<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreinvestmentsRequest;
use App\Http\Requests\UpdateinvestmentsRequest;
use App\Models\investments;

class InvestmentsController extends Controller
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
    public function store(StoreinvestmentsRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(investments $investments)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(investments $investments)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateinvestmentsRequest $request, investments $investments)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(investments $investments)
    {
        //
    }
}
