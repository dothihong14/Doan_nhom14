<?php

namespace App\Livewire;

use App\Models\Order;
use App\Models\TableDish;
use App\Models\User; // Make sure to import the User model
use Livewire\Component;

class OrderReceived extends Component
{
    public $order;

    public function mount()
    {

        $this->order = Order::where('order_code', request()->vnp_TxnRef)->first();
        if(!$this->order){
            session()->flash('message', 'Đơn hàng không tồn tại!');
            return redirect('/');
        }
        // Check if the order was found
        if (!$this->order) {
            session()->flash('message', 'Đơn hàng không tồn tại!');
            // return redirect('/');
        }
        if($this->order->payment_method == 'cod'){
            $this->order->payment_status = 'unpaid';
            $this->order->save();
            session()->flash('message', 'Đơn hàng đã được tạo thành công!');
            return ;

        }
        // Compare the amounts without formatting
        // dd($this->order->total_amount, request()->vnp_Amount);
        // if ($this->order->total_amount != request()->vnp_Amount) {
        //     $this->order->payment_status = 'failed';
        //     $this->order->save();
        //     session()->flash('message', 'Thanh toán thất bại!');
        //     // return redirect('/');
        // }

        // Handle payment response
        // ORDER_67EC90E929B05
        if (request()->vnp_ResponseCode != '00' && $this->order->payment_status == 'unpaid') {
            $this->order->payment_status = 'failed';
            $this->order->save();
            $order = Order::where('order_code', request()->vnp_TxnRef)->first();
            TableDish::where('order_code', request()->vnp_TxnRef)->delete();
            if($order){
                $order->delete();
            }
            session()->flash('message', 'Thanh toán thất bại!');
        } else if (request()->vnp_ResponseCode == '00' && $this->order->payment_status == 'unpaid') {
            // Add 5% of the total amount to the user's loyalty points
            $user = User::find($this->order->user_id); // Assuming order has a user_id field
            if ($user) {
                // $loyaltyPointsToAdd = $this->order->total_amount * 0.05;
                // $user->loyalty_points += $loyaltyPointsToAdd; // Increase loyalty points
                $user->save(); // Save the user
            }
            $this->order->payment_status = 'paid';
            $this->order->save();


            session()->flash('message', 'Thanh toán thành công! Mã đơn hàng: ' . $this->order->order_code);
        } else {
            Order::where('order_code', request()->vnp_TxnRef)->delete();
            session()->flash('message', 'Thanh toán thất bại!');

        }
    }

    public function render()
    {
        return view('livewire.order-received');
    }
}