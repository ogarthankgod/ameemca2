<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    public function amc_forums() : HasMany {
        return $this->hasMany(amc_forums::class);
    }

    public function amc_posts() : HasMany {
        return $this->hasMany(amc_posts::class);
    }

    public function amc_replies() : HasMany {
        return $this->hasMany(amc_reply::class);
    }


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'fname',
        'lname',
        'email',
        'secondary_email',
        'password',
        'gender',
        'phone',
        'second_phone',

        'state',
        'country',
        'address',
        'photo',
        'agency_bureau',
        'employee_post',
        'employee_number',
        'allotment_amount',
        'allotment_desc',
        'allotment_file',
        'reg_fee',
        'date_of_employment',

        'code',
        'status',

        'package',

        'nokgender',
        'nokphone',
        'nokfname',
        'noklname',
        'nokemail',
        'nokstate',
        'nokcountry',
        'nokaddress'
    ];

    protected $guarded = ['id', 'remember_token'];
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
