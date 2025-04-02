/* exo2 devoir 2024*/
/*1) creation des table*/
CREATE TABLE `Etudiant` ( 
`CodeEt` char(5) NOT NULL AUTO_INCREMENT,
`NomEt` varchar(30) ,
 `DatenEt` date, 
 PRIMARY KEY (`CodeEt`)
 ); 
 
 CREATE TABLE `Matiere` ( 
`CodeMat` char(5) NOT NULL AUTO_INCREMENT,
`NomEt` varchar(30) ,
 `coefMat` tinyint, 
 PRIMARY KEY (`CodeMat`)
 ); 
 
 CREATE TABLE `Enseignant` ( 
`CodeEns` char(5) NOT NULL AUTO_INCREMENT,
`NomEns` varchar(30) ,
 `GradeEns` varchar(10), 
 PRIMARY KEY (`CodeEns`),
 Constraint fk_codeMat FOREIGN key (codeMat) references Matiere(codeMat)
 ); 

CREATE TABLE `Note` ( 
`CodeEt` NOT NULL,
`CodeMat` NOT NULL,
 `note` decimal(4 , 2), 
 PRIMARY KEY (`CodeEt`, `CodeMat`),
 Constraint fk_codeEt FOREIGN key (codeEt) references Etudiant(codeEt),
 Constraint fk_codeMat FOREIGN key (codeMat) references Matiere(codeMat)
 ); 
 
 /*2)les information des etudiant selon l'ordre aphabétique croissant du nom*/
 select *
 from ETUDIANT
 order by ASC;
 
 /*3)*/
 select En.NomEns, En.GradeEns
 From ENSEIGNANT En join MATIERE Mat on (En.codeMat = Mat.codeMat)
 where Mat.NomMat = "BD";
 
 /*ou*/
 select NomEns, GradeEns
 from ENSEIGNANT 
 where CodeMat in (select codeMat
                    from MATIERE 
                    where NomMat = "BD");
                    
/*ou*/
select  E.NomEns, E.GradeEns
From ENSEIGNANT En , MATIERE Mat
where E.codeMat = M.codeMat and E.NomMat;

/*4*/
select Mat.NomMat, Mat.coefMat
from MATIERE Mat join ENSEIGNANT En on (En.codeMat = Mat.codeMat)
where En.GradeEns = "Grd3";

/*5*/
select Mat.NomMat, Mat.coefMat
from Matiere Mat join Note N on (Mat.codeMat = N.codeMat) 
join ETUDIANT E on (N.codeEt = E.codeEt)
where E.codeEt ="Et321";

/*6*/
select count(codeEns)
from ENSEIGNANT En join MATIERE Mat on (En.codeMat = Mat.codeMat)
where Mat.NomMat = "Informatique";
 
 


 