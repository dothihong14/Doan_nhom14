<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;

class Invoice extends Model
{
    use HasFactory;

    protected $fillable = [
        'invoice_code',
        'restaurant_id',
        'user_id',
        'total_amount',
        'final_amount',
        'point_discount',
        'restaurant_discount',
        'status',
        'payment_method'
    ];

    /**
     * Mối quan hệ với model Restaurant
     */
    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    public function invoiceItems()
    {
        return $this->hasMany(InvoiceItem::class);
    }
    public function items()
    {
        return $this->hasMany(InvoiceItem::class);
    }

    public function dishes()
    {
        return $this->belongsToMany(Dish::class, 'invoice_items', 'invoice_id', 'dish_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'phone', 'phone');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($invoice) {
            do {
                $code = 'INV-' . strtoupper(uniqid());
            } while (self::where('invoice_code', $code)->exists());

            $invoice->invoice_code = $code;
        });
    }

    protected static function booted()
    {
        static::addGlobalScope('restaurant', function (Builder $builder) {
            if (auth()->check() && auth()->user()->restaurant_id) {
                $builder->where('restaurant_id', auth()->user()->restaurant_id);
            }
        });

        static::created(function ($invoice) {
            if ($invoice->status === 'paid' && $invoice->getOriginal('status') !== 'paid' && isset($invoice->user_id)) {
                $customer = User::findOrFail($invoice->user_id);
                if ($customer) {
                    $customer->update(['loyalty_points' => $customer->loyalty_points + $invoice->final_amount * 0.05]);
                }
            }
        });

        static::updated(function ($invoice) {
            if ($invoice->wasChanged('status') && $invoice->status === 'paid' && $invoice->getOriginal('status') !== 'paid' && isset($invoice->user_id)) {
                $customer = User::findOrFail($invoice->user_id);
                if ($customer) {
                    $customer->update(['loyalty_points' => $customer->loyalty_points + $invoice->final_amount * 0.05]);
                }
            }
        });
    }

}
