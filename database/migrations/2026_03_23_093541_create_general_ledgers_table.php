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
        Schema::create('general_ledgers', function (Blueprint $table) {
            $table->id();

            $table->string('name');
            $table->string('code')->unique();

            $table->enum('type', ['asset', 'liability', 'income', 'expense']);

            $table->string('currency');

            $table->decimal('balance', 25, 2)->default(0);

            $table->unsignedBigInteger('created_by')->nullable();

            $table->enum('active', ['active'. 'pending', 'inactive', 'delete'])->default('active');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('general_ledgers');
    }
};
