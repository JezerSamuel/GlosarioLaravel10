<?php

use App\Http\Controllers\TerminoController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    
    return view('welcome');
});

Route::get("/glosario", [TerminoController::class,'index'])->name('glosario');
Route::post('/glosario', [TerminoController::class, 'show'])->name('glosario.ajax');

//Ruta para la creacion del nuevo termino
Route::get('/terminos/crear', [TerminoController::class, 'create'])->name('terminos.create');
Route::post('/terminos', [TerminoController::class, 'store'])->name('terminos.store');

// Ruta para la vista del panel de control
Route::get('/terminos/panel', [TerminoController::class, 'panel'])->name('terminos.panel');

Route::get('/terminos/{id}/edit', [TerminoController::class, 'edit'])->name('terminos.edit');
Route::put('/terminos/{id}', [TerminoController::class, 'update'])->name('terminos.update');
Route::delete('/terminos/{id}', [TerminoController::class, 'destroy'])->name('terminos.destroy');

