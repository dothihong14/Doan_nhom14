<?php

namespace App\Livewire;

use App\Models\Reservation;
use Livewire\Component;

class Reservations extends Component
{
        public $reservations;
        protected $listeners = ['cancelReservation'];

    public function mount()
    {
        $reservations = Reservation::where('user_id', auth()->user()->id)->get();
        $this->reservations = $reservations;
    }
    public function cancelReservation($id)
    {
        $reservation = Reservation::find($id);
        if ($reservation && $reservation->status == 'pending') {
            $reservation->status = 'canceled';
            $reservation->save();
            $this->dispatch('reservationCancelled'); // Gửi sự kiện đến frontend
        }
    }


    public function reservationDetail($code)
    {
        return redirect('/my-account/reservations/'.$code);
    }
    public function render()
    {
        return view('livewire.reservations');
    }
}
