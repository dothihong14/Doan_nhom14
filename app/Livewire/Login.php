<?php

namespace App\Livewire;

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
        if (User::where('email', $this->email_or_phone)->where('is_locked', 1)->exists()) {
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
        if (empty($this->email) || empty($this->phone) || empty($this->password)) {
            session()->flash('error', 'Vui lòng nhập đầy đủ thông tin.');
            return;
        }


        // Tạo người dùng mới
        User::create([
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'password' => bcrypt($this->password_register),
        ]);

        // Reset các thuộc tính
        $this->reset(['email', 'phone', 'password', 'name']);
        // Hiển thị thông báo thành công
        session()->flash('message', 'Đăng ký thành công!');
        return redirect('/login');

    }

    public function render()
    {
        return view('livewire.login');
    }
}
