package com.moralesvalverdegerman.pruebatec2.persistencia;

import com.moralesvalverdegerman.pruebatec2.logica.Ciudadano;
import com.moralesvalverdegerman.pruebatec2.logica.Turno;
import com.moralesvalverdegerman.pruebatec2.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    TurnoJpaController turnoPu = new TurnoJpaController();
    CiudadanoJpaController ciudadPu = new CiudadanoJpaController();

    public void createUser(Ciudadano ciudadano) {
        try {
            ciudadPu.create(ciudadano);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearTurno(Turno turno) {
        turnoPu.create(turno);
    }

//    public Ciudadano traerDniCiudadano(String dni) {
//        return ciudadPu.findCiudadano(dni);
//    }

    public void borrarTurno(Long id) {
        try {
            turnoPu.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> traerTurnos() {
        return turnoPu.findTurnoEntities();
    }

    public boolean turnoExistente(Long id) {
        return turnoPu.turnoExists(id);
    }

    public List<Turno> traerTurnoPorDni(String dni) {
        return turnoPu.traerTurnoPorDni(dni);
    }

    public Turno traerTurnoPorId(Long id) {
        return turnoPu.traerTurnoPorId(id);
    }
}
