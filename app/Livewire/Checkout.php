<?php

namespace App\Livewire;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use App\Helpers\CartManagement;
use App\Models\Order;
use App\Models\OrderItem;

class Checkout extends Component
{
    public $cartItems = [];
    public $totalAmount = 0;
    public $address;
    public $name;
    public $phone;
    public $email;
    public $notes;
    public $paymentMethod; // New property for payment method

    public function mount()
    {
        if (!Auth::check()) {
            return redirect('/login');
        }
        $this->name = auth()->user()->name;
        $this->email = auth()->user()->email;
        $this->phone = auth()->user()->phone;
        $this->address = auth()->user()->address;
        $this->cartItems = CartManagement::getCartItemsFromCookie();
        if (empty($this->cartItems)) {
            return redirect('/cart');
        }
        $this->totalAmount = CartManagement::calculateGrandTotal($this->cartItems);
    }

    public function placeOrder()
    {

        if (empty($this->address) || empty($this->name) || empty($this->phone) || empty($this->email)) {
            session()->flash('error', 'Vui lòng điền đầy đủ các trường bắt buộc.');
            return redirect('/checkout');
        }
        if (empty($this->paymentMethod)) {
            session()->flash('error', 'Vui lòng chọn phương thức thanh toán.');
            return redirect('/checkout');
        }

        // Create the order
        $order = Order::create([
            'user_id' => auth()->id(), // Assuming users are authenticated
            'total_amount' => $this->totalAmount,
            'address' => $this->address,
            'name' => $this->name,
            'phone' => $this->phone,
            'email' => $this->email,
            'status' => 'pending', // Set the status as needed
            'payment_status' => 'unpaid', // Set payment status
            'payment_method' => $this->paymentMethod, // Store selected payment method
            'order_code' => strtoupper(uniqid('ORDER_')), // Generate a unique order code
            'notes' => $this->notes,
        ]);
        // Create order items
        foreach ($this->cartItems as $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'dish_id' => $item['product_id'],
                'quantity' => $item['quantity'],
                'price' => $item['unit_amount'],
            ]);
        }
        CartManagement::clearCartItems();
        if($this->paymentMethod == 'bank'){
            $this->paymentVNPAY($order->id,$this->totalAmount,$order->order_code);
        }else{
            return redirect('/order-received?vnp_TxnRef='.$order->order_code);
        }
        // Clear cart items after order is placed

        // Optionally, you could redirect or show a success message
        session()->flash('message', 'Đặt hàng thành công!');
    }
    public function paymentVNPAY($order_id,$total_amount,$order_code)
    {
        $vnp_TmnCode = "AHWX5MX0"; //Mã website tại VNPAY
        $vnp_HashSecret = "LMPIBTDLXYGA1K0RTK06SAEPKGW0V1LX"; //Chuỗi bí mật
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = env('APP_URL') . "/order-received";
        $vnp_TxnRef = $order_code; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = "Thanh toán hóa đơn phí dich vụ";
        $vnp_OrderType = 'billpayment';
        $vnp_Amount = $total_amount * 100;
        $vnp_Locale = 'vn';
        $vnp_IpAddr = request()->ip();

        $inputData = array(
            "vnp_Version" => "2.0.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . $key . "=" . $value;
            } else {
                $hashdata .= $key . "=" . $value;
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
            $vnp_Url .= 'vnp_SecureHashType=HMACSHA512&vnp_SecureHash=' . $vnpSecureHash;
        }
        return redirect($vnp_Url);
    }
    public function render()
    {
        return view('livewire.checkout', [
            'cartItems' => $this->cartItems,
            'totalAmount' => $this->totalAmount,
        ]);
    }
}
