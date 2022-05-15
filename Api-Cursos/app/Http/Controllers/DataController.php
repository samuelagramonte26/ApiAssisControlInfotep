<?php

namespace App\Http\Controllers;

use App\Models\Maestro;
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
    public function getMaestroMateria($codigo,$cedula)
    {
        $maestro = Maestro::join("maestro_materias","maestro_materias.maestroID","=","maestros.id")
        ->join("materias","materias.id","=","maestro_materias.materiaID")
        ->select("maestros.*","materias.nombre as materia")
        ->where("materias.codigo",$codigo)
        ->where("maestros.cedula",$cedula)
        ->where("maestros.active",1)
        ->get();
        if(Count($maestro)==0)
        return response()->json(["Maestro no encontrado!"],404);
        else
        return response()->json($maestro,200);
    }
}
