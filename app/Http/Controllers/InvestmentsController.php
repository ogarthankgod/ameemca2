<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use App\Models\investments;
use App\Models\Contributions;
use App\Http\Requests\StoreinvestmentsRequest;
use App\Http\Requests\UpdateinvestmentsRequest;
use App\Models\Account_balance;
use Illuminate\Http\Request;

class InvestmentsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //
        $user = User::find($request->user()->id);
        $staffid = $user->staffid;
        $accountBalance = Account_balance::where("staffid", $staffid)->first()->balance;
        $contributionBalance = Contributions::where("staffid", $staffid)->sum('amount');
    
        return Inertia::render("Investments/Index", [
            "contributionBalance" => $contributionBalance,
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
