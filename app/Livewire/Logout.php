<?php

namespace App\Livewire;

use Livewire\Component;

class Logout extends Component
{
    public function mount()
    {
        auth()->logout();
        return redirect('/');
    }
    public function render()
    {
        return view('livewire.logout');
    }
}
