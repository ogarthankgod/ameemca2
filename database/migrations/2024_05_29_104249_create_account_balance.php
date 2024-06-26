<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('account_balance', function (Blueprint $table) {
            $table->id();
            $table->integer("staffid")->foreign("staffid")->constrained("users", "staffid")->references("staffid");
            $table->decimal("balance", 13,2);
            $table->dateTime('time');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('account_balance');
    }
};
