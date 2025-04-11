<?php

namespace App\Filament\Widgets;

use App\Models\Reservation;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class LatestReservationsWidget extends BaseWidget
{
    protected static ?string $heading = 'Lịch đặt bàn đang chờ';
    protected static ?int $sort = 1;

    public function table(Table $table): Table
    {
        return $table
            ->query(Reservation::query()->latest()->where('status', 'pending')->take(10)) // Giới hạn số lượng đơn đặt chỗ
            ->columns([
                Tables\Columns\TextColumn::make('reservation_code')
                    ->searchable()
                    ->label('Mã đặt bàn'),
                Tables\Columns\TextColumn::make('user.name')
                    ->numeric()
                    ->searchable()
                    ->label('Tên người đặt')
                    ->sortable(),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->numeric()
                    ->searchable()
                    ->label('Tên nhà hàng')
                    ->sortable(),
                Tables\Columns\TextColumn::make('number_of_people')
                    ->numeric()
                    ->label('Số lượng người')
                    ->sortable(),
                Tables\Columns\TextColumn::make('reservation_time')
                    ->sortable()
                    ->searchable()
                    ->label('Giờ đặt')
                   ,
                Tables\Columns\TextColumn::make('notes')
                    ->searchable()
                    ->label('Ghi chú')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->label('Tên người đặt'),
                Tables\Columns\TextColumn::make('phone')
                    ->searchable()
                    ->label('Số điện thoại'),
                Tables\Columns\TextColumn::make('reservation_day')
                    ->searchable()
                    ->sortable()
                    ->label('Ngày đặt'),
                Tables\Columns\TextColumn::make('status')
                    ->badge()
                    ->label('Trạng thái'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->label('Ngày tạo')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->label('Ngày cập nhật')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),


            ])
            ->defaultSort('created_at', 'desc') // Sắp xếp theo thời gian tạo
            ->actions([
                Tables\Actions\ViewAction::make(), // Hành động xem
            ]);
    }
}
