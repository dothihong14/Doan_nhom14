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
        Schema::create('import_request_details', function (Blueprint $table) {
            $table->id(); // Mã chi tiết
            $table->foreignId('import_request_id')->constrained('import_requests'); // Mã phiếu
            $table->foreignId('ingredient_id')->constrained('ingredients'); // Mã nguyên liệu
            $table->integer('requested_quantity'); // Số lượng yêu cầu
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('import_request_details');
    }
};
