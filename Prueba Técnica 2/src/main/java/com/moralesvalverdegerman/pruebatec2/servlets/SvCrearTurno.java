package com.moralesvalverdegerman.pruebatec2.servlets;

import com.moralesvalverdegerman.pruebatec2.logica.Ciudadano;
import com.moralesvalverdegerman.pruebatec2.logica.Controladora;
import com.moralesvalverdegerman.pruebatec2.logica.Turno;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvCrearTurno", urlPatterns = {"/SvCrearTurno"})
public class SvCrearTurno extends HttpServlet {

    private Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String verTodos = request.getParameter("verTodos");
        List<Turno> turnos;

        if ("true".equals(verTodos)) {
            // Obtener todos los turnos
            turnos = control.traerTurnos();
        } else {
            // Lógica para filtrar por fecha y/o estado
            String fechaParam = request.getParameter("turnDate");
            String estadoParam = request.getParameter("estado");
            LocalDate fecha = LocalDate.parse(fechaParam);
            boolean estado = "atendidos".equals(estadoParam);

            turnos = control.traerTurnos().stream()
                    .filter(t -> t.getFecha().isEqual(fecha) && t.isEstado() == estado)
                    .collect(Collectors.toList());
        }

        request.setAttribute("turns", turnos);

        RequestDispatcher dispatcher = request.getRequestDispatcher("TurnosRegistrados.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession mySession = request.getSession();
        Ciudadano ciudadano = (Ciudadano) mySession.getAttribute("Ciudadano");

        Long id = Long.valueOf(request.getParameter("id"));
        String descripcion = request.getParameter("descripcion");
        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));

        if (control.turnoExiste(id)) {
            request.getRequestDispatcher("ErrorTurnoExistente.jsp").forward(request, response);
        } else {

            Turno turno = new Turno();
            turno.setCiudadano(ciudadano);
            turno.setFecha(fecha);
            turno.setDescripcion(descripcion);
            turno.setId(id);

            control.crearTurno(turno);
            response.sendRedirect("CrearUsuario.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
