<?php

namespace App\Filament\Resources\MaterialTransactionResource\Pages;

use App\Filament\Resources\MaterialTransactionResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateMaterialTransaction extends CreateRecord
{
    protected static string $resource = MaterialTransactionResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (auth()->user()->restaurant_id) {
            $data['restaurant_id'] = auth()->user()->restaurant_id;
        }
        return $data;
    }

    protected function afterCreate(): void
    {
        $record = $this->record;

        \Log::info('After Create - MaterialTransaction ID: ' . $record->id);
        \Log::info('Details: ' . $record->details->toJson());

        $details = $record->details;
        foreach ($details as $detail) {
            $ingredient = \App\Models\Ingredient::where('id', $detail->ingredient_id)
                ->where('restaurant_id', $record->restaurant_id)
                ->first();

            if ($ingredient) {
                \Log::info("Subtracting {$detail->actual_quantity} from Ingredient ID: {$detail->ingredient_id}");
                $ingredient->quantity_in_stock -= $detail->actual_quantity;
                $ingredient->quantity_auto -= $detail->actual_quantity;
                $ingredient->save();
            }
        }
    }
}
