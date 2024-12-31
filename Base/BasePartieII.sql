----- 9. Table des Employés Modifier

CREATE TABLE employes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL, -- Nom de l'employé
    poste VARCHAR(50) NOT NULL, -- Poste ou rôle de l'employé (e.g., Boulanger, Vendeur)
    salaire DECIMAL NOT NULL
);

----- 10. Table des Primes
CREATE TABLE primes (
    id SERIAL PRIMARY KEY,
    motif_id INT NOT NULL REFERENCES motif_prime(id),
    employe_id INT NOT NULL REFERENCES employes(id),
    solde DECIMAL NOT NULL
);

----- 11. Table motif prime
CREATE TABLE motif_prime (
    id SERIAL PRIMARY KEY,
    motif VARCHAR(250)
);

----- 12. Table augmentation
CREATE TABLE augmentation (

);