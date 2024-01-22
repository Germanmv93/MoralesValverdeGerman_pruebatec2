package com.moralesvalverdegerman.pruebatec2.logica;

import com.moralesvalverdegerman.pruebatec2.persistencia.ControladoraPersistencia;
import java.util.List;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void createPerson(Ciudadano ciudadano) {
        controlPersis.createUser(ciudadano);
    }
    
    public void crearTurno (Turno turno){
        controlPersis.crearTurno(turno);
    }
    
    public void borrarTurno(Long id){
        controlPersis.borrarTurno(id);
    }
    
    public List<Turno> traerTurnos(){
        return controlPersis.traerTurnos();
    }

    public boolean turnoExiste(Long id) {
        return controlPersis.turnoExistente(id);
    }

    public List<Turno> traerTurnosPorDni(String dni) {
        return controlPersis.traerTurnoPorDni(dni);
    }

    public Turno traerTurnosPorId(Long id) {
        return controlPersis.traerTurnoPorId(id);
    }
    
    public List<Ciudadano> traerCiudadanos(){
        return controlPersis.traerCiudadanos();
    }
    
    public void actualizarTurno(Turno turno){
        controlPersis.actualizarTurno(turno);
    }

    public Ciudadano traerCiudadanoPorDni(String dni) {
        return controlPersis.traerCiudadanoPorDni(dni);
    }

}