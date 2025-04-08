<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'status', 'total_amount', 'payment_method', 'address', 'name', 'phone', 'email', 'payment_status', 'order_code', 'notes', 'restaurant_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function dish()
    {
        return $this->belongsTo(Dish::class);
    }
    public function save(array $options = [])
    {
        // Kiểm tra trạng thái trước khi lưu
        if ($this->isDirty('status') && $this->status === 'delivered') {
            $user = Customer::where('email', $this->email)->first();
            if ($user) {
                // Tính loyalty points là 5% giá trị hóa đơn
                $loyaltyPoints = round($this->total_amount * 0.05);

                // Cập nhật loyalty_points
                $user->increment('loyalty_points', $loyaltyPoints);
            }
        }

        // Gọi phương thức save của lớp cha
        return parent::save($options);
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
}
