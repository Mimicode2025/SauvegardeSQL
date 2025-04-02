/*creation de la base de donnés*/
CREATE DATABASE gespersonnes;

/*creation de la table personne*/

/*insertion*/
insert into personne(numero, nom, prenom, sexe) VALUES
('USER1', 'TRAORE', 'ukarama', 'feminin');

/*selection sur la table*/
select *
from personne 
where numero ="USER1";

/*sectioner le numero*/
select numero
from personne ;

/*requete pour modifier une personne*/
UPDATE personne SET nom = 'TRAORE', prenom = 'Mimi', sexe = 'feminin', bibliotheque = 'RSA' WHERE numero = 'USER1';

/*requete Pour suprimer une personne*/
DELETE FROM personne WHERE numero = 'USER1'; 