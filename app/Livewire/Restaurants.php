<?php

namespace App\Livewire;

use App\Models\Restaurant;
use Livewire\Component;

class Restaurants extends Component
{
    public $restaurants;

    public function mount()
    {
        $this->restaurants = Restaurant::all();
    }
    public function render()
    {
        return view('livewire.restaurants');
    }
}
