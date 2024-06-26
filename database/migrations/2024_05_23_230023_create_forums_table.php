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
        //Categories
        Schema::create('amc_forums', function (Blueprint $table) {
            $table->id();
            $table->text("forum_name");
            $table->string("forum_slug")->nullable()->default(null);
            $table->text("forum_desc")->nullable();

            $table->enum("forum_package", [
                0,
                1,
                2,
                3,
                4
            ])->default(0); //1:contractors, 2:elite, 3:platinum, 4:diamond, 0:all
            $table->enum("privacy", [0, 1])->default(0); //0:not private 1:private

            $table->enum("forum_status", [0, 1, 2])->default(1); //0:rejected 1:accepted 2:pending
            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);
            $table->foreignId("user_id")->constrained("users")->cascadeOnDelete();
            $table->timestamps();
        });

        // Schema::create('amc_forum_topics', function (Blueprint $table) {
        //     $table->id();
        //     $table->foreignId("forum_id")->constrained("amc_forums");
        //     $table->foreignId('user_id')->constrained('users');
        //     $table->enum("privacy", [0, 1])->default(0); //0:not private 1:private

        //     $table->timestamps();
        // });

        Schema::create('amc_posts', function (Blueprint $table) {
            $table->id();
            $table->foreignId("forum_id")->constrained("amc_forums")->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->longText("post_title");
            $table->longText("post_body");
            $table->text("post_thumb");
            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);

            $table->timestamps();
        });

        Schema::create('amc_post_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId("post_id")->constrained("amc_posts")->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();

            $table->enum("attachment_type", ["image", "video", "audio", "document", "file"])
                ->default("file");
            $table->longText("attachment");

            $table->string("user_ip");
            $table->string("user_agent");

            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);

            $table->timestamps();
        });

        Schema::create('amc_reply', function (Blueprint $table) {
            $table->id();
            $table->foreignId("post_id")->constrained("amc_posts");
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->longText("reply_body");
            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);

            $table->timestamps();
        });

        Schema::create('amc_reply_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId("reply_id")->constrained("amc_reply")->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();

            $table->enum("attachment_type", ["image", "video", "audio", "document", "file"])
                ->default("file");
            $table->longText("attachment");

            $table->string("user_ip");
            $table->string("user_agent");

            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);

            $table->timestamps();
        });

        Schema::create('amc_featured_forums', function (Blueprint $table) {
            $table->id();
            $table->foreignId("forum_id")->constrained("amc_forums")->cascadeOnDelete();
            $table->integer("priority")->nullable();
            $table->timestamps();
        });

        // Schema::create('amc_forum_subscribers', function (Blueprint $table) {
        //     $table->id();
        //     $table->foreignId("user_id")->constrained("users");
        //     $table->foreignId("forum_id")->constrained("amc_forums");
        //     $table->enum('subscribtion', [
        //         "posts",
        //         "popular",
        //         "everything"
        //     ]);
        //     $table->text("subscribe_message")->nullable()->default(null);
        //     $table->enum("status", [0, 1, 2])->default(0); //0:pending 1:accepted 2:rejected

        //     $table->timestamps();
        // });

        Schema::create('amc_forum_report', function (Blueprint $table) {
            $table->id();
            $table->foreignId("forum_id")->constrained("amc_forums")->cascadeOnDelete();
            $table->foreignId("user_id")->constrained("users")->cascadeOnDelete();
            $table->text("reason")->nullable();
            ;
            $table->enum('report_status', [
                "acknowledged",
                "reviewed",
                "discarded"
            ]);
            $table->text("report_status_review")->nullable();
            $table->timestamps();
        });

        Schema::create('amc_forum_report_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId("report_id")->constrained("amc_forum_report")->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();

            $table->enum("attachment_type", ["image", "video", "audio", "document", "file"])
                ->default("file");
            $table->longText("attachment");

            $table->string("user_ip");
            $table->string("user_agent");

            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);

            $table->timestamps();
        });

        Schema::create('amc_post_report', function (Blueprint $table) {
            $table->id();
            $table->foreignId("post_id")->constrained("amc_posts")->cascadeOnDelete();
            $table->foreignId("user_id")->constrained("users")->cascadeOnDelete();
            $table->text("reason")->nullable();
            ;
            $table->enum('report_status', [
                "acknowledged",
                "reviewed",
                "discarded"
            ]);
            $table->text("report_status_review")->nullable();
            $table->timestamps();
        });

        Schema::create('amc_post_report_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId("post_id")->constrained("amc_post_report")->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();

            $table->enum("attachment_type", ["image", "video", "audio", "document", "file"])
                ->default("file");
            $table->longText("attachment");

            $table->string("user_ip");
            $table->string("user_agent");

            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);

            $table->timestamps();
        });

        Schema::create('amc_reply_report', function (Blueprint $table) {
            $table->id();
            $table->foreignId("reply_id")->constrained("amc_reply")->cascadeOnDelete();
            $table->foreignId("user_id")->constrained("users")->cascadeOnDelete();
            $table->text("reason")->nullable();
            ;
            $table->enum('report_status', [
                "acknowledged",
                "reviewed",
                "discarded"
            ]);
            $table->text("report_status_review")->nullable();
            $table->timestamps();
        });

        Schema::create('amc_reply_report_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId("report_id")->constrained("amc_reply_report")->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();

            $table->enum("attachment_type", ["image", "video", "audio", "document", "file"])
                ->default("file");
            $table->longText("attachment");

            $table->string("user_ip");
            $table->string("user_agent");

            $table->enum("is_deleted", [0, 1])->default(0);
            $table->timestamp("deleted_at")->nullable()->default(null);

            $table->timestamps();
        });

        // Schema::create('amc_forum_notifications', function(Blueprint $table) {
        //     $table->id();
        //     $table->foreignId("user_id")->constrained("users");
        //     $table->timestamps();
        // });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('amc_reply_report_attachments');
        Schema::dropIfExists('amc_reply_report');
        Schema::dropIfExists('amc_post_report_attachments');
        Schema::dropIfExists('amc_post_report');
        Schema::dropIfExists('amc_forum_report_attachments');
        Schema::dropIfExists('amc_forum_report');
        // Schema::dropIfExists('amc_forum_subscribers');
        Schema::dropIfExists('amc_featured_forums');
        Schema::dropIfExists('amc_reply_attachments');
        Schema::dropIfExists('amc_reply');
        Schema::dropIfExists('amc_post_attachments');
        Schema::dropIfExists('amc_posts');

        // Schema::dropIfExists('amc_forum_topics');

        Schema::dropIfExists('amc_forums');

    }
};
