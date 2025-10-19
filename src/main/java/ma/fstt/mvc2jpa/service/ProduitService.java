package ma.fstt.mvc2jpa.service;

import jakarta.persistence.*;
import ma.fstt.mvc2jpa.entity.Produit;
import ma.fstt.mvc2jpa.util.JpaUtil;
import java.util.List;

public class ProduitService {

    public void ajouterProduit(Produit p) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
    }

    public void supprimerProduit(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        Produit p = em.find(Produit.class, id);
        if (p != null) em.remove(p);
        em.getTransaction().commit();
        em.close();
    }

    public void mettreAJourProduit(Produit p) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        em.merge(p);
        em.getTransaction().commit();
        em.close();
    }

    public Produit trouverProduit(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        Produit p = em.find(Produit.class, id);
        em.close();
        return p;
    }

    public List<Produit> tousLesProduits() {
        EntityManager em = JpaUtil.getEntityManager();
        List<Produit> produits = em.createQuery("SELECT p FROM Produit p", Produit.class).getResultList();
        em.close();
        return produits;
    }
}
