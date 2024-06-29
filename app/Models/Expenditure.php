<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expenditure extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'amount',
        'reason',
        'recipient_name',
        'recipient_account',
        'recipient_bank',
        'admin_id',
        'transaction_id',
        'recipient',
        'transfer_code',
        'reference',
        'currency',
        'status',
    ];
}
