 /*création de gestionvente*/
 create DATABASE gestionvente
create table clients (
    idcl int not null auto_increment,
    nomcl varchar(50),
    prenomcl varchar(100),
    primary key
);
/*création de client*/
CREATE TABLE IF NOT EXISTS `client` (
  `idcl` int(11) NOT NULL AUTO_INCREMENT,
  `nomcl` varchar(50) NOT NULL,
  `prenomcl` varchar(100) NOT NULL,
  PRIMARY KEY (`idcl`)
);
/*ajout de l''indice nom et prenom*/
iNSERT INTO `client` (`idcl`, `nomcl`, `prenomcl`) VALUES
(1, 'HODONOU', 'Christiane-Lucie'),
(2, 'HODONOU', 'Angèle-Doris'),
(3, 'ASSIOBO', 'Edith'),
(4, 'HODONOU', 'Claude'),
(5, 'ASSIOBO', 'Florence'),
(6, 'ASSIOBO', 'Rose'),
(7, 'ASSIOBO', 'Hypollyte'),
(8, 'KOFFI', 'Henoc'),
(9, 'KOFFI', 'Justin'),
(10, 'KOFFI', 'Charbel');
/*création de produits*/
CREATE TABLE `produits` (
  `idpt` int NOT NULL AUTO_INCREMENT,
  `nompt` varchar(50) NOT NULL,
  PRIMARY KEY (`idpt`)
  p_u  check(p_u <= 100000) 
);
/*ajouter prix unitaire à produit */
DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idpt` int(11) NOT NULL AUTO_INCREMENT,
  `nompt` varchar(50) NOT NULL,
  `P_u` int(11) DEFAULT NULL
  PRIMARY KEY (`idpt`)
);
 /*listes des produits dont le p_u est compris entre 5000 et 500000 */
SELECT * 
FROM produit 
where p_u between 5000 and 500000
/*une autre manière*/
SELECT * 
FROM produit 
where p_u >= 5000 and p_u <= 500000
'''liste des produits dont le p_u est: 5000, 10000, 350, 500'''
select*
from produit
where p_u in (5000, 10000, 350, 500)
/*ajouter les indices les noms et les prix des produits*/
INSERT INTO `produit` (`idpt`, `nompt`, `P_u`) VALUES
(1, 'produit1', 100),
(2, 'produit2', 1000),
(3, 'produit3', 3000),
(4, 'produit4', 4500),
(5, 'produit5', 2750),
(6, 'produit6', 4350),
(7, 'produit7', 29000),
(8, 'produit8', 14000),
(9, 'produit9', 10000),
(10, 'produit10', 9000);

/*liste des produits dont le nom contient le chiffre ou lettre ca dépend des noms des produits fait préalablement*/
select*
from produit
where nompt like '%1'or nompt like '%I';
/*gestion de jointure de client et commander*/
select client.*, commander.*
from client, commander
'''jointure''''''produit scalaire'''
select cl.*, cd.*
from  client cl, commander cd
where cl.idcl = cd.idcl;
'''requete imbriquée 1ère manière'''
select cl.nomcl, pt.nompt, cd.qte
from client cl, commander cd,  produit pt
where cl.idcl = cd.idcl
and cd.idpt = pt.idpt;
'''  requete imbriquée  2ème man ière  '''
SELECT nomcl
from client
where idcl IN (select idcl
               from commander);
''' deux client ayant le meme nom '''
select cl1.nomcl, cl1.prenomcl, cl2.prenomcl
from client cl1, client cl2
where cl1.nomcl = cl2.nomcl
'''  cross join   '''
select cl.*, cd.*
from client cl cross join commander cd;
'''natural join'''
select cl.*, cd.*
from client cl natural join commander cd;
'''     '''
select cl.*, pt.*
from client cl 
join commander cd using (idcl)
join produit pt using (idpt);
/* lorsque les clients ont le meme nom  */
select cl.nomcl, cl.prenomcl, pt.nompt, pt.p_u
from client cl 
join commander cd using (idcl)
join produit pt using (idpt);
/*afficher nom et prenom du client et nom et p_u des produits */
select cl.nomcl, cl.prenomcl, pt.nompt, pt.p_u
from client cl 
join commander  cd on (cl.idcl = cd.idcl)
join produit pt on (cd.idpt = pt.idpt);

region(codereg,nomreg)
prefecture(codepref, nompref, #codereg)
commune(codecom,nomcom, #codepref)
canton(codecan, nomcan, #codecom)
village(codevi, nomvi, #codecan)
quartier(codequa, nomqua, #codevi)
localite(codeloc, nomloc, #codequa)
''' création de base de donnés'''
create DATABASE decoupageadminTogo
'''création de la table region'''
create table region(
    codereg int not null auto_increment
    nomreg varchar(50) not null,
    primary key(codereg)
);
'''création de la table prefecture'''
create table prefecture(
    codepref int not null auto_increment
    nompref varchar(50) not null,
    constraint foreign key(codereg)references prefecture(codereg),
    primary key(codepref)
);
'''création de la table commune'''
create table commune(
    codecom int not null auto_increment
    nomcom varchar(50) not null,
    constraint foreign key(codepref)references commune(codepref);
    primary key(codecom)
);
/*création de la table canton*/
create table canton(
    codecan int not null auto_increment
    nomcan varchar(50) not null,
    constraint foreign key(codecom)references canton(codecom);
    primary key(codecan)
);
/*création de la table village*/
create table village(
    codevi int not null auto_increment
    nomvi varchar(50) not null,
    constraint foreign key(codecan)references region(codecan),
    primary key(codevi)
);
/*création de la table quartier*/
create table quartier(
    codequa int not null auto_increment
    nomqua varchar(50) not null,
    constraint foreign key(codevi)references region(codevi),
    primary key(codequa)
);
'''création de la table localite'''
reate table localite(
    codeloc int not null auto_increment
    nomloc varchar(50) not null,
    constraint foreign key(codequa)references region(codequa);
    primary key(codeloc)
);
''' région'''
INSERT INTO `region` (`codereg`, `nomreg`) VALUES
(1, 'savane'),
(2, 'kara'),
(3, 'centrale'),
(4, 'plateau'),
(5, 'maritime');
'''préfecture'''
INSERT INTO `prefecture` (`codepref`, `Nompref`, `codereg`) VALUES
(1, 'blitta', 1),
(2, 'mo', 2),
(3, 'assoli', 3),
(4, 'binah', 4),
(5, 'keran', 5),
(6, 'agoè-nyivè', 6),
(7, 'agou', 7),
(8, 'annie', 8),
(9, 'ave', 9),
(10, 'bas-mono', 10);
'''commune'''
INSERT INTO `commune` (`codecom`, `Nomcom`, `codepref`) VALUES
(1, 'blitta1', 1),
(2, 'blitta2', 2),
(3, 'blitta3', 3),
(4, 'assoli1', 4),
(5, 'assoli2', 5),
(6, 'agou1', 6),
(7, 'agou2', 7),
(8, 'akebou', 8),
(9, 'amou1', 9),
(10, 'amou2', 10);
''' canton'''
INSERT INTO `canton` (`codecan`, `Nomcan`, `codecom`) VALUES
( 1, 'goubi', 1),
(2, 'bago', 2),
(3, 'koffiti', 3),
(4, 'welly', 4),
(5, 'blita-gare', 5),
(6, 'togle', 6),
(7, 'zanguera', 7),
(8, 'adetikope', 8),
(9, 'agou-iboe', 9),
(10, 'agou-kebo', 10);
'''village'''
INSERT INTO `village` (`codevil`, `Nomvil`, `codecan`) VALUES
(1, 'vogan', 1),
(2, 'bagon', 2),
(3, 'koffitikè', 3),
(4, 'wellymnou', 4),
(5, 'blita-garemen', 5);
'''quartier'''
INSERT INTO `quartier` (`codequa`, `Nomvqua`, `codevil`) VALUES
(1, 'baguida', 1),
(2, 'nekonakpoè', 2),
(3, 'avedji', 3),
(4, 'attiégou', 4),
(5, 'zongo', 5);
'''localite'''
INSERT INTO `localite` (`codeloc`, `Nomvloc`, `codequa`) VALUES
(1, 'adjougba', 1),
(2, 'anome', 2),
(3, 'atsanve', 3),
(4, 'cacaveli', 4),
(5, 'demakpo', 5),
(6, 'houmbi', 6),
(7, 'logope', 7),
(8, 'daliko', 8),
(9, 'athieme', 9),
(10, 'alinka', 10);
'''pour supprimer toutes les tables'''
TRUNCATE TABLE localite;
TRUNCATE TABLE quartier;
TRUNCATE TABLE village;
TRUNCATE TABLE canton;
TRUNCATE TABLE commune;
TRUNCATE TABLE prefecture;
TRUNCATE TABLE region;
'''pour faire sortir le nom des prefectures sans doublon'''
select distinct prefecture
from brouillon;
'''   '''
select distinct prefecture
from brouillon
'''pour supprimer pour les ordres 0'''
delete from brouillon order = 0
'''   '''
select distinct b.prefecture, r.codereg
from region r, brouillon b
where r.nomreg = b.region
''' union'''
select idcl from client 
union
select idcl from commander;
''' intersection'''
select idcl from client 
intersect
select idcl from commander;
'''le nbre de client dans la table'''
select count(idcl) from client 
'''au lieu de count(idcl) ça afficher nbre total de client suivi du nombre en question'''
select count(*) as 'nombre total de client' from client;
'''pour afficher le maximum de quantité commander'''
select max(qte) as 'maximum' from commander;
'''pour afficher le minimum de quantité commander'''
select min(qte) as 'minimum' from commander;
''' somme des quantités commander'''
select count(*) as 'total',
    min(qte) as 'Minimum'
    max(qte) as 'Maximum'
    avg(qte) as 'Moyenne'
    sum(qte) as 'Somme';
    '''pour voir le produit qui a plus de quantité commander'''
    select p.nompt, c.qte 
    from produit p, commander c 
    where p.idpt = c.idpt and c.qte >= (select max(qte) from commander);
    ''' listes des produits dont le p_u est inférieur à la moyenne des p_u'''
    select nompt, p_u, avg(p_u)
    from produit
    having p_u < avg(p_u);
   '''correction'''
   '''MLD'''
   Etudiant(idetd,nometd,prenometd,datenaiss)
   Region(idreg, nomreg)
   Ville(idvil, nomvil, #idreg)
   Universite(cygle, nomuniv, #idvil)
   inscrire(#cygle,#idetd,dateinscript)
   '''création de la base de données'''
   create database gestionetudiant
   ''' création de la table Etudiant'''
   create table Etudiant(
    idetd int not null,auto_increment
    nometd varchar(50),
    prenometd varchar(50),
    datenaiss date,
    primary key (idetd),
    );
    ''' création  de la table région'''
   create table Region(
    idreg int not null, auto_increment
    nomreg varchar(50),
    primary key (idreg),
   );
   '''création de la table ville'''
   create table ville( 
    idville int not null, 
   primary key (idville),
    nomville varchar(50), 
    idreg int not null,
    constraint fk_region_idreg foreign key (idreg) references region (idreg)
    );

   '''création de la table université'''
   create table Universite(
    iduniv int not null,
    sigle varchar(5), 
    nomuniv varchar(50),
    idvil int not null, 
    primary key(iduniv),
    constraint fk_Ville_idvil foreign key (idvil) references Ville (idvil)
   );
   '''création de la table inscrire'''
   create table Inscrire(
      sigle varchar(5),
      idetd int not null,
      constraint fk_Universite_sigle foreign key (sigle)references Universite(sigle),
      constraint fk_Etudiant_idetd foreign key(idetd) references Etudiant(idetd),
      primary key (sigle, idetud),
      dateinscript date
   );
   //Insertion d'Etudiant
INSERT INTO `etudiant` (`idetd`, `nometd`, `prenometd`, `datenaiss`) VALUES
(1, 'EDITCHAO', 'Edwige', '2005-05-09'),
(2, 'ABI', 'Louise', '2005-03-15'),
(3, 'SARABI', 'joys', '2004-10-02'),
(4, 'AKA', 'Franck', '1998-02-02'),
(5, 'ZAVON', 'Gloria', '1999-05-04'),
(6, 'BANA', 'Gorges', '1999-01-06'),
(7, 'ADJEYI', 'Eric', '2003-09-26'),
(8, 'MALAGNE', 'Valerie', '2004-12-13'),
(9, 'ADJEYI', 'Rachel', '1999-03-22'),
(10, 'BADJO', 'John', '2000-05-07');
//Insertion de université
INSERT INTO `universite` (`sigle`, `nomuniv`, `idville`) VALUES
('UL', 'Université de lomé', 1),
('UKA', 'Université de Kara', 2),
('IAI', 'Institut Africain Informatique', 3),
('ESA', 'Agence Spatiale Européénne', 4),
('UCAO', 'Université Catholique de Afrique de Ouest', 5),
('ISDI', 'Institut Superieur de Droit et Interpretariat', 6);
//Inscription des etudiant
INSERT INTO `inscrit` (`sigle`, `idetd`, `date_inscrip`) VALUES
('UL', 1, '2023-05-12'),
('UL', 2, '2023-06-02'),
('UKA', 1, '2023-06-03'),
('UKA', 2, '2023-06-04'),
('UCAO', 4, '2023-06-05'),
('UCAO', 7, '2023-07-01'),
('ESA', 3, '2023-07-03'),
('ESA', 5, '2023-07-05'),
('IAI', 6, '2023-07-06'),
('IAI', 8, '2023-07-08'),
('ISDI', 9, '2023-08-06'),
('ISDI', 10, '2023-08-06');
