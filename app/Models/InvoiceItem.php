<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'invoice_id', 'dish_id', 'quantity', 'unit_price', 'total_price',
    ];

    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }

    public function dish()
    {
        return $this->belongsTo(Dish::class);
    }

    protected static function boot()
    {
        parent::boot();

        // Khi thêm mới hoặc cập nhật
        static::saved(function ($invoiceItem) {
            $invoiceItem->updateInvoiceTotal();
        });

        // Khi xóa
        static::deleted(function ($invoiceItem) {
            $invoiceItem->updateInvoiceTotal();
        });
    }

    // Hàm cập nhật tổng tiền cho hóa đơn
    public function updateInvoiceTotal()
    {
        $this->invoice->update([
            'total_amount' => $this->invoice->items()->sum('total_price')
        ]);
    }
}
