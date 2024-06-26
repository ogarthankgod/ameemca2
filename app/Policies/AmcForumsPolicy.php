<?php

namespace App\Policies;

use App\Models\User;
use App\Models\amc_forums;
use Illuminate\Auth\Access\Response;

class AmcForumsPolicy
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
    public function view(User $user, amc_forums $amcForums): bool
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
    public function update(User $user, amc_forums $amcForums): bool
    {
        $isAdmin = ($amcForums->user()->user_type == 'admin');
        return ($isAdmin && $amcForums->user()->is($user));
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, amc_forums $amcForums): bool
    {
        return $this->update($user, $amcForums);
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, amc_forums $amcForums): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, amc_forums $amcForums): bool
    {
        //
    }
}
