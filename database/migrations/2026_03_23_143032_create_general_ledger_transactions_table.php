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
            $table->string('name');
            $table->string('code')->unique();

            $table->enum('type', ['asset', 'liability', 'income', 'expense']);

            $table->string('currency', 3);

            $table->decimal('balance', 20, 2)->default(0);

            $table->unsignedBigInteger('created_by')->nullable();

            $table->enum('status', ['pending', 'active', 'inactive', 'delete'])->default('pending');
            $table->timestamps();
            $table->index(['type', 'currency']);

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
