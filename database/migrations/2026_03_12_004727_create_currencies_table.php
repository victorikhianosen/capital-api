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
        Schema::create('currencies', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique();
            $table->string('name'); // Nigerian Naira
            $table->string('symbol', 10)->nullable();
            $table->decimal('rate_buy', 15, 6)->nullable();
            $table->decimal('rate_sell', 15, 6)->nullable();
            $table->decimal('exchange_rate', 15, 6)->default(1);
            $table->boolean('is_base_currency')->default(false);

            $table->enum('status', [
                'pending',
                'active',
                'inactive',
                'disabled',
                'deleted'
            ])->default('active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('currencies');
    }
};
