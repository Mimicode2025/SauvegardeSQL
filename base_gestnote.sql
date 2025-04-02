CREATE TABLE ETUDIANT (
	numetu int(10) NOT NULL PRIMARY KEY,
	nom varchar(30),
	prenom varchar(30),
	datenaiss date, 
	sexe char(1),
	rue varchar(50),
	cp varchar(10),
	ville varchar(50)
);

CREATE TABLE MATIERE (
	codemat int(10) NOT NULL PRIMARY KEY,
	libelle varchar(30),
	coef int
);

CREATE TABLE EPREUVE (
	numepreuve int(10) NOT NULL PRIMARY KEY,
	datepreuve date,
	lieu varchar(40),
	codemat int NOT NULL,
	CONSTRAINT fk_codemat FOREIGN KEY (codemat) REFERENCES MATIERE(codemat)
);

CREATE TABLE NOTATION (
	numetu int NOT null,
	numepreuve int not null,
	note int,
	PRIMARY KEY (numetu, numepreuve),
	CONSTRAINT fk_numetu FOREIGN KEY (numetu) REFERENCES ETUDIANT(numetu),
	CONSTRAINT fk_numepreuve FOREIGN KEY (numepreuve) REFERENCES EPREUVE(numepreuve)
);

 