<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.s
     */
    public function up(): void
    {
        Schema::create('vtu_wallets', function (Blueprint $table) {
            $table->id();
            $table->integer("staffid")->foreign("staffid")->constrained("users", "staffid")->references("staffid");
            $table->decimal("balance", 13,2)->default(0.00);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vtu_wallets');
    }
};
