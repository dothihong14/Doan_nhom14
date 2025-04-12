<?php

namespace App\Filament\Resources\ReservationResource\Pages;

use App\Filament\Resources\ReservationResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class ListReservations extends ListRecords
{
    protected static string $resource = ReservationResource::class;
    protected static ?string $title = 'Danh sách đặt bàn';

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->label('Thêm lịch đặt bàn'),
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
