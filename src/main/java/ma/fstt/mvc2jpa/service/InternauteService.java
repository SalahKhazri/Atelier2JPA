package ma.fstt.mvc2jpa.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import ma.fstt.mvc2jpa.entity.Internaute;
import ma.fstt.mvc2jpa.util.JpaUtil;

public class InternauteService {

    public Internaute trouverParEmail(String email) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery("SELECT i FROM Internaute i WHERE i.email = :email", Internaute.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public Internaute ajouterInternaute(Internaute internaute) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(internaute);
        em.getTransaction().commit();
        em.close();
        return internaute;
    }
}
