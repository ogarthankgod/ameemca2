<?php

namespace App\Http\Controllers;

use App\Models\amc_posts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Inertia\Inertia;

class AmcPostsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render("Forum/Post/Index", [
            'posts' => amc_posts::paginate(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render("Forum/Post/Create");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            "post_title" => 'required|string|max:155',
            "post_body" => 'string|required',
            "post_thumb" => '',
        ]);

        $request->user()->amc_posts()->create([
            $validated,
        ]);

        return redirect(route('post.index'))->with('message', "Post Was Created Succesfully!");

    }

    /**
     * Display the specified resource.
     */
    public function show(amc_posts $amc_posts)
    {
        return Inertia::render("Forum/Post/Show", [
            "post" => $amc_posts
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(amc_posts $amc_posts)
    {
        return Inertia::render("Forum/Post/Edit", [
            "post" => $amc_posts
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, amc_posts $amc_posts)
    {
        Gate::authorize('update', $amc_posts);

        $validated = $request->validate([
            "post_title" => 'required|string|max:155',
            "post_body" => 'string|required',
            "post_thumb" => '',
        ]);

        $amc_posts->create($validated);

        return redirect(route('post.index'))->with('message', "Updated Succesfully!");

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(amc_posts $amc_posts)
    {
        Gate::authorize('delete', $amc_posts);

        $amc_posts->delete();
        return redirect()->route('post.index');
    }
}
