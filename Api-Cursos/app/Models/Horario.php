<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Horario extends Model
{
    protected $fillable = ["id", "horaDesde", "horaHasta",'tanda',"fechaCreado", "fechaEditado", "fechaEliminado"];
    public $timestamps = false;

    public function scopeActive($query)
    {
        $query->where("active",1);
    }
}
