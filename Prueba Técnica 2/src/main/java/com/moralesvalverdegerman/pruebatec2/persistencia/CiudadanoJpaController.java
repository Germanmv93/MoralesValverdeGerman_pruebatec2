package com.moralesvalverdegerman.pruebatec2.persistencia;

import com.moralesvalverdegerman.pruebatec2.logica.Ciudadano;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.moralesvalverdegerman.pruebatec2.logica.Turno;
import com.moralesvalverdegerman.pruebatec2.persistencia.exceptions.NonexistentEntityException;
import com.moralesvalverdegerman.pruebatec2.persistencia.exceptions.PreexistingEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class CiudadanoJpaController implements Serializable {

    public CiudadanoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public CiudadanoJpaController() {
        emf = Persistence.createEntityManagerFactory("PruebaTec2PU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Ciudadano ciudadano) throws PreexistingEntityException, Exception {
        if (ciudadano.getTurno() == null) {
            ciudadano.setTurno(new ArrayList<Turno>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Turno> attachedTurno = new ArrayList<Turno>();
            for (Turno turnoTurnoToAttach : ciudadano.getTurno()) {
                turnoTurnoToAttach = em.getReference(turnoTurnoToAttach.getClass(), turnoTurnoToAttach.getId());
                attachedTurno.add(turnoTurnoToAttach);
            }
            ciudadano.setTurno(attachedTurno);
            em.persist(ciudadano);
            for (Turno turnoTurno : ciudadano.getTurno()) {
                Ciudadano oldCiudadanoOfTurnoTurno = turnoTurno.getCiudadano();
                turnoTurno.setCiudadano(ciudadano);
                turnoTurno = em.merge(turnoTurno);
                if (oldCiudadanoOfTurnoTurno != null) {
                    oldCiudadanoOfTurnoTurno.getTurno().remove(turnoTurno);
                    oldCiudadanoOfTurnoTurno = em.merge(oldCiudadanoOfTurnoTurno);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findCiudadano(ciudadano.getDni()) != null) {
                throw new PreexistingEntityException("Ciudadano " + ciudadano + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Ciudadano ciudadano) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Ciudadano persistentCiudadano = em.find(Ciudadano.class, ciudadano.getDni());
            List<Turno> turnoOld = persistentCiudadano.getTurno();
            List<Turno> turnoNew = ciudadano.getTurno();
            List<Turno> attachedTurnoNew = new ArrayList<Turno>();
            for (Turno turnoNewTurnoToAttach : turnoNew) {
                turnoNewTurnoToAttach = em.getReference(turnoNewTurnoToAttach.getClass(), turnoNewTurnoToAttach.getId());
                attachedTurnoNew.add(turnoNewTurnoToAttach);
            }
            turnoNew = attachedTurnoNew;
            ciudadano.setTurno(turnoNew);
            ciudadano = em.merge(ciudadano);
            for (Turno turnoOldTurno : turnoOld) {
                if (!turnoNew.contains(turnoOldTurno)) {
                    turnoOldTurno.setCiudadano(null);
                    turnoOldTurno = em.merge(turnoOldTurno);
                }
            }
            for (Turno turnoNewTurno : turnoNew) {
                if (!turnoOld.contains(turnoNewTurno)) {
                    Ciudadano oldCiudadanoOfTurnoNewTurno = turnoNewTurno.getCiudadano();
                    turnoNewTurno.setCiudadano(ciudadano);
                    turnoNewTurno = em.merge(turnoNewTurno);
                    if (oldCiudadanoOfTurnoNewTurno != null && !oldCiudadanoOfTurnoNewTurno.equals(ciudadano)) {
                        oldCiudadanoOfTurnoNewTurno.getTurno().remove(turnoNewTurno);
                        oldCiudadanoOfTurnoNewTurno = em.merge(oldCiudadanoOfTurnoNewTurno);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = ciudadano.getDni();
                if (findCiudadano(id) == null) {
                    throw new NonexistentEntityException("The ciudadano with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Ciudadano ciudadano;
            try {
                ciudadano = em.getReference(Ciudadano.class, id);
                ciudadano.getDni();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The ciudadano with id " + id + " no longer exists.", enfe);
            }
            List<Turno> turno = ciudadano.getTurno();
            for (Turno turnoTurno : turno) {
                turnoTurno.setCiudadano(null);
                turnoTurno = em.merge(turnoTurno);
            }
            em.remove(ciudadano);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Ciudadano> findCiudadanoEntities() {
        return findCiudadanoEntities(true, -1, -1);
    }

    public List<Ciudadano> findCiudadanoEntities(int maxResults, int firstResult) {
        return findCiudadanoEntities(false, maxResults, firstResult);
    }

    private List<Ciudadano> findCiudadanoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Ciudadano.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Ciudadano findCiudadano(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Ciudadano.class, id);
        } finally {
            em.close();
        }
    }

    public int getCiudadanoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Ciudadano> rt = cq.from(Ciudadano.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    List<Ciudadano> traerCiudadano() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT c FROM Ciudadano c", Ciudadano.class).getResultList();
        } finally {
            em.close();
        }
    }
}
