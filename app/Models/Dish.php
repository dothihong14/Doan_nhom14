<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dish extends Model
{
    use HasFactory;

    protected $fillable = [
        'restaurant_id', 'name', 'description', 'food_category_id', 'price',  'image', 'slug', 'sold_quantity', 'status'
    ];



    public function food_category()
    {
        return $this->belongsTo(FoodCategory::class);
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function recipes()
    {
        return $this->hasMany(Recipe::class);
    }
    public function tableDishes()
    {
        return $this->hasMany(TableDish::class);
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
}
