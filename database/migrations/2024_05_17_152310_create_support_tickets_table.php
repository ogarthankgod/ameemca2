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
        Schema::create('support_tickets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->string("ticket_ref");
            $table->string("subject");
            $table->tinyInteger("status")->default(0);
            $table->tinyInteger("priority")->default(1);
            $table->dateTime("last_reply");
            $table->timestamps();
        });

        Schema::create('support_messages', function (Blueprint $table) {
            $table->id();
            $table->foreignId("support_ticket_id")->constrained("support_tickets");
            $table->foreignId("user_id")->constrained("users");
            $table->longText("message");
            $table->timestamps();
        });

        Schema::create('support_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId("support_message_id")->constrained("support_messages");
            $table->enum("attachment_type", ["document", "image", "video"]);
            $table->text("attachment");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('support_attachments');
        Schema::dropIfExists('support_messages');
        Schema::dropIfExists('support_tickets');
    }
};
