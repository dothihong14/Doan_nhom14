<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

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

    protected static function booted()
    {
        static::addGlobalScope('restaurant', function (Builder $builder) {
            if (auth()->check() && auth()->user()->restaurant_id) {
                $builder->where('restaurant_id', auth()->user()->restaurant_id);
            }
        });

        static::updated(function ($tableDish) {
//            dd($tableDish->dish->recipes);
            if ($tableDish->status == 'done') {
                foreach ($tableDish->dish->recipes as $recipe) {
                    $ingredient = Ingredient::findOrFail($recipe->ingredient_id);
                    $ingredient->quantity_auto -= $recipe->quantity;
                    $ingredient->save();
                }
            }
        });
    }
}
