<?php

namespace App\Livewire;

use App\Helpers\CartManagement;
use App\Models\Dish;
use Livewire\Component;

class Product extends Component
{
    public $product;
    public $quantity = 1;
    public $related_products;
    public function mount($slug)
    {
        $this->product = Dish::where('slug', $slug)->first();
        if (!$this->product) {
            abort(404);
        }
        $this->related_products = Dish::where('food_category_id', $this->product->food_category_id)
        ->inRandomOrder()
        ->limit(4)
        ->get();

    }
    public function addToCart()
    {
        CartManagement::addItemToCart($this->product->id, $this->quantity);
        $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Sản phẩm đã được thêm vào giỏ hàng!']);
    }
    public function incrementQuantity()
    {
        $this->quantity++;
    }
    public function addToCart_related($id)
    {
        CartManagement::addItemToCart($id, 1);
//        return redirect('/cart');
    }
    public function decrementQuantity()
    {
        $this->quantity--;
    }
    public function render()
    {
        return view('livewire.product');
    }
}
