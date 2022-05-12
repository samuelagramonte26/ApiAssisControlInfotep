<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMaestroMateriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maestro_materias', function (Blueprint $table) {
            $table->id();
            $table->integer("maestroID");
            $table->integer("materiaID");
            $table->boolean("active")->default(true);
            $table->date("fechaCreado")->nullable();
            $table->date("fechaEditado")->nullable();
            $table->date("fechaEliminado")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('maestro_materias');
    }
}
