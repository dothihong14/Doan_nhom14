<?php

namespace App\Livewire;

use App\Models\Customer;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class EditAccount extends Component
{
    public $name;
    public $address;
    public $phone;
    public $current_password;
    public $new_password;
    public $new_password_confirmation;

    public function mount()
    {
        $customer = Customer::where('email', Auth::user()->email)->first();
        $this->name = $customer->name;
        $this->address = $customer->address;
        $this->phone = $customer->phone;
    }

    public function updateAccount()
    {
        if (strlen($this->name) < 3) {
            session()->flash('error', 'Tên không được nhỏ hơn 3 ký tự.');
            return;
        }

        if (strlen($this->phone) < 10) {
            session()->flash('error', 'Số điện thoại không được nhỏ hơn 10 số.');
            return;
        }
        if (strlen($this->address) < 3) {
            session()->flash('error', 'Địa chỉ không được nhỏ hơn 3 ký tự.');
            return;
        }
        if($this->new_password != $this->new_password_confirmation){
        session()->flash('error', 'Mật khẩu và xác nhận mật khẩu không khớp.');
        return;
       }
       $user = Auth::user();
       $customer = Customer::where('email', Auth::user()->email)->first();

        $customer->name = $this->name;
        $customer->address = $this->address;
        $customer->phone = $this->phone;

        if ($this->current_password) {
            if (!\Hash::check($this->current_password, $user->password)) {
                session()->flash('error', 'Mật khẩu hiện tại không đúng.');
                return;
            }
            $user->password = bcrypt($this->new_password);
        }

        $customer->save();
        session()->flash('message', 'Cập nhật tài khoản thành công!');
    }

    public function render()
    {
        return view('livewire.edit-account');
    }
}