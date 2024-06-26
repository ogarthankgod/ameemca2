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
        Schema::create('user_types', function (Blueprint $table) {
            $table->id();
            $table->enum("type", ["user", "admin"]);
            $table->string('email')->nullable(true)->default(null);
            $table->enum('title', ["president", "finsec", "treasurer", "gensec"]);
            $table->string('comment');  
            $table->timestamps();
        });

        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->integer("staffid")->unique();
            $table->foreignId("user_type")->constrained("user_types")->nullable()->default(null);

            $table->string('firstname');
            $table->string('lastname');
            $table->string('email')->unique();
            $table->string('secondary_email')->unique()->nullable()->default(null);
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');

            $table->string("gender");
            $table->string("phone")->unique()->nullable()->default(null);
            $table->string("second_phone")->unique()->nullable()->default(null);
            $table->string("state");
            $table->string("country");
            $table->text("address");

            $table->text("photo")->nullable();

            $table->string("agency_bureau");
            $table->enum("employee_post", [
                "56002-Nigeria-Lagos",
                "56002-Nigeria-Abuja"
            ]);
            $table->integer("employee_number");

            $table->decimal("allotment_amount", 8,2);
            $table->text("allotment_desc");
            $table->text("allotment_file");
            $table->decimal("reg_fee", 8,2);

            $table->date("date_of_employment");

            $table->integer("code");
            $table->string("status");
            $table->integer("package");

            $table->string("nokgender")->nullable();
            $table->string("nokphone")->nullable();
            $table->string("nokfname")->nullable();
            $table->string("noklname")->nullable();
            $table->string("nokemail")->unique()->nullable()->default(null);
            $table->string("nokstate")->nullable();
            $table->string("nokcountry")->nullable();
            $table->text("nokaddress")->nullable();

            $table->enum("onboarding_phase", [1,2,3, null])->default(null);
            //1:Basic, 2:Employment Info & Allotment, 3:Nok Info..

            $table->rememberToken();
            $table->timestamps();
        });

        Schema::create('password_reset_tokens', function (Blueprint $table) {
            $table->string('email')->primary();
            $table->string('token');
            $table->timestamp('created_at')->nullable();
        });

        Schema::create('sessions', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->foreignId('user_id')->nullable()->index();
            $table->string('ip_address', 45)->nullable();
            $table->text('user_agent')->nullable();
            $table->longText('payload');
            $table->integer('last_activity')->index();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_types');
        Schema::dropIfExists('users');
        Schema::dropIfExists('password_reset_tokens');
        Schema::dropIfExists('sessions');
    }
};
