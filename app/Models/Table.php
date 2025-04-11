<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Table extends Model
{
    use HasFactory;

    protected $fillable = [
        'restaurant_id', 'table_code', 'status', 'reservation_id', 'number_guest'
    ];

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    public function reservation()
    {
        return $this->belongsTo(Reservation::class);
    }
    public function tableDishes()
    {
        return $this->hasMany(TableDish::class);
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
