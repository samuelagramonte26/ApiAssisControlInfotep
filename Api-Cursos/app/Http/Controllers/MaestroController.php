<?php

namespace App\Http\Controllers;

use App\Models\Maestro;
use Illuminate\Http\Request;

class MaestroController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function get()
    {
        //
          //
          try {
            //code...
            $maestros = Maestro::active()->get();
            return response()->json($maestros,200);
        } catch (\Throwable $th) {
            //throw $th;
             return response()->json($th->getMessage(),406);
        }
    }

    public function post(Request $request)
    {
        //
        try {
            //code...
            $rules = [
                "nombre" => "required",
                "apellido" => "required",
            ];
            $messages = [
                "nombre.required" => "El nombre es requerido",
                "apellido.required" => "El apellido es requerido",
            ];
            $validador = validator($request->all(), $rules, $messages);
            if ($validador->fails()) {
                return response()->json($validador->errors()->all(), 200);
            } else {
                $request->request->add(array("fechaCreado" => date('Y-d-m')));
                $maestro = Maestro::create($request->only('nombre', 'apellido','fechaCreado'));
                return response()->json($maestro, 200);
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json($th->getMessage(), 406);
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
