<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReturnIngredient extends Model
{
    use HasFactory;

    protected $fillable = ['ingredient_id', 'returned_quantity', 'reason'];

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }
    protected static function boot()
    {
        parent::boot();

        static::created(function ($returnIngredient) {
           MaterialTransaction::create([
            'type' => 'export',
            'quantity' => $returnIngredient->returned_quantity,
            'ingredient_id' => $returnIngredient->ingredient_id,
            'reason' => $returnIngredient->reason,
           ]);
        });
    }
}