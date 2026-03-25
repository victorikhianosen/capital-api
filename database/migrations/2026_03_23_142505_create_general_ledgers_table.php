<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up(): void
    {

        Schema::create('general_ledgers', function (Blueprint $table) {
            $table->id();

            $table->foreignId('branch_id')->nullable()
                ->constrained('branches')
                ->nullOnDelete();
                
            $table->foreignId('currency')->nullable()
                ->constrained('branches')
                ->nullOnDelete();

            $table->string('name');
            $table->string('code')->unique();

            $table->enum('type', [
                'asset',
                'liability',
                'equity',
                'income',
                'expense'
            ]);

            $table->foreignId('parent_id')->nullable()
                ->constrained('general_ledgers')
                ->nullOnDelete();



            $table->decimal('balance', 25, 2)->default(0);

            $table->enum('status', ['active', 'inactive'])->default('active');

            $table->timestamps();
        });
    }


    public function down(): void
    {
        Schema::dropIfExists('general_ledgers');
    }
};
