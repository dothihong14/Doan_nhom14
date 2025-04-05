<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
class ListOrders extends ListRecords
{
    protected static string $resource = OrderResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tạo đơn hàng'),
        ];
    }

    protected function getTableQuery(): Builder
    {
        $query = parent::getTableQuery();

        $user = Auth::user();

        if ($user && $user->restaurant_id) {
            // Filter reservations by the user's restaurant ID
            return $query->where('restaurant_id', $user->restaurant_id)->orderBy('created_at', 'desc');
        }

        // If no restaurant ID, return all reservations
        return $query->orderBy('created_at', 'desc');
    }
}