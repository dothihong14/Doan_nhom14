<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImportRequestsTable extends Migration
{
    public function up()
    {
        Schema::create('import_requests', function (Blueprint $table) {
            $table->id(); // Mã phiếu
            $table->date('request_date'); // Ngày yêu cầu
            $table->string('requested_by'); // Người yêu cầu
            $table->string('status'); // Trạng thái
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('import_requests');
    }
}