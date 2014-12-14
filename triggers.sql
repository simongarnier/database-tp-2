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
CURSOR Curseur IS
	SELECT dureeMaxPrets
	FROM Adherent
	WHERE Adherent.idAdherent = :NEW.idAdherent;

duree INTEGER;
maxJours INTEGER;

BEGIN
maxJours := 0;
OPEN Curseur;
FETCH Curseur INTO maxJours;
	IF ((:NEW.dateRetour - :NEW.dateEmprunt) > maxJours) THEN
		raise_application_error(-20100, 'Le delais maximum de pret pour cet oeuvre est atteint >>');
	END IF;
CLOSE Curseur;
END nbJours_trigger;
/
SHOW ERRORS

-- Verifie que l'oeuvre ne peut pas etre emprunte s'il est limite a la consultation 
CREATE OR REPLACE TRIGGER consult_trigger
BEFORE INSERT ON Pret
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
CURSOR Curseur IS
	SELECT surPlaceSeulement
	FROM Exemplaire
	WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;

consultation INTEGER;

BEGIN
consultation :=0;
OPEN Curseur;
FETCH Curseur INTO consultation;
	IF (consultation = 1) THEN
		raise_application_error(-20100, 'Cet oeuvre ne peut seulement etre en consultation et ne peut pas etre emprunte >>');
	END IF;
CLOSE Curseur;
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


-- Verifie si un exemplaire est deja reserve ou emprunte (verifie la disponibilite de l'exemplaire)
-- si disponible, on change le statut a prete.
CREATE OR REPLACE TRIGGER emprunt_trigger
BEFORE INSERT ON Pret
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
CURSOR Curseur IS
	SELECT statut
	FROM Exemplaire
	WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;

statut VARCHAR(10);
BEGIN
OPEN Curseur;
FETCH Curseur INTO statut;
	IF ((statut = 'prete') OR (statut = 'reserve') ) THEN
		raise_application_error(-20100,'Cet exemplaire ne peut pas etre emprunte.');
	
	ELSE
		UPDATE Exemplaire
		SET Exemplaire.statut='prete'
		WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;
	END IF;
CLOSE Curseur;
END emprunt_trigger;
/
SHOW ERRORS

-- Verifie si un exemplaire est deja reserve (verifie la date de reservation)
-- si disponible ou emprunter, on change le statut a reserve.
CREATE OR REPLACE TRIGGER reserve_trigger
BEFORE INSERT ON Reservation
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
CURSOR Curseur IS
	SELECT statut
	FROM Exemplaire
	WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;

statut VARCHAR(10);
BEGIN
OPEN Curseur;
FETCH Curseur INTO statut;
	IF (statut = 'reserve') THEN
		raise_application_error(-20100, 'Cet exemplaire est deja reserve.');
	ELSE
		UPDATE Exemplaire
		SET Exemplaire.statut='reserve'
		WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;
	END IF;
CLOSE Curseur;
END reserve_trigger;
/
SHOW ERRORS;

--
CREATE OR REPLACE TRIGGER date_retour_trigger 
AFTER INSERT ON Pret 
REFERENCING OLD AS OLD NEW AS NEW 
FOR EACH ROW 
DECLARE 
CURSOR Curseur IS 
SELECT dureeMaxPrets 
FROM Adherent 
WHERE Adherent.idAdherent = :NEW.idAdherent;
maxJours INTEGER;
BEGIN 
maxJours := 0;
OPEN Curseur; 
 FETCH Curseur INTO maxJours; 
 		UPDATE Pret 
 		SET Pret.dateRetour = CURRENT_DATE + maxJours   
 		WHERE Pret.idPret  = :NEW.idPret ; 
 CLOSE Curseur; 
 END date_retour_trigger; 
 / 
 SHOW ERRORS;


SET ECHO OFF