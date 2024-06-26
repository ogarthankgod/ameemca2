<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;

class amc_posts extends Model
{
    use HasFactory;

    public function user(): BelongsTo {
        return $this->belongsTo(User::class);
    }

    public function amc_forum(): BelongsTo {
        return $this->belongsTo(amc_forums::class);
    }

    public function amc_reply(): HasMany {
        return $this->hasMany(amc_reply::class);
    }

    protected $fillable = [
        'post_title',
        'post_thumb',
        'post_body'
    ];
}
