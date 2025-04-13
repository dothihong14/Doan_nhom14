<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Reservation extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id','table_id', 'restaurant_id', 'number_of_people', 'reservation_time', 'status', 'reservation_code', 'notes', 'name', 'phone', 'reservation_day'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function table()
    {
        return $this->belongsTo(Table::class);
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
    }
}
