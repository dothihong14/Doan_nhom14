<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    // Specify the table associated with the model (if not using plural convention)
    protected $table = 'contacts';

    // Define the fillable attributes
    protected $fillable = [
        'name',
        'email',
        'message',
    ];
}