<?php

namespace App\Http\Middleware;

use App\Models\Package;
use Illuminate\Http\Request;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): string|null
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {
        $user = $request->user();
        return [
            ...parent::share($request),
            'auth' => [
                'user' => $user ? [
                    'name' => $user?->firstname . '. ' . str_split($user?->lastname)[0],
                    'firstname' => $user?->firstname ?? "NIL",
                    'lastname' => $user?->lastname ?? "NIL",
                    'email' => $user?->email ?? 'NIL',
                    'staffid' => $user?->staffid ?? 'NIL',
                    'secondaryEmail' => $user?->secondary_email  ?? 'NIL',
                    'phone' => $user?->phone ?? 'NIL',
                    'secondPhone' => $user?->second_phone  ?? 'NIL',
                    'fullname' => $user?->firstname . ' ' . $user?->lastname,
                    'img' => $user?->photo ?? 'NIL',
                    'empId' => $user?->employee_number ?? 'NIL',
                    'package' => Package::find($user->package)->package_name ?? 'NIL',
                    'allotment' => "₦".number_format($user?->allotment_amount, 2) ?? '0.00',
                    'doe' => $user?->date_of_employment ?? 'NIL',
                    'agency' => $user?->agency_bureau ?? 'NIL',
                    'empPost' => $user?->employee_post ?? 'NIL',
                ] : '',
            ],
        ];
    }
}
