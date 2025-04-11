<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Ingredient extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'image', 'quantity_in_stock', 'minimum_threshold', 'unit', 'restaurant_id', 'expiration_date', 'status', 'quantity_auto'
    ];

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }

    // Sử dụng sự kiện saving để kiểm tra và cập nhật status
    protected static function boot()
    {
        parent::boot();

        static::saving(function ($ingredient) {
            if ($ingredient->quantity_in_stock > 0 && $ingredient->quantity_in_stock >= $ingredient->minimum_threshold) {
                $ingredient->status = 'in_stock'; // còn
            } elseif ($ingredient->quantity_in_stock > 0 && $ingredient->quantity_in_stock < $ingredient->minimum_threshold) {
                $ingredient->status = 'low_stock'; // sắp hết
            } else {
                $ingredient->status = 'out_of_stock'; // hết hàng
            }
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
