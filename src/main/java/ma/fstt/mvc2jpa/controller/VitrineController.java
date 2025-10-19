package ma.fstt.mvc2jpa.controller;


import ma.fstt.mvc2jpa.entity.Produit;
import ma.fstt.mvc2jpa.service.ProduitService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/vitrine")
public class VitrineController extends HttpServlet {
    private ProduitService produitService = new ProduitService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Produit> produits = produitService.tousLesProduits();
        request.setAttribute("produits", produits);
        request.getRequestDispatcher("/WEB-INF/Vitrine/vitrine.jsp").forward(request, response);
    }
}

