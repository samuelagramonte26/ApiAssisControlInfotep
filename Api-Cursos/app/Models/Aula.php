<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Aula extends Model
{
    protected $fillable = ['id','nombre','ubicacion','capacidad','tallerID','fechaCreado','fechaEditado','fechaEliminado'];
    public $timestamps = false;

    public function scopeActive($query)
    {
        $query->where("active",1);
    }
}
