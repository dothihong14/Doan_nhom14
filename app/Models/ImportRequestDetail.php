<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImportRequestDetail extends Model
{
    use HasFactory;

    protected $fillable = ['import_request_id', 'ingredient_id', 'requested_quantity'];

    public function importRequest()
    {
        return $this->belongsTo(ImportRequest::class);
    }

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }
}