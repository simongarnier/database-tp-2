--
-- Script de nettoyage
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
--
SET ECHO ON;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='yyyy.mm.dd';
SET SERVEROUTPUT ON SIZE UNLIMITED;     
SPOOL resultats/drop.res;

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

DROP INDEX ind_nom;
DROP INDEX ind_numero;
DROP INDEX ind_titre;
DROP INDEX ind_nomAuteur;
DROP INDEX ind_nomEditeur;
DROP INDEX ind_categorie;
DROP INDEX ind_ISBN;

SPOOL OFF
SET ECHO OFF;
