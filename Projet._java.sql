/*création de la base*/
CREATE database gestion_salle_sport;
/*Création de la table abonne*/
CREATE TABLE abonne (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(60) NOT NULL,
    prenom VARCHAR(60) NOT NULL,
    date_inscription DATE NOT NULL,
    numero_telephone VARCHAR(8) NOT NULL,
    statut_souscription BOOLEAN DEFAULT FALSE
);
/*création de la table abonnement*/
CREATE TABLE abonnement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(250) NOT NULL,
    duree_mois float NOT NULL,
    prix_mensuel float NOT NULL
);
/*creation de la table souscription*/
CREATE TABLE souscription (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_abonne INT NOT NULL,
    id_abonnement INT NOT NULL,
    date_debut DATE NOT NULL,
    FOREIGN KEY (id_abonne) REFERENCES abonne(id) ON DELETE CASCADE,
    FOREIGN KEY (id_abonnement) REFERENCES abonnement(id) ON DELETE CASCADE
);
/*requete*/
INSERT INTO Abonnement (id, libelle, duree_mois, prix_mensuel) value (?, ?, ?, ?);
SELECT * FROM Abonnement where id = ?;
SELECT * FROM Abonnement ;
UPDATE Abonnement SET libelle = ?, duree_mois = ?, prix_mensuel wkere id = ?;
DELETE FROM Abonnement WHERE id = ?;
/*pou*/
/*cretion de la table admistateur*/
CREATE TABLE Admistrateur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);


-- Insertion de l'utilisateur admin
INSERT INTO Admistrateur (username, password) VALUES ('admin', '1234');

/*Pour selectionner le nombre abonné*/
SELECT Count(id) AS nombreTotal FROM Abonne WHERE statut_souscription = 1;
/*Pour le chiffre affaire */
SELECT somme(prix_mensuel) FROM souscription sco JOIN Abonnement ab  ON (sco.id_abonnement = ab.id) JOIN Abonne a ON (sco.id_abonne = a.id) WHERE statut_souscription = 1;
