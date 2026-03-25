<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Services\CustomerService;
use App\Traits\HttpResponses;
use Illuminate\Http\Request; // ✅ FIXED

class CustomerController extends Controller
{
    use HttpResponses;

    public function __construct(private CustomerService $customerService) {}

    public function store(Request $request)
    {
        $request->validate([

            'accountofficer_id' => 'required',
            'branch_id' => 'required',

            'first_name' => 'required|string|max:100',
            'last_name' => 'required|string|max:100',
            'middle_name' => 'nullable|string|max:100',

            'bvn' => 'required|digits:11|unique:customers,bvn',
            'phone' => 'required|string|unique:customers,phone',
            'email' => 'required|email|unique:customers,email',

            'gender' => 'nullable|string',
            'dob' => 'required',

            'marital_status' => 'nullable|in:single,married,divorced,widowed',

            'mother_maiden_name' => 'nullable|string',
            'spouse_name' => 'nullable|string',

            'residential_address' => 'nullable|string',
            'lga' => 'nullable|string',
            'state' => 'nullable|string',
            'nationality' => 'nullable|string',

            'mailing_address' => 'nullable|string',
            'office_address' => 'nullable|string',

            'occupation' => 'nullable|string',

            // ✅ CORRECT COLUMN
            'nin_number' => 'nullable|string|unique:customers,nin_number',
            'tin' => 'nullable|string|unique:customers,tin',

            'next_of_kin_name' => 'nullable|string',
            'next_of_kin_relationship' => 'nullable|string',
            'next_of_kin_address' => 'nullable|string',
            'next_of_kin_phone' => 'nullable|string',

            // ✅ FILES
            'nin' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'utility_bill' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'profile_picture' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        $customer = $this->customerService->store($request);

        return $this->success(
            message: 'Customer created successfully',
            data: $customer,
            statusCode: 201
        );
    }
}
