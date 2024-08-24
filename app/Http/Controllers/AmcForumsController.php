<?php

namespace App\Http\Controllers;

use App\Models\amc_forums;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Inertia\Inertia;

class AmcForumsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $forums = amc_forums::paginate();

        return Inertia::render("Forum/Index", [
            "forums" => $forums
        ]);

        // return "Could not connect to Database.";
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render("Forum/Create");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            "forum_name" => 'required|string|max:100',
            "forum_desc" => 'string|required|max:500',
        ]);

        $request->user()->amc_forums()->create([
            $validated,
        ]);

        return redirect(route('forum.index'))->with('message', "Forum Was Created Succesfully!");
    }

    /**
     * Display the specified resource.
     */
    public function show(amc_forums $amc_forums)
    {
        return Inertia::render("Forum/Show", [
            "forum" => $amc_forums
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(amc_forums $amc_forums)
    {
        return Inertia::render("Forum/Edit", [
            "forum" => $amc_forums
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, amc_forums $amc_forums)
    {
        Gate::authorize('update', $amc_forums);

        $validated = $request->validate([
            "forum_name" => 'required|string|max:255',
            "forum_desc" => 'string|required|max:500',
        ]);

        $amc_forums->update($validated);

        return redirect(route('forum.index'))->with('message', "Updated Succesfully!");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(amc_forums $amc_forums)
    {
        Gate::authorize('delete', $amc_forums);

        $amc_forums->delete();
        return redirect()->route('forum.index');
    }
}
