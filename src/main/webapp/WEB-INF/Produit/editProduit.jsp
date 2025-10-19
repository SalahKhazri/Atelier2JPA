<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 18/10/2025
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifier Produit</title>
</head>
<body>
<h2>✏️ Modifier le Produit</h2>

<form action="produits" method="post">
    <input type="hidden" name="action" value="modifier">
    <input type="hidden" name="id" value="${produit.id}">

    <label>Nom :</label>
    <input type="text" name="nom" value="${produit.nom}" required><br>

    <label>Description :</label>
    <textarea name="description">${produit.description}</textarea><br>

    <label>Prix :</label>
    <input type="number" step="0.01" name="prix" value="${produit.prix}" required><br>

    <label>Stock :</label>
    <input type="number" name="stock" value="${produit.stock}" required><br>

    <label>Catégorie :</label>
    <input type="text" name="categorie" value="${produit.categorie}"><br>

    <button type="submit">Mettre à jour</button>
</form>

</body>
</html>
