--
-- Script de creation des tables
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
-- 
--
SET ECHO ON

CREATE TABLE Utilisateur
(
	idUtilisateur 		INTEGER NOT NULL PRIMARY KEY,
	motPass 			VARCHAR(20) NOT NULL,
	nom 				VARCHAR(200) NOT NULL,
	prenom 				VARCHAR(200) NOT NULL
);

CREATE TABLE Employe
(
	idEmploye 			INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur),
	codeMatricule 		VARCHAR(20) NOT NULL UNIQUE,
	categorie			VARCHAR2(40) CHECK( categorie IN ('bibliothecaire', 'employe', 'responsable des adherents', 'responsable des oeuvres') )
);

CREATE TABLE Adherent
(
	idAdherent 			INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur),
	numero 				INTEGER NOT NULL,
	adresse 			VARCHAR(200) NOT NULL,
	telephone 			VARCHAR(12) NOT NULL,
	nbMaxPrets 			INTEGER DEFAULT 3,
	dureeMaxPrets		INTEGER DEFAULT 4
);

CREATE TABLE Oeuvre
(
	idOeuvre 			INTEGER NOT NULL PRIMARY KEY,
	titre				VARCHAR(200) NOT NULL
);

CREATE TABLE Emplacement
(
	idEmplacement		Integer NOT NULL PRIMARY KEY,
	travee				Varchar(40) NOT NULL,
	etagere				Varchar(40) NOT NULL,
	rayon				Varchar(40) NOT NULL
);

CREATE TABLE Exemplaire
(
	idExemplaire		INTEGER NOT NULL PRIMARY KEY,
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre),
	statut				VARCHAR2(10) CHECK( statut IN ('prete', 'disponible', 'reserve') ),
	nomSupport 			VARCHAR2(10) CHECK( nomSupport IN ('livre', 'cassette', 'audio', 'video','CD','DVD') ),
	surPlaceSeulement 	NUMBER(1) NOT NULL,
	idEmplacement 		INTEGER REFERENCES Emplacement(idEmplacement)
);

CREATE TABLE Reservation
(
	idReservation 		INTEGER NOT NULL PRIMARY KEY,
	dateFinReservation	DATE,
	idAdherent			INTEGER REFERENCES Adherent(idAdherent),
	idExemplaire		INTEGER REFERENCES Exemplaire(idExemplaire)
);

CREATE TABLE Pret
(
	idPret 				INTEGER NOT NULL PRIMARY KEY,
	dateEmprunt			DATE,
	dateRetour			DATE,
	idAdherent			INTEGER REFERENCES Adherent(idAdherent),
	idExemplaire		INTEGER REFERENCES Exemplaire(idExemplaire)
);

CREATE TABLE Auteur
(
	idAuteur 			INTEGER NOT NULL PRIMARY KEY,
	nom 				VARCHAR(200) NOT NULL,
	prenom 				VARCHAR(200) NOT NULL
);

CREATE TABLE Editeur
(
	idEditeur 			INTEGER NOT NULL PRIMARY KEY,
	nomEditeur	 		VARCHAR(200)
);

CREATE TABLE Categorie
(
	idCategorie		 	INTEGER NOT NULL PRIMARY KEY,
	descripteur			Varchar(200) NOT NULL
);

CREATE TABLE AuteurOeuvre
(
	idAuteur			INTEGER REFERENCES Auteur(idAuteur),
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre)
);

CREATE TABLE EditeurOeuvre
(
	idEditeur			INTEGER REFERENCES Editeur(idEditeur),
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre)
);

CREATE TABLE CategorieOeuvre
(
	idCategorie			INTEGER REFERENCES Categorie(idCategorie),
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre)
);

CREATE TABLE Livre
(
	idLivre				INTEGER PRIMARY KEY REFERENCES Oeuvre(idOeuvre),
	ISBN	 			VARCHAR(40) NOT NULL,
	nbPages				INTEGER NOT NULL
);

CREATE TABLE Musique
(
	idMusique	 		INTEGER PRIMARY KEY REFERENCES Oeuvre(idOeuvre),
	duree				INTEGER NOT NULL
);

CREATE TABLE Film
(
	idFilm		 		INTEGER PRIMARY KEY REFERENCES Oeuvre(idOeuvre),
	duree				INTEGER NOT NULL
);


-- Auto-increment des cles primaires

CREATE SEQUENCE utilisateur_seq;
SELECT utilisateur_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER utilisateur_increment
BEFORE INSERT ON Utilisateur
FOR EACH ROW
BEGIN
  SELECT utilisateur_seq.NEXTVAL
  INTO   :new.idUtilisateur
  FROM   dual;
END;

CREATE SEQUENCE oeuvre_seq;
SELECT oeuvre_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER oeuvre_increment
BEFORE INSERT ON Oeuvre
FOR EACH ROW
BEGIN
  SELECT oeuvre_seq.NEXTVAL
  INTO   :new.idOeuvre
  FROM   dual;
END;

CREATE SEQUENCE emplacement_seq;
SELECT emplacement_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER emplacement_increment
BEFORE INSERT ON Emplacement
FOR EACH ROW
BEGIN
  SELECT emplacement_seq.NEXTVAL
  INTO   :new.idEmplacement
  FROM   dual;
END;

CREATE SEQUENCE exemplaire_seq;
SELECT exemplaire_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER exemplaire_increment
BEFORE INSERT ON Exemplaire
FOR EACH ROW
BEGIN
  SELECT exemplaire_seq.NEXTVAL
  INTO   :new.idExemplaire
  FROM   dual;
END;

CREATE SEQUENCE reservation_seq;
SELECT reservation_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER reservation_increment
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
  SELECT reservation_seq.NEXTVAL
  INTO   :new.idReservation
  FROM   dual;
END;

CREATE SEQUENCE pret_seq;
SELECT pret_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER pret_increment
BEFORE INSERT ON Pret
FOR EACH ROW
BEGIN
  SELECT pret_seq.NEXTVAL
  INTO   :new.idPret
  FROM   dual;
END;

CREATE SEQUENCE auteur_seq;
SELECT auteur_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER auteur_increment
BEFORE INSERT ON Auteur
FOR EACH ROW
BEGIN
  SELECT auteur_seq.NEXTVAL
  INTO   :new.idAuteur
  FROM   dual;
END;

CREATE SEQUENCE editeur_seq;
SELECT editeur_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER editeur_increment
BEFORE INSERT ON Editeur
FOR EACH ROW
BEGIN
  SELECT editeur_seq.NEXTVAL
  INTO   :new.idEditeur
  FROM   dual;
END;

CREATE SEQUENCE categorie_seq;
SELECT categorie_seq.NEXTVAL FROM DUAL;
CREATE OR REPLACE TRIGGER categorie_increment
BEFORE INSERT ON Categorie
FOR EACH ROW
BEGIN
  SELECT categorie_seq.NEXTVAL
  INTO   :new.idCategorie
  FROM   dual;
END;

SET ECHO OFF



