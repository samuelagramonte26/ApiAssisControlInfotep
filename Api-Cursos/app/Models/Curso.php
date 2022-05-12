<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    protected $fillable = ["id", "nombre", "aulaID","fechaCreado", "fechaEditado", "fechaEliminado"];
    public $timestamps = false;

    public function scopeActive($query)
    {
        $query->where("active",1);
    }
}
