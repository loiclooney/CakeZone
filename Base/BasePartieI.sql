----- 1. Table des Ingrédients

CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    unite VARCHAR(20) NOT NULL, -- Unité de mesure (e.g., kg, litre)
    seuil_minimum DECIMAL(10, 2) NOT NULL -- Seuil minimal pour alerter le réapprovisionnement
);
----- 2. Table des Stocks des Ingrédients

CREATE TABLE stocks_ingredients (
    id SERIAL PRIMARY KEY,
    ingredient_id INT NOT NULL REFERENCES ingredients(id),
    quantite DECIMAL(10, 2) NOT NULL, -- Quantité de l'ingrédient
    is_approvisionnement BOOLEAN NOT NULL, -- True = Approvisionnement, False = Utilisation
    date_mouvement DATE NOT NULL, -- Date du mouvement
    employe_id INT NOT NULL REFERENCES employes(id) -- Employé ayant effectué l'opération
);
----- 3. Table des Recettes

CREATE TABLE recettes (
    id SERIAL PRIMARY KEY,
    produit_id INT NOT NULL REFERENCES produits(id),
    ingredient_id INT NOT NULL REFERENCES ingredients(id),
    quantite DECIMAL(10, 2) NOT NULL -- Quantité d'ingrédient nécessaire pour produire le produit
);
----- 4. Table des Produits

CREATE TABLE produits (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    type_id INT NOT NULL REFERENCES types_produits(id),
    prix DECIMAL(10, 2) NOT NULL -- Prix unitaire du produit
);
----- 5. Table des Types de Produits

CREATE TABLE types_produits (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL -- Nom du type de produit (e.g., Pain, Viennoiserie)
);
----- 6. Table de Production des Produits

CREATE TABLE production_produits (
    id SERIAL PRIMARY KEY,
    produit_id INT NOT NULL REFERENCES produits(id),
    quantite INT NOT NULL, -- Quantité produite
    date_production DATE NOT NULL, -- Date de la production
    employe_id INT NOT NULL REFERENCES employes(id) -- Employé ayant produit
);
----- 7. Table des Ventes

CREATE TABLE ventes (
    id SERIAL PRIMARY KEY,
    date_vente TIMESTAMP NOT NULL, -- Date et heure de la vente
    client_nom VARCHAR(100), -- Nom du client (facultatif)
    total DECIMAL(10, 2) NOT NULL, -- Montant total de la vente
    moyen_paiement VARCHAR(50) NOT NULL, -- Mode de paiement (e.g., Espèce, Carte)
    etat_recu BOOLEAN NOT NULL -- True = Reçu généré, False = Non généré
);
----- 8. Table des Détails de Ventes

CREATE TABLE ventes_details (
    id SERIAL PRIMARY KEY,
    vente_id INT NOT NULL REFERENCES ventes(id),
    produit_id INT NOT NULL REFERENCES produits(id),
    quantite INT NOT NULL, -- Quantité vendue
    prix_unitaire DECIMAL(10, 2) NOT NULL, -- Prix unitaire du produit
    sous_total DECIMAL(10, 2) NOT NULL -- Sous-total (quantité * prix_unitaire)
);
----- 9. Table des Employés

CREATE TABLE employes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL, -- Nom de l'employé
    poste VARCHAR(50) NOT NULL -- Poste ou rôle de l'employé (e.g., Boulanger, Vendeur)
);