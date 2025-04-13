<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Table extends Model
{
    use HasFactory;

    protected $fillable = [
        'restaurant_id', 'table_code', 'status', 'number_guest'
    ];

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    public function reservations()
    {
        return $this->hasMany(Reservation::class);
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

        static::updated(function (Table $table) {
            $now = Carbon::now();
            $oneHourLater = $now->copy()->addHour();
            $currentDay = $now->toDateString();

            $hasUpcomingReservation = \App\Models\Reservation::where('table_id', $table->id)
                ->where('reservation_day', $currentDay)
                ->whereBetween('reservation_date', [$now, $oneHourLater])
                ->exists();

            if ($hasUpcomingReservation && $table->status !== 'reserved') {
                $table->update(['status' => 'reserved']);
            }
        });
    }
}
