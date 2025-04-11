<?php

namespace App\Filament\Resources\TableResource\Pages;

use App\Filament\Resources\TableResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateTable extends CreateRecord
{
    protected static string $resource = TableResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (auth()->user()->restaurant_id) {
            $data['restaurant_id'] = auth()->user()->restaurant_id;
        }
        return $data;
    }
}
