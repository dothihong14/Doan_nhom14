<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MaterialTransactionDetail extends Model
{
    protected $fillable = [
        'ingredient_id', 'actual_quantity', 'reason', 'material_transaction_id'
    ];

    public function ingredient() {
        return $this->belongsTo(Ingredient::class);
    }

    public function materialTransaction()
    {
        return $this->belongsTo(MaterialTransaction::class);
    }
}
