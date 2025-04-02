/*Creation des table*/
CREATE TABLE `Departement` ( 
`NoD` int NOT NULL AUTO_INCREMENT,
 `Dnom` varchar(25), 
 `Dir` varchar(25), 
 `Dville` varchar(25), 
 PRIMARY KEY (`NoD`) 
 );
 
 CREATE TABLE `Employer` ( 
 `NoEm` int NOT NULL AUTO_INCREMENT, 
 `ENom` varchar(25),
 `Prof` varchar(25), 
 `DateEmb` date,
 `Comm` varchar(25), 
 `NoD` int NOT NULL, 
 PRIMARY KEY (`NoEm`), 
 CONSTRAINT fk_NoD FOREIGN KEY (NoD) REFERENCES departement(NoD)
 );
 /*ajout de salaire*/
 ALTER TABLE 
 Employer ADD Sal int;
 
 /*Insertion des enployer et des departement*/
 INSERT INTO Departement (NoD, Dnom, Dir, Dville) VALUES
 (1, 'Production', 'Me. Mariama', 'lome'), 
 (2, 'Ventes et marketing', 'M. Razak', 'lome'), 
 (3, 'comptabilité', 'Me. fousena', 'lome'), 
 (4, 'RH', 'Me. Fadilah', 'lome'), 
 (5, 'Services humaines', 'M. Faozane', 'lome'), 
 (6, 'Services clients', 'Me. Pelletia', 'lome'), 
 (7, 'IT', 'Me. Lucie', 'lome');
 
 INSERT INTO Employer (NoEm, ENom, Prof, DateEmb, Comm, NoD, Sal) VALUES
 (001, 'BIBLIO', 'comptable', '2006-02-25', '10%', 3, 20000), 
 (002, 'BISMUTH', 'assistant', '2005-03-12', '20%', 2, 20000), 
 (003, 'MICHEL', 'directeur RH', '2007-08-13', '1%', 1, 200000), 
 (004, 'DUNDY', 'directeur financier', '2008-07-14', '15%', 4, 25000), 
 (005, 'MARTINEZ', 'secretaire', '2009-06-17', '10%', 5, 35000), 
 (006, 'HENRY', 'caissier', '2016-05-20', '25%', 6, 20000), 
 (007, 'AFOLABI', 'devellopeur', '2012-04-21', '11%', 3, 100000),
 (008, 'THEDRE', 'assistant RH', '2010-09-28', '12%', 4, 30000),
 (009, 'THAO', 'gardien', '2012-10-04', '13%', 5, 25000),
 (0010, 'YATARA', 'jardinier', '2013-07-05', '19%', 6, 14000);
 
 /*1) la liste des employer ayant une commision */
 SELECT *
 from Employer
 where Comm IS NOT NULL;
 
 /*2)Donner  les noms, les profesion et salaire des employer par profesions ds ordre croissant 
 et pour chaque profesion par salaire decroissante*/
 SELECT ENom, Prof , sal
 FROM Employer 
 ORDER BY Prof ASC , Sal DESC;
 
 /*3)le salaire moyen des employer*/
 SELECT avg(Sal) as salaire_moyen 
 from Employer;
 
 /*4)salaire moyen du depardement production*/
 SELECT AVG(em.Sal) AS Salaire_production 
 FROM employer em join Departement d on em.NoD = d.NoD
 WHERE d.Dnom = 'Production';
 
 /*5)le numero de departement et leur salaire maximum*/
 SELECT NoD, MAX(Sal) AS Max_Salaire 
 FROM Employer
 GROUP BY NoD;

/*pour verifier les tables*/
 SHOW TABLES; 