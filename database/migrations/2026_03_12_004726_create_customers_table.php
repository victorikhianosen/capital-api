<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up(): void
    {

        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('branch_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('accountofficer_id')->nullable()->constrained('users')->nullOnDelete();
            $table->string('customer_number')->unique()->index();
            $table->enum('customer_type', [
                'individual',
                'corporate',
                'merchant',
                'government',
                'ngo',
                'agent',
            ])->default('individual');
            $table->foreignId('guardian_id')
                ->nullable()
                ->constrained('customers')
                ->nullOnDelete();

            $table->string('title')->nullable();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('middle_name')->nullable();

            $table->string('phone')->unique();
            $table->string('email')->unique();
            $table->string('username')->unique();

            $table->enum('marital_status', ['single', 'married', 'divorced', 'widowed'])->nullable();
            $table->string('mailing_address')->nullable();

            $table->string('gender')->nullable();
            $table->string('dob')->nullable();

            $table->text('residential_address')->nullable();
            $table->text('office_address')->nullable();
            $table->string('lga')->nullable();
            $table->string('state')->nullable();
            $table->string('nationality')->nullable();

            $table->string('occupation')->nullable();
            $table->string('working_status')->nullable();
            $table->string('business_name')->nullable();

            $table->string('bvn')->nullable()->unique();
            $table->string('nin_number')->nullable()->unique();
            $table->string('tin')->nullable()->unique();

            $table->boolean('pep')->default(false);

            $table->boolean('enable_internet')->default(true);
            $table->boolean('enable_sms')->default(true);
            $table->boolean('enable_email')->default(true);
            $table->boolean('enable_reset_password')->default(true);

            $table->tinyInteger('tier')->default(1);
            $table->boolean('id_verified')->default(false);
            $table->boolean('face_verified')->default(false);
            $table->boolean('utility_verified')->default(false);

            $table->timestamp('tier_upgraded_at')->nullable();

            $table->string('mother_maiden_name')->nullable();
            $table->string('spouse_name')->nullable();

            $table->timestamps();
        });
    }


    public function down(): void
    {
        Schema::dropIfExists('customers');
    }
};
