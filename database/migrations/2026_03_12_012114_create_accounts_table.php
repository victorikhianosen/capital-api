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
        Schema::create('accounts', function (Blueprint $table) {
            $table->id();
            $table->string('customer_number')->index();
            $table->foreignId('customer_id')->constrained()->cascadeOnDelete();

            $table->foreignId('branch_id')->nullable()->constrained()->nullOnDelete()->cascadeOnDelete();

            $table->foreignId('account_product_id')->constrained('account_products')->cascadeOnDelete();

            $table->decimal('account_number')->unique();

            $table->foreignId('account_type_id')->constrained('account_types');

            $table->foreignId('currency_id')->constrained('currencies')->default('NGN');

            $table->decimal('account_balance', 25, 2)->default(0);
            $table->decimal('available_balance', 18, 2)->default(0);
            $table->tinyInteger('tier')->default(1)->index();
            $table->enum('status', ['pending','active','dormant','closed','blocked','restricted'])->default('pending');


            // Balances
            $table->decimal('ledger_balance', 20, 2)->default(0);
            $table->decimal('available_balance', 20, 2)->default(0);

            // Status
            $table->enum('status', ['active', 'dormant', 'frozen', 'closed'])->default('active');

            // Controls
            $table->boolean('pnd')->default(false);
            $table->boolean('pnc')->default(false);

            // Dates
            $table->timestamp('last_transaction_at')->nullable();
            $table->timestamp('closed_at')->nullable();

            $table->timestamps();
            $table->index(['customer_id', 'status']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('accounts');
    }
};
