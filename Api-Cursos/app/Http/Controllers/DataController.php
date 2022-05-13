<?php

namespace App\Http\Controllers;

use App\Models\Materia;
use App\Models\Participante;

class DataController extends Controller
{
    public function getMaterias()
    {
        $materias = Materia::join("materia_cursos","materia_cursos.materiaID","=","materias.id")
        ->join("cursos","cursos.id","=","materia_cursos.cursoID")
        ->select("materias.*","cursos.nombre as curso")
        ->where("materias.active",1)
        //->groupBy("curso")
        ->get();
        return response()->json($materias,200);
    }

    public function getParticipantesCursos()
    {
        $participantes = Participante::join("cursos","cursos.id","=","participantes.cursoID")
        ->select("participantes.*","cursos.nombre as curso")
        ->where("participantes.active",1)
        ->get();
        return response()->json($participantes,200);
    }
}
