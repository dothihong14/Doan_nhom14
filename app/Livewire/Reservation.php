<?php

namespace App\Livewire;

use App\Models\Customer;
use App\Models\Reservation as ReservationModel;
use App\Models\Restaurant;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class Reservation extends Component
{
    public $name;
    public $phone;
    public $email;
    public $reservation_day;
    public $number_of_people;
    public $reservation_time;
    public $restaurant_id;
    public $notes;
    public $otp;
    public $generatedOtp;
    public $otpSent = false;

    public $showSuccessModal = false;
    public $reservation_id;

    public function mount()
    {
        if (Auth::check()) {
            $customer = Customer::where('email', Auth::user()->email)->first();
            $this->name = $customer->name ?? null;
            $this->phone = $customer->phone ?? null;
            $this->email = $customer->email ?? null;
        } else {
            $this->name = null;
            $this->phone = null;
            $this->email = null;
        }

        $this->reservation_time = null;
        $this->reservation_day = null;
    }

    public function submit()
    {
        $this->createReservation();
    }

    public function sendOtp()
    {
        $this->generatedOtp = rand(100000, 999999);
        Mail::to($this->email)->send(new \App\Mail\OtpMail($this->generatedOtp));
        $this->otpSent = true;
        session()->flash('message', 'OTP has been sent to your email.');
    }

    public function verifyOtp()
    {
        if ($this->otp == $this->generatedOtp) {
            $this->createReservation();
        } else {
            session()->flash('error', 'Invalid OTP. Please try again.');
        }
    }

    public function createReservation()
    {
        \Log::info($this->all());
        $reservation_code = strtoupper(uniqid('RESERVATION_'));

        if ($this->name == null || $this->phone == null || $this->reservation_day == null || $this->reservation_time == null || $this->restaurant_id == null) {
            session()->flash('error', 'Vui lòng điền đầy đủ thông tin.');
            return;
        }
        if (!preg_match('/^\d{10}$/', $this->phone)) {
            session()->flash('error', 'Số điện thoại không hợp lệ. Vui lòng nhập đúng 10 chữ số.');
            return;
        }

        $today = now()->format('Y-m-d');
        if ($this->reservation_day < $today) {
            session()->flash('error', 'Ngày đặt bàn phải lớn hơn ngày hiện tại.');
            return;
        }

        $reservation = ReservationModel::create([
            'user_id' => Auth::check() ? Auth::id() : null,
            'restaurant_id' => $this->restaurant_id,
            'number_of_people' => $this->number_of_people,
            'reservation_time' => $this->reservation_time,
            'reservation_day' => $this->reservation_day,
            'reservation_code' => $reservation_code,
            'name' => $this->name,
            'phone' => $this->phone,
            'notes' => $this->notes,
            'status' => 'pending',
        ]);

        $this->reservation_id = $reservation->id;
        $this->showSuccessModal = true;

        $this->reset(['name', 'phone', 'email', 'reservation_day', 'reservation_time', 'restaurant_id', 'number_of_people', 'notes', 'otp', 'generatedOtp', 'otpSent']);
    }

    public function downloadPDF($reservationId)
    {
        $reservation = ReservationModel::findOrFail($reservationId);
        $pdf = Pdf::loadView('pdf.reservation', ['reservation' => $reservation]);

        $filePath = storage_path('app/public/reservations/reservation_' . $reservation->reservation_code . '.pdf');
        $pdf->save($filePath);

        $this->showSuccessModal = false;

        return response()->download($filePath, 'reservation_' . $reservation->reservation_code . '.pdf');
    }

    // Hàm để hiển thị lại form đặt bàn
    public function continueBooking()
    {
        $this->showSuccessModal = false;
        $this->reset(['name', 'phone', 'email', 'reservation_day', 'reservation_time', 'restaurant_id', 'number_of_people', 'notes', 'otp', 'generatedOtp', 'otpSent']);
        if (Auth::check()) {
            $customer = Customer::where('email', Auth::user()->email)->first();
            $this->name = $customer->name ?? null;
            $this->phone = $customer->phone ?? null;
            $this->email = $customer->email ?? null;
        }
    }

    public function closeModal()
    {
        $this->showSuccessModal = false;
    }

    public function render()
    {
        $restaurants = Restaurant::all();
        return view('livewire.reservation', ['restaurants' => $restaurants]);
    }
}
