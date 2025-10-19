package ma.fstt.mvc2jpa.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ma.fstt.mvc2jpa.entity.Produit;
import ma.fstt.mvc2jpa.service.ProduitService;

import java.io.IOException;
import java.util.List;

@WebServlet("/produits")
public class ProduitController extends HttpServlet {

    private ProduitService produitService;

    @Override
    public void init() {
        produitService = new ProduitService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "addForm":
                request.getRequestDispatcher("/WEB-INF/Produit/Produits.jsp").forward(request, response);
                break;

            case "supprimer":
                Long idSup = Long.parseLong(request.getParameter("id"));
                produitService.supprimerProduit(idSup);
                response.sendRedirect("produits");
                break;

            case "edit":
                Long idEdit = Long.parseLong(request.getParameter("id"));
                Produit produit = produitService.trouverProduit(idEdit);
                request.setAttribute("produit", produit);
                request.getRequestDispatcher("/WEB-INF/Produit/editProduit.jsp").forward(request, response);
                break;

            default: // afficher la liste
                List<Produit> produits = produitService.tousLesProduits();
                request.setAttribute("produits", produits);
                request.getRequestDispatcher("/WEB-INF/Produit/Produits.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
            Produit p = new Produit();
            p.setNom(request.getParameter("nom"));
            p.setDescription(request.getParameter("description"));
            p.setPrix(Double.parseDouble(request.getParameter("prix")));
            p.setStock(Integer.parseInt(request.getParameter("stock")));
            p.setCategorie(request.getParameter("categorie"));
            produitService.ajouterProduit(p);
        } else if ("modifier".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            Produit p = produitService.trouverProduit(id);
            p.setNom(request.getParameter("nom"));
            p.setDescription(request.getParameter("description"));
            p.setPrix(Double.parseDouble(request.getParameter("prix")));
            p.setStock(Integer.parseInt(request.getParameter("stock")));
            p.setCategorie(request.getParameter("categorie"));
            produitService.mettreAJourProduit(p);
        }

        response.sendRedirect("produits");
    }
}
