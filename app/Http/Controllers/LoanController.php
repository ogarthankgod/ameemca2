<?php

namespace App\Http\Controllers;

use App\Models\Loan_request;
use App\Models\Package;
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

    public function request(Request $request) {
        $packageInfo = Package::find($request->user()->package);
        $packageInfo = [
            "packageName" => $packageInfo->package_name,
            "packageTenure" => $packageInfo->package_tenure,
        ];

        return Inertia::render("Loan/LoanRequest", [
            "pageState" => "Loan Request",
            "packageInfo" => $packageInfo
        ]);
    }
    
    public function history(Request $request) {
        $loanData = Loan_request::where("staffid", $request->user()->staffid)->get()->map(fn($data, $count) => [
          "sn" => $count+1,
          "amount" => number_format($data->amount, 2),
          "type" => $data->type,
          "status" => $data->status,
          "refcode" => $data->refcode,
          "date" => $data->date,
        ]);
;
        return Inertia::render("Loan/LoanHistory", [
            "pageState" => "Loan History",
            "loanHistory" => $loanData
        ]);
    }

    public function repayments(Request $request) {
        return Inertia::render("Loan/Index", [
            "pageState" => "Loan Payments"
        ]);
    }

    public function bulkLoanRepayments(Request $request) {
        return Inertia::render("Loan/Index", [
            "pageState" => "Bulk Loan Repayments"
        ]);
    }

    public function fetch(Request $request) {
        //Fetch loan Info
        return Inertia::render("Loan/Index", [
            "pageState" => "fetch"
        ]);
    }
}
