<?php

namespace App\Filament\Widgets;

use App\Models\Order;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class PendingOrdersTable extends BaseWidget
{
    protected static ?string $heading = 'Đơn hàng đang chờ';
    protected static ?int $sort = 1;

    public function table(Table $table): Table
    {
        return $table
            ->query(Order::where('status', 'pending')
            )
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
                    ->label('Trạng thái')
                    ->formatStateUsing(function (string $state): string {
                        return match ($state) {
                            'pending' => 'Đang chờ',
                            'confirmed' => 'Đã xác nhận',
                            'on_the_way' => 'Đang giao hàng',
                            'delivered' => 'Đã giao hàng',
                            'canceled' => 'Đã hủy',
                            default => $state,
                        };
                    }),
                Tables\Columns\TextColumn::make('total_amount')
                    ->numeric()
                    ->sortable()
                    ->money('VND')
                    ->label('Tổng tiền'),
                Tables\Columns\TextColumn::make('payment_method')
                    ->label('Phương thức thanh toán')
                    ->badge()
                    ->formatStateUsing(function (string $state): string {
                        return match ($state) {
                            'cod' => 'Thanh toán tiền mặt',
                            'bank' => 'Chuyển khoản',
                            default => $state,
                        };
                    }),
                Tables\Columns\TextColumn::make('payment_status')
                    ->badge()
                    ->label('Trạng thái thanh toán')
                    ->formatStateUsing(function (string $state): string {
                        return match ($state) {
                            'unpaid' => 'Chưa thanh toán',
                            'paid' => 'Đã thanh toán',
                            'failed' => 'Thất bại',
                            default => $state,
                        };
                    }),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày tạo')
                ,
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ]);
    }
}
