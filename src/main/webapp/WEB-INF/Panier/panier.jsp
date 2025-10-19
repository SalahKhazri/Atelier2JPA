<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 19/10/2025
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mon Panier</title>
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
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin: 0;
            font-size: 28px;
        }

        .container {
            width: 90%;
            max-width: 900px;
            background-color: white;
            margin: 40px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
            font-size: 16px;
        }

        td {
            font-size: 15px;
            color: #333;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        .empty {
            text-align: center;
            font-size: 18px;
            color: #888;
            padding: 50px 0;
        }

        .actions {
            text-align: center;
            margin-top: 25px;
        }

        a.button {
            display: inline-block;
            background-color: #27ae60;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 6px;
            margin: 5px;
            transition: background-color 0.2s ease;
        }

        a.button:hover {
            background-color: #219150;
        }

        a.button.secondary {
            background-color: #2980b9;
        }

        a.button.secondary:hover {
            background-color: #1f6393;
        }

        a.button.danger {
            background-color: #c0392b;
        }

        a.button.danger:hover {
            background-color: #962d22;
        }

        .total {
            text-align: right;
            font-weight: bold;
            margin-top: 15px;
            font-size: 18px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #ecf0f1;
            margin-top: 40px;
            font-size: 15px;
        }
    </style>
</head>
<body>

<header>
    <h1>🛒 Mon Panier</h1>
</header>

<div class="container">
    <c:if test="${empty panier}">
        <div class="empty">
            <p>Votre panier est vide.</p>
            <a href="vitrine" class="button secondary">← Retour à la vitrine</a>
        </div>
    </c:if>

    <c:if test="${not empty panier}">
        <table>
            <tr>
                <th>Nom</th>
                <th>Prix (MAD)</th>
            </tr>
            <c:forEach var="produit" items="${panier}">
                <tr>
                    <td>${produit.nom}</td>
                    <td>${produit.prix}</td>
                </tr>
            </c:forEach>
        </table>

        <div class="total">
            Total :
            <c:set var="total" value="0" />
            <c:forEach var="produit" items="${panier}">
                <c:set var="total" value="${total + produit.prix}" />
            </c:forEach>
            <span>${total} MAD</span>
        </div>

        <div class="actions">
            <a href="panier?action=vider" class="button danger">🗑️ Vider le panier</a>
            <a href="vitrine" class="button secondary">← Continuer mes achats</a>
            <a href="commande?action=confirmer" class="button">✅ Confirmer la commande</a>
        </div>
    </c:if>
</div>

<footer>
    <p>© 2025 Ma Boutique - Tous droits réservés</p>
</footer>

</body>
</html>
