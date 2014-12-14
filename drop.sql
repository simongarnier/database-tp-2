--
-- Script de nettoyage
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
--
SET ECHO ON

DROP TABLE EditeurOeuvre;
DROP TABLE AuteurOeuvre;
DROP TABLE CategorieOeuvre;
DROP TABLE Pret;
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

DROP SEQUENCE utilisateur_seq;
DROP SEQUENCE oeuvre_seq;
DROP SEQUENCE emplacement_seq;
DROP SEQUENCE exemplaire_seq;
DROP SEQUENCE reservation_seq;
DROP SEQUENCE pret_seq;
DROP SEQUENCE auteur_seq;
DROP SEQUENCE editeur_seq;
DROP SEQUENCE categorie_seq;

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

SET ECHO OFF
