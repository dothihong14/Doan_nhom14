<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'status', 'total_amount', 'final_amount', 'point_discount', 'payment_method', 'address', 'name', 'phone', 'email', 'payment_status', 'order_code', 'notes', 'restaurant_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function dishes()
    {
        return $this->belongsToMany(Dish::class, 'order_items', 'order_id', 'dish_id');
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }

    protected static function booted()
    {
        static::addGlobalScope('restaurant', function (Builder $builder) {
            if (auth()->check() && auth()->user()->restaurant_id) {
                $builder->where('restaurant_id', auth()->user()->restaurant_id);
            }
        });

        static::created(function ($order) {
            if ($order->status === 'delivered' && $order->payment_status === 'paid' && $order->getOriginal('payment_status') !== 'paid' && isset($order->user_id)) {
                $customer = User::findOrFail($order->user_id);
                if ($customer) {
                    $customer->update(['loyalty_points' => $customer->loyalty_points + $order->final_amount * 0.05]);
                }
            }
        });

        static::updated(function ($order) {
            $originalPaymentStatus = $order->getOriginal('payment_status');
            $originalStatus = $order->getOriginal('status');

            if (
                $order->payment_status === 'paid' &&
                $order->status === 'delivered' &&
                ($originalPaymentStatus !== 'paid' || $originalStatus !== 'delivered') &&
                $order->wasChanged(['payment_status', 'status'])
            ) {
                if (isset($order->user_id)) {
                    $customer = User::find($order->user_id);
                    if ($customer) {
                        $customer->update([
                            'loyalty_points' => $customer->loyalty_points + $order->final_amount * 0.05
                        ]);
                    }
                }
            }
        });

    }
}
