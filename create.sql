--
-- Script de creation des tables
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
--
--
SET ECHO ON;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='yyyy.mm.dd';
SET SERVEROUTPUT ON SIZE UNLIMITED;
SPOOL resultats/create.res;

CREATE TABLE Utilisateur
(
	idUtilisateur 		INTEGER NOT NULL PRIMARY KEY,
	motPass 			VARCHAR(20) NOT NULL,
	nom 				VARCHAR(200) NOT NULL,
	prenom 				VARCHAR(200) NOT NULL
);

CREATE TABLE Employe
(
	idEmploye 			INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur) ON DELETE CASCADE,
	codeMatricule 		VARCHAR(20) NOT NULL UNIQUE,
	categorie			VARCHAR2(40) CHECK( categorie IN ('bibliothecaire', 'employe', 'responsable des adherents', 'responsable des oeuvres') )
);

CREATE TABLE Adherent
(
	idAdherent 			INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur) ON DELETE CASCADE,
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
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE,
	statut				VARCHAR2(10) CHECK( statut IN ('prete', 'disponible', 'reserve') ),
	nomSupport 			VARCHAR2(10) CHECK( nomSupport IN ('livre', 'cassette', 'audio', 'video','CD','DVD') ),
	surPlaceSeulement 	NUMBER(1) NOT NULL,
	idEmplacement 		INTEGER REFERENCES Emplacement(idEmplacement) ON DELETE CASCADE,
	numeroExamplaire 	VARCHAR2(10) NOT NULL
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
	idAdherent			INTEGER REFERENCES Adherent(idAdherent) ON DELETE CASCADE,
	idExemplaire		INTEGER REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE
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
	idAuteur			INTEGER REFERENCES Auteur(idAuteur) ON DELETE CASCADE,
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE
);

CREATE TABLE EditeurOeuvre
(
	idEditeur			INTEGER REFERENCES Editeur(idEditeur) ON DELETE CASCADE,
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE
);

CREATE TABLE CategorieOeuvre
(
	idCategorie			INTEGER REFERENCES Categorie(idCategorie) ON DELETE CASCADE,
	idOeuvre 			INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE
);

CREATE TABLE Livre
(
	idLivre				INTEGER PRIMARY KEY REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE,
	ISBN	 			VARCHAR(40) NOT NULL,
	nbPages				INTEGER NOT NULL
);

CREATE TABLE Musique
(
	idMusique	 		INTEGER PRIMARY KEY REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE,
	duree				INTEGER NOT NULL
);

CREATE TABLE Film
(
	idFilm		 		INTEGER PRIMARY KEY REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE,
	duree				INTEGER NOT NULL
);

-- Liste des index
CREATE INDEX ind_nom ON Utilisateur(nom);

CREATE INDEX ind_numero ON Adherent(numero);

CREATE INDEX ind_titre ON Oeuvre(titre);

CREATE INDEX ind_nomAuteur ON Auteur(nom);

CREATE INDEX ind_nomEditeur ON Editeur(nomEditeur);

CREATE INDEX ind_categorie ON Categorie(descripteur);

CREATE INDEX ind_ISBN ON Livre(ISBN);

SPOOL OFF
SET ECHO OFF;
