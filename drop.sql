--
-- Script de nettoyage
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
--
SET ECHO ON;

DROP TABLE EditeurOeuvre;
DROP TABLE AuteurOeuvre;
DROP TABLE CategorieOeuvre;
DROP TABLE Pret;
DROP TABLE Reservation;
DROP TABLE Employe;
DROP TABLE Adherent;
DROP TABLE Utilisateur;
DROP TABLE Auteur;
DROP TABLE Editeur;
DROP TABLE Categorie;
DROP TABLE Livre;
DROP TABLE Musique;
DROP TABLE Film;
DROP TABLE Exemplaire;
DROP TABLE Emplacement;
DROP TABLE Oeuvre;

DROP TRIGGER nbPrets_trigger;
DROP TRIGGER nbJours_trigger;
DROP TRIGGER consult_trigger;
DROP TRIGGER date_trigger;
DROP TRIGGER emprunt_trigger;
DROP TRIGGER reserve_trigger;

DROP TRIGGER utilisateur_increment;
DROP TRIGGER oeuvre_increment;
DROP TRIGGER emplacement_increment;
DROP TRIGGER exemplaire_increment;
DROP TRIGGER reservation_increment;
DROP TRIGGER pret_increment;
DROP TRIGGER auteur_increment;
DROP TRIGGER editeur_increment;
DROP TRIGGER categorie_increment;

DROP INDEX ind_nom;
DROP INDEX ind_numero;
DROP INDEX ind_titre;
DROP INDEX ind_nomAuteur;
DROP INDEX ind_nomEditeur;
DROP INDEX ind_categorie;
DROP INDEX ind_ISBN;


SET ECHO OFF;
