/* 1) creation de base de donnes BANQUE*/
CREATE DATABASE BANQUE;
/* a)creation de la table AGENCE */
CREATE TABLE `AGENCE`(
    `NumAgence` varchar(8),
    `Nom` varchar(50),
    `Ville` varchar(25),
    `Actif`int(13) not null,
    PRIMARY KEY( `NumAgence`)
);
/* b)creation de la table client */
CREATE TABLE `CLIENT`(
    `NumClient` varchar(8),
    `Nom` varchar(25),
    `Prenom` varchar(25),
    `Ville` varchar(25),
    PRIMARY KEY (`NumClient`)
);
/* c)creation de la table compte */
CREATE TABLE `COMPTE`(
    `NumCompte` varchar(11),
    `Solde` int(13) not null,
    `NumAgence` varchar(8),
    `NumClient` varchar(8),
    PRIMARY KEY (`NumCompte`),
    Constraint FK_NumAgence FOREIGN key (NumAgence) references AGENCE(NumAgence),
    Constraint FK_NumClient FOREIGN key (NumClient) references AGENCE(NumClient)
);
/* d)creation de la table emprunt */
CREATE TABLE `EMPRUNT`(
    `NumEmprunt` varchar(11),
    `Montant` int(13) not null,
    `Date` date,
    `NumAgence` varchar(8),
    `NumClient` varchar(8),
    PRIMARY KEY (`NumEmprunt`),
    Constraint FK_NumAgence FOREIGN key (NumAgence) references AGENCE(NumAgence),
    Constraint FK_NumClient FOREIGN key (NumClient) references AGENCE(NumClient)
);
/*22) Insertion de table*/
/* AGENCE */
INSERT INTO `AGENCE`(`NumAgence`,`Nom`,`Ville`,`Actif`) VALUES
('A01','BAT-Bé','Lome','100000000'),
('A02','UTB-Circulaire','Lome','800000000'),
('A03','ORAKA','Kara','50000000'),
('A04','BAT-Kpodzi','kpalime','22000000'),
('A05','ORAKA','kpalime','12000000'),
('A06','BAT-KA','kara','10000000'),
('A07','BAT-Adidogome','lome','900000000'),
('A08','UTP-Kpal','kpalime','19000000'),
('A09','BAT-An','Aneho','19000000'),
('A010','UTP-KA','kara','65000000');
/* CLIENT */
INSERT INTO `AGENCE`(`NumClient`,`Nom`,`Prenom`,`Ville`) VALUES
('C1','VILLAGEOIS','Premier','Vogan'),
('C2','VILLAGEOIS','Deuxieme','Kara'),
('C3','EKLOU','Kokou','Lome'),
('C4','KOSSI','koffi','Vogan'),
('C5','JEAN','Yves',''),
('C6','SITE','Ame','Kara'),
('C7','AKOSS','Laure','Lome'),
('C8','BABADE','Lauryne',''),
('C9','KODJO','Ayao',''),
('C10','NAOMI','Afivi','Sokode');
/*COMPTE*/
INSERT INTO `COMPTE`(`NumCompte`,`Solde`,`NumAgence`,`NumClient`)VALUES
('11111111111','50000000','A01','C1'),
('22222222222','8000000','A01','C2'),
('33333333333','150000000','A04','C5'),
('44444444444','30000000','A08','C5'),
('55555555555','22000000','A10','C7'),
('66666666666','990000000','A02','C4'),
('77777777777','400000000','A01','C6'),
('88888888888','7000000','A02','C6'),
('99999999999','72000000','A05','C5'),
('10101010101','20000','A07','C8'),
('10101010102','9000000','A07','C10');
/*EMPRUNT*/
INSERT INTO `EMPRUNT`(`NumEmprunt`,`NumAgence`,`NumClient`,`Date`,`Montant`)VALUES
('E0001','A07','C8','08/05/2022','100000000'),
('E0002','A07','C10','25/06/2022','50000000'),
('E0003','A01','C1','25/02/2022','15000000'),
('E0004','A05','C5','03/03/2022','55000000'),
('E0005','A04','C5','24/04/2022','30000000'),
('E0006','A10','C7','27/07/2022','18000000'),
('E0007','A10','C7','11/09/2022','14000000'),
('E0008','A01','C6','30/11/2022','2500000000');
/*3) Ecriture de requetes */
/*a)les client qui n'on pas la mm agence que premier villageois*/
SELECT cl.NumClient, cl.Nom, cl.Prenom
from client cl, compte co , agence a
where cl.NumClient = co.NumClient 
and cl.Nom <> " VILLAGEOIS" 
and cl.Prenom <> "Premier";
/*b)les client ayant actif le plus elever des agence de kpalime*/
SELECT NumAgence, Nom, Ville
from agence a
where a.ville <> "kpalime" and a.actif > "22000000"
/*c) le solde moyen des comptes  client pour chaque agence dont
le solde moyen est superieur a 10000000*/
select NumAgence,solde 
from compte co 
where solde > "1000000";
/*d) le nombre de client de l'agence "BAT-Bé" dont la ville n'est pas enregistrer 
dans la relation client*/
select count(cl.ville)
from client cl, agence a
where a.nom = "BAT-bé" and cl.ville <> a.ville
/*e)*/