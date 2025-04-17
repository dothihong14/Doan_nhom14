<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    // Khai báo tên bảng nếu khác với quy ước
    protected $table = 'customers';

// Khai báo các trường có thể được gán hàng loạt
    protected $fillable = [
        'email',
        'address',
        'name',
        'phone',
        'is_locked',
        'loyalty_points',
    ];

    // Khai báo các trường không được gán hàng loạt
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
