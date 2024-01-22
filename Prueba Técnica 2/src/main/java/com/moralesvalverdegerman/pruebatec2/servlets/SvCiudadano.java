package com.moralesvalverdegerman.pruebatec2.servlets;

import com.moralesvalverdegerman.pruebatec2.logica.Ciudadano;
import com.moralesvalverdegerman.pruebatec2.logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvCiudadano", urlPatterns = {"/SvCiudadano"})
public class SvCiudadano extends HttpServlet {

    private Controladora control = new Controladora();

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

        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String dni = request.getParameter("dni");

        Ciudadano ciudadano = new Ciudadano();
        ciudadano.setNombre(nombre);
        ciudadano.setApellidos(apellidos);
        ciudadano.setDni(dni);

        control.createPerson(ciudadano);

        HttpSession mySesion = request.getSession();
        mySesion.setAttribute("Ciudadano", ciudadano);

        response.sendRedirect("CrearTurno.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
