package ma.fstt.mvc2jpa.service;

import jakarta.persistence.EntityManager;
import ma.fstt.mvc2jpa.entity.*;
import ma.fstt.mvc2jpa.util.JpaUtil;

public class PanierService {

    public Panier creerPanier(Internaute internaute) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();

        Panier panier = new Panier(internaute);
        em.persist(panier);

        em.getTransaction().commit();
        em.close();
        return panier;
    }

    public Panier trouverPanier(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        Panier panier = em.find(Panier.class, id);
        em.close();
        return panier;
    }

    public void ajouterProduit(Panier panier, Produit produit, int quantite) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();

        panier = em.merge(panier); // attacher au contexte
        produit = em.merge(produit);

        panier.ajouterProduit(produit, quantite);
        em.merge(panier);

        em.getTransaction().commit();
        em.close();
    }

    public void validerPanier(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        Panier panier = em.find(Panier.class, id);
        if (panier != null) {
            panier.setStatut("VALIDE");
            em.merge(panier);
        }
        em.getTransaction().commit();
        em.close();
    }
}
