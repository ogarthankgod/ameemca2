<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class LoanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return Inertia::render("Loan/Index");
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
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function request(Request $reequest) {
        return Inertia::render("Loan/LoanRequest", [
            "pageState" => "Loan Request"
        ]);
    }
    
    public function history(Request $reequest) {
        return Inertia::render("Loan/Index", [
            "pageState" => "Loan History"
        ]);
    }

    public function repayments(Request $reequest) {
        return Inertia::render("Loan/Index", [
            "pageState" => "Loan Payments"
        ]);
    }

    public function bulkLoanRepayments(Request $reequest) {
        return Inertia::render("Loan/Index", [
            "pageState" => "Bulk Loan Repayments"
        ]);
    }

    public function fetch(Request $reequest) {
        //Fetch loan Info
        return Inertia::render("Loan/Index", [
            "pageState" => "fetch"
        ]);
    }
}
