--
-- Script de creation des triggers
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
--
SET ECHO ON

-- Verifie que le nombre de prets d'un adherent ne depasse pas le nombre maximal de prets alloues
CREATE OR REPLACE TRIGGER nbPrets_trigger 
BEFORE INSERT ON Pret
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW   
DECLARE 
CURSOR Curseur IS
    SELECT COUNT(*)
    FROM   Pret 
    WHERE Pret.idAdherent = :NEW.idAdherent;
	  
 CURSOR curseur2 IS
    Select nbMaxPrets
    From Adherent 
    where  Adherent.idAdherent = :NEW.idAdherent;
  
compteur INT;
maxPrets INT;

BEGIN
compteur := 0;
maxPrets := 0;

OPEN Curseur;
OPEN Curseur2;
FETCH Curseur INTO compteur;  
FETCH curseur2 INTO maxPrets;  
IF (compteur >= maxPrets) THEN
 raise_application_error(-20100, 'Le nombre maximal de pret est atteint! >>');
END IF;
CLOSE Curseur;
CLOSE Curseur2;
END nbPrets_trigger;
/
SHOW ERRORS

-- Verifie que le nombre de jours d'emprunt d'une oeuvre ne depasse pas le nombre maximal de jours alloues
CREATE OR REPLACE TRIGGER nbJours_trigger
BEFORE INSERT ON Pret
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
CURSOR Curseur3 IS
	SELECT dureeMaxPrets
	FROM Adherent
	WHERE Adherent.idAdherent = :NEW.idAdherent;

duree INTEGER;
maxJours INTEGER;

BEGIN
maxJours := 0;
OPEN Curseur3;
FETCH Curseur3 INTO maxJours;
	IF ((:NEW.dateRetour - :NEW.dateEmprunt) > maxJours) THEN
		raise_application_error(-20100, 'Le delais maximum de pret pour cet oeuvre est atteint >>');
	END IF;
CLOSE Curseur3;
END nbJours_trigger;
/
SHOW ERRORS

-- Verifie que l'oeuvre ne peut pas etre emprunte s'il est limite a la consultation 
CREATE OR REPLACE TRIGGER consult_trigger
BEFORE INSERT ON Pret
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
CURSOR Curseur5 IS
	SELECT surPlaceSeulement
	FROM Exemplaire
	WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;

consultation INTEGER;

BEGIN
consultation :=0;
OPEN Curseur5;
FETCH Curseur5 INTO consultation;
	IF (consultation = 1) THEN
		raise_application_error(-20100, 'Cet oeuvre ne peut seulement etre en consultation et ne peut pas etre emprunte >>');
	END IF;
CLOSE Curseur5;
END consult_trigger;
/
SHOW ERRORS

-- Verifie que la date de retour est plus grand que la date d'emprunt
CREATE OR REPLACE TRIGGER date_trigger
BEFORE INSERT ON Pret
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
BEGIN
IF (:NEW.dateRetour < :NEW.dateEmprunt) THEN
	raise_application_error(-20100, 'La date de retour ne peut pas etre plus petit que la date empruntee');
END IF;

END date_trigger;
/
SHOW ERRORS


-- On ne peut pas emprunter un oeuvre qui est reserve ou emprunter deja
-- il faut verifier le nombre disponibles de exemplaires de cet oeuvre


-- On ne peut pas reserver un exemplaire qui est deja reserver a ce moment la



SET ECHO OFF