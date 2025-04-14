<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use App\Models\User;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateOrder extends CreateRecord
{
    protected static string $resource = OrderResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (auth()->user()->restaurant_id) {
            $data['restaurant_id'] = auth()->user()->restaurant_id;
        }
        if ($data['point_discount'] > 0) {
            $user = User::findOrFail($data['user_id']);
            $user->loyalty_points = 0;
            $user->save();
        }
        $data['order_code'] = strtoupper(uniqid('ORDER_'));
        return $data;
    }
}
