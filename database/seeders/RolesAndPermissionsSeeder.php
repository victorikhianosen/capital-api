<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        $guard = 'user';

        // Reset cache
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Create Permissions
        $permissions = [
            'create_account',
            'delete_account',
            'edit_account',
            'upgrade_account'
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate([
                'name' => $permission,
                'guard_name' => $guard
            ]);
        }

        // Create Roles
        $superAdmin = Role::firstOrCreate([
            'name' => 'super_admin',
            'guard_name' => $guard
        ]);

        $admin = Role::firstOrCreate([
            'name' => 'admin',
            'guard_name' => $guard
        ]);

        $supervisor = Role::firstOrCreate([
            'name' => 'supervisor',
            'guard_name' => $guard
        ]);

        // Assign Permissions

        // Super Admin gets everything
        $superAdmin->givePermissionTo(Permission::all());

        // Admin permissions
        $admin->givePermissionTo([
            'create_account',
            'edit_account',
            'upgrade_account'
        ]);

        // Supervisor permissions
        $supervisor->givePermissionTo([
            'create_account',
            'edit_account'
        ]);
    }
}