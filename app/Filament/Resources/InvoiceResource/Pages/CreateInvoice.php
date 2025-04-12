<?php

namespace App\Filament\Resources\InvoiceResource\Pages;

use App\Filament\Resources\InvoiceResource;
use App\Models\TableDish;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateInvoice extends CreateRecord
{
    protected static string $resource = InvoiceResource::class;
    protected static ?string $title = 'Tạo hóa đơn';

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (auth()->user()->restaurant_id) {
            $data['restaurant_id'] = auth()->user()->restaurant_id;
        }
        return $data;
    }

    protected function afterCreate(): void
    {
        $invoice = $this->record;
        foreach ($invoice->invoiceItems as $item) {
            TableDish::create([
                'dish_id' => $item->dish_id,
                'quantity' => $item->quantity,
                'status' => 'pending',
            ]);
        }
        // Logic sau khi tạo hóa đơn (nếu cần)
    }
}
