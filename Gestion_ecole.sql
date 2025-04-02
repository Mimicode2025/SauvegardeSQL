/*creation des table*/
CREATE TABLE `etudiant` ( 
`id_Etudiant` int NOT NULL AUTO_INCREMENT,
 `Prenoms` varchar(25), 
 `Noms` varchar(25), 
 PRIMARY KEY (`id_Etudiant`) 
 );
 
CREATE TABLE `Examens` ( 
`id` int NOT NULL AUTO_INCREMENT,
`id_Examens` int ,
 `Matiére` varchar(25), 
 `id_Etudiant` int,
 PRIMARY KEY (`id`),
 Constraint fk_id_Etudiant FOREIGN key (id_Etudiant) references etudiant(id_Etudiant)
 ); 
  /*insersion de note*/
  ALTER TABLE 
  Examens ADD note DECIMAL(2, 1);
  ALTER TABLE examens MODIFY note DECIMAL(4, 1);
  
 /*insertion des element dans les table*/
 INSERT INTO etudiant (id_Etudiant, Prenoms, Noms) VALUES 
(30, 'Joseph', 'BIBLIO'), 
(31, 'Paul', 'BISMUTH'), 
(32, 'Jean', 'MICHEL'), 
(33, 'Ted', 'DUNYY'), 
(34, 'Caroline', 'MARTYNEZ'), 
(35, 'Josephine', 'HENRY');

INSERT INTO Examens (id, id_etudiant, Id_examen, Matiere, Note) VALUES 
(789, 30, 45, 'H-G', 10.5), 
(790, 33, 87, 'Maths', 14.0), 
(791, 34, 88, 'Maths', 4.0), 
(792, 31, 89, 'H-G', 15.5), 
(793, 32, 90, 'H-G', 8.0), 
(794, 31, 91, 'Maths', 14.0), 
(795, 33, 92, 'H-G', 9.5), 
(796, 36, 93, 'H-G', 13.0), 
(797, 34, 94, 'H-G', 17.0),
(798, 30, 95, 'Maths', 7.5);

/*1) les etudiand qui pn participer a au moins 1 examen*/
SELECT DISTINCT id_Etudiant
FROM examens;

/*2) conter le nbre etudiand qui on partipe a un examen*/
SELECT DISTINCT count(id_Etudiant) as nombre_etudiant
FROM examens;

/*3)la moyen de l'examen portant id 45*/
SELECT avg(note) as moyen_45
FROM examens
where id_Examens = 45 ;

/*4) la meilleur note de l'examens portant id= 87*/
SELECT max(note) as meilleur_note
FROM examens 
where id_Examens = 87;

/*5)les etudiant qui ont eu plus de 11 q l'examen 45 ou 12 a l'examen 87*/
SELECT  DISTINCT id_Etudiant
FROM examens 
where (note > 11 and id_Examens = 45) or (note > 12 and id_Examens = 87);

/*6)afficher tous les enregistrement de la table examens et 
le nom et le prénom des etudiant*/
SELECT ex.* , et.Noms , et.Prenoms
from examens ex 
JOIN etudiant et ON ex.Id_etudiant = et.Id_Etudiant;