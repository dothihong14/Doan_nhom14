<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MaterialTransaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'ingredient_id', 'reason', 'quantity', 'type' // type can be 'import' or 'export'
    ];

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }

    protected static function boot()
    {
        parent::boot();

        static::created(function ($transaction) {
            $ingredient = $transaction->ingredient;

            if ($transaction->type === 'import') {
                // Increase the quantity in stock
                $ingredient->quantity_in_stock += $transaction->quantity;
            } elseif ($transaction->type === 'export') {
                // Decrease the quantity in stock
                $ingredient->quantity_in_stock -= $transaction->quantity;
            }

            // Save the updated ingredient
            $ingredient->save();
        });
    }
}