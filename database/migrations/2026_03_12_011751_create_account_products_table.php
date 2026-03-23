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
               $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();

            $table->foreignId('account_category_id')
                ->constrained('account_categories')
                ->cascadeOnDelete();

            $table->string('name');
            $table->string('code')->unique();

            $table->decimal('minimum_balance',25,2)->default(0);
            $table->decimal('interest_rate',15,2)->nullable();

            $table->boolean('overdraft_allowed')->default(false);

            $table->string('status')->default('active');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('account_products');
    }
};
