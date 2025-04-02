/*creation de la table client*/
CREATE TABLE `client`(
    `idcl` int NOT NULL AUTO_INCREMENT,
    `nomcl` varchar(50) NOT NULL,
    `prenomcl` varchar(100) NOT NULL,
    PRIMARY KEY (`idcl`)
);
/*creation de la table produit*/
CREATE TABLE `produits`(
    `idpt` int NOT NULL AUTO_INCREMENT,
    `nompt` varchar(50) NOT NULL,
    `pu` int between 1 and 100000 
);
/*cration de la table produits*/
CREATE TABLE `produits`(
    `idpt` int primary key,
    `nompt` varchar(50) NOT NULL,
    `pu` int, CHECK ( pu BETWEEN 1 and  100000) 
);
/*pour inserer des ligne*/
alter table produits
    add column pu integer 

/*pour cree des colonne*/
INSERT INTO `client` (`idcl`, `nomcl`, `prenomcl`) VALUES
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
/*Ajouter des produit*/
INSERT INTO `produit`(`idpt`, `nompt`, `pu`) VALUES
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

/*Recette pour cree une table avec 2 cles primaire*/
CREATE TABLE `commander`(
    `idpt` int not null,
    `idcl` int not null,
    `quantite` int ,
    CONSTRAINT fk_client_idcl FOREIGN key (idcl) references client(idcl),
    CONSTRAINT fk_produit_idpt FOREIGN key (idpt)references produit(idpt),
    PRIMARY key (`idpt`,`idcl`)
);
/*LISTER TOUS LES CLIENT*/
select *
From client;

/*liste des client dont le nom est ##### */
select *
From client
where nomcl = "####";

/*liste des client dont le nom et le prenom est ####*/
select nomcl , prenomcl
From client
where nomcl = "####";

/*pour ranger par ordre acendant et descendant*/
/*acendant*/
select nomcl , prenomcl
From client
order by nomcl ASC;

/*decendant*/
select nomcl , prenomcl
From client
order by nomcl DESC;

/*afficler les nom doublon*/
select DISTINCT nomcl
from client;

/*liste des produit dont le pu est compris entre 5000 et 500000*/
select *
from produit
where pu between 5000 AND 500000;
/*ou*/
select *
from produit
where pu >= 5000 AND pu <= 500000;

/*afficher la liste des produits dont le pu est 5000,10000,350,500*/
select*
from produit
where pu in (5000,10000,35000,500);

/*liste des produit dont le nom contient la lettre a ou A*/
select*
from produit
where nompt like '%a%' or nompt like '%A%';/*appartient*/
where nompt like 'a%' or nompt like 'A%';/*commence*/
where nompt like '%a' or nompt like '%A';/*termine*/

/*jointure entre client et commande*/
select client.*, commander.*
from client,commander

/*on peut cree des aliace ou abreviayion pour facilliter eciture*/
select cl.*, cd.*
from cl.client,cd.commander

/*afficher les client(jointure)*/
select cl.*, cd.*
from client cl,commander cd
where cl.idcl = cd.idpt

/*inserer les dans*/
INSERT INTO `commander` (`idcl`, `idpt`, `quantite`) VALUES
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
/*Afficher le nom des client et le produit commender*/
select cl.*, cd.*, pt.*
from client cl,commander cd, produit pt
where cl.idcl = cl.idcl
    and cd.idpt = pt.idpt;

/*Afficher le nom du client la quantiter et le nom du produit */
select cl.nomcl, cd.quantite, pt.nompt
from client cl,commander cd, produit pt
where cl.idcl = cl.idcl
    and cd.idpt = pt.idpt;

/*Afficher la jointure entre produit et commande*/
select pt.*,cd.*
from produit pt, commander cd
where pt.idpt = cd.idpt

/*Afficher le nom le prenom la quantite de la commande*/
select cl.nomcl, cl.prenomcl, cd.quantite, pt.nompt
from client cl, commander cd, produit pt
where cl.idcl = cd.idcl and cd.idpt = pt.idpt 

/*imbrication de select pour chercher le nom des client qui on commander ayant un mm id*/
select nomcl
from client
where idcl in ( select idcl from commander);

/*Afficher les client qui on le mm nom (auto jointure)*/
select cl1.nomcl,cl2.nomcl cl1.prenomcl, cl2.prenomcl
from client cl1, client cl2
where cl1.nomcl = cl2.nomcl;

/*Affichage des client le mm nom et prenom(auta jointure)a modifier*/
select cl1.nomcl, cl1.prenomcl, cl2.prenomcl
from client cl1, client cl2
where cl1.nomcl = cl2.nomcl and cl1.prenomcl = cl2.prenomcl;

/*jointure avec le mot cle cross join*/
select cl.*, cd.*
from client cl CROSS JOIN commander cd;

/*jointure avec le mot cle naturale join*/
select cl.*, cd.*
from client cl NATURAL JOIN commander cd;

/*jointure avec le mot cle natural join de facon directe
en presisant atribut dans lequel se baser*/
select cl.*, cd.*
from client cl 
JOIN commander cd using (idcl)
JOIN produit pt using (idpt);

/*mm chose mais avec une projection*/
select cl.nomcl, cl.prenomcl, pt.nompt, pt.pu
from client cl 
JOIN commander cd using (idcl)
JOIN produit pt using (idpt);

/*jointure avec le mot cle join on elle est utiliser per des table ayant 
des nom different . (c'est pour afficher le nom et les produit commander)*/
select cl.nomcl, cl.prenomcl, pt.nompt, pt.pu
from client cl 
JOIN commander cd on(cl.idcl = cd.idcl)--- chercher client ayant fait des commande
JOIN produit pt on (cd.idpt  = pt.idpt);--- chercher chaque commande de produit 

/*ecrire le MLD (modelle relationelle)*/
Region(codeReg,nomreg)
Prefecture(codePref,nomPref,#codeReg)
Commune(codeCom,nomCom,#codePref)
Canton(codeCant,nomCant,#codeCom)
Village(codeVil,nomVil,#codeCant)
quartier(codeQuar,nomQuar,#codeVil)
Localiter(codeLoc,nomLoc,#codeQuar)

/*creation de table*/
---pour Region
CREATE TABLE `Region`(
    `codeReg` int NOT NULL AUTO_INCREMENT,
    `nomReg` varchar(50) NOT NULL, 
    primary key (`codeReg`)
);
---pour prefecture
CREATE TABLE `Prefecture`(
    `codePref` int NOT NULL AUTO_INCREMENT,
    `nomPref` varchar(50) NOT NULL,
    `codeReg` int,
    primary key (`codePref`),
    constraint fk_CodeReg FOREIGN key (CodeReg) references Region(codeReg)
);
---pour Commune
CREATE TABLE `Commune`(
    `codeCom` int not null AUTO_INCREMENT,
    `nomCom` varchar(50) not null,
    `codePref` int,
    primary key(`codeCom`),
    CONSTRAINT fk_codePref FOREIGN key (codePref) references Prefecture(codePref)
);
---pour Canton
CREATE TABLE `Canton`(
    `codeCant` int not null AUTO_INCREMENT,
    `nomCant` varchar(50) not null,
    `codeCom` int,
    primary key(`codeCant`),
    CONSTRAINT fk_codeCom FOREIGN key (codeCom) references Commune(codeCom)
);
---pour Village
CREATE TABLE `village`(
    `codeVil` int not null AUTO_INCREMENT,
    `nomVil` varchar(50) not null,
    `codeCant` int,
    primary key(`codeVil`),
    CONSTRAINT fk_codeCant FOREIGN key (codeCant) references Canton(codeCant)
);
---pour Quartier
CREATE TABLE `Quartier`(
    `codeQuar` int not null AUTO_INCREMENT,
    `nomQuar` varchar(50) not null,
    `codeVil` int,
    primary key(`codeQuar`),
    CONSTRAINT fk_codeVil FOREIGN key (codeVil) references village(codeVil)
);
---locliter
CREATE TABLE `Locliter`(
    `codeLoc` int not null AUTO_INCREMENT,
    `nomLoc` varchar(50) not null,
    `codeLoc` int,
    primary key(`codeLoc`),
    CONSTRAINT fk_codeQuar FOREIGN key (codeQuar) references quartier(codeQuar);
);

/*Insertion de donner*/
---pour Region
INSERT INTO `region` (`codeReg`, `nomReg`) VALUES
('1', 'maritime'),
('2', 'plateaux'),
('3', 'centrale'),
('4', 'kara'),
('5', 'savane');
---pour prefecture
INSERT INTO `prefecture` (`codePref`, `nomPref`) VALUES
('1', 'Bassar'),
('2', 'Assoli'),
('3', 'Bassars'),
('4', 'Tchaoudjo'),
('5', 'kozah');
---pour canton
INSERT INTO `canton` (`codeCant`, `nomCant`) VALUES
('1', 'lacs'),
('2', 'Avé'),
('3', 'Haho'),
('4', 'Wawa'),
('5', 'Sotouboua');
---pour commune
INSERT INTO `commune` (`codeCom`, `nomCom`) VALUES
('1', 'Lomé'),
('2', 'sokodé'),
('3', 'Kara'),
('4', 'Kpalimé'),
('5', 'Bassars');
---pour quartier
INSERT INTO `Quartier` (`codeQuar`, `nomQuar`) VALUES
('1', 'forever'),
('2', 'Noukafou'),
('3', 'hedjranawoe'),
('4', 'Adewi'),
('5', 'bé');
---pour localiter
INSERT INTO `locliter` (`codeLoc`, `nomLoc`) VALUES
('1', 'kara'),
('2', 'Dapaond'),
('3', 'kegué'),
('4', 'Tchaoudjo'),
('5', 'kozah');
---pour village
INSERT INTO `village` (`codeVil`, `nomVil`) VALUES
('1', 'Nadoba'),
('2', 'Malfakasa'),
('3', 'Keve'),
('4', 'Kanté'),
('5', 'fazao');
/*Insertion de prefecture */
INSERT INTO Prefecture (codepref, nompref, codereg) VALUES
    (1, 'Blitta', 1),
    (2, 'Mô', 1),
    (3, 'Sotouboua', 1),
    (4, 'Tchamba', 1),
    (5, 'Tchaoudjo', 1),
    (6, 'Assoli', 2),
    (7, 'Bassar', 2),
    (8, 'Binah', 2),
    (9, 'Dankpen', 2),
    (10, 'Doufelgou', 2),
    (11, 'Keran', 2),
    (12, 'Kozah', 2),
    (13, 'Agoe-Nyive', 3),
    (14, 'Ave', 3),
    (15, 'Bas-Mono', 3),
    (16, 'Golfe', 3),
    (17, 'Lacs', 3),
    (18, 'Vo', 3),
    (19, 'Yoto', 3),
    (20, 'Zio', 3),
    (21, 'Agou', 4),
    (22, 'Akebou', 4),
    (23, 'Amou', 4),
    (24, 'Anie', 4),
    (25, 'Danyi', 4),
    (26, 'Est-Mono', 4),
    (27, 'Haho', 4),
    (28, 'Kloto', 4),
    (29, 'Kpele', 4),
    (30, 'Moyen-Mono', 4),
    (31, 'Ogou', 4),
    (32, 'Wawa', 4),
    (33, 'Cinkasse', 5),
    (34, 'Kpendjal', 5),
    (35, 'Kpendjal Ouest', 5),
    (36, 'Oti', 5),
    (37, 'Oti Sud', 5),
    (38, 'Tandjouare', 5),
    (39, 'Tone', 5);
/*Insertion de Commune*/
INSERT INTO Commune (codecom, nomcom, codepref) VALUES
    (1, 'Blitta 1', 1),
    (2, 'Blitta 2', 1),
    (3, 'Blitta 3', 1),
    (4, 'Mô 1', 2),
    (5, 'Mô 2', 2),
    (6, 'Sotouboua 1', 3),
    (7, 'Sotouboua 2', 3),
    (8, 'Sotouboua 3', 3),
    (9, 'Tchamba 1', 4),
    (10, 'Tchamba 2', 4),
    (11, 'Tchamba 3', 4),
    (12, 'Tchaoudjo 1', 5),
    (13, 'Tchaoudjo 2', 5),
    (14, 'Tchaoudjo 3', 5),
    (15, 'Tchaoudjo 4', 5),
    (16, 'Assoli 1', 6),
    (17, 'Assoli 2', 6),
    (18, 'Assoli 3', 6),
    (19, 'Bassar 1', 7),
    (20, 'Bassar 2', 7),
    (21, 'Bassar 3', 7),
    (22, 'Bassar 4', 7),
    (23, 'Binah 1', 8),
    (24, 'Binah 2', 8),
    (25, 'Dankpen 1', 9),
    (26, 'Dankpen 2', 9),
    (27, 'Dankpen 3', 9),
    (28, 'Doufelgou 1', 10),
    (29, 'Doufelgou 2', 10),
    (30, 'Doufelgou 3', 10),
    (31, 'Keran 1', 11),
    (32, 'Keran 2', 11),
    (33, 'Keran 3', 11),
    (34, 'Kozah 1', 12),
    (35, 'Kozah 2', 12),
    (36, 'Kozah 3', 12),
    (37, 'Kozah 4', 12),
    (38, 'Agoe-Nyive 1', 13),
    (39, 'Agoe-Nyive 2', 13),
    (40, 'Agoe-Nyive 3', 13),
    (41, 'Agoe-Nyive 4', 13),
    (42, 'Agoe-Nyive 5', 13),
    (43, 'Agoe-Nyive 6', 13),
    (44, 'Ave 1', 14),
    (45, 'Ave 2', 14),
    (46, 'Bas-Mono 1', 15),
    (47, 'Bas-Mono 2', 15),
    (48, 'Golfe 1 (BE EST)', 16),
    (49, 'Golfe 2 (BE CENTRE)', 16),
    (50, 'Golfe 3 (BE OUEST)', 16),
    (51, 'Golfe 4', 16),
    (52, 'Golfe 5', 16),
    (53, 'Golfe 6', 16),
    (54, 'Golfe 7', 16),
    (55, 'Lacs 1', 17),
    (56, 'Lacs 2', 17),
    (57, 'Lacs 3', 17),
    (58, 'Lacs 4', 17),
    (59, 'Vo 1', 18),
    (60, 'Vo 2', 18),
    (61, 'Vo 3', 18),
    (62, 'Vo 4', 18),
    (63, 'Yoto 1', 19),
    (64, 'Yoto 2', 19),
    (65, 'Yoto 3', 19),
    (66, 'Zio 1', 20),
    (67, 'Zio 2', 20),
    (68, 'Zio 3', 20),
    (69, 'Zio 4', 20),
    (70, 'Agou 1', 21),
    (71, 'Agou 2', 21),
    (72, 'Akebou 1', 22),
    (73, 'Akebou 2', 22),
    (74, 'Amou 1', 23),
    (75, 'Amou 2', 23),
    (76, 'Amou 3', 23),
    (77, 'Anie 1', 24),
    (78, 'Anie 2', 24),
    (79, 'Danyi 1', 25),
    (80, 'Danyi 2', 25),
    (81, 'Est-Mono 1', 26),
    (82, 'Est-Mono 2', 26),
    (83, 'Est-Mono 3', 26),
    (84, 'Haho 1', 27),
    (85, 'Haho 2', 27),
    (86, 'Haho 3', 27),
    (87, 'Haho 4', 27),
    (88, 'Kloto 1', 28),
    (89, 'Kloto 2', 28),
    (90, 'Kloto 3', 28),
    (91, 'Kpele 1', 29),
    (92, 'Kpele 2', 29),
    (93, 'Moyen-Mono 1', 30),
    (94, 'Moyen-Mono 2', 30),
    (95, 'Ogou 1', 31),
    (96, 'Ogou 2', 31),
    (97, 'Ogou 3', 31),
    (98, 'Ogou 4', 31),
    (99, 'Wawa 1', 32),
    (100, 'Wawa 2', 32),
    (101, 'Wawa 3', 32),
    (102, 'Cinkasse 1', 33),
    (103, 'Cinkasse 2', 33),
    (104, 'Kpendjal 1', 34),
    (105, 'Kpendjal 2', 34),
    (106, 'Kpendjal Ouest 1', 35),
    (107, 'Kpendjal Ouest 2', 35),
    (108, 'Oti 1', 36),
    (109, 'Oti 2', 36),
    (110, 'Oti Sud 1', 37),
    (111, 'Oti Sud 2', 37),
    (112, 'Tandjouare 1', 38),
    (113, 'Tandjouare 2', 38),
    (114, 'Tone 1', 39),
    (115, 'Tone 2', 39),
    (116, 'Tone 3', 39);

/*Inserer canton */
INSERT INTO Canton (codeCant, nomCant, codePref) VALUES
     (1, 'AGOE-NYIVE', 1),
     (2, 'AGOE-NYIVE', 2),
     (3, 'AGOE-NYIVE', 3),
     (4, 'AGOE-NYIVE', 4),
     (5, 'AGOE-NYIVE', 5),
     (6, 'AGOE-NYIVE', 6),
     (7, 'AGOE-NYIVE', 7),
     (8, 'AGOE-NYIVE', 8),
     (9, 'AGOE-NYIVE', 9),
     (10, 'AGOE-NYIVE', 10),
     (11, 'AGOE-NYIVE', 11),
     (12, 'AGOE-NYIVE', 12),
     (13, 'AGOE-NYIVE', 13),
     (14, 'AGOE-NYIVE', 14),
     (15, 'AGOE-NYIVE', 15),
     (16, 'AGOE-NYIVE', 16),
     (17, 'LEGBASSITO', 17),
     (18, 'LEGBASSITO', 18),
     (19, 'LEGBASSITO', 19),
     (20, 'LEGBASSITO', 20),
     (21, 'LEGBASSITO', 21),
     (22, 'LEGBASSITO', 22),
     (23, 'VAKPOSSITO', 23),
     (24, 'TOGBLE', 24),
     (25, 'TOGBLE', 25),
     (26, 'TOGBLE', 26),
     (27, 'TOGBLE', 27),
     (28, 'TOGBLE', 28),
     (29, 'TOGBLE', 29),
     (30, 'TOGBLE', 30),
     (31, 'TOGBLE', 31),
     (32, 'TOGBLE', 32),
     (33, 'ZANGUERA', 33),
     (34, 'ZANGUERA', 34),
     (35, 'ZANGUERA', 35),
     (36, 'ZANGUERA', 36),
     (37, 'ZANGUERA', 37),
     (38, 'ZANGUERA', 38),
     (39, 'ZANGUERA', 39),
     (40, 'ZANGUERA', 40),
     (41, 'ZANGUERA', 41),
     (42, 'ADETIKOPE', 42),
     (43, 'ADETIKOPE', 43),
     (44, 'ADETIKOPE', 44),
     (45, 'ADETIKOPE', 45),
     (46, 'ADETIKOPE', 46),
     (47, 'ADETIKOPE', 47),
     (48, 'AGOU-ATIGBE', 48),
     (49, 'AGOU-ATIGBE', 49),
     (50, 'AGOU-ATIGBE', 50),
     (51, 'AGOU-IBOE', 51),
     (52, 'AGOU-IBOE', 52),
     (53, 'AGOU-IBOE', 53),
     (54, 'AGOU-IBOE', 54),
     (55, 'AGOU-KEBO', 55),
     (56, 'AGOU-KEBO', 56),
     (57, 'AGOU-KEBO', 57),
     (58, 'AGOU-KEBO', 58),
     (59, 'AGOU-KEBO', 59),
     (60, 'AGOU-KEBO', 60),
     (61, 'AGOU-NYOGBE-NORD', 61),
     (62, 'AGOU-NYOGBE-NORD', 62),
     (63, 'AGOU-NYOGBE-NORD', 63),
     (64, 'AGOU-NYOGBE-SUD', 64),
     (65, 'AGOU-NYOGBE-SUD', 65),
     (66, 'AGOU-NYOGBE-SUD', 66),
     (67, 'AGOU-TAVIE', 67),
     (68, 'AGOU-TAVIE', 68),
     (69, 'AGOU-TAVIE', 69),
     (70, 'AGOU-TAVIE', 70),
     (71, 'ASSAHOUN_FIAGBE', 71),
     (72, 'ASSAHOUN-FIAGBE', 72),
     (73, 'ASSAHOUN-FIAGBE', 73),
     (73, 'ASSAHOUN-FIAGBE', 73),
     (74, 'GADJA', 74),
     (75, 'GADJA', 74),
     (76, 'GADJA', 74),
     (77, 'GADJA', 74),
     (78, 'GADJA', 74),
     (79, 'GADJA', 74),
     (80, 'GADJA', 74),
     (81, 'GADJA', 81),
     (82, 'GADJA', 82),
     (83, 'GADJA', 83),
     (84, 'GADJA', 84),
     (85, 'GADJA', 85),
     (86, 'GADJA', 86),
     (87, 'GADJA', 87),
     (88, 'GADJA', 88),
     (89, 'GADJA', 89),
     (90, 'GADJA', 90),
     (91, 'GADJA', 91),
     (92, 'GADJA', 92),
     (93, 'GADJA', 93),
     (94, 'GADJA', 94),
     (95, 'GADJA', 95),

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
select sum(qte) as 'Somme'
from commander
--association
select count(*) as 'Total: ',
    min(qte) as 'Minimum: ',
    max(qte) as 'Maximum', 
    avg(qte) as 'Moyenne:',
    sum(qte) as 'Somme: '
from commander
/*nbre de produit commander par client*/
select cl.nomcl,count(cd.idpt) as 'nombre de produit'
from Commander cd, client cl
where cl idcl = cd.idcl
Group by cd.idpt;
/*ou*/
select cl.nomcl,count(cd.idpt) as 'nombre de produit' 
from Commander cd, client cl 
where cl.idcl = cd.idcl
Group by cd.idpt;
/*ou*/
from commander cd 
join client cl on (cl.idclm = cd.idcl);
/* la listes des produit dont le prix unitaire est inferieur a la moyenne se Pu*/
SELECT nomprod, Pu ,Avg(pu) 
From produit 
Having Pu < Avg(pu);
---(ou) avec Where
SELECT nomprod, Pu ,Avg(pu) 
From produit 
where Pu < Avg(pu);
---(ou)
SELECT nomprod, pu, avg(Pu)
From Produit 
where pu < (SELECT avg(Pu)
            From Produit);
/*Quantitee commander sur chaque produit */
SELECT p.nomprod, p.idprod, c.qte 
from produit p ,commander c
where p.idprod = c.idprod and c.qte >= All(select max(qte) from commander)
/**/
SELECT p.nomprod, p.idprod, c.qte 
from produit p ,commander c
where p.idprod = c.idprod and c.qte >= ANY(select qte from commander)

