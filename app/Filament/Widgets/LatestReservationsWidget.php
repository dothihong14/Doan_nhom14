<?php

namespace App\Filament\Widgets;

use App\Models\Dish;
use App\Models\Reservation;
use Filament\Tables;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;

class LatestReservationsWidget extends BaseWidget
{
    protected static ?string $heading = 'Món ăn bán chạy';
    protected static ?int $sort = 1;

    public function table(Table $table): Table
    {
        return $table
            ->query(
                Dish::query()
                    ->leftJoin('order_items', 'dishes.id', '=', 'order_items.dish_id')
                    ->leftJoin('invoice_items', 'dishes.id', '=', 'invoice_items.dish_id')
                    ->select(
                        'dishes.id',
                        'dishes.name',
                        'dishes.price',
                        'dishes.image',
                        'dishes.status',
                        DB::raw('COALESCE(SUM(order_items.quantity), 0) + COALESCE(SUM(invoice_items.quantity), 0) as total_sold'),
                        DB::raw('COALESCE(SUM(order_items.total_price), 0) + COALESCE(SUM(invoice_items.total_price), 0) as total_price_sold')
                    )
                    ->groupBy('dishes.id', 'dishes.name', 'dishes.price', 'dishes.image', 'dishes.status')
                    ->orderBy('total_sold', 'desc')
                    ->take(10)
            )
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->label('Tên món ăn')
                    ->sortable()
                    ->wrap(),
                Tables\Columns\TextColumn::make('price')
                    ->money('VND')
                    ->label('Giá')
                    ->sortable(),
                Tables\Columns\TextColumn::make('total_sold')
                    ->label('Số lượng')
                    ->sortable(),
                Tables\Columns\TextColumn::make('total_price_sold')
                    ->money('VND')
                    ->label('Tổng tiền')
                    ->sortable(),
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
            ->filters([
                Filter::make('date_range')
                    ->form([
                        \Filament\Forms\Components\DatePicker::make('from_date')
                            ->label('Từ ngày'),
                        \Filament\Forms\Components\DatePicker::make('to_date')
                            ->label('Đến ngày'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['from_date'],
                                fn (Builder $query) => $query->where(
                                    fn ($query) => $query
                                        ->where('order_items.created_at', '>=', $data['from_date'])
                                        ->orWhere('invoice_items.created_at', '>=', $data['from_date'])
                                )
                            )
                            ->when(
                                $data['to_date'],
                                fn (Builder $query) => $query->where(
                                    fn ($query) => $query
                                        ->where('order_items.created_at', '<=', $data['to_date'])
                                        ->orWhere('invoice_items.created_at', '<=', $data['to_date'])
                                )
                            );
                    })
                    ->indicateUsing(function (array $data): array {
                        $indicators = [];
                        if ($data['from_date']) {
                            $indicators[] = 'Từ ngày: ' . \Carbon\Carbon::parse($data['from_date'])->format('d/m/Y');
                        }
                        if ($data['to_date']) {
                            $indicators[] = 'Đến ngày: ' . \Carbon\Carbon::parse($data['to_date'])->format('d/m/Y');
                        }
                        return $indicators;
                    }),
                Filter::make('restaurant_id')
                    ->form([
                        \Filament\Forms\Components\Select::make('restaurant_id')
                            ->label('Nhà hàng')
                            ->options(
                                \App\Models\Restaurant::pluck('name', 'id')->toArray()
                            )
                            ->placeholder('Chọn nhà hàng'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->when(
                            $data['restaurant_id'],
                            fn (Builder $query) => $query->where('dishes.restaurant_id', $data['restaurant_id'])
                        );
                    })
                    ->indicateUsing(function (array $data): array {
                        $indicators = [];
                        if ($data['restaurant_id']) {
                            $restaurant = \App\Models\Restaurant::find($data['restaurant_id']);
                            $indicators[] = 'Nhà hàng: ' . ($restaurant->name ?? 'Không xác định');
                        }
                        return $indicators;
                    }),
            ])
            ->defaultSort('total_sold', 'desc')
            ->actions([
            ]);
    }
}
