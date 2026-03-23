<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('branch_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('accountofficer_id')->nullable()->constrained('users')->nullOnDelete();

            $table->string('customer_number')->unique();
            $table->enum('customer_type', [
                'individual',
                'corporate',
                'merchant',
                'government',
                'ngo',
                'agent',
            ])->default('individual');

            $table->string('title')->nullable();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('middle_name')->nullable();
            $table->string('phone')->unique();
            $table->string('email')->unique();
            $table->string('username')->unique();

            $table->string('gender')->nullable();
            $table->date('dob')->nullable();

            $table->string('religion')->nullable();
            $table->string('marital_status')->nullable();

            $table->text('residential_address')->nullable();
            $table->text('office_address')->nullable();
            $table->string('lga')->nullable();
            $table->string('state')->nullable();
            $table->string('country')->nullable();

            $table->string('occupation')->nullable();
            $table->string('working_status')->nullable();
            $table->string('business_name')->nullable();

            $table->string('bvn')->nullable()->unique();
            $table->string('nin')->nullable()->unique();
            $table->string('tin')->nullable()->unique();
            $table->string('tax_id')->nullable();

            $table->boolean('pep')->default(false);

            $table->tinyInteger('tier')->default(1);
            $table->boolean('id_verified')->default(false);
            $table->boolean('face_verified')->default(false);
            $table->boolean('utility_verified')->default(false);

            $table->timestamp('tier_upgraded_at')->nullable();

            $table->string('mother_name')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('customers');
    }
};
