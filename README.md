# Vitrine & Panier - Application Web Java EE / JPA
## Description

Cette application web permet de gérer une vitrine de produits, un panier client et la confirmation de commandes.
Elle est développée en Java EE / Jakarta EE, utilise JPA/Hibernate pour la persistance et des JSP / Servlets pour l’interface utilisateur.

## Fonctionnalités principales :

  - Affichage des produits dans une vitrine responsive.

  - Ajout de produits au panier par les clients.

  - Consultation du panier avec calcul automatique du total.

  - Suppression ou validation des produits dans le panier.

  - Gestion du panier via la session HTTP.

## Technologies utilisées

  - Java EE / Jakarta EE 9

  - JPA / EclipseLink

  - Servlets & JSP

  - MySQL / MariaDB (base de données)

  - HTML5 / CSS3 pour l’interface utilisateur

  - Lombok pour réduire le boilerplate dans les entités

## Structure du projet:

```

MVC2JPA/
├── src/main/java/ma/fstt/mvc2jpa/
│   ├── controller/
│   │    ├── PanierController.java
│   │    ├── ProduitController.java
│   │    └── VitrineController.java
│   ├── entity/
│   │    ├── Produit.java
│   │    ├── Panier.java
│   │    ├── LignePanier.java
│   │    └── Internaute.java
│   ├── service/
│   │    ├── ProduitService.java
│   │    ├── PanierService.java
│   │    └── InternauteService.java
│   └── util/
│        ├── JpaUtil.java
├── src/main/webapp/
│   ├── WEB-INF/
│   |   ├── Produit/
│   |   │   ├── editProduit.jsp
│   |   │   └── Produits.jsp
│   │   ├── Vitrine/vitrine.jsp
│   │   └── Panier/panier.jsp
│   └── index.jsp
├── pom.xml
└── README.md


```

## Installation

1. **Cloner le dépôt :**
```
git clone https://github.com/SalahKhazri/MVC2JPA.git
```

2. **Configurer la base de données MySQL :**

  - Créer une base mvc2jpa.
  - Configurer les tables via JPA/Hibernate (ou SQL fourni).

3. **Modifier la connexion JPA (persistence.xml) avec tes identifiants MySQL :**
```
<property name="jakarta.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/mvc2jpa"/>
<property name="jakarta.persistence.jdbc.user" value="root"/>
<property name="jakarta.persistence.jdbc.password" value="password"/>
```

4. **Compiler et déployer sur WildFly :**

```
mvn clean install
```

5. **Accéder à l’application :**

  - Pour ajouter des produits:
```
http://localhost:8080/MVC2JPA-1.0-SNAPSHOT/produits
```
  - Pour voir la vitrine pour bien ajouter des produits au panier

```
http://localhost:8080/MVC2JPA-1.0-SNAPSHOT/vitrine
```
## Utilisation

  - **Vitrine produits :** affiche tous les produits disponibles avec bouton "Ajouter au panier".

  - **Panier :** accessible via /panier, affiche les produits sélectionnés et le total.

  - **Actions :**

      - Ajouter un produit → bouton 🛒

      - Vider le panier → bouton 🗑️

      - Continuer les achats → bouton ←

      - Confirmer la commande → bouton ✅
  

