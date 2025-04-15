<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReturnIngredientDetail extends Model
{
    protected $fillable = [
        'return_ingredient_id', 'ingredient_id', 'actual_quantity', 'reason', 'image_url'
    ];
}
