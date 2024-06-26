<?php

namespace App\Http\Controllers;

use App\Models\amc_reply;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class AmcReplyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(amc_reply $amc_reply)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(amc_reply $amc_reply)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, amc_reply $amc_reply)
    {
        Gate::authorize('update', $amc_reply);
        
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(amc_reply $amc_reply)
    {
        Gate::authorize('delete', $amc_reply);
        
    }
}
