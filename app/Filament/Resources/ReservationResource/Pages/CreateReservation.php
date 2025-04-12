<?php

namespace App\Filament\Resources\ReservationResource\Pages;

use App\Filament\Resources\ReservationResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateReservation extends CreateRecord
{
    protected static string $resource = ReservationResource::class;
    protected static ?string $title = 'Thêm lịch đặt bàn';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
//    protected function getFormActions(): array
//    {
//        return [
//            Actions\CreateAction::make()
//                ->label('Tạo'),
//            Actions\Action::make('cancel')
//                ->label('Quay lại')
//                ->url($this->getResource()::getUrl('index'))
//                ->color('gray'),
//        ];
//    }
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (auth()->user()->restaurant_id) {
            $data['restaurant_id'] = auth()->user()->restaurant_id;
        }
        return $data;
    }
}
