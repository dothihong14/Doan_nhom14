<?php

namespace App\Filament\Resources;

use App\Models\Dish;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Filament\Forms\Components\Section;
use Illuminate\Support\Facades\Storage;
use Filament\Tables\Actions\Action;
use App\Filament\Resources\InvoiceResource\Pages;
use App\Filament\Resources\InvoiceResource\RelationManagers;
use App\Models\Invoice;
use App\Models\Restaurant;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class InvoiceResource extends Resource
{
    protected static ?string $model = Invoice::class;
    protected static ?string $navigationGroup = 'Quản lý Hóa đơn';
    protected static ?string $navigationLabel = 'Đơn hàng trực tiếp';
    protected static ?string $modelLabel = 'Đơn hàng trực tiếp';
    protected static ?string $title = 'Đơn hàng trực tiếp';

    public static function getPluralModelLabel(): string
    {
        return 'Danh sách đơn hàng trực tiếp';
    }
    protected static ?int $navigationSort = 2;

    protected static ?string $navigationIcon = 'heroicon-o-credit-card';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Thông tin chung')
                    ->schema([
                        Forms\Components\TextInput::make('invoice_code')
                            ->label('Mã hóa đơn')
                            ->required()
                            ->readOnly()
                            ->hidden()
                            ->maxLength(255)
                            ->default(function () {
                                do {
                                    $code = 'INV-' . strtoupper(uniqid());
                                } while (Invoice::where('invoice_code', $code)->exists());

                                return $code;
                            }),

                        Forms\Components\Select::make('restaurant_id')
                            ->label('Nhà hàng')
                            ->options(Restaurant::all()->pluck('name', 'id'))
                            ->required()
                            ->visible(fn () => !auth()->user()->restaurant_id),

                        Forms\Components\Select::make('user_id')
                            ->label('Khách hàng')
                            ->options(User::all()->pluck('name', 'id'))
                            ->nullable() // Cho phép user_id là null
                            ->reactive(),

                        Forms\Components\Select::make('status')
                            ->label('Trạng thái')
                            ->options([
                                'pending' => 'Chưa thanh toán',
                                'paid' => 'Đã thanh toán',
                            ])
                            ->default('pending')
                            ->required(),

                        Forms\Components\TextInput::make('total_amount')
                            ->required()
                            ->numeric()
                            ->readOnly()
                            ->label('Tổng đơn hàng')
                            ->reactive()
                            ->afterStateHydrated(function ($set, $get, $record) {
                                $items = $get('invoiceItems') ?? ($record->invoiceItems ?? []);
                                $total = collect($items)->sum('total_price');
                                $set('total_amount', $total);
                            }),

                        Forms\Components\Checkbox::make('point_discount')
                            ->label('Đổi điểm')
                            ->reactive()
                            ->afterStateUpdated(function ($state, callable $set, $get) {
                                static::updateFinalAmount($set, $get);
                            }),

                        Forms\Components\Placeholder::make('user_points')
                            ->label('Số điểm hiện tại')
                            ->content(function ($get) {
                                $userId = $get('user_id');
                                if ($userId) {
                                    $user = User::find($userId);
                                    return $user ? $user->loyalty_points . ' điểm' : 'Không có điểm';
                                }
                                return 'Không có khách hàng được chọn';
                            })
                            ->visible(fn ($get) => !empty($get('user_id'))),

                        Forms\Components\Placeholder::make('point_discount')
                            ->label('Số điểm quy đổi')
                            ->content(function ($get, $record) {
                                return $record && $get('point_discount') ? number_format($record->point_discount) . ' điểm' : 'Không áp dụng điểm';
                            })
                            ->visible(fn ($get) => $get('point_discount')),

                        Forms\Components\TextInput::make('restaurant_discount')
                            ->label('Giảm giá của nhà hàng')
                            ->numeric()
                            ->default(0)
                            ->reactive()
                            ->afterStateUpdated(function ($state, callable $set, $get) {
                                static::updateFinalAmount($set, $get);
                            }),

                        Forms\Components\TextInput::make('final_amount')
                            ->required()
                            ->numeric()
                            ->readOnly()
                            ->label('Tổng thanh toán')
                            ->reactive()
                            ->afterStateHydrated(function ($set, $get, $record) {
                                static::updateFinalAmount($set, $get);
                            }),
                    ])
                    ->columns(3),

                Section::make('Chi tiết hóa đơn')
                    ->schema([
                        Forms\Components\Repeater::make('invoiceItems')
                            ->label('Món ăn')
                            ->relationship('invoiceItems')
                            ->schema([
                                Forms\Components\Select::make('dish_id')
                                    ->label('Món ăn')
                                    ->options(Dish::pluck('name', 'id'))
                                    ->required()
                                    ->reactive()
                                    ->afterStateUpdated(function ($state, callable $set, $get) {
                                        $dish = Dish::find($state);
                                        if ($dish) {
                                            $set('unit_price', $dish->price);
                                            $set('total_price', $dish->price * $get('quantity'));
                                        } else {
                                            $set('unit_price', 0);
                                            $set('total_price', 0);
                                        }
                                        static::updateTotalAndFinalAmount($set, $get);
                                    }),

                                Forms\Components\TextInput::make('quantity')
                                    ->label('Số lượng')
                                    ->required()
                                    ->numeric()
                                    ->default(1)
                                    ->reactive()
                                    ->afterStateUpdated(function ($state, callable $set, $get) {
                                        $set('total_price', $state * $get('unit_price'));
                                        static::updateTotalAndFinalAmount($set, $get);
                                    }),

                                Forms\Components\TextInput::make('unit_price')
                                    ->label('Đơn giá')
                                    ->numeric()
                                    ->suffix('VNĐ')
                                    ->required()
                                    ->readOnly(),

                                Forms\Components\TextInput::make('total_price')
                                    ->label('Thành tiền')
                                    ->numeric()
                                    ->suffix('VNĐ')
                                    ->required()
                                    ->readOnly(),
                            ])
                            ->columns(4)
                            ->afterStateUpdated(function ($set, $get) {
                                static::updateTotalAndFinalAmount($set, $get);
                            }),
                    ]),
            ]);
    }

    protected static function updateTotalAndFinalAmount(callable $set, $get)
    {
        $items = $get('invoiceItems') ?? [];
        $total_amount = collect($items)->sum('total_price');
        $set('total_amount', $total_amount);

        static::updateFinalAmount($set, $get);
    }

    protected static function updateFinalAmount(callable $set, $get)
    {
        $total_amount = $get('total_amount') ?? 0;
        $restaurant_discount = $get('restaurant_discount') ?? 0;
        $point_discount = 0;

        // Chỉ tính điểm nếu point_discount được check và user_id tồn tại
        if ($get('point_discount') && $get('user_id')) {
            $user = User::find($get('user_id'));
            $point_discount = $user ? $user->loyalty_points : 0;
        }

        $final_amount = $total_amount - $restaurant_discount - $point_discount;

        $set('final_amount', max(0, $final_amount));
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('invoice_code')->label('Mã hóa đơn')->searchable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Khách hàng')
                    ->searchable()
                    ->formatStateUsing(function ($state, $record) {
                        return $record->user ? $state : 'Vãng lai';
                    }),
                Tables\Columns\TextColumn::make('restaurant.name')->label('Cơ sở')->searchable()->sortable()->visible(fn () => !auth()->user()->restaurant_id),
                Tables\Columns\TextColumn::make('final_amount')->label('Tổng tiền')->numeric()->money('VND'),
                Tables\Columns\TextColumn::make('status')->label('Trạng thái')->badge()->formatStateUsing(function ($state) {
                    switch ($state) {
                        case 'pending':
                            return 'Chưa thanh toán';
                        case 'paid':
                            return 'Đã thanh toán';
                    }
                }),
                Tables\Columns\TextColumn::make('created_at')->label('Ngày tạo')->dateTime()->sortable(),
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Xem'),
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh sửa'),
                    Tables\Actions\DeleteAction::make()
                        ->label('Xóa'),
                    Tables\Actions\Action::make('print')
                        ->label('In hóa đơn')
                        ->icon('heroicon-o-printer')
                        ->url(fn (Invoice $record) => route('invoices.print', $record))
                        ->openUrlInNewTab(),
                ]),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()->label('Xóa'),
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
        ];
    }

    public static function printInvoice(Invoice $invoice)
    {
        $pdf = Pdf::loadView('pdf.invoice', ['invoice' => $invoice]);

        $filePath = 'invoices/invoice_' . $invoice->invoice_code . '.pdf';
        Storage::put('public/' . $filePath, $pdf->output());

        return Storage::url($filePath);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListInvoices::route('/'),
            'create' => Pages\CreateInvoice::route('/create'),
            'edit' => Pages\EditInvoice::route('/{record}/edit'),
        ];
    }
}
