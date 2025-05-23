<?php

namespace App\Filament\Resources\TableDishResource\Pages;

use App\Filament\Resources\TableDishResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
class ListTableDishes extends ListRecords
{
    protected static string $resource = TableDishResource::class;

    protected function getHeaderActions(): array
    {
        return [
//            Actions\CreateAction::make()
//                ->label('Tạo yêu cầu lên món'),
        ];
    }
    protected function getTableQuery(): Builder
    {
        return parent::getTableQuery()->orderBy('created_at', 'desc');
    }
}
