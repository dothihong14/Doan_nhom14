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
        Schema::create('warehouse_receipts', function (Blueprint $table) {
            $table->id(); // Mã phiếu
            $table->date('import_date'); // Ngày nhập
            $table->string('imported_by'); // Người nhập
            $table->string('supplier'); // Nhà cung cấp
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('warehouse_receipts');
    }
};
