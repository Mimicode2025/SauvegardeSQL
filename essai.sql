create Database GestioVente;

create table Clients(
    idcl int not null AUTO_INCREMENT,
    nomcl varchar(50) NOT NULL,
    prenomcl varchar(100) NOT NULL,
    PRIMARY KEY(idcl)
)

create table Produit(
    idprod int not null AUTO_INCREMENT,
    nomprod varchar(50) NOT NULL,
    PRIMARY KEY(idprod)
)

/odifier la table produit pour ajouter un nouvel attribut/
Alter table Produit
    add colum pu interger

/Table Produits/
CREATE TABLE Produits (
    idpt INT PRIMARY KEY,
    nomprod VARCHAR(50) NOT NULL,
    pu INT CHECK (pu BETWEEN 1 AND 100000)
);

/Ajouter des 10 lignes à Clients/
INSERT INTO clients(idcl, nomcl, prenomcl) VALUES
('1', 'AMOU', 'Prince'),
('2', 'DEGBE', 'Boule'),
('3', 'EKLOU', 'Godwin'),
('4', 'GNANSA', 'Afat'),
('5', 'TRAORE', 'Mimi'),
('6', 'HODONOU', 'Lucie'),
('7', 'TCHABODJO', 'Jamil'),
('8', 'KOSSI', 'Abel'),
('9', 'KAO', 'Alexandre'),
('10', 'WILSON', 'Jean');

/Ajouter ds lignes au prosuit/
INSERT INTO produit(idprod, nomprod, pu) VALUES
('1', 'Ordinateur', '5000'),
('2', 'Clavier', '2000'),
('3', 'Ecran', '120000'),
('4', 'Unite cantrale', '12005'),
('5', 'Souris', '1000'),
('6', 'Voiture', '25000000'),
('7', 'Moto', '234000000'),
('8', 'VELO', '35000'),
('9', 'AVION', '200000000000'),
('10', 'Montre', '350000');

--Inserer des données dans la table commander
INSERT INTO commander(idcl, idprod, qte) VALUES
('1', '4', '5'),
('2', '3', '2'),
('3', '5', '12'),
('4', '9', '15'),
('5', '10', '1'),
('6', '7', '10'),
('7', '2', '23'),
('8', '1', '3'),
('9', '8', '2'),
('10', '3', '35');

/Table Commander/
CREATE TABLE Commander(
    idcl INT not null,
    idprod INT not null,
    qte INT,
    Constraint fk_clients_idcl FOREIGN KEY (idcl) REFERENCES clients(idcl),
    Constraint fk_produit_idprod FOREIGN KEY (idprod) REFERENCES produit(idprod),
    PRIMARY KEY(idcl, idprod)
);

/LES OPERATIONS DE TRIES/
/Ranger dans l'ordre croissant/
SELECT nomcl, prenomcl 
FROM clients 
order by nomcl ASC;

/Ordre decroissant/
SELECT nomcl, prenomcl 
FROM clients 
order by nomcl DESC;

/Afficher les noms de clients sans doublon/
SELECT DISTINCT nomcl
from clients;

/Liste des produits dont le pu est compris entre 5000 et 500.000/
/Première manière/
SELECT*
from produit
where pu BETWEEN 5000 and 500000;
/Deuxième manière/
SELECT*
from produit
where pu>=5000 and pu<=500000;

/LISTE des produits dont le pu est 5000, 35000, 120000, 2000/
SELECT*
from produit
where pu in(5000, 35000, 120000, 2000);

/liste des produits dont le nom contient la lette a ou A/
SELECT*
from produit
where nomprod like '%a%' or nomprod like '%A%';--contenant par a ou A
where nomprod like 'a%' or nomprod like 'A%' --commençant par a ou A
where nomprod like '%a' or nomprod like '%A' -- se terminant par a ou A

--Jointure de la table client et la table commander--
SELECT clients.* , commander.*
from clients, commander;

--Jointure avec equivalence
SELECT cl., cd.
from clients cl, commander cd 
where cl.idcl = cd.idcl;

--Jointure
SELECT cl., cd.
from clients cl, commander cd 
where cl.idcl = cd.idprod;

--Afficher le nom des clients et des produits
select cl., cd., pt.*
from clients cl, commander cd, produit pt 
Where cl.idcl= cd.idcl and cd.idprod=pt.idprod;
----------
select cl.nomcl, cd.qte, pt.nomprod
from clients cl, commander cd, produit pt 
Where cl.idcl= cd.idcl and cd.idprod=pt.idprod;
--------
create Database GestioVente;

create table Clients(
    idcl int not null AUTO_INCREMENT,
    nomcl varchar(50) NOT NULL,
    prenomcl varchar(100) NOT NULL,
    PRIMARY KEY(idcl)
)

create table Produit(
    idprod int not null AUTO_INCREMENT,
    nomprod varchar(50) NOT NULL,
    PRIMARY KEY(idprod)
)

/odifier la table produit pour ajouter un nouvel attribut/
Alter table Produit
    add colum pu interger

/Table Produits/
CREATE TABLE Produits (
    idpt INT PRIMARY KEY,
    nomprod VARCHAR(50) NOT NULL,
    pu INT CHECK (pu BETWEEN 1 AND 100000)
);

/Ajouter des 10 lignes à Clients/
INSERT INTO clients(idcl, nomcl, prenomcl) VALUES
('1', 'AMOU', 'Prince'),
('2', 'DEGBE', 'Boule'),
('3', 'EKLOU', 'Godwin'),
('4', 'GNANSA', 'Afat'),
('5', 'TRAORE', 'Mimi'),
('6', 'HODONOU', 'Lucie'),
('7', 'TCHABODJO', 'Jamil'),
('8', 'KOSSI', 'Abel'),
('9', 'KAO', 'Alexandre'),
('10', 'WILSON', 'Jean');

/Ajouter ds lignes au prosuit/
INSERT INTO produit(idprod, nomprod, pu) VALUES
('1', 'Ordinateur', '5000'),
('2', 'Clavier', '2000'),
('3', 'Ecran', '120000'),
('4', 'Unite cantrale', '12005'),
('5', 'Souris', '1000'),
('6', 'Voiture', '25000000'),
('7', 'Moto', '234000000'),
('8', 'VELO', '35000'),
('9', 'AVION', '200000000000'),
('10', 'Montre', '350000');

--Inserer des données dans la table commander
INSERT INTO commander(idcl, idprod, qte) VALUES
('1', '4', '5'),
('2', '3', '2'),
('3', '5', '12'),
('4', '9', '15'),
('5', '10', '1'),
('6', '7', '10'),
('7', '2', '23'),
('8', '1', '3'),
('9', '8', '2'),
('10', '3', '35');

/*Table Commander*/
CREATE TABLE Commander(
    idcl INT not null,
    idprod INT not null,
    qte INT,
    Constraint fk_clients_idcl FOREIGN KEY (idcl) REFERENCES clients(idcl),
    Constraint fk_produit_idprod FOREIGN KEY (idprod) REFERENCES produit(idprod),
    PRIMARY KEY(idcl, idprod)
);

/LES OPERATIONS DE TRIES/
/Ranger dans l'ordre croissant/
SELECT nomcl, prenomcl 
FROM clients 
order by nomcl ASC;

/Ordre decroissant/
SELECT nomcl, prenomcl 
FROM clients 
order by nomcl DESC;

/Afficher les noms de clients sans doublon/
SELECT DISTINCT nomcl
from clients;

/Liste des produits dont le pu est compris entre 5000 et 500.000/
/Première manière/
SELECT*
from produit
where pu BETWEEN 5000 and 500000;
/Deuxième manière/
SELECT*
from produit
where pu>=5000 and pu<=500000;

/LISTE des produits dont le pu est 5000, 35000, 120000, 2000/
SELECT*
from produit
where pu in(5000, 35000, 120000, 2000);

/liste des produits dont le nom contient la lette a ou A/
SELECT*
from produit
where nomprod like '%a%' or nomprod like '%A%';--contenant par a ou A
where nomprod like 'a%' or nomprod like 'A%' --commençant par a ou A
where nomprod like '%a' or nomprod like '%A' -- se terminant par a ou A

--Jointure de la table client et la table commander--
SELECT clients.* , commander.*
from clients, commander;

--Jointure avec equivalence
SELECT cl., cd.
from clients cl, commander cd 
where cl.idcl = cd.idcl;

--Jointure
SELECT cl., cd.
from clients cl, commander cd 
where cl.idcl = cd.idprod;

--Afficher le nom des clients et des produits avec les id
select cl., cd., pt.*
from clients cl, commander cd, produit pt 
Where cl.idcl= cd.idcl and cd.idprod=pt.idprod;
----------Affichage de Nom, prenom, qte et nom produit
select cl.nomcl, cl.prenomcl, cd.qte, pt.nomprod
from clients cl, commander cd, produit pt 
Where cl.idcl= cd.idcl and cd.idprod=pt.idprod;
----------Affichege de Nom, prenom, qte, nom prod et prix
select cl.nomcl, cl.prenomcl, cd.qte, pt.nomprod, pt.pu
from clients cl, commander cd, produit pt 
Where cl.idcl= cd.idcl and cd.idprod=pt.idprod;

--Expression de jointure de manière procédurale
select nomcl 
from clients
where idcl in (select idcl from commander)
------
select cl.nomcl , cl.prenomcl
from clients cl
where cl.idcl in (
    select idcl from commander 
)

--Client ayant le même nom
select cl1.nomcl, cl1.prenomcl, cl2.prenomcl
from clients cl1, clients cl2
where cl1.nomcl=cl2.nomcl

-----Jointure SQL2
select cl., cd.
from clients cl CROSS JOIN commander cd
--
select cl., cd.
from clients cl NATURAL JOIN commander cd
-----
--Usage de Join Using
select cl., pt.
from clients cl 
join commander cd using(idcl)
join produit pt using(idprod)
---
select cl.nomcl,cl.prenomcl, pt.nomprod
from clients cl 
join commander cd using(idcl)
join produit pt using(idprod)
-----
select cl.nomcl,cl.prenomcl, pt.nomprod, pt.pu
from clients cl 
join commander cd using(idcl)
join produit pt using(idprod)

--Usage de Join On
--Nom et prix unitaire de produits commande
select cl.nomcl,cl.prenomcl, pt.nomprod, pt.pu
from clients cl 
join commander cd on(cl.idcl=cd.idcl)
join produit pt on(pt.idprod=cd.idprod)
-----
--Operations ensemblistes
----Union
select idcl from clients 
union 
select idcl from commander;
----intersection
select idcl from clients 
intersect  --commande à revoir
select idcl from commander;

---Fonction agrégat
--Count: donne le nombre de tuple
select COUNT(idcl)
from clients
--
select count(*) as 'Nombre de Client: '
from clients
--max: renvoi le maximum des commandes
select max(qte) as 'Maximum'
from commander
--min: renvoi le minimum des commandes
select min(qte) as 'Minimum'
from commander
--avg: calcul la moyenne
select avg(qte) as 'Moyenne'
from commander
--Sum: pour faire la somme
select sum(qte) as 'Moyenne'
from commander
--association
select count(*) as 'Total: ',
    min(qte) as 'Minimum: ',
    max(qte) as 'Maximum', 
    avg(qte) as 'Moyenne:',
    sum(qte) as 'Somme: '
from commander