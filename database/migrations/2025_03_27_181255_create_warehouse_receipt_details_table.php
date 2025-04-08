<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('warehouse_receipt_details', function (Blueprint $table) {
            $table->id(); // Mã chi tiết
            $table->foreignId('warehouse_receipt_id')->constrained('warehouse_receipts'); // Mã phiếu
            $table->foreignId('ingredient_id')->constrained('ingredients'); // Mã nguyên liệu
            $table->integer('actual_quantity'); // Số lượng thực nhập
            $table->decimal('unit_price', 10, 2); // Đơn giá
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('warehouse_receipt_details');
    }
};
