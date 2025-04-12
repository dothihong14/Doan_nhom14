<?php

namespace App\Livewire;

use Livewire\Component;

class Logout extends Component
{
    public function mount()
    {
        auth()->logout();
        return redirect('/login');
    }
    public function render()
    {
        return view('livewire.logout');
    }
}
