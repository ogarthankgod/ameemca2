<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('chats', function (Blueprint $table) {
            $table->id();
            $table->foreignId('chat_from')->constrained("users", "id");
            $table->foreignId('chat_to')->constrained("users", "id");
            $table->enum("chat_status", ["sent", "delivered", "read"])
                ->default("delivered");
            $table->enum("chat_type", ["text", "attachment", "quote"])
                ->default("text");
            $table->longText("message");
            $table->string("user_ip");
            $table->string("user_agent");
            $table->enum("is_deleted", [0, 1]);
            $table->timestamp("deleted_at")->default(null);
            $table->timestamps();
        });

        //todo
        //create a schema for generall chats to all users in form of "announcements"

        Schema::create('chat_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('chat_id')->constrained("chats", "id");
            $table->foreignId('chat_from')->constrained("users", "id");
            $table->foreignId('chat_to')->constrained("users", "id");
            $table->enum("attachment_status", ["sent", "delivered", "read"])
                ->default("delivered");
            $table->enum("attachment_type", ["image", "video", "audio", "document", "file"])
                ->default("file");
            $table->longText("attachment");
            $table->string("user_ip");
            $table->string("user_agent");
            $table->enum("is_deleted", [0, 1]);
            $table->timestamp("deleted_at")->default(null);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('chats');
        Schema::dropIfExists('chats_attachments');
    }
};
