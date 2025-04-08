<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDailySoldQuantityToDishesTable extends Migration
{
    public function up()
    {
        Schema::table('dishes', function (Blueprint $table) {
            $table->integer('daily_sold_quantity')->default(0); // Thêm cột daily_sold_quantity với giá trị mặc định là 0
        });
    }

    public function down()
    {
        Schema::table('dishes', function (Blueprint $table) {
            $table->dropColumn('daily_sold_quantity'); // Xóa cột nếu cần
        });
    }
}