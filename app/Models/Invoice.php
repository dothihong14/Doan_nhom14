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
        'total_amount',
        'status',
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
    }

}
