<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Turnero Prueba Tecnica 2</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon">
                        <i class="fas fa-solid fa-archway"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Turnero</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-duotone fa-bars"></i>
                        <span>Panel principal</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Gestiones
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
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

                <!-- Nav Item - Utilities Collapse Menu -->
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

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Mas informacion
                </div>


                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="AcercaDeEsteProyecto.jsp">
                        <i class="fas far fa-info-circle"></i>
                        <span>Acerca de este proyecto</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fal fa-address-card"></i>
                        <span>Contacto</span></a>
                </li>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        
                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Aplicacion Turnero</h1>
                        </div>

                        <form action="SvCiudadano" method="post">
                            <div class="mb-3">
                                <div class=" mb-3">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <label for="name">Nombre</label>
                                        <input class="form-control" id="nombre" name="nombre" type="text" required required pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ\s]+"/>
                                    </div>
                                </div>
                                <div class=" mb-3">
                                    <div class="form-floating">
                                        <label for="surname">Apellidos</label>
                                        <input class="form-control" id="apellidos" name="apellidos" type="text" required pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ\s]+" />
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="form-floating">
                                        <label for="dni">DNI</label>
                                        <input class="form-control" id="dni" name="dni" type="text" required pattern="[0-9]{8}[A-Za-z]" placeholder="Introduce ocho digitos mas una letra"/>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4 mb-0">
                                <button type="submit" class="btn btn-dark w-100">Enviar</button>
                            </div>
                        </form>



                        <!-- Footer -->
                        <footer class="sticky-footer bg-white">
                            <div class="container my-auto">
                                <div class="copyright text-center my-auto">
                                    <span>Copyright &copy; German Morales Valverde</span>
                                </div>
                            </div>
                        </footer>
                        <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->



 

                <!-- Bootstrap core JavaScript-->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="js/sb-admin-2.min.js"></script>

                <!-- Page level plugins -->
                <script src="vendor/chart.js/Chart.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="js/demo/chart-area-demo.js"></script>
                <script src="js/demo/chart-pie-demo.js"></script>

                </body>

                </html>