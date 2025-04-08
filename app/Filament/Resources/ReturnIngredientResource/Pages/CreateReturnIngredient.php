<?php

namespace App\Filament\Resources\ReturnIngredientResource\Pages;

use App\Filament\Resources\ReturnIngredientResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateReturnIngredient extends CreateRecord
{
    protected static string $resource = ReturnIngredientResource::class;
    protected static ?string $title = "Tạo mới yêu cầu đổi trả nguyên liệu";
}
