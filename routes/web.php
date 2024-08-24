<?php

use App\Http\Controllers\AmcPostsController;
use App\Http\Controllers\GuestController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AmcForumsController;
use App\Http\Controllers\FinanceController;
use App\Http\Controllers\FintechController;
use App\Http\Controllers\InvestmentsController;
use App\Http\Controllers\LoanController;
use App\Http\Controllers\SupportTicketsController;
use App\Models\Account_balance;
use App\Models\Contributions;
use App\Models\Loan_balance;
use App\Models\User;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
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


Route::get('/dashboard', function (Request $request) {
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

    return Inertia::render('Dashboard', [
        "greeting" => $greeting,
        "time" => $time,
        "income" => "NIL",
        "accountBalance" => number_format($accountBalance, 2),
        "loanBalance" => number_format($loanBalance, 2),
        "contributionBalance" => number_format($contributionBalance, 2),
    ]);
})->middleware(['auth', 'verified'])->name('dashboard');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


    Route::resource('forum', AmcForumsController::class);
    
    // Route::get('/loan', [LoanController::class, 'index'])->name('loan.index');
    // Route::get('/loan/create', [LoanController::class, 'create'])->name('loan.create');
    // Route::post('/loan', [LoanController::class, 'store'])->name('loan.store');
    // Route::post('/loan/{id}', [LoanController::class, 'show'])->name('loan.show');
    // Route::get('/loan/{id}/edit', [LoanController::class, 'edit'])->name('loan.edit');
    // Route::put('/loan/{id}', [LoanController::class, 'update'])->name('loan.update');

    Route::get('loan/request', [LoanController::class, 'request'])->name("loan.request");
    Route::get('loan/history', [LoanController::class, 'history'])->name("loan.history");
    Route::get('loan/repayments', [LoanController::class, 'repayments'])->name("loan.repayments");
    Route::get('loan/bulkrepayments', [LoanController::class, 'bulkLoanRepayments'])->name("loan.bulkrepayments");
    Route::get('loan/fetch/{loanId}', [LoanController::class, 'fetch'])->name('loan.fetch');

    Route::resource('loan', LoanController::class);


    Route::get('video', function () {
        return Inertia::render('Video/Index', []);
    })->name('video.index');

    Route::get('upgrade', function () {
        return Inertia::render("UpgradeP");
    })->name('upgrade.index');

    Route::get('byelaws', function () {
        return Inertia::render("ByeLaws/Index");
    })->name('byelaws');

    Route::get('guidelines', function () {
        return Inertia::render("Guidelines/Index");
    })->name('guidelines');

    Route::get('objectives', function () {
        return Inertia::render("Objectives/Index");
    })->name('objectives');

    Route::resource('post', AmcPostsController::class);

    //Create, Show, Edit the Support ticket
    Route::resource('support', SupportTicketsController::class);

    Route::resource("finance", FinanceController::class);

    Route::resource("fintech", FintechController::class);

    Route::resource("investments", InvestmentsController::class);
});

require __DIR__ . '/auth.php';