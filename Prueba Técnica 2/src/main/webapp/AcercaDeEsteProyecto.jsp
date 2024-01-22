<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Turnero Prueba Tecnica 2</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <div id="wrapper">
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon">
                        <i class="fas fa-solid fa-archway"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Turnero</div>
                </a>
                <hr class="sidebar-divider my-0">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-duotone fa-bars"></i>
                        <span>Panel principal</span></a>
                </li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Gestiones
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-solid fa-user-plus"></i>
                        <span>Pedir turno</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">

                            <a class="collapse-item" href="CrearUsuario.jsp"> <i class="fas fa-plus"></i>Pedir turno </a>
                            <a class="collapse-item" href="EliminarTurno.jsp"><i class="fas fa-minus"></i>Eliminar turno</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                       aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-search"></i>
                        <span>Consultar turnos</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">

                            <a class="collapse-item" href="TurnosRegistrados.jsp">Todos los turnos</a>
                            <a class="collapse-item" href="TurnoPorDni.jsp">Turnos por Dni</a>
                        </div>
                    </div>
                </li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Mas informacion
                </div>
                <li class="nav-item">
                    <a class="nav-link" href="AcercaDeEsteProyecto.jsp">
                        <i class="fas far fa-info-circle"></i>
                        <span>Acerca de este proyecto</span></a>
                </li>
            </ul>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    </nav>
                    <div class="container-fluid">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Aplicacion creada por German Morales</h1>
                        </div>
                        <div>
                            <h4>Este proyecto ha sido creado para la prueba tecnica numero 2 del bootcamp Hack a boos.</h4>
                            <br>
                            <h5>El objetivo de esta prueba es evaluar conocimientos en Java y Java Web, incluyendo sintaxis, estructuras repetitivas,
                                estructuras selectivas, manejo de colecciones y operaciones CRUD (Crear, Leer, Actualizar y Borrar) utilizando JPA (Java Persistence API)
                                para interactuar con una base de datos, JSP para interactuar con el usuario y programación funcional como complemento.</h5>
                            <li>Utilidades de la aplicación:
                                <ul>
                                    <li>Agregar un nuevo turno: Los usuarios deben poder ingresar información sobre un nuevo turno, incluyendo número, fecha y descripción
                                        del trámite a realizar. Al mismo tiempo cada turno tendrá un ciudadano asignado. Un turno es EXCLUSIVO de un ciudadano, sin embargo,
                                        un ciudadano puede sacar más de un turno en diferentes ocasiones.</li>
                                    <li>Listar turnos: La aplicación debe permitir la visualización de la lista de todos los turnos junto con los ciudadanos asignados a los mismos,
                                        en base a una fecha brindada por el usuario. Se sugiere el uso de una tabla, para mejor distribución de los datos.</li>
                                    <li>Filtrado de turnos: El usuario debe poder seleccionar si quiere ver los turnos "En Espera" (que son aquellos que aún no han sido atendidos)
                                        o los "Ya atendidos". Siempre teniendo como filtro principal antes que esto la fecha. Es decir, se deberá filtrar por la fecha indicada por el usuario mas el estado del turno.</li>
                                </ul>
                            </li>
                            <h5>Para la realizacion de esta prueba tecnica se ha usado una base da datos de PhpMyAdmin que ha sido denominada "turnero".</h5>
                        </div>
                        <footer class="sticky-footer bg-white">
                            <div class="container my-auto">
                                <div class="copyright text-center my-auto">
                                    <span>Copyright &copy; German Morales Valverde</span>
                                </div>
                            </div>
                        </footer>
                    </div>
                </div>
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                <script src="js/sb-admin-2.min.js"></script>
                <script src="vendor/chart.js/Chart.min.js"></script>
                <script src="js/demo/chart-area-demo.js"></script>
                <script src="js/demo/chart-pie-demo.js"></script>
                </body>
                </html>