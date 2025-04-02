SELECT * FROM db_boutique.client;
/* creation de base de donnes BANQUE*/
CREATE DATABASE BD_boutique;

/*creation de la table AGENCE */
CREATE TABLE `article`(
    `id_article` int not null,
    `marque_art` varchar(15),
    `description_art` text,
    `nom_art` varchar(20),
    `prix_vente_art` mediumint(3) not null,
    PRIMARY KEY( `id_article`)
);

/*creation des tables*/
CREATE TABLE `client`(
    `id_client` int not null,
    `nom_cl` varchar(25),
    `prenom_cl` varchar(25),
    `date_naiss_cl` DATE,
    `adresse_cl` varchar(25),
    `telephone_cl` varchar(20),
    `Ville_cl` varchar(15),
    PRIMARY KEY (`id_Client`)
);

CREATE TABLE `facture`(
    `id_facture` int not null,
    `num_facture` smallint not null,
    `date_facture` date,
    `id_client` int not null,	
    PRIMARY KEY (`id_facture`),
    Constraint FK_id_client FOREIGN key (id_client) references client(id_client)
);

CREATE TABLE `vente`(
    `id_vente` int not null,
    `num_tiket` smallint not null,
    `date_vente` DATE,
    `code_barre_vente` smallint not null,
    `id_facture` int not null,
    PRIMARY KEY (`id_vente`),
	Constraint fk_id_facture FOREIGN key (id_facture) references facture(id_facture)
);

alter table facture add column `id_vente` int not null;
alter table facture add constraint fk_id_vente FOREIGN key (id_vente) references vente(id_vente);

CREATE TABLE `ligne_vente`(
    `id_ligne_vente` int not null,
    `Quantite_ligne_vente` smallint not null,
    PRIMARY KEY (`id_ligne_vente`)
);

alter table facture add column `id_vente` int not null;
alter table facture add constraint fk_id_vente FOREIGN key (id_vente) references vente(id_vente);

CREATE TABLE `ligne_facture`(
    `id_ligne_facture` int not null,
    `Quantite_ligne_facture` int not null,
    PRIMARY KEY (`id_ligne_facture`)
);

ALTER TABLE ligne_facture 
DROP COLUMN num_facture;

alter table ligne_facture add column `id_facture` int not null;
alter table ligne_facture add constraint fk_id_facture FOREIGN key (id_facture) references facture(idligne_facture_facture);
alter table ligne_facture add column `id_article` int not null;
alter table ligne_facture add constraint fk_id_article FOREIGN key (id_article) references article(id_article);


CREATE TABLE `carte_fidelite`(
    `id_carte_fidelite` int not null,
    `id_client` int not null,
    `date_validite_debut` date,	
    `date_validite_fin` date,	    
    `point` smallint,	
    PRIMARY KEY (`id_carte_fidelite`)
);

 alter table carte_fidelite add Constraint fk_id_client FOREIGN key (id_client) references client(id_client);

CREATE TABLE `acheter`(
    `id_acheter` int not null,
    `id_client` int  not null,ligne_facture
    `date_achat` date,	
    `id_article` int not null,	    
    `quantite` smallint,	
    PRIMARY KEY (`id_acheter`)
);
      
alter table acheter add Constraint fk_id_client FOREIGN key (id_client) references client(id_client);
alter table acheter add Constraint fk_id_article FOREIGN key (id_article) references article(id_article);
/*inderer les donner*/
INSERT INTO client (id_client, nom_cl, prenom_cl, date_naiss_cl, adresse_cl, telephone_cl, ville_cl) VALUES 
(1, 'TRAORE', 'mimi', '2006-07-24', 'lome', '74125896', 'atakpamé'), 
(2, 'SOPKO', 'peletia', '2005-02-06', 'lome', '96332147', 'atakpamé'), 
(3, 'HODONOU', 'lucie', '2005-01-02', 'lome', '78524596', 'atakpamé'), 
(4, 'KALIPE', 'rufine', '2006-03-03', 'lome', '96312385', 'atakpamé'), 
(5, 'KOSSI', 'abel', '2006-05-07', 'lome', '96396312', 'atakpamé'), 
(6, 'DOGBE', 'jean', '2005-08-08', 'lome', '85252458', 'atakpamé'), 
(7, 'DOYOH', 'nelly', '2006-02-27', 'lome', '85450210', 'atakpamé'), 
(8, 'ALEDJI', 'mathiase', '2006-10-10', 'lome', '78996385', 'atakpamé'), 
(9, 'THABODJO', 'jamil', '2006-08-25', 'lome', '85204102', 'atakpamé'), 
(10, 'GNANSA', 'afat', '2006-04-11', 'lome', '85201238', 'atakpamé'), 
(11, 'EDAH', 'junior', '2006-03-12', 'lome', '96385201', 'atakpamé'), 
(12, 'DAGLA', 'kleis', '2006-07-03', 'lome', '74108520', 'atakpamé'), 
(13, 'THANI', 'bilal', '2006-07-07', 'lome', '02587410', 'atakpamé'), 
(14, 'GAPARA', 'fanuel', '2005-07-06', 'lome', '74108520', 'atakpamé'), 
(15, 'ELIE', 'edjidjom', '2006-04-04', 'lome', '85207410', 'atakpamé');

INSERT INTO article (id_article, marque_art, description_art, nom_art, prix_vente_art) VALUES 
(1, 'AGRI-MEDIA', 'du riz', 'riz', 1000), 
(2, 'AGRI-MEDIA', 'du sorgho', 'sorgho', 1600), 
(3, 'AGRI-MEDIA', 'du mil', 'mil', 1700), 
(4, 'AGRI-MEDIA', 'de la carote', 'carote', 700), 
(5, 'AGRI-MEDIA', 'de haricot', 'haricot', 1200), 
(6, 'AGRI-MEDIA', 'du mais', 'mais', 1500), 
(7, 'AGRI-MEDIA', 'de igname', 'igname', 3000), 
(8, 'AGRI-MEDIA', 'de la tomate', 'tomate', 1000), 
(9, 'AGRI-MEDIA', 'du piment', 'piment', 400), 
(10, 'AGRI-MEDIA', 'du oignon', 'oignon', 300);

INSERT INTO acheter (id_acheter, id_client, date_achat, id_article, quantite) VALUES 
(1, 1, '2024-12-14', 1, 10), 
(2, 2, '2024-12-13', 2, 5), 
(3, 3, '2024-12-12', 3, 15), 
(4, 4, '2024-12-11', 4, 8), 
(5, 5, '2024-12-10', 5, 12), 
(6, 6, '2024-12-09', 6, 20), 
(7, 7, '2024-12-08', 7, 30), 
(8, 8, '2024-12-07', 8, 7), 
(9, 9, '2024-12-06', 9, 25), 
(10, 10, '2024-12-05', 10, 2), 
(11, 11, '2024-12-04', 1, 18), 
(12, 12, '2024-12-03', 2, 9), 
(13, 13, '2024-12-02', 3, 14), 
(14, 14, '2024-12-01', 4, 10), 
(15, 15, '2024-11-30', 5, 22);

INSERT INTO vente (id_vente, num_tiket, date_vente, code_barre_vente, id_facture) VALUES
(1, 1001, '2024-12-14', 123456, 1),
(2, 1002, '2024-12-13', 234567, 2),
(3, 1003, '2024-12-12', 345678, 3),
(4, 1004, '2024-12-11', 456789, 4),
(5, 1005, '2024-12-10', 567890, 5),
(6, 1006, '2024-12-09', 678901, 6),
(7, 1007, '2024-12-08', 789012, 7),
(8, 1008, '2024-12-07', 890123, 8),
(9, 1009, '2024-12-06', 901234, 9),
(10, 1010, '2024-10-05', 112745, 10),
(11, 1011, '2024-12-14', 123556, 11),
(12, 1012, '2024-07-13', 234867, 12),
(13, 1013, '2024-08-12', 345678, 13),
(14, 1014, '2024-09-11', 457789, 14),
(15, 1015, '2024-06-10', 567890, 15);


INSERT INTO facture (id_facture, num_facture, date_facture, id_client, id_vente) VALUES
 (1, 1001, '2024-12-14', 1, 1), 
 (2, 1002, '2024-12-13', 2, 2), 
 (3, 1003, '2024-12-12', 3, 3), 
 (4, 1004, '2024-12-11', 4, 4), 
 (5, 1005, '2024-12-10', 5, 5), 
 (6, 1006, '2024-12-09', 6, 6), 
 (7, 1007, '2024-12-08', 7, 7), 
 (8, 1008, '2024-12-07', 8, 8), 
 (9, 1009, '2024-12-06', 9, 9), 
 (10, 1010, '2024-12-05', 10, 10),
 (11, 1011, '2024-12-04', 11, 11), 
 (12, 1012, '2024-12-03', 12, 12), 
 (13, 1013, '2024-12-02', 13, 13), 
 (14, 1014, '2024-12-01', 14, 14), 
(15, 1015, '2024-11-30', 15, 15);

/*client néé en 2006*/
SELECT *
FROM db_boutique.client
where date_naiss_cl > "2006-01-01" and  date_naiss_cl < "2006-12-31";

/*les client qui on achete a une date donné et leur article*/
SELECT cl.nom_cl , cl.prenom_cl , cl.Ville_cl , art.nom_art, art.PriX_vente_art, ach.date_achat, date_naiss_cl
FROM client cl, article art, acheter ach
where cl.id_client = ach.id_client 
and art.id_article = ach.id_acheter 
and date_achat > "2024-11-01" and  date_achat <"2024-12-31"
and date_naiss_cl > "2005-01-01" and  date_naiss_cl <"2006-12-31"
and prix_vente_art> 1000 and prix_vente_art < 3000;
/*ou*/
SELECT cl.nom_cl , cl.prenom_cl , cl.Ville_cl , art.nom_art, art.PriX_vente_art, ach.date_achat, date_naiss_cl
FROM client cl, article art, acheter ach
where cl.id_client = ach.id_client 
and art.id_article = ach.id_acheter 
and date_achat BETWEEN "2024-11-01" and "2024-12-31"
and date_naiss_cl BETWEEN "2005-01-01" and  "2006-12-31"
and prix_vente_art BETWEEN 1000 and  3000;

/*trie tous les client a une date nassance donné */
SELECT *
from client 
where date_naiss_cl > "2005-01-01" and  date_naiss_cl <"2006-12-31"
ORDER BY nom_cl;

/*trie le client par le nom et le prenom*/
SELECT *
from client 
where date_naiss_cl > "2005-01-01" and  date_naiss_cl <"2006-12-31"
ORDER BY nom_cl and prenom_cl desc;


/*TP on delete et on Update*/
INSERT INTO client (id_client, nom_cl, prenom_cl, date_naiss_cl, adresse_cl, telephone_cl, ville_cl) VALUES 
('12345', 'agbenowoko', 'benoit', '2005-01-05', 'agoé','71391393', 'lome');

INSERT INTO facture (id_facture, num_facture, date_facture, id_client, id_vente) VALUES
 (16, 102, '2024-04-14', 12345, 17);
 
 INSERT INTO vente (id_vente, num_tiket, date_vente, code_barre_vente, id_facture) VALUES
(17, 1001, '2024-12-14', 123456, 16);

ALTER TABLE vente 
DROP COLUMN  id_facture;

INSERT INTO client (id_client, nom_cl, prenom_cl, date_naiss_cl, adresse_cl, telephone_cl, ville_cl) VALUES 
(567, 'dupon', 'paul', '2006-08-24', 'lome', '74128896', 'atakpamé');

Replace INTO client (id_client, nom_cl, prenom_cl, date_naiss_cl, adresse_cl, telephone_cl, ville_cl) VALUES 
(345, 'dupon', 'razak', '2006-07-24', 'kara', '74125896', 'atakpamé');

ALTER TABLE client
ADD column Email varchar(25);

/*pour moi*/
DELIMITER //
CREATE DEFINER = CURRENT_USER TRIGGER `db_boutique`.`client_BEFORE_INSERT` BEFORE INSERT ON client FOR EACH ROW
BEGIN
	if (LOCATE("@" , new.Email) > 0 and LOCATE(".", new.Email) > 0)
		then 
			INSERT into client(email) values(new.email);
	else
		
        signal sqlstate '45000' set MESSAGE_TEXT = 'email invalide';
        set new.Email  =mull;
	end if;
END 
//DELIMITER ;
insert client(id_client, Email) values (1, 'traore');
drop trigger client_BEFORE_INSERT ;

/*pour mathiase*/
DELIMITER |
CREATE DEFINER = CURRENT_USER TRIGGER `db_boutique`.`verification` BEFORE INSERT ON `client` FOR EACH ROW
BEGIN
	if (LOCATE("@" , new.Email) = 0 or LOCATE(".", new.Email) = 0) then
		signal sqlstate '45000'
        set MESSAGE_TEXT = 'email doit  contenir le symbole @ et .';
	end if;
END |
DELIMITER ;
insert into client (id_client, Email) Values (999, 'traoremukarama');
drop trigger verification ;

/*afficher id et la quantité totale acheter*/
DELIMITER |
CREATE procedure somme_des_quantite_total(in p_id_article int,  out P_quantite smallint)
BEGIN
	SELECT id_article, SUM(quantite) into id , quantite_total
    FROM article art
    JOIN acheter ach
    ON art.id_article = ach.id_article
    WHERE art.id_article = p_id_article;
END |
DELIMITER ;

call somme_des_quantité(1)

/*coorection*/
DELIMITER |
CREATE PROCEDURE somme_des_quantite_total(IN p_id_article INT, OUT p_quantite SMALLINT)
BEGIN
    DECLARE id INT;
    DECLARE quantite_total SMALLINT;

    SELECT id_article, SUM(quantite) INTO id, quantite_total
    FROM article art
    JOIN acheter ach
    ON art.id_article = ach.id_article
    WHERE art.id_article = p_id_article;

    SET p_quantite = quantite_total;
END |
DELIMITER ;
call somme_des_quantite_total(1);
		
