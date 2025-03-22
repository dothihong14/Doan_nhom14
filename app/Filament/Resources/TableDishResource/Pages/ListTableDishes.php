<?php

namespace App\Filament\Resources\TableDishResource\Pages;

use App\Filament\Resources\TableDishResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListTableDishes extends ListRecords
{
    protected static string $resource = TableDishResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
