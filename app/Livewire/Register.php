<?php

namespace App\Livewire;

use App\Models\Customer;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class Register extends Component
{

    public $email;
    public $phone;
    public $name;
    public $password_register;

    public function register()
    {

        if (empty($this->name)) {
            session()->flash('error', 'Vui lòng nhập tên.');
            return;
        }
        if (empty($this->email)) {
            session()->flash('error', 'Vui lòng nhập email.');
            return;
        }
        if (!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            session()->flash('error', 'Email không hợp lệ.');
            return;
        }
        if (empty($this->phone)) {
            session()->flash('error', 'Vui lòng nhập số điện thoại.');
            return;
        }

        if (!preg_match('/^\d{10}$/', $this->phone)) {
            session()->flash('error', 'Số điện thoại không hợp lệ. Vui lòng nhập đúng 10 chữ số.');
            return;
        }

        if (!preg_match('/^[0-9]{10}$/', $this->phone)) {
            session()->flash('error', 'Số điện thoại không hợp lệ.');
            return;
        }
        if (empty($this->password_register)) {
            session()->flash('error', 'Vui lòng nhập mật khẩu.');
            return;
        }
        // Kiểm tra xem email và phone đã tồn tại chưa
        if (User::where('email', $this->email)->exists()) {
            session()->flash('error', 'Email đã tồn tại.');
            return;
        }

        if (User::where('phone', $this->phone)->exists()) {
            session()->flash('error', 'Số điện thoại đã tồn tại.');
            return;
        }
        if (empty($this->email) || empty($this->phone) || empty($this->password_register)) {
            session()->flash('error', 'Vui lòng nhập đầy đủ thông tin.');
            return;
        }


        // Tạo người dùng mới
        $user = User::create([
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'password' => bcrypt($this->password_register),
        ]);
        Customer::create([
            'user_id' => $user->id,
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'is_locked' => 0,
        ]);
        Auth::login($user);


        return redirect('/');

    }

    public function render()
    {
        return view('livewire.register');
    }
}
