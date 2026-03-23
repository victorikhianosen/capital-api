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
            $table->string('account_number')->unique();
            $table->string('customer_number')->index();
            $table->foreignId('customer_id')
                ->constrained()
                ->cascadeOnDelete();

            $table->foreignId('branch_id')
                ->nullable()
                ->constrained()
                ->nullOnDelete();

            $table->foreignId('account_product_id')
                ->constrained('account_products');

            $table->foreignId('account_type_id')
                ->constrained('account_types');

            $table->foreignId('currency_id')
                ->constrained('currencies');

            $table->decimal('account_balance', 18, 2)->default(0);
            $table->decimal('available_balance', 18, 2)->default(0);
            $table->tinyInteger('tier')->default(1)->index();
            $table->enum('status', [
                'pending',
                'active',
                'dormant',
                'closed',
                'blocked',
                'restricted'
            ])->default('pending');

            $table->timestamp('opened_at')->nullable();

            $table->timestamps();
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
