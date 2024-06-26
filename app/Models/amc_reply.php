<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class amc_reply extends Model
{
    use HasFactory;

    public function amc_post(): BelongsTo {
        return $this->belongsTo(amc_posts::class);
    }

    public function user(): BelongsTo {
        return $this->belongsTo(User::class);
    }
}
