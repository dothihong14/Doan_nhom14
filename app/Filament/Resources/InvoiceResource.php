<?php

namespace App\Filament\Resources;
use App\Models\Dish;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Filament\Forms\Components\Tabs;
use Illuminate\Support\Facades\Storage;
use Filament\Tables\Actions\Action;
use App\Filament\Resources\InvoiceResource\Pages;
use App\Filament\Resources\InvoiceResource\RelationManagers;
use App\Filament\Resources\InvoiceResource\RelationManagers\InvoiceItemsRelationManager;
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
        return 'Danh sách đơn hàng trực tuyến';
    }
    protected static ?int $navigationSort = 2;

    protected static ?string $navigationIcon = 'heroicon-o-credit-card';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('Thông tin hóa đơn') // Tab title in Vietnamese
                    ->tabs([
                        Tabs\Tab::make('Thông tin chung') // Tab for general information
                            ->schema([
                                Forms\Components\TextInput::make('invoice_code')
                                    ->label('Mã hóa đơn')
                                    ->required()
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
                                ->options(User::all()->pluck('name', 'id')),

                                Forms\Components\Select::make('status')
                                    ->label('Trạng thái')
                                    ->options([
                                        'pending' => 'Chưa thanh toán',
                                        'paid' => 'Đã thanh toán',
                                    ])
                                    ->default('pending')
                                    ->required()
                                    , // Description
                            ])->columns(3),

                        Tabs\Tab::make('Chi tiết hóa đơn') // Tab for invoice details
                            ->schema([
                                Forms\Components\Repeater::make('invoiceItems')
                                    ->label('Món ăn')
                                    ->relationship('invoiceItems')
                                    ->schema([
                                        Forms\Components\Select::make('dish_id')
                                            ->label('Món ăn')
                                            ->options(Dish::pluck('name', 'id'))
                                            ->required()
                                            ->reactive() // Make the select reactive to trigger updates
                                            ->afterStateUpdated(function ($state, callable $set, $get) {
                                                $dish = Dish::find($state);
                                                if ($dish) {
                                                    $set('unit_price', $dish->price); // Set unit price based on the selected dish
                                                    $set('total_price',  $dish->price * $get('quantity')); // Update total price when dish is selected
                                                } else {
                                                    $set('unit_price', 0); // Reset if not found
                                                    $set('total_price', 0); // Reset total price
                                                }
                                            })
                                            , // Description

                                        Forms\Components\TextInput::make('quantity')
                                            ->label('Số lượng')
                                            ->required()
                                            ->numeric()
                                            ->default(1)
                                            ->reactive() // Make quantity reactive for total price calculation
                                            ->afterStateUpdated(function ($state, callable $set, $get) {
                                                $set('total_price', $state * $get('unit_price')); // Update total price when quantity changes
                                            })
                                            , // Description

                                        Forms\Components\TextInput::make('unit_price')
                                            ->label('Đơn giá')
                                            ->numeric()
                                            ->suffix('VNĐ')
                                            ->required()
                                            ->disabled()
                                         , // Description

                                        Forms\Components\TextInput::make('total_price')
                                            ->label('Thành tiền')
                                            ->numeric()
                                            ->suffix('VNĐ')
                                            ->required()
                                            ->dehydrated(true) // Ensure this value is sent to the database
                                            ->reactive() // Make total price reactive
                                            ->afterStateUpdated(function ($state, callable $set, $get) {
                                                $set('total_price', $get('quantity') * $get('unit_price')); // Calculate total price
                                            })
                                            ->disabled()
                                          , // Description
                                    ])->columns(4),
                            ]),
                    ])->columnSpanFull(),
            ]);
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
                Tables\Columns\TextColumn::make('total_amount')->label('Tổng tiền')->numeric()->money('VND'),
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
                        ->openUrlInNewTab(), // Mở file PDF trong tab mới
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
            // InvoiceItemsRelationManager::class,
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
