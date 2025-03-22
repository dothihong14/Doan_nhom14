<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TableDish extends Model
{
    use HasFactory;

    protected $fillable = [
        'dish_id', 'table_id', 'quantity', 'served_at', 'status'
    ];

    public function dish()
    {
        return $this->belongsTo(Dish::class);
    }

    public function table()
    {
        return $this->belongsTo(Table::class);
    }
}