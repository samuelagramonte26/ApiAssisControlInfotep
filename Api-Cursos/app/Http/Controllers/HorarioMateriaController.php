<?php

namespace App\Http\Controllers;

use App\Models\HorarioMateria;
use Illuminate\Http\Request;

class HorarioMateriaController extends Controller
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
            $horariosMaterias = HorarioMateria::active()->get();
            return response()->json($horariosMaterias, 200);
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json($th->getMessage(), 406);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        try {
            //code...
            $rules = [
                "materiaID"=>"required",
                "horarioID"=>"required",         
            ];
            $messages = [
                "materiaID.required"=>"La materia es requerida",
                "horarioID.required"=>"El horario es requerido",
            

            ];
            $validador = validator($request->all(),$rules,$messages);
            if($validador->fails()){
                return response()->json($validador->errors()->all(),200);
            }else{
                $request->request->add(array("fechaCreado"=>date('Y-d-m')));
                $horariosMaterias = HorarioMateria::create($request->only('materiaID','horarioID','fechaCreado'));
                return response()->json($horariosMaterias,200);
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
