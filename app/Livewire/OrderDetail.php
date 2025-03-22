<?php

namespace App\Livewire;

use App\Models\Order;
use Livewire\Component;

class OrderDetail extends Component
{
    public $order;
    public function mount($code)
    {
        $this->order = Order::where('order_code', $code)->with('items')->first();
    }
    public function render()
    {
        return view('livewire.order-detail');
    }
}
