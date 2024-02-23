<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $terminos = ['Cliente','Servidor','Sistemas de computadoras centrales','Computadoras dedicadas','Recursos compartidos','Protocolos asimétricos','Encapsulación de servicios','Escalabilidad','Integridad','IAAS','PAAS','SAAS','Cómputo en la nube'];

        foreach($terminos as $termino){
            DB::table('terminos')->insert(['nombre' => $termino,'descripcion' => Str::Random(100)]);
        }

    }
}
