<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id(); // Tự động tạo cột ID
            $table->unsignedBigInteger('user_id')->unique(); // Khóa ngoại cho user_id
            $table->string('address'); // Địa chỉ
            $table->string('phone'); // Số điện thoại
            $table->boolean('is_locked')->default(false); // Trạng thái khóa
            $table->integer('loyalty_points')->default(0); // Điểm thưởng
            $table->timestamps(); // Thời gian tạo và cập nhật
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}