<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AccountCategorySeeder extends Seeder
{
    public function run(): void
    {
        DB::table('account_categories')->insert([
            [
                'name' => 'Savings',
                'code' => 'SAV',
                'status' => 'active',
            ],
            [
                'name' => 'Current',
                'code' => 'CUR',
                'status' => 'active',
            ],
            [
                'name' => 'Fixed Deposit',
                'code' => 'FD',
                'status' => 'active',
            ],
        ]);
    }
}