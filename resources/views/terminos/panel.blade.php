<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Control</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body class="bg-secondary">
    <!--Encabezado-->
    <div class="container text-center bg-dark mt-2">
        <div class="row align-items-start">
          <div class="col-12">
            <Header>
                <br>
                <h3 class="display-3 text-white">Panel de Control</h3>
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
              <a class="navbar-brand" href="{{ route('glosario') }}">
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

    <div class="container text-center mt-2">
        <div class="row align-items-start mt-3"><!--Row principal-->
            <div class="col-1"></div>
            <div class="col-10 bg-dark mt-2"><!--Columna que almacena la barra lateral-->
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripción</th>
                        
                    </tr>
                </thead>
                <tbody>
                    @foreach($terminos as $termino)
                    <tr>
                        <th scope="row">{{ $termino->id }}</th>
                        <td>{{ $termino->nombre }}</td>
                        <td>{{ $termino->descripcion }}</td>
                        <td>
                            <!-- Botón para editar -->
                            <a href="{{ route('terminos.edit', $termino->id) }}" class="btn btn-primary btn-sm">Editar</a>
                            
                            <!-- Formulario para borrar -->
                            <form action="{{ route('terminos.destroy', $termino->id) }}" method="POST" style="display: inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Borrar</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table><br>
            </div>
            <div class="col-1"></div>
        </div>
    </div>

    <!--Estilos de javascript y Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


</body>
</html>