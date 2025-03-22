<?php

namespace App\Filament\Resources\TableDishResource\Pages;

use App\Filament\Resources\TableDishResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditTableDish extends EditRecord
{
    protected static string $resource = TableDishResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
