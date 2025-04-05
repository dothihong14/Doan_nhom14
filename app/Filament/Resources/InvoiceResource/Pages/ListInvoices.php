<?php

namespace App\Filament\Resources\InvoiceResource\Pages;

use App\Filament\Resources\InvoiceResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class ListInvoices extends ListRecords
{
    protected static string $resource = InvoiceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    protected function getTableQuery(): Builder
    {
        $query = parent::getTableQuery();

        $user = Auth::user();

        if ($user && $user->restaurant_id) {
            // Filter invoices by the user's restaurant ID
            return $query->where('restaurant_id', $user->restaurant_id)->orderBy('created_at', 'desc');
        }

        // If no restaurant ID, return all invoices
        return $query->orderBy('created_at', 'desc');
    }
}