<?php

namespace App\Filament\Resources\ImportRequestResource\Pages;

use App\Filament\Resources\ImportRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateImportRequest extends CreateRecord
{
    protected static string $resource = ImportRequestResource::class;
    protected static ?string $title = 'Tạo yêu cầu nhập hàng';
}
