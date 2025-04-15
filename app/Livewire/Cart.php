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
        $this->cartItems = CartManagement::incrementQuantityToCartItem($productId);
        $this->grandTotal = CartManagement::calculateGrandTotal($this->cartItems);
    }

    public function decrement($productId)
    {
        $this->cartItems = CartManagement::decrementQuantityToCartItem($productId);
        $this->grandTotal = CartManagement::calculateGrandTotal($this->cartItems);
    }

    public function remove($productId)
    {
        $this->cartItems = CartManagement::removeCartItem($productId);
        $this->grandTotal = CartManagement::calculateGrandTotal($this->cartItems);
    }

    public function render()
    {
        return view('livewire.cart');
    }
}
