<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up(): void
    {

        Schema::create('accounts', function (Blueprint $table) {
            $table->id();

            $table->string('customer_number')->index();
            
            $table->foreignId('customer_id')->constrained()->cascadeOnDelete();

            $table->foreignId('branch_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('account_product_id')->constrained()->cascadeOnDelete();
            $table->foreignId('account_type_id')->constrained();
            $table->foreignId('currency_id')->constrained('currencies');

            $table->string('account_number')->unique();

            $table->decimal('ledger_balance', 25, 2)->default(0);
            $table->decimal('available_balance', 25, 2)->default(0);

            $table->tinyInteger('tier')->default(1)->index();

            $table->enum('status', [
                'pending',
                'active',
                'dormant',
                'frozen',
                'closed',
                'restricted'
            ])->default('pending');

            $table->boolean('pnd')->default(false);
            $table->boolean('pnc')->default(false);

            $table->timestamp('last_transaction_at')->nullable();
            $table->timestamp('closed_at')->nullable();

            $table->timestamps();

            $table->index(['customer_id', 'status']);
        });
    }

  
    public function down(): void
    {
        Schema::dropIfExists('accounts');
    }
};
