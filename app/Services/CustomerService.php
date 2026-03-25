<?php

namespace App\Services;

use App\Models\Customer;
use App\Models\NextOfKin;
use App\Models\Document;
use Illuminate\Support\Facades\DB;

class CustomerService
{

public function __construct(private AuditService $audit);
{
    throw new \Exception('Not implemented');
}
    public function store($request)
    {
        return DB::transaction(function () use ($request) {

            $data = $request->only([
                'accountofficer_id',
                'branch_id',
                'first_name',
                'last_name',
                'middle_name',
                'bvn',
                'phone',
                'email',
                'gender',
                'dob',
                'marital_status',
                'mother_maiden_name',
                'spouse_name',
                'residential_address',
                'lga',
                'state',
                'nationality',
                'mailing_address',
                'office_address',
                'occupation',
                'nin_number',
                'tin',
            ]);

            $data['customer_number'] = $this->generateCustomerNumber();
            $data['username'] = $this->uniqueUsername(
                $data['first_name'],
                $data['last_name']
            );

            $customer = Customer::create($data);

            if ($request->next_of_kin_name) {
                NextOfKin::create([
                    'customer_id' => $customer->id,
                    'customer_number' => $customer->customer_number,
                    'name' => $request->next_of_kin_name,
                    'relationship' => $request->next_of_kin_relationship,
                    'address' => $request->next_of_kin_address,
                    'phone' => $request->next_of_kin_phone,
                ]);
            }

            $this->handleDocument($request, $customer, 'nin');
            $this->handleDocument($request, $customer, 'utility_bill');
            $this->handleDocument($request, $customer, 'profile_picture');

            return $customer;
        });
    }

    private function handleDocument($request, $customer, $field)
    {
        if ($request->hasFile($field)) {

            $file = $request->file($field);

            $path = $file->store("documents/{$customer->customer_number}", 'public');

            Document::create([
                'customer_id' => $customer->id,
                'customer_number' => $customer->customer_number,
                'title' => strtoupper(str_replace('_', ' ', $field)),
                'name' => $file->getClientOriginalName(),
                'path' => $path,
                'type' => $file->getClientMimeType(),

                // ✅ MORPH FIX
                'uploaded_by_type' => 'system',
                'uploaded_by_id' => 1,

                'status' => 'pending',
            ]);
        }
    }

    private function generateCustomerNumber(): string
    {
        do {
            $lastId = Customer::max('id') ?? 0;
            $nextId = $lastId + 1;

            $customerNumber = 'CUST' . str_pad($nextId, 8, '0', STR_PAD_LEFT);

        } while (Customer::where('customer_number', $customerNumber)->exists());

        return $customerNumber;
    }

    private function uniqueUsername(string $firstName, string $lastName): string
    {
        $baseUsername = strtolower(preg_replace('/[^a-z0-9]/', '', $firstName . $lastName));
        $username = $baseUsername;
        $counter = 1;

        while (Customer::where('username', $username)->exists()) {
            $username = $baseUsername . $counter;
            $counter++;
        }

        return $username;
    }
}