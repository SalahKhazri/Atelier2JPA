<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 19/10/2025
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vitrine Produits</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin: 0;
            font-size: 28px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
            gap: 25px;
        }

        .product {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
            padding: 20px;
            text-align: center;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .product:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.12);
        }

        .product h2 {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }

        .product p {
            font-size: 15px;
            color: #555;
            margin: 5px 0;
        }

        .price {
            font-weight: bold;
            color: #e67e22;
            margin-top: 10px;
            font-size: 16px;
        }

        form {
            margin-top: 15px;
        }

        button {
            background-color: #27ae60;
            border: none;
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        button:hover {
            background-color: #219150;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #ecf0f1;
            margin-top: 40px;
            font-size: 15px;
        }

        .panier-link {
            display: inline-block;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 8px;
            margin-top: 25px;
            transition: background-color 0.2s ease;
        }

        .panier-link:hover {
            background-color: #1f6393;
        }
    </style>
</head>
<body>

<header>
    <h1>🛍️ Vitrine des Produits</h1>
</header>

<div class="container">
    <c:forEach var="produit" items="${produits}">
        <div class="product">
            <h2>${produit.nom}</h2>
            <p>${produit.description}</p>
            <p class="price">${produit.prix} MAD</p>

            <form action="panier" method="post">
                <input type="hidden" name="id" value="${produit.id}">
                <button type="submit">Ajouter au panier 🛒</button>
            </form>
        </div>
    </c:forEach>
</div>

<div style="text-align:center;">
    <a href="panier?action=afficher" class="panier-link">Voir mon panier</a>
</div>

<footer>
    <p>© 2025 Ma Boutique - Tous droits réservés</p>
</footer>

</body>
</html>
