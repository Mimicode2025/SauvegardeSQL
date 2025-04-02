/*création de la dase de donnée*/
CREATE Database gs_etude;
/*creation de la table etudiant*/
CREATE TABLE Etudiant (
	matricule int NOT NULL auto_increment,
	nom varchar(30),
	prenom varchar(30),
	sexe char(1),
	nationalité varchar(20),
	PRIMARY KEY (matricule)
);

/*insertion des donnés ds laes tables*/
INSERT INTO Etudiant (matricule, nom, prenom, sexe, nationalité) VALUES 
(1, TRAORE , mimi, F, togolaise ),
(2, SOKPO , Peletia, F, togolaise),
(3, DOGBE , jean-claude, M, togolais),
(4, ALEDJI, Mathias, M , togolais),
(5, THABOBJO, jamil, M, togolais);