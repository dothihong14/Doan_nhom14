<?php
namespace App\Livewire;

use Livewire\Component;
use App\Models\Dish;
use App\Models\Promotion;

class Home extends Component
{
    public $topDishes;
    public $latestPromotions;

    public function mount()
    {
        $this->topDishes = Dish::orderBy('sold_quantity', 'desc')->limit(4)->get();
        $this->latestPromotions = Promotion::orderBy('created_at', 'desc')->limit(5)->get();
    }

    public function logout()
    {
        auth()->logout();
        return redirect('/login');
    }

    public function render()
    {
        return view('livewire.home', [
            'dishes' => $this->topDishes,
            'promotions' => $this->latestPromotions,
        ]);
    }
}