<?php


use App\Livewire\EditAccount;
use App\Livewire\Logout;
use App\Livewire\OrderDetail;
use App\Livewire\Orders;
use App\Livewire\Promotion;
use App\Livewire\PromotionDetail;
use App\Livewire\ReservationDetail;
use App\Livewire\Reservations;
use App\Livewire\RestaurantDetail;
use App\Livewire\Restaurants;
use Illuminate\Support\Facades\Route;
use App\Livewire\Home;
use App\Livewire\Cart;
use App\Livewire\Checkout;
use App\Livewire\Contact;
use App\Livewire\Login;
use App\Livewire\Register;
use App\Livewire\LostPassword;
use App\Livewire\MyAccount;
use App\Livewire\OrderReceived;
use App\Livewire\Product;
use App\Livewire\Reservation;
use App\Livewire\Shop;

Route::get('/', Home::class);
Route::get('/cart', Cart::class);
Route::get('/checkout', Checkout::class);
Route::get('/contact', Contact::class);
Route::get('/login', Login::class);
Route::get('/register', Login::class);
Route::get('/lost-password', LostPassword::class);
Route::get('/my-account', MyAccount::class);
Route::get('/my-account/edit-account', EditAccount::class);
Route::get('/my-account/orders', Orders::class);
Route::get('/my-account/orders/{code}', OrderDetail::class);
Route::get('/my-account/reservations', Reservations::class);
Route::get('/my-account/reservations/{code}', ReservationDetail::class);
Route::get('/my-account/edit-account', EditAccount::class);
Route::get('/my-account/logout', Logout::class);







Route::get('/order-received', OrderReceived::class);
Route::get('/product/{slug}', Product::class);
Route::get('/reservation', Reservation::class);
Route::get('/shop', Shop::class);
Route::get('/promotion', Promotion::class);
Route::get('/promotion/{slug}', PromotionDetail::class);
Route::get('/restaurant', Restaurants::class);
Route::get('/restaurant/{id}', RestaurantDetail::class);
