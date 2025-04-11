<?php
namespace App\Livewire;

use App\Helpers\CartManagement;
use Livewire\Component;
use App\Models\Dish;
use App\Models\Promotion;

class Home extends Component
{
    public $topDishes;
    public $latestPromotions;

    public function mount()
    {
        $this->topDishes = Dish::orderBy('sold_quantity', 'desc')->limit(12)->get();
        $this->latestPromotions = Promotion::orderBy('created_at', 'desc')->limit(5)->get();
    }
    public function addToCart($id)
    {
        CartManagement::addItemToCart($id, 1);
        $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Sản phẩm đã được thêm vào giỏ hàng!']);
    }
    public function buyNow($id)
    {
        CartManagement::addItemToCart($id, 1);
        return redirect('/checkout');
    }
    public function render()
    {
        return view('livewire.home', [
            'dishes' => $this->topDishes,
            'promotions' => $this->latestPromotions,
        ]);
    }
}
