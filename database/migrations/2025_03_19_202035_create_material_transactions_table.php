<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMaterialTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('material_transactions', function (Blueprint $table) {
            $table->id(); // Tạo cột ID tự động tăng
            $table->foreignId('ingredient_id')->constrained()->onDelete('cascade'); // ID nguyên liệu
            $table->string('reason'); // Lý do
            $table->integer('quantity'); // Số lượng
            $table->enum('type', ['import', 'export']); // Loại: nhập hay xuất
            $table->timestamps(); // Cột created_at và updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('material_transactions'); // Gỡ bảng nếu rollback
    }
}