<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 18/10/2025
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%-- Created by IntelliJ IDEA. User: Lenovo Date: 18/10/2025 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des Produits</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        th { background-color: #f2f2f2; }
        button { padding: 6px 10px; border: none; border-radius: 5px; cursor: pointer; }
        .btn-edit { background-color: #ffc107; color: white; }
        .btn-delete { background-color: #dc3545; color: white; }
        .btn-add { background-color: #007bff; color: white; }
        #addForm { display: none; margin-top: 20px; background: #fafafa; padding: 15px; border-radius: 8px; }
    </style>

    <script>
        function toggleForm() {
            const form = document.getElementById("addForm");
            form.style.display = (form.style.display === "none" || form.style.display === "") ? "block" : "none";
        }

        function confirmDelete(id) {
            if (confirm("Voulez-vous vraiment supprimer ce produit ?")) {
                window.location.href = "produits?action=supprimer&id=" + id;
            }
        }
    </script>
</head>
<body>

<div style="display:flex;justify-content:space-between;align-items:center;">
    <h2>🛍️ Liste des Produits</h2>
    <button class="btn-add" onclick="toggleForm()">➕ Ajouter un produit</button>
</div>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Prix</th>
        <th>Stock</th>
        <th>Catégorie</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${produits}">
        <tr>
            <td>${p.id}</td>
            <td>${p.nom}</td>
            <td>${p.description}</td>
            <td>${p.prix} MAD</td>
            <td>${p.stock}</td>
            <td>${p.categorie}</td>
            <td>
                <a href="produits?action=edit&id=${p.id}" class="btn-edit">✏️ Modifier</a>
                <button class="btn-delete" onclick="confirmDelete(${p.id})">🗑️ Supprimer</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Formulaire Ajouter -->
<form id="addForm" action="produits" method="post">
    <input type="hidden" name="action" value="ajouter">

    <h3>➕ Ajouter un Produit</h3>
    <label>Nom :</label>
    <input type="text" name="nom" required>

    <label>Description :</label>
    <textarea name="description"></textarea>

    <label>Prix :</label>
    <input type="number" step="0.01" name="prix" required>

    <label>Stock :</label>
    <input type="number" name="stock" required>

    <label>Catégorie :</label>
    <input type="text" name="categorie">

    <button type="submit" class="btn-add">Ajouter</button>
</form>

</body>
</html>
