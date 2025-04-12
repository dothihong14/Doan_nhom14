<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

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
    protected static function booted()
    {
        static::addGlobalScope('restaurant', function (Builder $builder) {
            if (auth()->check() && auth()->user()->restaurant_id) {
                $builder->where('restaurant_id', auth()->user()->restaurant_id);
            }
        });
    }
}
