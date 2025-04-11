<?php

namespace App\Filament\Resources\ImportRequestResource\Pages;

use App\Filament\Resources\ImportRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateImportRequest extends CreateRecord
{
    protected static string $resource = ImportRequestResource::class;
    protected static ?string $title = 'Tạo yêu cầu nhập hàng';

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (auth()->user()->restaurant_id) {
            $data['restaurant_id'] = auth()->user()->restaurant_id;
        }
        return $data;
    }
}
