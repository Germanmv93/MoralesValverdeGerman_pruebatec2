package com.moralesvalverdegerman.pruebatec2.servlets;

import com.moralesvalverdegerman.pruebatec2.logica.Controladora;
import com.moralesvalverdegerman.pruebatec2.logica.Turno;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvBuscarDni", urlPatterns = {"/SvBuscarDni"})
public class SvBuscarDni extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String dni = request.getParameter("dni");

        List<Turno> turnos = control.traerTurnosPorDni(dni);

        request.setAttribute("turnos", turnos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TurnoPorDni.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
