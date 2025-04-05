<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\TableDish;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách đơn hàng';
    }
    protected static ?string $navigationGroup = 'Quản lý Hóa đơn';

    protected static ?string $navigationLabel = 'Đơn hàng trực tuyến';
    protected static ?string $navigationIcon = 'heroicon-o-shopping-cart';
    protected static ?int $navigationSort = 1;


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Thông tin đơn hàng')
                    ->description('Nhập thông tin chi tiết cho đơn hàng.')
                    ->schema([
                        // Forms\Components\Select::make('user_id')
                        //     ->relationship('user', 'name') // Kết nối với model User
                        //     ->required()
                        //     ->label('Người đặt'),
                        Forms\Components\TextInput::make('name')
                            ->required()
                            ->label('Tên người đặt'),
                        Forms\Components\TextInput::make('email')
                            ->required()
                            ->label('Email'),
                        Forms\Components\TextInput::make('phone')
                            ->required()
                            ->label('Số điện thoại'),
                        Forms\Components\TextInput::make('address')
                            ->required()
                            ->label('Địa chỉ giao hàng'),
                        Forms\Components\Select::make('status')
                            ->options([
                                'pending' => 'Đang chờ',
                                'confirmed' => 'Đã xác nhận',
                                'preparing' => 'Đang chuẩn bị',
                                'on_the_way' => 'Đang giao hàng',
                                'delivered' => 'Đã giao hàng',
                                'canceled' => 'Đã hủy',
                            ])
                            ->required()
                            ->label('Trạng thái'),

                        Forms\Components\TextInput::make('total_amount')
                            ->required()
                            ->numeric()
                            ->label('Tổng tiền'),

                        Forms\Components\Select::make('payment_method')
                            ->options([
                                'cod' => 'Thanh toán tiền mặt',
                                'bank' => 'Chuyển khoản',
                            ])
                            ->required()
                            ->label('Phương thức thanh toán'),
                            Forms\Components\Select::make('payment_status')
                            ->options([
                                'unpaid' => 'Chưa thanh toán',
                                'paid' => 'Đã thanh toán',
                            ])
                            ->required()
                            ->label('Trạng thái thanh toán'),
                        Forms\Components\TextInput::make('address')
                            ->label('Địa chỉ giao hàng')
                            ->required(),

                        Forms\Components\DateTimePicker::make('created_at')
                            ->label('Ngày đặt hàng')
                            ->default(now()),
                            Forms\Components\Select::make('restaurant_id')
                            ->relationship('restaurant', 'name')
                            ->required()
                            ->label('Nhà hàng'),

                        Forms\Components\Textarea::make('notes')
                            ->label('Ghi chú')
                            ->rows(3),
                    ])->columns(4),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('order_code')
                    ->searchable()
                    ->label('Mã đơn hàng'),
                Tables\Columns\TextColumn::make('name')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->label('Tên người đặt'),
                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->sortable()
                    ->label('Email')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\SelectColumn::make('status')
                    ->options([
                        'pending' => 'Đang chờ',
                        'confirmed' => 'Đã xác nhận',
                        'preparing' => 'Đang chuẩn bị',
                        'on_the_way' => 'Đang giao hàng',
                        'delivered' => 'Đã giao hàng',
                        'canceled' => 'Đã hủy',
                    ])
                    ->afterStateUpdated(function ($state, $record) {
                        if ($state == 'confirmed') {
                            $orderItems = OrderItem::where('order_id', $record->id)->get();
                            foreach ($orderItems as $item) {
                                TableDish::create([
                                    'dish_id' => $item->dish_id,
                                    'quantity' => $item->quantity,
                                    'status' => 'pending',
                                ]);
                            }
                        }
                    })
                    ->label('Trạng thái'),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->label('Cơ sở'),
                Tables\Columns\TextColumn::make('total_amount')
                    ->numeric()
                    ->sortable()
                    ->money('VND')
                    ->label('Tổng tiền'),
                Tables\Columns\TextColumn::make('payment_method')
                    ->badge()
                    ->label('Phương thức thanh toán')
                    ->formatStateUsing(function ($state) {
                        return $state == 'cod' ? 'Thanh toán tiền mặt' : 'Chuyển khoản';
                    }),
                Tables\Columns\SelectColumn::make('payment_status')
                    ->options([
                        'unpaid' => 'Chưa thanh toán',
                        'paid' => 'Đã thanh toán',
                    ])
                    ->label('Trạng thái thanh toán'),
                Tables\Columns\TextColumn::make('phone')
                    ->label('Số điện thoại'),
                Tables\Columns\TextColumn::make('address')
                    ->label('Địa chỉ giao hàng'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày tạo')
                   ,
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Xem'), // Đổi nhãn sang tiếng Việt
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh Sửa'), // Đổi nhãn sang tiếng Việt
                    Tables\Actions\DeleteAction::make()
                        ->label('Xóa'), // Đổi nhãn sang tiếng Việt
                        Tables\Actions\Action::make('print')
                        ->label('In đơn hàng')
                        ->icon('heroicon-o-printer')
                        ->url(fn (Order $record) => route('orders.print', $record))
                        ->openUrlInNewTab(), // Mở file PDF trong tab mới
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->label('Xóa'), // Đổi nhãn sang tiếng Việt
                    ExportBulkAction::make(),

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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }
}
