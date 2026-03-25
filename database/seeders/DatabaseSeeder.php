<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();


        $this->call([
            BranchSeeder::class,
            UsersTableSeeder::class,
            RolesAndPermissionsSeeder::class,
            SettingsSeeder::class,

            CurrencySeeder::class,

            AccountCategorySeeder::class,
            AccountTypeSeeder::class,
            AccountProductSeeder::class,
        ]);
        // RolesAndPermissionsSeeder::class

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
