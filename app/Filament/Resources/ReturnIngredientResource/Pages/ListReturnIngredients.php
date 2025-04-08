<?php

namespace App\Filament\Resources\ReturnIngredientResource\Pages;

use App\Filament\Resources\ReturnIngredientResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListReturnIngredients extends ListRecords
{
    protected static string $resource = ReturnIngredientResource::class;
    protected static ?string $title = 'Danh sách đổi trả nguyên liệu';
    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->label('Tạo mới'),
        ];
    }
}
