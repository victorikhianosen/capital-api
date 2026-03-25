<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AccountTypeSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('account_types')->insert([
            [
                'name' => 'Individual',
                'code' => 'IND',
                'status' => 'active',
            ],
            [
                'name' => 'Corporate',
                'code' => 'CORP',
                'status' => 'active',
            ],
            [
                'name' => 'Minor',
                'code' => 'MIN',
                'status' => 'active',
            ],
            [
                'name' => 'Government',
                'code' => 'GOV',
                'status' => 'active',
            ],

        ]);
    }
}
