<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ImportRequest extends Model
{
    use HasFactory;

    protected $fillable = ['request_date', 'requested_by', 'status'];

    public function details()
    {
        return $this->hasMany(ImportRequestDetail::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'requested_by');
    }
    protected static function boot()
    {
        parent::boot();

        static::updating(function ($importRequest) {
            if ($importRequest->status == 'approved') {
                DB::transaction(function () use ($importRequest) {
                    // Create material transactions for each detail
                    foreach ($importRequest->details as $detail) {
                        MaterialTransaction::create([
                            'transaction_type' => 'import',
                            'quantity' => $detail->requested_quantity,
                            'ingredient_id' => $detail->ingredient_id,
                            'reason' => 'nhập hàng',
                        ]);
                        $ingredient = Ingredient::find($detail->ingredient_id);
                        $ingredient->quantity_in_stock += $detail->requested_quantity;
                        $ingredient->save();
                    }
                    // Delete details first
                    ImportRequestDetail::where('import_request_id', $importRequest->id)->delete();
                    // Then delete the import request
                    ImportRequest::where('id', $importRequest->id)->delete();
                });
            }
        });
    }
}
