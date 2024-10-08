<?php

namespace App\Http\Controllers;

use App\Models\support_tickets;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SupportTicketsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return Inertia::render("Support/Index");
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
    public function show(Support_tickets $support_tickets)
    {
        //
        // return Inertia::render("Support/Show", [
        //     "messageId" => 1,
        // ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Support_tickets $support_tickets)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Support_tickets $support_tickets)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Support_tickets $support_tickets)
    {
        //
    }
}
