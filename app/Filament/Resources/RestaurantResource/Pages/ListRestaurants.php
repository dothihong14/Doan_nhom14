<?php

namespace App\Filament\Resources\RestaurantResource\Pages;

use App\Filament\Resources\RestaurantResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
class ListRestaurants extends ListRecords
{
    protected static string $resource = RestaurantResource::class;
    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
            ->label('Tạo mới cơ sở'),
        ];
    }
    protected function getTableQuery(): Builder
{
    return parent::getTableQuery()->orderBy('created_at', 'desc');
}
}
