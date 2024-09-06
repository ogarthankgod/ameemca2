<?php

namespace App\Http\Controllers;

use App\Models\Documents;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DocumentsController extends Controller
{
  /**
   * Display a listing of the resource.
   */ 
  public function index(Request $request)
  {
    //
    if($request->doc_type == 1) {
      $doc_name = "Allotment";
    } elseif($request->doc_type == 2) {
      $doc_name = "Beneficiary";
    } elseif($request->doc_type == 3) {
      $doc_name = "Others";
    }
    $uploadedForms = Documents::where(["staffid" => $request->user()->staffid, "doc_type" => 2])->get()->map(fn($data, $count) => [
      "sn" => $count + 1,
      "documentId" => $data->id,
      "documentName" => $data->doc_name,
      "file" => $data->doc_file,
      "date" => $data->created_at,
    ]);

    return Inertia::render("Forms/$", [
      "pageState" => "Beneficiary Form",
      "data" => $uploadedForms
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
  public function show(Documents $documents)
  {
    //
  }

  /**
   * Show the form for editing the specified resource.
   */
  public function edit(Documents $documents)
  {
    //
  }

  /**
   * Update the specified resource in storage.
   */
  public function update(Request $request, Documents $documents)
  {
    //
  }

  /**
   * Remove the specified resource from storage.
   */
  public function destroy(Documents $documents)
  {
    //
  }

  public function beneficiaryForm(Request $request)
  {
    $beneficiaryForm = Documents::where(["staffid" => $request->user()->staffid, "doc_type" => 2])->get()->map(fn($data, $count) => [
      "sn" => $count + 1,
      "documentId" => $data->id,
      "documentName" => $data->doc_name,
      "file" => $data->doc_file,
      "date" => $data->created_at,
    ]);

    return Inertia::render("Forms/Beneficiary", [
      "pageState" => "Beneficiary Form",
      "data" => $beneficiaryForm
    ]);
  }

  public function allotmentForm(Request $request)
  {
    $allotmentForm = Documents::where(["staffid" => $request->user()->staffid, "doc_type" => 1])->get()->map(fn($data, $count) => [
      "sn" => $count + 1,
      "documentId" => $data->id,
      "documentName" => $data->doc_name,
      "file" => $data->doc_file,
      "date" => $data->created_at,
    ]);

    return Inertia::render("Forms/Allotment", [
      "pageState" => "Allotment Form",
      "data" => $allotmentForm
    ]);
  }

  public function otherForm(Request $request)
  {
    $otherForm = Documents::where(["staffid" => $request->user()->staffid, "doc_type" => 3])->get()->map(fn($data, $count) => [
      "sn" => $count + 1,
      "documentId" => $data->id,
      "documentName" => $data->doc_name,
      "file" => $data->doc_file,
      "date" => $data->created_at,
    ]);

    return Inertia::render("Forms/Others", [
      "pageState" => "Other Forms",
      "data" => $otherForm
    ]);
  }
}
