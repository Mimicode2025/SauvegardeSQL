CREATE DATABASE GestionVols;
/*1) creation des table et insertion des données*/
CREATE TABLE `Avion` ( 
`NA` int NOT NULL AUTO_INCREMENT,
`nom` text(12) ,
 `Capaite` int, 
 `Localite` text(10),
 PRIMARY KEY (`NA`)
 ); 
 
CREATE TABLE `Pilote` ( 
`NP` int NOT NULL AUTO_INCREMENT,
`Nom` text(25) ,
`Adresse` text(10),
PRIMARY KEY (`NP`)
 ); 

CREATE TABLE `Pilote` ( 
`NP` int NOT NULL AUTO_INCREMENT,
`Nom` text(25) ,
`Adresse` text(10),
PRIMARY KEY (`NP`)
 ); 

CREATE TABLE `Vol` ( 
`NV` varchar(6) NOT NULL,
`NP` int NOT NULL,
`NA` int NOT NULL,
`VD` text(10) ,
`VA` text(10) ,
`HD` int,
`HA` int,
PRIMARY KEY (`NV`),
Constraint fk_NP FOREIGN key (NP) references Pilote(NP),
Constraint fk_NA FOREIGN key (NA) references Avion(NA)
 ); 
 
 INSERT INTO Avion (NA, nom, Capaite, Localite) VALUES
 (100, 'AIRBUS', 300, 'LOME'),
 (101, 'B737', 250, 'NIAMTOUGOU'),
 (102, 'B767', 250, 'PARIS'),
 (103, 'B777', 120, 'PARIS'),
 (104, 'B737', 220, 'LOME');
 
 INSERT INTO Pilote (NP, Nom, Adresse) VALUES
 (001, 'RICHARD', 'LOME' ),
 (002, 'HASSAN', 'LOME'),
 (003, 'AHMED', 'DAKAR'),
 (004, 'ANANE', 'LONDRE');
 
 INSERT INTO Vol (NV, NP, NA, VD, VA, HD, HA) VALUES 
 ('TG100', 001, 100, 'LOME', 'LONDRE', 9 , 15),
 ('TG104', 002, 101, 'ACCRA', 'PARIS', 10, 13),
 ('TG109', 003, 102, 'COTONOU', 'AMERIQUE', 11, 19),
 ('TG306', 004, 103, 'LAGOS', 'QUEBEC', 10, 15);
 
 /*2) Les avion de capacite 250 et localité paris*/
 SELECT *
 FROM Avion 
 Where capaite = 250 and Localite = 'PARIS'; 
 
 /*3) les avion par odre croissant par le nom*/
 SELECT *
 FROM Avion
 ORDER BY nom ASC;
 
 /*4) nom et capacité des avions dont le nom du pilote est RICHARD*/
 SELECT a.nom, a.capaite
 FROM avion a JOIN vol v on a.Na = v.NA
 JOIN pilote p on v.NP = p.NP 
 where p.Nom = 'RICHARD';
 
 
 /*5)localisation des avion qui une vole de destination sur LONDRE*/
 SELECT DISTINCT a.Localite 
 FROM Avion a JOIN Vol v ON a.NA = v.NA 
 WHERE v.VA = 'LONDRE';
 
 /*6)les avions dont la localités est lome ou Niamtougou*/
 SELECT *
 FROM avion 
 where localite = 'LOME' OR localite = 'NIAMTOUGOU';
 
/*7) Modifier la capaciter de l'avion 101 a une capacité = 220*/
UPDATE avion 
SET Capacite = 220 
WHERE NA = 101;

/*8)supprimer les avion dont la capacite < 200*/
DELETE FROM avion 
WHERE capaite < 200;

/*9)afficher la capacité max, min, moy des avions*/
SELECT max(capaite) as capacité_maximal , min(capaite) as capacité_miminal , avg(capaite) as capacité_moyenne 
from avion 

/*10)afficher les avion dont la capacité est la plus basse*/
SELECT *
FROM Avion
WHERE Capaite = (SELECT MIN(Capaite) FROM Avion);
/*ou*/
SELECT *
FROM avion
ORDER BY capaite ASC 
LIMIT 1;

/*11)afficher les avion dont la capacite est superieur a la capacite moyen*/
SELECT * 
FROM avion 
where capaite > (select avg(capaite) from avion);

/*12)le nom et l'adresse des pilode du vols TG100 et du vol TG104*/
SELECT p.nom, p.adresse 
FROM Pilote p 
JOIN Vol v ON p.NP = v.NP 
WHERE v.NV IN ('TG100', 'TG104'); 

/*13)le numero les numero des pilote  qui on piloté dans la periode
"01-01-2023 et 31-12-20-23"*/
SELECT p.NP 
FROM pilote p JOIN vol v on p.NP = v.NP 
WHERE v.date BETWEEN '01-01-2023' and '31-12-2023';
 
/*14) le noms des pilote qui conduise AIRBUS*/
SELECT p.nom
FROM pilote p JOIN Avion a join vol v 
on p.NP = v.NP and a.NA = v.NA
where a.nom = 'AIRBUS';