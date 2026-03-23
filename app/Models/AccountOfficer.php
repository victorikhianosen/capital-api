<?php

namespace App\Models;

use App\Models\Branch;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;

class AccountOfficer extends Model
{
        protected $guarded = [];
        
        public function branch()
        {
                return $this->belongsTo(Branch::class);
        }

        public function user()
        {
                return $this->belongsTo(User::class);
        }
}
