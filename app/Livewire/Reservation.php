<?php

namespace App\Livewire;

use App\Models\Reservation as ReservationModel;
use App\Models\Restaurant; // Import the Restaurant model
use Barryvdh\DomPDF\Facade\Pdf;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;
class Reservation extends Component
{
    public $name;
    public $phone;
    public $reservation_day;
    public $number_of_people;
    public $reservation_time;
    public $restaurant_id;
    public $notes; // New notes property

    public function mount()
    {
        if (!Auth::check()) {
            return redirect('/login');

        }
        $this->name = Auth::user()->name;
        $this->phone = Auth::user()->phone;
        $this->reservation_time = date('H:i');
        $this->reservation_day = date('Y-m-d');
        $this->restaurant_id = Restaurant::first()->id;
        $this->number_of_people = 1;

    }

    public function submit()
    {
        if (empty($this->name) || empty($this->phone) || empty($this->reservation_day) || empty($this->number_of_people) || empty($this->reservation_time) || empty($this->restaurant_id)) {
            session()->flash('error', 'Vui lòng điền đầy đủ các trường bắt buộc.');
            return redirect('/reservation');
        }

        $reservation_code = strtoupper(uniqid('RESERVATION_')); // Use uniqid to generate a unique code

        $reservation = ReservationModel::create([
            'user_id' => Auth::id(),
            'restaurant_id' => $this->restaurant_id,
            'number_of_people' => $this->number_of_people,
            'reservation_time' => $this->reservation_time,
            'reservation_day' => $this->reservation_day,
            'reservation_code' => $reservation_code, // Use the unique reservation code
            'name' => $this->name,
            'phone' => $this->phone,
            'notes' => $this->notes,
            'status' => 'pending',
        ]);

        session()->flash('message', 'Reservation successfully created.');
        $this->downloadPDF($reservation->id);

        // Clear the form fields
        $this->reset();
    }
    public function downloadPDF($reservationId)
    {
        $reservation = ReservationModel::findOrFail($reservationId);

        $pdf = Pdf::loadView('pdf.reservation', ['reservation' => $reservation]);
        $pdf->save('reservation_' . $reservation->reservation_code . '.pdf');
         redirect('/reservation_' . $reservation->reservation_code . '.pdf');
    }
    public function render()
    {
        $restaurants = Restaurant::all(); // Fetch all restaurants
        return view('livewire.reservation', ['restaurants' => $restaurants]);
    }
}