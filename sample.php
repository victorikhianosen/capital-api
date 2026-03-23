use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {

    public function up(): void
    {
        Schema::create('documents', function (Blueprint $table) {

            $table->id();

            $table->foreignId('customer_id')
                ->nullable()
                ->constrained()
                ->cascadeOnDelete();

            $table->foreignId('account_id')
                ->nullable()
                ->constrained()
                ->cascadeOnDelete();

            $table->string('title');
            $table->string('type')->nullable();

            $table->string('file_path');

            $table->enum('status', ['pending','approved','rejected'])
                ->default('pending');

            $table->foreignId('updated_by')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->foreignId('approved_by')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->timestamp('approved_at')->nullable();

            $table->timestamps();

        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documents');
    }
};