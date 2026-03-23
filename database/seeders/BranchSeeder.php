<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class BranchSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('branches')->insert([
            [
                'name' => 'Lagos Branch',
                'code' => 'LAG001',
                'email' => 'lagos@yourapp.com',
                'phone' => '08010000001',
                'address' => 'Victoria Island',
                'city' => 'Lagos',
                'state' => 'Lagos',
                'country' => 'Nigeria',
                'status' => 'active',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Abuja Branch',
                'code' => 'ABJ001',
                'email' => 'abuja@yourapp.com',
                'phone' => '08010000002',
                'address' => 'Wuse Zone 2',
                'city' => 'Abuja',
                'state' => 'FCT',
                'country' => 'Nigeria',
                'status' => 'active',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Port Harcourt Branch',
                'code' => 'PH001',
                'email' => 'ph@yourapp.com',
                'phone' => '08010000003',
                'address' => 'GRA Phase 2',
                'city' => 'Port Harcourt',
                'state' => 'Rivers',
                'country' => 'Nigeria',
                'status' => 'active',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Kano Branch',
                'code' => 'KAN001',
                'email' => 'kano@yourapp.com',
                'phone' => '08010000004',
                'address' => 'Sabon Gari',
                'city' => 'Kano',
                'state' => 'Kano',
                'country' => 'Nigeria',
                'status' => 'active',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ]);
    }
}