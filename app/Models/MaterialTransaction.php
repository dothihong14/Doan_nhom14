<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MaterialTransaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'exported_by', 'export_date', 'restaurant_id'
    ];

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }

    public function user() {
        return $this->belongsTo(User::class, 'exported_by');
    }

    public function details()
    {
        return $this->hasMany(MaterialTransactionDetail::class);
    }

    public function restaurant() {
        return $this->belongsTo(Restaurant::class);
    }
}
