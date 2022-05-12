<?php

use App\Http\Controllers\AulaController;
use App\Http\Controllers\CursoController;
use App\Http\Controllers\MaestroCursoController;
use App\Http\Controllers\MateriaController;
use App\Http\Controllers\MateriaCursoController;
use App\Http\Controllers\ParticipanteController;
use App\Http\Controllers\TallerController;
use App\Models\Maestro;
use App\Models\Taller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Taller
Route::get('/taller',[TallerController::class,"get"]);
Route::post('/taller/add',[TallerController::class,"post"]);

//Aula
Route::get('/aula',[AulaController::class,"get"]);
Route::post('/aula/add',[AulaController::class,"post"]);

//Curso
Route::get('/curso',[CursoController::class,"get"]);
Route::post('/curso/add',[CursoController::class,"post"]);

//Participante
Route::get('/participante',[ParticipanteController::class,"get"]);
Route::post('/participante/add',[ParticipanteController::class,"post"]);

//Materia
Route::get('/materia',[MateriaController::class,"get"]);
Route::post('/materia/add',[MateriaController::class,"post"]);

//MateriaCurso
Route::get('/materiaCurso',[MateriaCursoController::class,"get"]);
Route::post('/materiaCurso/add',[MateriaCursoController::class,"post"]);


//Maestro
Route::get('/maestro',[MaestroCursoController::class,"get"]);
Route::post('/maestro/add',[MaestroCursoController::class,"post"]);