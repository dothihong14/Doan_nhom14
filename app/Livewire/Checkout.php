<?php

namespace App\Livewire;

use App\Models\Customer;
use App\Models\Dish;
use App\Models\Reservation as ReservationModel;
use App\Models\TableDish;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Livewire\Component;
use App\Helpers\CartManagement;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Restaurant;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class Checkout extends Component
{
    public $cartItems = [];
    public $totalAmount = 0;
    public $subtotal = 0;
    public $loyaltyDiscount = 0;
    public $address;
    public $name;
    public $phone;
    public $email;
    public $notes;
    public $paymentMethod;
    public $restaurant_id;
    public $restaurants;
    public $verificationCode;
    public $enteredCode;
    public $emailVerified = false;
    public $useLoyaltyPoints = false;

    public function mount()
    {
        $this->name = auth()->user()->name ?? '';
        $this->email = auth()->user()->email ?? '';
        $this->phone = auth()->user()->phone ?? '';
        $this->address = auth()->user()->address ?? '';
        $this->restaurant_id = Restaurant::first()->id ?? '';
        $this->restaurants = Restaurant::all();
        $this->paymentMethod = 'cod';

        $pd_id = request()->query('pd_id');

        if ($pd_id) {
            $product = Dish::find($pd_id);
            if (!$product) {
                session()->flash('error', 'Sản phẩm không tồn tại.');
                return redirect('/cart');
            }

            $this->cartItems = [
                [
                    'product_id' => $product->id,
                    'name' => $product->name,
                    'quantity' => 1,
                    'unit_amount' => $product->price,
                ]
            ];
            $this->subtotal = $product->price; // Sử dụng giá trực tiếp thay vì format
        } else {
            $this->cartItems = CartManagement::getCartItemsFromCookie();
            $this->calculateSubtotal();
        }

        if (empty($this->cartItems)) {
            return redirect('/cart');
        }

        $this->updateTotal();
    }

    // Hàm tính toán subtotal dựa trên cartItems
    private function calculateSubtotal()
    {
        $this->subtotal = 0;
        foreach ($this->cartItems as $item) {
            $this->subtotal += $item['unit_amount'] * $item['quantity'];
        }
    }

    // Hàm tăng số lượng
    public function increaseQuantity($index)
    {
        if (isset($this->cartItems[$index])) {
            $this->cartItems[$index]['quantity']++;
            $this->updateCart();
        }
    }

    // Hàm giảm số lượng
    public function decreaseQuantity($index)
    {
        if (isset($this->cartItems[$index]) && $this->cartItems[$index]['quantity'] > 1) {
            $this->cartItems[$index]['quantity']--;
            $this->updateCart();
        }
    }

    // Hàm cập nhật giỏ hàng và tính lại tiền
    public function updateCart()
    {
        if (!request()->query('pd_id')) {
            CartManagement::updateCartItemsInCookie($this->cartItems);
        }
        $this->calculateSubtotal();
        $this->updateTotal();
    }

    // Hàm tính lại tổng tiền (bao gồm giảm giá từ điểm thưởng)
    public function updateTotal()
    {
        $this->calculateSubtotal();
        $this->loyaltyDiscount = 0;

        if ($this->useLoyaltyPoints && auth()->check() && auth()->user()->loyalty_points > 0) {
            $this->loyaltyDiscount = auth()->user()->loyalty_points;
        }

        $this->totalAmount = max(0, $this->subtotal - $this->loyaltyDiscount);
    }

    public function sendVerificationCode()
    {
        if (empty($this->email)) {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Vui lòng nhập email !']);
            return;
        }

        $this->verificationCode = rand(100000, 999999);
        Session::put('verification_code', $this->verificationCode);
        Session::put('verification_email', $this->email);
        Session::put('email_verified', false);

        Mail::raw("Mã xác thực của bạn là: " . $this->verificationCode, function ($message) {
            $message->to($this->email)
                ->subject('Mã xác thực đặt hàng');
        });

        $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Mã xác thực đã được gửi tới gmail của bạn!']);
    }

    public function placeOrder()
    {
        if (!auth()->check()) {
            if (!$this->emailVerified) {
                $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Bạn cần xác thực email trước khi đặt hàng !']);
                return;
            }
        }
        if (empty($this->address) || empty($this->name) || empty($this->phone) || empty($this->email)) {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Vui lòng điền đầy đủ các trường bắt buộc !']);
            return redirect('/checkout');
        }
        if (!preg_match('/^\d{10}$/', $this->phone)) {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Số điện thoại không hợp lệ. Vui lòng nhập đúng 10 chữ số !']);
            return;
        }
        if (empty($this->paymentMethod)) {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Vui lòng chọn phương thức thanh toán !']);
            return redirect('/checkout');
        }

        $pointDiscount = 0;
        if ($this->useLoyaltyPoints && auth()->check()) {
            $pointDiscount = auth()->user()->loyalty_points;
            $user = User::find(auth()->id());
            $user->loyalty_points = 0;
            $user->save();
        }

        $order = Order::create([
            'user_id' => auth()->id() ?? null,
            'total_amount' => $this->subtotal,
            'final_amount' => $this->totalAmount,
            'address' => $this->address,
            'name' => $this->name,
            'phone' => $this->phone,
            'email' => $this->email,
            'status' => 'pending',
            'payment_status' => 'unpaid',
            'payment_method' => $this->paymentMethod,
            'order_code' => strtoupper(uniqid('ORDER_')),
            'notes' => $this->notes,
            'restaurant_id' => $this->restaurant_id,
            'point_discount' => $pointDiscount,
        ]);

        foreach ($this->cartItems as $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'dish_id' => $item['product_id'],
                'quantity' => $item['quantity'],
                'unit_price' => $item['unit_amount'],
                'total_price' => $item['unit_amount'] * $item['quantity'],
            ]);
            TableDish::create([
                'dish_id' => $item['product_id'],
                'table_id' => null,
                'quantity' => $item['quantity'],
                'status' => 'pending',
                'order_code' => $order->order_code,
            ]);
        }
        if (!request()->query('pd_id')) {
            CartManagement::clearCartItems();
        }
        if (!auth()->user()) {
            $customer = Customer::where('email', $this->email)->first();
            if (!$customer) {
                $customer = Customer::create([
                    'email' => $this->email,
                    'name' => $this->name,
                    'phone' => $this->phone,
                    'address' => $this->address,
                ]);
            }
        }
        $this->order_id = $order->id;
        if ($this->paymentMethod == 'bank') {
            return $this->paymentVNPAY($order->id, $this->totalAmount, $order->order_code);
        } else {
            return redirect('/order-received?vnp_TxnRef=' . $order->order_code);
        }
    }
    public function downloadPDF($order_code)
    {
        $order = Order::where('order_code', $order_code)->first();
        $pdf = Pdf::loadView('pdf.order', ['order' => $order]);

        $filePath = storage_path('app/public/orders/order_' . $order->order_code . '.pdf');
        $pdf->save($filePath);

        return response()->download($filePath, 'order_' . $order->order_code . '.pdf');
    }

    public function verifyCode()
    {
        if ($this->enteredCode == Session::get('verification_code') && $this->email == Session::get('verification_email')) {
            Session::put('email_verified', true);
            $this->emailVerified = true;
            $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Xác thực email thành công !']);
        } else {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Mã xác thực không đúng !']);
        }
    }

    public function paymentVNPAY($order_id, $total_amount, $order_code)
    {
        $vnp_TmnCode = "AHWX5MX0";
        $vnp_HashSecret = "LMPIBTDLXYGA1K0RTK06SAEPKGW0V1LX";
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = env('APP_URL') . "/order-received";
        $vnp_TxnRef = $order_code;
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
            'subtotal' => $this->subtotal,
            'loyaltyDiscount' => $this->loyaltyDiscount,
        ]);
    }
}
