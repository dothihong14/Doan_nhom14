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
    public function save(array $options = [])
    {
        if ($this->isDirty('status') && $this->status === 'delivered') {
            $user = User::where('email', $this->email)->first();
            if ($user) {
                $loyaltyPoints = round($this->total_amount * 0.05);

                $user->increment('loyalty_points', $loyaltyPoints);
            }
        }

        return parent::save($options);
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
        static::created(function ($invoice) {
            if ($invoice->payment_status === 'paid' && $invoice->getOriginal('payment_status') !== 'paid' && isset($invoice->user_id)) {
                $customer = User::findOrFail($invoice->user_id);
                if ($customer) {
                    $customer->update(['loyalty_points' => $customer->loyalty_points + $invoice->final_amount * 0.05]);
                }
            }
        });

        static::updated(function ($invoice) {
            if ($invoice->wasChanged('payment_status') && $invoice->payment_status === 'paid' && $invoice->getOriginal('payment_status') !== 'paid' && isset($invoice->user_id)) {
                $customer = User::findOrFail($invoice->user_id);
                if ($customer) {
                    $customer->update(['loyalty_points' => $customer->loyalty_points + $invoice->final_amount * 0.05]);
                }
            }
        });
    }
}
