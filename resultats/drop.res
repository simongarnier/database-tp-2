SQL> 
SQL> DROP TABLE EditeurOeuvre;

Table dropped.

SQL> DROP TABLE AuteurOeuvre;

Table dropped.

SQL> DROP TABLE CategorieOeuvre;

Table dropped.

SQL> DROP TABLE Pret;

Table dropped.

SQL> DROP TABLE Reservation;

Table dropped.

SQL> DROP TABLE Employe;

Table dropped.

SQL> DROP TABLE Adherent;

Table dropped.

SQL> DROP TABLE Utilisateur;

Table dropped.

SQL> DROP TABLE Auteur;

Table dropped.

SQL> DROP TABLE Editeur;

Table dropped.

SQL> DROP TABLE Categorie;

Table dropped.

SQL> DROP TABLE Livre;

Table dropped.

SQL> DROP TABLE Musique;

Table dropped.

SQL> DROP TABLE Film;

Table dropped.

SQL> DROP TABLE Exemplaire;

Table dropped.

SQL> DROP TABLE Emplacement;

Table dropped.

SQL> DROP TABLE Oeuvre;

Table dropped.

SQL> 
SQL> DROP TRIGGER nbPrets_trigger;
DROP TRIGGER nbPrets_trigger
*
ERROR at line 1:
ORA-04080: declencheur 'NBPRETS_TRIGGER' n'existe pas 


SQL> DROP TRIGGER nbJours_trigger;
DROP TRIGGER nbJours_trigger
*
ERROR at line 1:
ORA-04080: declencheur 'NBJOURS_TRIGGER' n'existe pas 


SQL> DROP TRIGGER consult_trigger;
DROP TRIGGER consult_trigger
*
ERROR at line 1:
ORA-04080: declencheur 'CONSULT_TRIGGER' n'existe pas 


SQL> DROP TRIGGER date_trigger;
DROP TRIGGER date_trigger
*
ERROR at line 1:
ORA-04080: declencheur 'DATE_TRIGGER' n'existe pas 


SQL> DROP TRIGGER emprunt_trigger;
DROP TRIGGER emprunt_trigger
*
ERROR at line 1:
ORA-04080: declencheur 'EMPRUNT_TRIGGER' n'existe pas 


SQL> DROP TRIGGER reserve_trigger;
DROP TRIGGER reserve_trigger
*
ERROR at line 1:
ORA-04080: declencheur 'RESERVE_TRIGGER' n'existe pas 


SQL> 
SQL> DROP INDEX ind_nom;
DROP INDEX ind_nom
           *
ERROR at line 1:
ORA-01418: l'index indique n'existe pas 


SQL> DROP INDEX ind_numero;
DROP INDEX ind_numero
           *
ERROR at line 1:
ORA-01418: l'index indique n'existe pas 


SQL> DROP INDEX ind_titre;
DROP INDEX ind_titre
           *
ERROR at line 1:
ORA-01418: l'index indique n'existe pas 


SQL> DROP INDEX ind_nomAuteur;
DROP INDEX ind_nomAuteur
           *
ERROR at line 1:
ORA-01418: l'index indique n'existe pas 


SQL> DROP INDEX ind_nomEditeur;
DROP INDEX ind_nomEditeur
           *
ERROR at line 1:
ORA-01418: l'index indique n'existe pas 


SQL> DROP INDEX ind_categorie;
DROP INDEX ind_categorie
           *
ERROR at line 1:
ORA-01418: l'index indique n'existe pas 


SQL> DROP INDEX ind_ISBN;
DROP INDEX ind_ISBN
           *
ERROR at line 1:
ORA-01418: l'index indique n'existe pas 


SQL> 
SQL> SPOOL OFF
