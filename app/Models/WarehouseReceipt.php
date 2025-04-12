<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class WarehouseReceipt extends Model
{
    use HasFactory;

    protected $fillable = ['import_date', 'imported_by', 'supplier', 'restaurant_id'];

    public function details()
    {
        return $this->hasMany(WarehouseReceiptDetail::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'imported_by');
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
