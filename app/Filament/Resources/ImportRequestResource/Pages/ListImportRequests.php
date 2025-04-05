<?php

namespace App\Filament\Resources\ImportRequestResource\Pages;

use App\Filament\Resources\ImportRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListImportRequests extends ListRecords
{
    protected static string $resource = ImportRequestResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->label('Tạo yêu cầu nhập hàng'),
        ];
    }
}
