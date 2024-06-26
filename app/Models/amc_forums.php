<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class amc_forums extends Model
{
    use HasFactory;

    public function user(): BelongsTo {
        return $this->belongsTo(User::class);
    }

    public function amc_posts(): HasMany {
        return $this->hasMany(amc_posts::class);
    }

    protected $fillable = [
        'forum_name',
        'forum_desc'
    ];
}
