<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WarehouseReceipt extends Model
{
    use HasFactory;

    protected $fillable = ['import_date', 'imported_by', 'supplier'];

    public function details()
    {
        return $this->hasMany(WarehouseReceiptDetail::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'imported_by');
    }
}