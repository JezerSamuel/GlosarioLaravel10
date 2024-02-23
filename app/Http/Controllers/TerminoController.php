<?php

namespace App\Http\Controllers;

use App\Models\Termino;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class TerminoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
        // Obtén todos los términos ordenados por nombre, con "Acerca de" al final
        $terminos = Termino::orderByRaw("nombre = 'Acerca de' ASC, nombre ASC")->get(); 
        
        // Encuentra el término "Acerca de" y muévelo al final de la colección
        $acerca_de = $terminos->firstWhere('nombre', 'Acerca de');
        if ($acerca_de) {
            $terminos = $terminos->reject(function ($termino) use ($acerca_de) {
                return $termino->id === $acerca_de->id;
            });
            $terminos->push($acerca_de);
        }

        $termino = Termino::find(4); // El término inicial

        return view('glosario', compact('terminos', 'termino')); 
            
    }

    

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //Te reenvia al la vista del formulario para añadir un nuevo termino
        return view('terminos.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Valida los datos del formulario
        $request->validate([
            'nombre' => 'required|string|max:255',
            'descripcion' => 'required|string',
            'imagen' => 'required|image', // Validación para asegurar que se carga una imagen
        ]);

        // Subir la imagen y obtener su nombre
        $imagenNombre = $request->file('imagen')->getClientOriginalName();
        $request->file('imagen')->storeAs('public/img', $imagenNombre);

        // Crea un nuevo término con los datos del formulario
        $termino = new Termino();
        $termino->nombre = $request->nombre;
        $termino->descripcion = $request->descripcion;
        $termino->imagen = $imagenNombre; // Guarda el nombre de la imagen en la base de datos

        // Guarda el término en la base de datos
        $termino->save();

        // Redirecciona a una página de éxito o a donde desees
        return redirect()->route('glosario')->with('success', 'Término creado exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        //Funcion que se encarga de actualizar la vista en tiempo real

        //Obtenemos los datos obtenidos del boton seleccionado
        $id = $request->input('id');
        $termino = Termino::find($id);
        $imagenURL = asset('storage/img/' . $termino->imagen); // Obtener la URL de la imagen

        //Reenviamos los nuevos datos a la vista
        return response()->json([
            'nombre' => $termino->nombre,
            'descripcion' => $termino->descripcion,
            'imagen' => $imagenURL,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $termino = Termino::findOrFail($id);
        return view('terminos.edit', compact('termino'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $termino = Termino::findOrFail($id);
        
        $request->validate([
            'nombre' => 'required|string|max:255',
            'descripcion' => 'required|string',
            'imagen' => 'image', // Permitir actualizar la imagen opcionalmente
        ]);

        $termino->nombre = $request->nombre;
        $termino->descripcion = $request->descripcion;

        // Actualiza la imagen solo si se ha cargado una nueva
        if ($request->hasFile('imagen')) {
            $imagenNombre = $request->file('imagen')->getClientOriginalName();
            $request->file('imagen')->storeAs('public/img', $imagenNombre);
            $termino->imagen = $imagenNombre;
        }

        $termino->save();

        return redirect()->route('terminos.panel')->with('success', 'Término actualizado exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $termino = Termino::findOrFail($id);
        $termino->delete();
        return redirect()->route('terminos.panel')->with('success', 'Término eliminado exitosamente.');
    }

    //Avilita la vista del panel de control y le otorg los elementos de la tabla Terminos
    public function panel()
    {
        $terminos = Termino::all(); // Obtener todos los términos
        return view('terminos.panel', compact('terminos'));
    }

}
