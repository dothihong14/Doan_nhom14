<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TableDishRelationManagerResource\RelationManagers\TableDishRelationManagerRelationManager;
use App\Filament\Resources\TableResource\Pages;
use App\Filament\Resources\TableResource\RelationManagers;
use App\Models\Invoice;
use App\Models\InvoiceItem;
use App\Models\Reservation;
use App\Models\Restaurant;
use App\Models\Table as TableModel;
use App\Models\TableDish;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class TableResource extends Resource
{
    protected static ?string $model = TableModel::class;
    protected static ?string $navigationGroup = 'Quản lý Nhà Hàng';
    protected static ?string $modelLabel = 'Danh sách bàn';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách bàn';
    }
    protected static ?string $navigationIcon = 'heroicon-o-table-cells';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Thông tin bàn')
                    ->description('Chọn nhà hàng và nhập thông tin bàn.')
                    ->schema([
                        Forms\Components\Select::make('restaurant_id')
                            ->options(Restaurant::all()->pluck('name', 'id'))
                            ->visible(fn () => !auth()->user()->restaurant_id)
                            ->required()
                            ->label('Cơ sở')
                            ->live()
                            ->afterStateUpdated(function (callable $set, $state) {
                                if (!$state) {
                                    $set('table_code', null);
                                    return;
                                }

                                $restaurant = Restaurant::find($state);
                                if (!$restaurant) {
                                    $set('table_code', null);
                                    return;
                                }

                                $restaurantName = Str::slug($restaurant->name, '');

                                $latestTable = \App\Models\Table::where('restaurant_id', $state)
                                    ->where('table_code', 'like', $restaurantName . '%')
                                    ->orderBy('table_code', 'desc')
                                    ->first();

                                if ($latestTable) {
                                    preg_match('/\d+$/', $latestTable->table_code, $matches);
                                    $lastNumber = isset($matches[0]) ? (int)$matches[0] : 0;
                                    $newNumber = $lastNumber + 1;
                                } else {
                                    $newNumber = 1;
                                }

                                $formattedNumber = str_pad($newNumber, 2, '0', STR_PAD_LEFT);
                                $tableCode = $restaurantName . '_' . $formattedNumber;

                                $set('table_code', $tableCode);
                            }),

                        Forms\Components\TextInput::make('table_code')
                            ->required()
                            ->default(function (callable $get) {
                                $restaurantId = auth()->user()->restaurant_id;
                                if (!$restaurantId) {
                                    return null;
                                }

                                $restaurant = Restaurant::find($restaurantId);
                                if (!$restaurant) {
                                    return null;
                                }

                                $restaurantName = Str::slug($restaurant->name, '');

                                $latestTable = \App\Models\Table::where('restaurant_id', $restaurantId)
                                    ->where('table_code', 'like', $restaurantName . '%')
                                    ->orderBy('table_code', 'desc')
                                    ->first();

                                if ($latestTable) {
                                    preg_match('/\d+$/', $latestTable->table_code, $matches);
                                    $lastNumber = isset($matches[0]) ? (int)$matches[0] : 0;
                                    $newNumber = $lastNumber + 1;
                                } else {
                                    $newNumber = 1;
                                }

                                $formattedNumber = str_pad($newNumber, 2, '0', STR_PAD_LEFT);
                                $tableCode = $restaurantName . '_' . $formattedNumber;

                                Log::info('Default table code: ' . $tableCode);
                                return $tableCode;
                            })
                            ->unique(\App\Models\Table::class, 'table_code', ignoreRecord: true)
                            ->label('Mã bàn')
                            ->readOnly()
                    ])->columns(2),

                Forms\Components\Section::make('Trạng thái bàn')
                    ->description('Chọn trạng thái hiện tại của bàn.')
                    ->schema([
                        Forms\Components\Select::make('status')
                            ->options([
                                'available' => 'Có sẵn',
                                'occupied' => 'Đã sử dụng',
                                'reserved' => 'Đã đặt',
                            ])
                            ->required()
                            ->label('Trạng thái'),
                        Forms\Components\TextInput::make('number_guest')
                            ->required()
                            ->numeric()
                            ->label('Số người tối đa'),
                    ])->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        $now = Carbon::now();
        $oneHourLater = $now->copy()->addHour();
        $currentDay = $now->toDateString();

        \App\Models\Table::whereHas('reservations', function ($query) use ($currentDay, $now, $oneHourLater) {
            $query->where('reservation_day', $currentDay)
                ->whereBetween('reservation_time', [$now, $oneHourLater]);
        })->where('status', '!=', 'reserved')
            ->update(['status' => 'reserved']);
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->sortable()
                    ->searchable()

                    ->label('ID')
                    ->toggleable(isToggledHiddenByDefault: true),
                    Tables\Columns\TextColumn::make('table_code')
                    ->numeric()
                    ->sortable()
                    ->searchable()
                    ->label('Mã bàn'),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->sortable()
                    ->searchable()
                    ->label('Cơ sở'),

                    Tables\Columns\SelectColumn::make('status')
                    ->label('Trạng thái')
                    ->options([
                        'available' => 'Có sẵn',
                        'occupied' => 'Đã sử dụng',
                        'reserved' => 'Đã đặt',
                    ])
                    ,

                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày tạo')

                   ,
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày cập nhật')
                    ->toggleable(isToggledHiddenByDefault: true)
                   ,
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('restaurant_id')
                    ->options(Restaurant::all()->pluck('name', 'id'))
                    ->label('Nhà hàng'),
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'available' => 'Có sẵn',
                        'occupied' => 'Đã sử dụng',
                        'reserved' => 'Đã đặt',
                    ])
                    ->label('Trạng thái'),
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Xem'),
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh Sửa'),
                    Tables\Actions\DeleteAction::make()
                        ->label('Xóa'),
                        Tables\Actions\Action::make('createInvoice')
                        ->label('Tạo Hóa Đơn')
                        ->icon('heroicon-o-document-text')
                        ->color('success')
                        ->requiresConfirmation()
                        ->action(fn ($record) => static::generateInvoice($record))
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->label('Xóa'),
                ]),
            ]);
    }
     public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }
    public static function getRelations(): array
    {
        return [
            TableDishRelationManagerRelationManager::class,
        ];
    }
    public static function generateInvoice($table)
    {
        if ($table->status === 'available') {
            Notification::make()
                ->title('Bàn trống không thể tạo hóa đơn!')
                ->danger()
                ->send();
            return;
        }

        $tableDishes = TableDish::where('table_id', $table->id)->get();
        if ($tableDishes->isEmpty()) {
            Notification::make()
                ->title('Không có món ăn nào để tạo hóa đơn!')
                ->danger()
                ->send();
            return;
        }

        // Tạo hóa đơn mới
        $invoice = Invoice::create([
            'table_id' => $table->id,
            'restaurant_id' => $table->restaurant_id,
            'total_amount' => 0, // Sẽ tính lại tổng tiền bên dưới
            'status' => 'pending',
        ]);


        $totalAmount = 0;

        // Thêm các món vào invoice_items
        foreach ($tableDishes as $dish) {
            InvoiceItem::create([
                'invoice_id' => $invoice->id,
                'dish_id' => $dish->dish_id,
                'quantity' => $dish->quantity,
                'unit_price' => $dish->dish->price, // Giả sử bảng dishes có cột price
                'total_price' => $dish->quantity * $dish->dish->price,
            ]);

            $totalAmount += $dish->quantity * $dish->dish->price;
        }

        // Cập nhật tổng tiền cho hóa đơn
        $invoice->update(['total_amount' => $totalAmount]);

        // Xóa các món ăn khỏi bàn
        TableDish::where('table_id', $table->id)->delete();
        // Cập nhật trạng thái bàn
        $table->update(['status' => 'available']);
        $table->update(['reservation_id' => null]);

        Notification::make()
            ->title('Hóa đơn đã được tạo thành công!')
            ->success()
            ->send();
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTables::route('/'),
            'create' => Pages\CreateTable::route('/create'),
            'edit' => Pages\EditTable::route('/{record}/edit'),
        ];
    }


}
