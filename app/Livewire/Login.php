<?php

namespace App\Livewire;

use App\Models\Customer;
use App\Models\User;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class Login extends Component
{
    public $email_or_phone;
    public $password;
    public $remember = false;


    public $email;
    public $phone;
    public $name;
    public $password_register;

    public function login()
    {
        $this->validate([
            'email_or_phone' => 'required|string',
            'password' => 'required|string',
        ]);

        $credentials = [
            'password' => $this->password,
        ];

        if (filter_var($this->email_or_phone, FILTER_VALIDATE_EMAIL)) {
            $credentials['email'] = $this->email_or_phone;
        } else {
            $credentials['phone'] = $this->email_or_phone; // Giả định bạn có trường phone trong model User
        }
        $customer = Customer::where('email', $this->email_or_phone)->first();
        if(empty($customer)) {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Tài khoản không tồn tại!']);
            return;
        }
        if (Customer::where('email', $this->email_or_phone)->first()->is_locked == 1) {
            session()->flash('error', 'Tài khoản đã bị khóa.');
            return;
        }
        if (Auth::attempt($credentials, $this->remember)) {

            // Đăng nhập thành công
            return redirect('/'); // Thay đổi route theo nhu cầu
        } else {
            // Đăng nhập thất bại
            session()->flash('error', 'Đăng nhập không thành công.');
        }
    }

    public function render()
    {
        return view('livewire.login');
    }
}
