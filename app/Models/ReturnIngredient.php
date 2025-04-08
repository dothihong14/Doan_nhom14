<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReturnIngredient extends Model
{
    use HasFactory;

    protected $fillable = ['restaurant_id', 'return_date'];

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }
    public function restaurant() {
        return $this->belongsTo(Restaurant::class);
    }
    public function details()
    {
        return $this->hasMany(ReturnIngredientDetail::class);
    }
}
