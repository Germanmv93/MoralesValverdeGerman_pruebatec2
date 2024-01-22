package com.moralesvalverdegerman.pruebatec2.servlets;

import com.moralesvalverdegerman.pruebatec2.logica.Turno;
import com.moralesvalverdegerman.pruebatec2.persistencia.ControladoraPersistencia;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SvEditarTurno", urlPatterns = {"/SvEditarTurno"})
public class SvEditarTurno extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Instancia de la controladora de persistencia
        ControladoraPersistencia controlPersis = new ControladoraPersistencia();

        try {
            // Obtener el ID del turno y el nuevo estado desde los parámetros del formulario
            Long turnoId = Long.valueOf(request.getParameter("turnoId"));
            boolean nuevoEstado = Boolean.parseBoolean(request.getParameter("nuevoEstado"));

            // Buscar el turno por ID
            Turno turno = controlPersis.traerTurnoPorId(turnoId);

            // Verificar si el turno existe
            if (turno != null) {
                // Cambiar el estado del turno
                turno.setEstado(nuevoEstado);

                // Actualizar el turno en la base de datos
                controlPersis.actualizarTurno(turno);

                // Redirigir a la página de turnos registrados
                response.sendRedirect("TurnosRegistrados.jsp");
            } else {
                // Manejar el caso en que el turno no se encuentra
                response.sendRedirect("error.jsp"); // Redirigir a una página de error
            }

        } catch (NumberFormatException e) {
            // Manejar excepciones para un ID inválido
            response.sendRedirect("error.jsp"); // Redirigir a una página de error
        } catch (Exception e) {
            // Manejar otras excepciones
            response.sendRedirect("error.jsp"); // Redirigir a una página de error
        }
    }
}
