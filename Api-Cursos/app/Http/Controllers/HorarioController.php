<?php

namespace App\Http\Controllers;

use App\Models\Horario;
use Illuminate\Http\Request;

class HorarioController extends Controller
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
            $horarios = Horario::active()->get();
            return response()->json($horarios,200);
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
                "horaDesde"=>"required",
                "horaHasta"=>"required",
                "tanda"=>"required"
               
            ];
            $messages = [
                "horaDesde.required"=>"La hora de inicio es requerida",
                "horaHasta.required"=>"La hora de fin es requerida",
                "tanda.required"=>"La tanda es requerida",
             
            ];
            $validador = validator($request->all(),$rules,$messages);
            if($validador->fails()){
                return response()->json($validador->errors()->all(),200);
            }else{
                $request->request->add(array("fechaCreado"=>date('Y-d-m')));
                $curso = Horario::create($request->only('horaDesde','horaHasta','tanta','fechaCreado'));
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
