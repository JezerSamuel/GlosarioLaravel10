<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Glosario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
  <body class="bg-secondary">

    <!--Encabezado-->
    <div class="container text-center bg-dark mt-2">
        <div class="row align-items-start">
          <div class="col-12">
            <Header>
                <br>
                <h3 class="display-3 text-white">Glosario de Programación Cliente Servidor</h3>
                <h4>Universidad Politéctica de Bacalar</h4>
                <h4>Materia: Programación Cliente Servidor</h4>
                <h4>Act 1.8 Desarrolla un Glosario de términos</h4>

                <br>
            </Header>
          </div>

          <!--Barra de navegacion-->
          <nav class="navbar bg-body-tertiary">
            <div class="container">
              <!--Logo del glosario-->
              <a class="navbar-brand" href="#">
                <img src="{{ asset('storage/img/logoG.png') }}" alt="Glosario" width="30" height="30"> Glosario
              </a>

              <!--Boton que reenvia al apartado para añadir un termino-->
              <a class="btn btn-outline-danger" href="{{ route('terminos.create') }}">Nuevo Término</a>

              <!--Botón Panel de Control-->
              <a class="btn btn-outline-primary" href="{{ route('terminos.panel') }}">Panel de Control</a>

              <!--Barra de busqueda-->
              <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
              </form>

            </div>
          </nav>

        </div><!--Fin del Row del encabezado-->
    </div><!--Fin del contenedor del encabezado-->
    
    <!--Contenido Principal-->
    <Main>
        <!--Contenedor del contenido de la pagina-->
        <div class="container text-center">
            <div class="row align-items-start mt-3"><!--Row principal-->

              <div class="col-2 bg-dark"><!--Columna que almacena la barra lateral-->
              <br>
              <form id="form">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <!--Grupo de botones en vertical-->
                <div class="btn-group-vertical" role="group" aria-label="Vertical radio toggle button group">
                    <!--Boton 1-->
                    @csrf
                    @foreach ($terminos as $termino1)
                      <input type="radio" class="btn-check btn-lg" name="vbtn-radio" id="vbtn-radio{{ $termino1->id }}" data-id="{{ $termino1->id }}" autocomplete="off" {{ $termino1->id == 2 ? 'checked' : '' }}>
                      <label class="btn btn-outline-danger btn-lg" for="vbtn-radio{{ $termino1->id }}">{{ $termino1->nombre }}</label>
                    @endforeach
                    <br>
                </div><!--Fin del grupo de botones en verical-->
                
              </form>
              </div><!--Fin de la barra lateral-->

              <div class="col-1"><!--Columna de relleno para poner espacio--></div>

              <div class="col-9 bg-dark ml-2"><!--Columna de contenido actualizable-->

              <h1 class="text-white"> {{ $termino->nombre }}</h1>
              <br>
              <p class="h2 text-white"> {{ $termino->descripcion }} </p>
              <br>

              <div class="container" style="max-width: 500px;">
                <img class="img-fluid" src="{{ asset('storage/img/' . $termino->imagen) }}" alt="Imagen del término" id="term-image"><br>
              </div>

              
              <br>
              </div><!--Fin de la columna de contenido actualizable-->

            </div><!--Fin del Row principal-->
        </div><!--Fin del contenedor Principal-->
    </Main>
    
    

    <!--Estilos de javascript y Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            // Cuando se cambia el valor de un botón radio
            $('input[name="vbtn-radio"]').change(function(){
                // Obtiene el valor del botón radio marcado
                var id = $('input[name="vbtn-radio"]:checked').data('id');
                // Envía una petición ajax a la ruta /glosario con el id como parámetro
                $.ajax({
                    url: '{{ route('glosario.ajax') }}',
                    type: 'POST',
                    data: {id: id,_token: $('input[name="_token"]').val()},
                    // Si la petición es exitosa
                    success: function(data){
                        // Actualiza el contenido de los elementos <h1> y <p> con el nombre y la descripción del término
                        $('h1').text(data.nombre);
                        $('p').text(data.descripcion);
                        $('#term-image').attr('src', data.imagen);
                    }
                });
            });
        });
    </script>

  </body>
</html>