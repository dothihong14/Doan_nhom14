<?php

namespace App\Filament\Resources\MaterialTransactionResource\Pages;

use App\Filament\Resources\MaterialTransactionResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditMaterialTransaction extends EditRecord
{
    protected static string $resource = MaterialTransactionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    protected $originalDetails = [];

    protected function mutateFormDataBeforeFill(array $data): array
    {
        $this->originalDetails = $this->record->details->toArray();
        \Log::info('Original Details Before Edit: ' . json_encode($this->originalDetails));

        return $data;
    }

    protected function afterSave(): void
    {
        $record = $this->record;

        \Log::info('After Save - MaterialTransaction ID: ' . $record->id);
        \Log::info('Original Details: ' . json_encode($this->originalDetails));
        \Log::info('New Details: ' . $record->details->toJson());

        foreach ($this->originalDetails as $originalDetail) {
            $ingredient = \App\Models\Ingredient::where('id', $originalDetail['ingredient_id'])
                ->where('restaurant_id', $record->getOriginal('restaurant_id'))
                ->first();

            if ($ingredient) {
                \Log::info("Restoring {$originalDetail['actual_quantity']} to Ingredient ID: {$originalDetail['ingredient_id']}");
                $ingredient->quantity_in_stock += $originalDetail['actual_quantity'];
                $ingredient->save();
            }
        }

        $newDetails = $record->details;
        foreach ($newDetails as $newDetail) {
            $ingredient = \App\Models\Ingredient::where('id', $newDetail->ingredient_id)
                ->where('restaurant_id', $record->restaurant_id)
                ->first();

            if ($ingredient) {
                \Log::info("Subtracting {$newDetail->actual_quantity} from Ingredient ID: {$newDetail->ingredient_id}");
                $ingredient->quantity_in_stock -= $newDetail->actual_quantity;
                $ingredient->save();
            }
        }

        $this->originalDetails = $record->details->toArray();
    }
}
