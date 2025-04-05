<?php

namespace App\Filament\Resources\TableResource\Pages;

use App\Filament\Resources\TableResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class ListTables extends ListRecords
{
    protected static string $resource = TableResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
            ->label('Tạo mới bàn'),
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
