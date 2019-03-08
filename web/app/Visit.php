<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Visit extends Model
{
    protected $fillable = [
        'url', 'count'
    ];
    public $timestamps = true;
}
