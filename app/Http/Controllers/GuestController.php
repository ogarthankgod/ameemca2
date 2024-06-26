<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class GuestController extends Controller
{
    public function team() {
        return Inertia::render("Guests/Team", []);
    }

    public function vision() {
        return Inertia::render("Guests/Vision", []);

    }

    public function membership() {        // return response("memmbership Handler from GuestController");
        return Inertia::render("Guests/Membership", []);
    }

    public function faq() {
        return Inertia::render("Guests/Faq", []);
    }

    public function contact() {
        return Inertia::render("Guests/Contact", []);
    }
    
    public function sendEnquiry(Request $request) {
        $validated = $request->validate([
            'name' => 'required|string',
            'subject' => 'required|string',
            'email' => 'required|email',
            'phone' => 'required',
            'message' => 'required'
        ]);
        
        return false;
    }

}
