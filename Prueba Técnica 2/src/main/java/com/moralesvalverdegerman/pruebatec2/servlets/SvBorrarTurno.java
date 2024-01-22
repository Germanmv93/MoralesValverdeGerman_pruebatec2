package com.moralesvalverdegerman.pruebatec2.servlets;

import com.moralesvalverdegerman.pruebatec2.logica.Controladora;
import com.moralesvalverdegerman.pruebatec2.logica.Turno;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvBorrarTurno", urlPatterns = {"/SvBorrarTurno"})
public class SvBorrarTurno extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = Long.valueOf(request.getParameter("id"));

        boolean eliminado = false;

        // Lógica para verificar si el turno existe
        Turno turno = control.traerTurnosPorId(id);
        if (turno != null) {
            // Lógica para eliminar el turno
            control.borrarTurno(id);
            eliminado = true;
        }

        if (eliminado) {
            response.sendRedirect("EliminarTurno.jsp?eliminado=true");
        } else {
            response.sendRedirect("EliminarTurno.jsp?eliminado=false");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
