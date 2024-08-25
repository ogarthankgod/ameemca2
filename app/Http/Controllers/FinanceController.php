<?php

namespace App\Http\Controllers;

use App\Models\Account_balance;
use App\Models\Contributions;
use App\Models\Deposit_records;
use App\Models\Loan_balance;
use App\Models\settings;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Inertia\Inertia;

class FinanceController extends Controller
{
  /**
   * Display a listing of the resource.
   */
  public function index(Request $request, $result = '')
  {
    if (empty($result)) $result = "{'status'=>false}";

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

    $testKey = settings::find(1)->paystack_test_publickey;

    return Inertia::render("Finance/Index", [
      "greeting" => $greeting,
      "time" => $time,
      "investment" => "NIL",
      "accountBalance" => number_format($accountBalance, 2),
      "loanBalance" => number_format($loanBalance, 2),
      "contributionBalance" => number_format($contributionBalance, 2),
      "response" => $result
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
    //hmm.. different kinds of deposits
    //into different kinds of wallets
    $request->validate([
      'email' => ['required', 'email'],
      'amount' => ['required', 'min_digits:999'],
      'transType' => ['required'],
    ]);

    $url = "https://api.paystack.co/transaction/initialize";
    $fields = [
      'email' => $request->email,
      'amount' => $request->amount,
      'ref' => "DEPOSIT_" . floor(mt_rand(0, 10) * 1000000000 + 1),
      'metadata' => [
        'custom_fields' => [
          'type' => $request->transType,
          'real_amt' => $request->realAmout,
        ]
      ],
    ];

    $fields_string = http_build_query($fields);

    //open connection
    $ch = curl_init();

    //set the url, number of POST vars, POST data
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
      "Authorization: Bearer sk_test_e7585f553d977f9ebffc8374705b93a34e79a7dd",
      "Cache-Control: no-cache",
    ));

    //So that curl_exec returns the contents of the cURL; rather than echoing it
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    //execute post
    $result = curl_exec($ch);

    return $this->index($request, $result);
  }

  public function verifyTransaction(Request $request)
  {

    $reference = $request->reference;

    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => "https://api.paystack.co/transaction/verify/{$reference}",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 30,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "GET",
      CURLOPT_HTTPHEADER => array(
        "Authorization: Bearer sk_test_e7585f553d977f9ebffc8374705b93a34e79a7dd",
        "Cache-Control: no-cache",
      ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);

    curl_close($curl);

    if ($err) {
      echo "cURL Error #:" . $err;
    } else {
      $result =  json_decode($response);
    }

    if ($result->data->status == 'success') {
      $status   = $result->data->status;
      $currency = $result->data->currency;
      $ip       = $result->data->ip_address;
      $refcode  = $result->data->reference;
      $medium   = $result->data->channel;
      $type     = $result->data->metadata->custom_fields[0]->type;
      $amount   = $result->data->metadata->custom_fields[0]->real_amt / 100;

      $user = User::find($request->user()->id);
      $staffid = $user->staffid;
      $data = ['staffid' => $staffid, 'refcode' => $reference];
      $depositRecord = Deposit_records::where("staffid", $staffid)->first();

      if ($depositRecord) {
        $result = ['status' => true, 'message' => 'Transaction Already Processed!'];
      } else {
        $newRecord = new Deposit_records();

        $newRecord->staffid = $staffid;
        $newRecord->refcode = $refcode;
        $newRecord->amount = $amount;
        $newRecord->currency = $currency;
        $newRecord->status = $status;
        $newRecord->medium = $medium;
        $newRecord->type = $type;
        $newRecord->time = time();
        $newRecord->date = date("Y-d-m", time());
        $newRecord->expiry = 0;
        $newRecord->ip = $ip;

        if ($newRecord->save()) {
          $oldBalance = Account_balance::where("staffid", $staffid)->first()->balance;
          $newBalance = $oldBalance + $amount;

          $accBalance = new Account_balance();

          $accBalance->staffid = $staffid;
          $accBalance->time = time();
          $accBalance->balance = $newBalance;

          if ($accBalance->save()) {
            $result = ['status' => true, "message" => "Your AMEEMCA savings wallet has been credited with ₦{$amount}"];
          }
        }
      }
    }

    return "Verifying Transactions";
  }

  public function verifyWebHook(Request $request)
  {
    if ((strtoupper($_SERVER['REQUEST_METHOD']) != 'POST') || !array_key_exists('HTTP_X_PAYSTACK_SIGNATURE', $_SERVER))
      exit();

    // Retrieve the request's body
    $input = @file_get_contents("php://input");
    define('PAYSTACK_SECRET_KEY', 'sk_test_e7585f553d977f9ebffc8374705b93a34e79a7dd');

    // validate event do all at once to avoid timing attack
    if ($_SERVER['HTTP_X_PAYSTACK_SIGNATURE'] !== hash_hmac('sha512', $input, PAYSTACK_SECRET_KEY))
      exit();

    http_response_code(200);

    // parse event (which is json string) as object
    // Do something - that will not take long - with $event
    $event = json_decode($input);

    exit();
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

  public function initialize(Request $request)
  {
    //
    $request->validate([
      'email' => ['required', 'email'],
      'amount' => ['required'],
      'transType' => ['required'],
    ]);


    $url = "https://api.paystack.co/transaction/initialize";

    $fields = [
      'email' => $request->email,
      'amount' => $request->amount,
      'real_amount' => $request->amount * 100,
      'ref' => "DEPOSIT_" . floor(mt_rand(0, 10) * 1000000000 + 1),
      'metadata' => [
        'custom_fields' => [
          'type' => $request->transType,
          'real_amt' => $request->amount * 100
        ]
      ],
    ];

    $fields_string = http_build_query($fields);

    //open connection
    $ch = curl_init();

    //set the url, number of POST vars, POST data
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
      "Authorization: Bearer sk_test_e7585f553d977f9ebffc8374705b93a34e79a7dd",
      "Cache-Control: no-cache",
    ));

    //So that curl_exec returns the contents of the cURL; rather than echoing it
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    //execute post
    $result = curl_exec($ch);

    // return Inertia::back()->with(['result' => $result, 'success' => 'Data saved successfully!']);
    return Inertia::render("Finance/Index", [
      "response" => $result
    ]);
  }
}
