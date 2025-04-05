<?php

namespace App\Livewire;

use App\Models\Dish;
use App\Models\Restaurant;
use Livewire\Component;

class RestaurantDetail extends Component
{
    public $restaurant;
    public $dishbyrestaurant;

    public function mount($id)
    {
        $this->restaurant = Restaurant::find($id);
        $this->dishbyrestaurant = Dish::inRandomOrder()->take(4)->get();
    }

    public function render()
    {
        return view('livewire.restaurant-detail');
    }
}
