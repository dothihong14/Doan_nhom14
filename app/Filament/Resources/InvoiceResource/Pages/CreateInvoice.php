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

    protected function beforeCreate(): void
    {
        // Kiểm tra dữ liệu trước khi tạo
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