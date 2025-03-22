<?php

namespace App\Livewire;

use Livewire\Component;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class Register extends Component
{



    public function render()
    {
        return view('livewire.register');
    }
}
