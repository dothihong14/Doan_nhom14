<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Builder;

class ImportRequest extends Model
{
    use HasFactory;

    protected $fillable = ['request_date', 'requested_by', 'status', 'restaurant_id'];

    public function details()
    {
        return $this->hasMany(ImportRequestDetail::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'requested_by');
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class, 'restaurant_id');
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
