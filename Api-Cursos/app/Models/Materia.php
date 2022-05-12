<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Materia extends Model
{
    protected $fillable = ['id','nombre','codigo','cantidadHrs','fechaCreado','fechaEditado','fechaEliminado'];
    public $timestamps = false;

    public function scopeActive($query)
    {
        $query->where("active",1);
    }
}
