<?php

namespace App\Livewire\Inc;

use Livewire\Component;

class MenuMobile extends Component
{

    public function logout()
    {

        auth()->logout();
        return redirect('/login');
    }
    public function render()
    {
        return view('livewire.inc.menu-mobile');
    }
}
