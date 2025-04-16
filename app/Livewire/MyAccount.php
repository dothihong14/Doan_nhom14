<?php

namespace App\Livewire;

use App\Models\Customer;
use App\Models\User;
use Livewire\Component;

class MyAccount extends Component
{
    public $user;
    public $customer;
    public function mount()
    {
        $this->user = auth()->user();
        if(!$this->user){
            return redirect()->route('login');
        }
        $this->customer = User::where('email', $this->user->email)->first();
    }
    public function render()
    {
        return view('livewire.my-account');
    }
}
