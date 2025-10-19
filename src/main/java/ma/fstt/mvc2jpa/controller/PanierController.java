package ma.fstt.mvc2jpa.controller;


import ma.fstt.mvc2jpa.entity.Produit;
import ma.fstt.mvc2jpa.service.ProduitService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/panier")
public class PanierController extends HttpServlet {
    private ProduitService produitService = new ProduitService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        HttpSession session = request.getSession();

        List<Produit> panier = (List<Produit>) session.getAttribute("panier");
        if (panier == null) {
            panier = new ArrayList<>();
        }

        Produit produit = produitService.trouverProduit(Long.parseLong(id));
        if (produit != null) {
            panier.add(produit);
        }

        session.setAttribute("panier", panier);
        response.sendRedirect("vitrine");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<Produit> panier = (List<Produit>) session.getAttribute("panier");

        if (action == null || action.equals("afficher")) {
            request.setAttribute("panier", panier);
            request.getRequestDispatcher("/WEB-INF/Panier/panier.jsp").forward(request, response);
        } else if (action.equals("vider")) {
            session.removeAttribute("panier");
            response.sendRedirect("vitrine");
        }
    }
}
