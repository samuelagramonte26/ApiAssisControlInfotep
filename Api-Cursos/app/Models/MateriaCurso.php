<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MateriaCurso extends Model
{
    protected $fillable = ['id','materiaID','cursoID','fechaCreado','fechaEditado','fechaEliminado'];
    public $timestamps = false;

    public function scopeActive($query)
    {
        $query->where("active",1);
    }
}
