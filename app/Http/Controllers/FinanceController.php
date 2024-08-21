<?php

namespace App\Http\Controllers;

use App\Models\Account_balance;
use App\Models\Contributions;
use App\Models\Loan_balance;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class FinanceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $hour = now()->format('H');
        $time = date("H:i:s a", time());
        
        if ($hour < 12) {
            $greeting = "Good Morning";
        } elseif ($hour < 18) {
            $greeting = "Good Afternoon";
        } else {
            $greeting = "Good Evening";
        }

        $user = User::find($request->user()->id);
        $staffid = $user->staffid;
        $accountBalance = Account_balance::where("staffid", $staffid)->first()->balance;
        $contributionBalance = Contributions::where("staffid", $staffid)->sum('amount');
        $loanBalance = Loan_balance::where("staffid", $staffid)->sum('balance');

        return Inertia::render("Finance/Index", [
            "greeting" => $greeting,
            "time" => $time,
            "income" => "NIL",
            "accountBalance" => number_format($accountBalance, 2),
            "loanBalance" => number_format($loanBalance, 2),
            "contributionBalance" => number_format($contributionBalance, 2),
        ]);
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
}
