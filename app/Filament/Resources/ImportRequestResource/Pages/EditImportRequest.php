<?php

namespace App\Filament\Resources\ImportRequestResource\Pages;

use App\Filament\Resources\ImportRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditImportRequest extends EditRecord
{
    protected static string $resource = ImportRequestResource::class;
    protected static ?string $title = 'Chỉnh sửa yêu cầu nhập hàng';

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make()
                ->label('Xóa yêu cầu nhập hàng'),
        ];
    }
}
