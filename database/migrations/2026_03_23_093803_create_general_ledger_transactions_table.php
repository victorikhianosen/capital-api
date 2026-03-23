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
        Schema::create('general_ledger_transactions', function (Blueprint $table) {
            $table->id();
            $table->uuid('reference');

            $table->foreignId('general_ledger_id')
                ->constrained('general_ledgers')
                ->cascadeOnDelete();

            $table->enum('type', ['debit', 'credit']);

            $table->decimal('amount', 25, 2);

            $table->decimal('balance_before', 20, 2);
            $table->decimal('balance_after', 20, 2);

            $table->string('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('general_ledger_transactions');
    }
};
