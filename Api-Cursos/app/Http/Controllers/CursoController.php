<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use Illuminate\Http\Request;

class CursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function get()
    {
        //
        try {
            //code...
            $cursos = Curso::join("aulas","aulas.id","=","cursos.aulaID")->select("aulas.nombre as aula","cursos.*")->where("cursos.active",1)->get();
            return response()->json($cursos,200);
        } catch (\Throwable $th) {
            //throw $th;
             return response()->json($th->getMessage(),406);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function post(Request $request)
    {
        //
        try {
            //code...
            $rules = [
                "nombre"=>"required",
                "aulaID"=>"required",
               
            ];
            $messages = [
                "nombre.required"=>"El nombre del taller es requerido",
                "aulaID.required"=>"El aula es requerida",
             
            ];
            $validador = validator($request->all(),$rules,$messages);
            if($validador->fails()){
                return response()->json($validador->errors()->all(),200);
            }else{
                $request->request->add(array("fechaCreado"=>date('Y-d-m')));
                $curso = Curso::create($request->only('nombre','aulaID','fechaCreado'));
                return response()->json($curso,200);
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json($th->getMessage(),406);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
