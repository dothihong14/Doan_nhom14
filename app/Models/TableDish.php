<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TableDish extends Model
{
    use HasFactory;

    protected $fillable = [
        'restaurant_id', 'dish_id', 'table_id', 'quantity', 'status', 'order_code', 'type'
    ];

    public function dish()
    {
        return $this->belongsTo(Dish::class);
    }

    public function table()
    {
        return $this->belongsTo(Table::class);
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_code', 'order_code');
    }
}
