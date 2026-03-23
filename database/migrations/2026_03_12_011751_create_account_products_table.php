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
        Schema::create('account_products', function (Blueprint $table) {
            $table->id();

            $table->foreignId('category_id')
                ->constrained('account_categories')
                ->cascadeOnDelete();

            $table->string('name');
            $table->string('code')->unique();

            // Currency
            $table->string('currency', 3)->default('NGN');

            // Interest
            $table->decimal('interest_rate', 5, 2)->default(0);
            $table->enum('interest_type', ['flat', 'daily', 'tiered'])->default('flat');
            $table->enum('interest_posting', ['monthly', 'quarterly', 'annually'])->default('monthly');

            // Balance Rules
            $table->decimal('min_balance', 25, 2)->default(0);
            $table->decimal('max_balance', 25, 2)->nullable();

            // Overdraft
            $table->boolean('overdraft_allowed')->default(false);
            $table->decimal('overdraft_limit', 25, 2)->nullable();

            // Transaction Limits
            $table->decimal('daily_withdrawal_limit', 25, 2)->nullable();
            $table->integer('max_transactions_per_day')->nullable();

            $table->decimal('transfer_fee', 10, 2)->default(0);
            $table->decimal('maintenance_fee', 10, 2)->default(0);
            $table->integer('dormancy_days')->default(365);

            $table->enum('status', ['active', 'pending', 'inactive', 'pending'])->default(true);


            $table->timestamps();
            $table->index(['category_id', 'currency']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('account_products');
    }
};
