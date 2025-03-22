<?php

namespace App\Livewire;

use App\Models\Reservation;
use Livewire\Component;

class ReservationDetail extends Component
{
    public $reservation;
    public function mount($code)
    {
        $this->reservation = Reservation::where('reservation_code', $code)->first();
    }
    public function render()
    {
        return view('livewire.reservation-detail');
    }
}
