<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddStatusToDishesTable extends Migration
{
    public function up()
    {
        Schema::table('dishes', function (Blueprint $table) {
            // Thêm cột 'status' kiểu string
            $table->string('status'); // Hoặc bất kỳ giá trị mặc định nào bạn muốn
        });
    }

    public function down()
    {
        Schema::table('dishes', function (Blueprint $table) {
            // Xóa cột 'status' nếu cần
            $table->dropColumn('status');
        });
    }
}