<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WarehouseReceiptDetail extends Model
{
    use HasFactory;

    protected $fillable = ['warehouse_receipt_id', 'ingredient_id', 'actual_quantity', 'unit_price'];

    public function warehouseReceipt()
    {
        return $this->belongsTo(WarehouseReceipt::class);
    }

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }
}