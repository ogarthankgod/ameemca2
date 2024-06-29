<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Package;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Inertia\Inertia;
use Inertia\Response;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(Package $package): Response
    {
        $package = ($package ?? 0);
        $packages = Package::whereNot('id', '2')->get();
        return Inertia::render('Auth/RegisterNew', [
            'package' => $package,
            'packages' => $packages
        ]);
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'firstname' => 'required|string|max:50',
            'lastname' => 'required|string|max:50',
            'email' => 'required|string|lowercase|email|max:255|unique:' . User::class,
            // 'secondary_email' => 'required|string|lowercase|email|max:255|unique:' . User::class,
            'password' => ['required', 'confirmed', Rules\Password::defaults()],

            'gender' => 'required|string',
            'phone' => 'required|string',
            // 'second_phone' => 'required|string',
            'state' => 'required|string',
            'country' => 'required|string',
            'address' => 'required|string',

            'employee_number' => 'required|integer',
            'employee_post' => 'required|integer',
            'agency_bureau' => 'required|string',

            // 'date_of_employment' => 'required|string',

            'package' => 'required|integer',

        ]);

        $user = User::create([
            'user_type' => 2,
            'firstname' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        event(new Registered($user));

        Auth::login($user);

        return redirect(route('dashboard', absolute: false));
    }

    /**
     * Handle an incoming registration request FOR PHASE 2... [NOK process]
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function phase_two(Request $request)
    {
        return response("Phase two form processor");
    }


}
