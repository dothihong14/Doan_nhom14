<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Order;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách đơn hàng';
    }
    protected static ?string $navigationGroup = 'Quản lý Nhà Hàng';
    protected static ?string $navigationIcon = 'heroicon-o-shopping-cart';
    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Thông tin đơn hàng')
                    ->description('Nhập thông tin chi tiết cho đơn hàng.')
                    ->schema([
                        Forms\Components\Select::make('user_id')
                            ->relationship('user', 'name') // Kết nối với model User
                            ->required()
                            ->label('Người đặt'),

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

                        Forms\Components\Textarea::make('notes')
                            ->label('Ghi chú')
                            ->rows(3),
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('order_code')
                    ->searchable()
                    ->label('Mã đơn hàng'),
                Tables\Columns\TextColumn::make('user.name')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->label('Tên người đặt'),
                Tables\Columns\TextColumn::make('status')
                    ->badge()
                    ->label('Trạng thái'),
                Tables\Columns\TextColumn::make('total_amount')
                    ->numeric()
                    ->sortable()
                    ->money('VND')
                    ->label('Tổng tiền'),
                Tables\Columns\TextColumn::make('payment_method')
                    ->label('Phương thức thanh toán'),
                Tables\Columns\TextColumn::make('payment_status')
                    ->badge()
                    ->label('Trạng thái thanh toán'),
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
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->label('Xóa'), // Đổi nhãn sang tiếng Việt
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
