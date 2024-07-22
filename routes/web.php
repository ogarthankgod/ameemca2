<?php

use App\Http\Controllers\AmcPostsController;
use App\Http\Controllers\GuestController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AmcForumsController;
use App\Http\Controllers\SupportTicketsController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::get('/', function () {
//     return Inertia::render('Header', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//     ]);
// });


// No Auth Guest Pages START;
Route::get('/', function () {
    return Inertia::render('Guests/Index', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
    ]);
})->name('guest.index');

Route::get('/team', [GuestController::class, 'team'])->name('team.index');
Route::get('/vision', [GuestController::class, 'vision'])->name('vision.index');
Route::get('/membership', [GuestController::class, 'membership'])->name('membership.index');
Route::get('/faq', [GuestController::class, 'faq'])->name('faq.index');
Route::get('/contact', [GuestController::class, 'contact'])->name('contact.index');
Route::post('/contact', [GuestController::class, 'sendEnquiry'])->name('contact.email');
//No Auth Guest Pages END;


Route::get('/dashboard', function () {
    return Inertia::render('Dashboard', []);
})->middleware(['auth', 'verified'])->name('dashboard');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


    Route::resource('forum', AmcForumsController::class);

    Route::get('video', function() {
        return 'Please Connect Video API.'; 
    })->name('video.index');

    Route::get('upgrade', function() {
        return '...'; 
    })->name('upgrade.index');

    Route::get('byelaws', function() {
        return 'ByeLaws..'; 
    })->name('byelaws');

    Route::get('guidlines', function() {
        return '{{OP.Guidlines}}'; 
    })->name('guidlines');

    Route::get('Finance', function() {
        return 'Wallet not Found!'; 
    })->name('finance.index');

    // Route::get('support', function() {
    //     return "Database is empty!"; 
    // })->name('support.index');


    Route::resource('post', AmcPostsController::class);

    Route::resource('support', SupportTicketsController::class);
});


require __DIR__ . '/auth.php';
