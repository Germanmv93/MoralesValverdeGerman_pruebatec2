<%@page import="java.util.List"%>
<%@page import="com.moralesvalverdegerman.pruebatec2.logica.Turno"%>
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
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <script>
            function setRequired(isRequired) {
                document.getElementById('turnDate').required = isRequired;
            }
        </script>
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


                        <div class="container-fluid px-4">
                            <h2 class="mt-4">Consulta de turnos</h2>
                            <br>
                            <div class=" mb-4 ">
                                Turnos registrados en la base de datos. Selecciona una fecha y un estado y haz click en filtrar.
                            </div>
                            <form action="SvCrearTurno" method="GET" class="mb-4">
                                <div class="form-group">
                                    <!-- Campo de fecha con estilo Bootstrap -->
                                    <label for="turnDate">Fecha:</label>
                                    <input type="date" name="turnDate" class="form-control" id="turnDate">
                                </div>

                                <div class="form-group">
                                    <!-- Opciones para el estado con estilo Bootstrap -->
                                    <div class="form-check">
                                        <input type="radio" id="enEspera" name="estado" class="form-check-input" value="enEspera">
                                        <label class="form-check-label" for="enEspera">En Espera</label>
                                    </div>
                                    <div class="form-check">
                                        <input type="radio" id="atendidos" name="estado" class="form-check-input" value="atendidos">
                                        <label class="form-check-label" for="atendidos">Atendidos</label>
                                    </div>
                                </div>

                                <!-- Botones con estilo Bootstrap -->
                                <button type="submit" class="btn btn-primary mr-2" onclick="setRequired(true)">Filtrar</button>
                                <button type="submit" name="verTodos" value="true" class="btn btn-secondary" onclick="setRequired(false)">Ver Todos</button>
                            </form>


                            <%
                                List<Turno> turns = (List<Turno>) request.getAttribute("turns");

                                if (turns != null) {
                                    if (turns.isEmpty()) {
                            %>
                            <div class="alert alert-danger mt-4 col-md-3" role="alert">
                                No se han encontrado turnos.
                            </div>
                            <%
                            } else {
                            %>
                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <div>
                                        <i class="fas fa-table me-1"></i>
                                        Registro
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Fecha</th>
                                                <th>Descripción</th>
                                                <th>Ciudadano</th>
                                                <th>Estado</th>
                                                <th>Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Turno turno : turns) {%>
                                            <tr>
                                                <td><%= turno.getId()%></td>
                                                <td><%= turno.getFecha()%></td>
                                                <td><%= turno.getDescripcion()%></td>
                                                <td>
                                                    <% if (turno.getCiudadano() == null) {%>
                                                    <%= "Usuario Eliminado"%>
                                                    <% } else {%>
                                                    <%= turno.getCiudadano().getNombre()%><%= " "%><%= turno.getCiudadano().getApellidos()%>
                                                    <% } %>
                                                </td>
                                                <td>
                                                    <div style="display: flex; justify-content: space-between; align-items: center">
                                                        <% if (!turno.isEstado()) { %>
                                                        <div class="text-danger fw-semibold">En espera</div>
                                                        <% } else { %>
                                                        <div class="text-success fw-semibold">Atendido</div>
                                                        <% }%>
                                                    </div>
                                                </td>
                                                <td>
                                                    <form action="SvEditarTurno" method="POST">
                                                        <input type="hidden" name="turnoId" value="<%= turno.getId()%>">
                                                        <input type="hidden" name="nuevoEstado" value="<%= !turno.isEstado()%>">
                                                        <button class="btn btn-outline-secondary px-4" type="submit" style="font-size: 15px; font-weight: 800">
                                                            Alternar estado
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>

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
                <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


                </body>

                </html>