<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Taller extends Model
{
    protected $fillable = ["id", "nombre", "ubicacion", "fechaCreado", "fechaEditado", "fechaEliminado"];
    public $timestamps = false;

    public function scopeActive($query)
    {
        $query->where("active",1);
    }
}
