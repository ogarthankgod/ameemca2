<?php

namespace App\Policies;

use App\Models\User;
use App\Models\amc_reply;
use Illuminate\Auth\Access\Response;

class AmcReplyPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, amc_reply $amcReply): bool
    {
        //
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, amc_reply $amcReply): bool
    {
        $isAdmin = ($amcReply->user()->user_type == 'admin');
        return ($isAdmin && $amcReply->user()->is($user));
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, amc_reply $amcReply): bool
    {
        return $this->update($user, $amcReply);
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, amc_reply $amcReply): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, amc_reply $amcReply): bool
    {
        //
    }
}
