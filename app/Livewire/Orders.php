<?php

namespace App\Livewire;

use App\Models\Order;
use Livewire\Component;

class Orders extends Component
{
    public $orders;
    public function mount()
    {
        $this->orders = Order::where('user_id', auth()->user()->id)->get();
    }
    public function orderDetail($code)
    {
        return redirect('/my-account/orders/'.$code);
    }
    public function cancelOrder($id)
    {
        $order = Order::find($id);
        if ($order->status == 'pending') {
            $order->status = 'canceled';
            $order->save();

        }
    }
    public function render()
    {
        return view('livewire.orders');
    }
}
