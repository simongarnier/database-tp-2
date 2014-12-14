SQL> 
SQL> CREATE TABLE Utilisateur
  2  (
  3  	     idUtilisateur	     INTEGER NOT NULL PRIMARY KEY,
  4  	     motPass			     VARCHAR(20) NOT NULL,
  5  	     nom			     VARCHAR(200) NOT NULL,
  6  	     prenom			     VARCHAR(200) NOT NULL
  7  );

Table created.

SQL> 
SQL> CREATE TABLE Employe
  2  (
  3  	     idEmploye			     INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur) ON DELETE CASCADE,
  4  	     codeMatricule	     VARCHAR(20) NOT NULL UNIQUE,
  5  	     categorie			     VARCHAR2(40) CHECK( categorie IN ('bibliothecaire', 'employe', 'responsable des adherents', 'responsable des oeuvres') )
  6  );

Table created.

SQL> 
SQL> CREATE TABLE Adherent
  2  (
  3  	     idAdherent 		     INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur) ON DELETE CASCADE,
  4  	     numero			     INTEGER NOT NULL,
  5  	     adresse			     VARCHAR(200) NOT NULL,
  6  	     telephone			     VARCHAR(12) NOT NULL,
  7  	     nbMaxPrets 		     INTEGER DEFAULT 3,
  8  	     dureeMaxPrets	     INTEGER DEFAULT 4
  9  );

Table created.

SQL> 
SQL> CREATE TABLE Oeuvre
  2  (
  3  	     idOeuvre			     INTEGER NOT NULL PRIMARY KEY,
  4  	     titre			     VARCHAR(200) NOT NULL
  5  );

Table created.

SQL> 
SQL> CREATE TABLE Emplacement
  2  (
  3  	     idEmplacement	     Integer NOT NULL PRIMARY KEY,
  4  	     travee			     Varchar(40) NOT NULL,
  5  	     etagere			     Varchar(40) NOT NULL,
  6  	     rayon			     Varchar(40) NOT NULL
  7  );

Table created.

SQL> 
SQL> CREATE TABLE Exemplaire
  2  (
  3  	     idExemplaire	     INTEGER NOT NULL PRIMARY KEY,
  4  	     idOeuvre			     INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE,
  5  	     statut			     VARCHAR2(10) CHECK( statut IN ('prete', 'disponible', 'reserve') ),
  6  	     nomSupport 		     VARCHAR2(10) CHECK( nomSupport IN ('livre', 'cassette', 'audio', 'video','CD','DVD') ),
  7  	     surPlaceSeulement	     NUMBER(1) NOT NULL,
  8  	     idEmplacement	     INTEGER REFERENCES Emplacement(idEmplacement) ON DELETE CASCADE,
  9  	     numeroExamplaire	     VARCHAR2(10) NOT NULL
 10  );

Table created.

SQL> 
SQL> CREATE TABLE Reservation
  2  (
  3  	     idReservation	     INTEGER NOT NULL PRIMARY KEY,
  4  	     dateFinReservation      DATE,
  5  	     idAdherent 		     INTEGER REFERENCES Adherent(idAdherent),
  6  	     idExemplaire	     INTEGER REFERENCES Exemplaire(idExemplaire)
  7  );

Table created.

SQL> 
SQL> CREATE TABLE Pret
  2  (
  3  	     idPret			     INTEGER NOT NULL PRIMARY KEY,
  4  	     dateEmprunt		     DATE,
  5  	     dateRetour 		     DATE,
  6  	     idAdherent 		     INTEGER REFERENCES Adherent(idAdherent) ON DELETE CASCADE,
  7  	     idExemplaire	     INTEGER REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE
  8  );

Table created.

SQL> 
SQL> CREATE TABLE Auteur
  2  (
  3  	     idAuteur			     INTEGER NOT NULL PRIMARY KEY,
  4  	     nom			     VARCHAR(200) NOT NULL,
  5  	     prenom			     VARCHAR(200) NOT NULL
  6  );

Table created.

SQL> 
SQL> CREATE TABLE Editeur
  2  (
  3  	     idEditeur			     INTEGER NOT NULL PRIMARY KEY,
  4  	     nomEditeur 		     VARCHAR(200)
  5  );

Table created.

SQL> 
SQL> CREATE TABLE Categorie
  2  (
  3  	     idCategorie		     INTEGER NOT NULL PRIMARY KEY,
  4  	     descripteur		     Varchar(200) NOT NULL
  5  );

Table created.

SQL> 
SQL> CREATE TABLE AuteurOeuvre
  2  (
  3  	     idAuteur			     INTEGER REFERENCES Auteur(idAuteur) ON DELETE CASCADE,
  4  	     idOeuvre			     INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE
  5  );

Table created.

SQL> 
SQL> CREATE TABLE EditeurOeuvre
  2  (
  3  	     idEditeur			     INTEGER REFERENCES Editeur(idEditeur) ON DELETE CASCADE,
  4  	     idOeuvre			     INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE
  5  );

Table created.

SQL> 
SQL> CREATE TABLE CategorieOeuvre
  2  (
  3  	     idCategorie		     INTEGER REFERENCES Categorie(idCategorie) ON DELETE CASCADE,
  4  	     idOeuvre			     INTEGER REFERENCES Oeuvre(idOeuvre) ON DELETE CASCADE
  5  );

Table created.

SQL> 
SQL> CREATE TABLE Livre
  2  (
  3  	     idLivre			     INTEGER PRIMARY KEY REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE,
  4  	     ISBN			     VARCHAR(40) NOT NULL,
  5  	     nbPages			     INTEGER NOT NULL
  6  );

Table created.

SQL> 
SQL> CREATE TABLE Musique
  2  (
  3  	     idMusique			     INTEGER PRIMARY KEY REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE,
  4  	     duree			     INTEGER NOT NULL
  5  );

Table created.

SQL> 
SQL> CREATE TABLE Film
  2  (
  3  	     idFilm			     INTEGER PRIMARY KEY REFERENCES Exemplaire(idExemplaire) ON DELETE CASCADE,
  4  	     duree			     INTEGER NOT NULL
  5  );

Table created.

SQL> 
SQL> -- Liste des index
SQL> CREATE INDEX ind_nom ON Utilisateur(nom);

Index created.

SQL> 
SQL> CREATE INDEX ind_numero ON Adherent(numero);

Index created.

SQL> 
SQL> CREATE INDEX ind_titre ON Oeuvre(titre);

Index created.

SQL> 
SQL> CREATE INDEX ind_nomAuteur ON Auteur(nom);

Index created.

SQL> 
SQL> CREATE INDEX ind_nomEditeur ON Editeur(nomEditeur);

Index created.

SQL> 
SQL> CREATE INDEX ind_categorie ON Categorie(descripteur);

Index created.

SQL> 
SQL> CREATE INDEX ind_ISBN ON Livre(ISBN);

Index created.

SQL> 
SQL> SPOOL OFF
