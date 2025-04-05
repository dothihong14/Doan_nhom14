<?php

namespace App\Filament\Resources\RestaurantResource\Pages;

use App\Filament\Resources\RestaurantResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditRestaurant extends EditRecord
{
    protected static string $resource = RestaurantResource::class;
    protected static ?string $title = 'Cập nhật cơ sở';
    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make()
            ->label('Xóa'),
        ];
    }
}
