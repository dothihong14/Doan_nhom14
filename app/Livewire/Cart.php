<?php

namespace App\Livewire;

use Livewire\Component;
use App\Helpers\CartManagement;

class Cart extends Component
{
    public $cartItems = [];
    public $grandTotal = 0;

    protected $listeners = ['cartUpdated' => 'refreshCart'];

    public function mount()
    {
        $this->refreshCart();
    }

    public function refreshCart()
    {
        $this->cartItems = CartManagement::getCartItemsFromCookie();
        $this->grandTotal = CartManagement::calculateGrandTotal($this->cartItems);
    }

    public function increment($productId)
    {
        CartManagement::incrementQuantityToCartItem($productId);
        $this->refreshCart();
    }

    public function decrement($productId)
    {
        CartManagement::decrementQuantityToCartItem($productId);
        $this->refreshCart();
    }

    public function remove($productId)
    {
        CartManagement::removeCartItem($productId);
        $this->refreshCart();
    }

    public function render()
    {
        return view('livewire.cart');
    }
}