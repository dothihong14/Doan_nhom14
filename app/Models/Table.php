<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Table extends Model
{
    use HasFactory;

    protected $fillable = [
        'restaurant_id', 'table_number', 'status', 'reservation_id'
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
}
