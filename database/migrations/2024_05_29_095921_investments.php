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
        //
        Schema::create('investment_settings', function(Blueprint $table) {
            $table->id();
            $table->foreignId("user_id")->constrained("users");
            $table->enum("investment_switch", [0,1])->default(0);
            $table->integer("investment_percentage")->default(0);
            $table->decimal("investment_amount", 13, 2)->default(0.00);
            $table->integer("timeframe")->default(0);

            $table->timestamps();
        });

        Schema::create('investments', function(Blueprint $table) {
            $table->id();
            $table->foreignId("user_id")->constrained("users");
            $table->decimal("investment", 13, 2);
            $table->decimal("roi", 13, 2);
            $table->string("batch");

            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
        Schema::dropIfExists("investments");
        Schema::dropIfExists("investment_settings");
    }
};
