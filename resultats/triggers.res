SQL> 
SQL> -- Verifie que le nombre de prets d'un adherent ne depasse pas le nombre maximal de prets alloues
SQL> CREATE OR REPLACE TRIGGER nbPrets_trigger
  2  BEFORE INSERT ON Pret
  3  REFERENCING OLD AS OLD NEW AS NEW
  4  FOR EACH ROW
  5  DECLARE
  6  CURSOR Curseur IS
  7  	 SELECT COUNT(*)
  8  	 FROM	Pret
  9  	 WHERE Pret.idAdherent = :NEW.idAdherent;
 10  
 11   CURSOR curseur2 IS
 12  	 Select nbMaxPrets
 13  	 From Adherent
 14  	 where	Adherent.idAdherent = :NEW.idAdherent;
 15  
 16  compteur INT;
 17  maxPrets INT;
 18  
 19  BEGIN
 20  compteur := 0;
 21  maxPrets := 0;
 22  
 23  OPEN Curseur;
 24  OPEN Curseur2;
 25  FETCH Curseur INTO compteur;
 26  FETCH curseur2 INTO maxPrets;
 27  IF (compteur >= maxPrets) THEN
 28   raise_application_error(-20100, 'Le nombre maximal de pret est atteint! >>');
 29  END IF;
 30  CLOSE Curseur;
 31  CLOSE Curseur2;
 32  END nbPrets_trigger;
 33  /

Trigger created.

SQL> SHOW ERRORS
No errors.
SQL> 
SQL> -- Verifie que le nombre de jours d'emprunt d'une oeuvre ne depasse pas le nombre maximal de jours alloues
SQL> CREATE OR REPLACE TRIGGER nbJours_trigger
  2  BEFORE INSERT ON Pret
  3  REFERENCING OLD AS OLD NEW AS NEW
  4  FOR EACH ROW
  5  DECLARE
  6  CURSOR Curseur IS
  7  	     SELECT dureeMaxPrets
  8  	     FROM Adherent
  9  	     WHERE Adherent.idAdherent = :NEW.idAdherent;
 10  
 11  duree INTEGER;
 12  maxJours INTEGER;
 13  
 14  BEGIN
 15  maxJours := 0;
 16  OPEN Curseur;
 17  FETCH Curseur INTO maxJours;
 18  	     IF ((:NEW.dateRetour - :NEW.dateEmprunt) > maxJours) THEN
 19  		     raise_application_error(-20100, 'Le delais maximum de pret pour cet oeuvre est atteint >>');
 20  	     END IF;
 21  CLOSE Curseur;
 22  END nbJours_trigger;
 23  /

Trigger created.

SQL> SHOW ERRORS
No errors.
SQL> 
SQL> -- Verifie que l'oeuvre ne peut pas etre emprunte s'il est limite a la consultation
SQL> CREATE OR REPLACE TRIGGER consult_trigger
  2  BEFORE INSERT ON Pret
  3  REFERENCING OLD AS OLD NEW AS NEW
  4  FOR EACH ROW
  5  DECLARE
  6  CURSOR Curseur IS
  7  	     SELECT surPlaceSeulement
  8  	     FROM Exemplaire
  9  	     WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;
 10  
 11  consultation INTEGER;
 12  
 13  BEGIN
 14  consultation :=0;
 15  OPEN Curseur;
 16  FETCH Curseur INTO consultation;
 17  	     IF (consultation = 1) THEN
 18  		     raise_application_error(-20100, 'Cet oeuvre ne peut seulement etre en consultation et ne peut pas etre emprunte >>');
 19  	     END IF;
 20  CLOSE Curseur;
 21  END consult_trigger;
 22  /

Trigger created.

SQL> SHOW ERRORS
No errors.
SQL> 
SQL> -- Verifie que la date de retour est plus grand que la date d'emprunt
SQL> CREATE OR REPLACE TRIGGER date_trigger
  2  BEFORE INSERT ON Pret
  3  REFERENCING OLD AS OLD NEW AS NEW
  4  FOR EACH ROW
  5  DECLARE
  6  BEGIN
  7  IF (:NEW.dateRetour < :NEW.dateEmprunt) THEN
  8  	     raise_application_error(-20100, 'La date de retour ne peut pas etre plus petit que la date empruntee');
  9  END IF;
 10  
 11  END date_trigger;
 12  /

Trigger created.

SQL> SHOW ERRORS
No errors.
SQL> 
SQL> 
SQL> -- Verifie si un exemplaire est deja reserve ou emprunte (verifie la disponibilite de l'exemplaire)
SQL> -- si disponible, on change le statut a prete.
SQL> CREATE OR REPLACE TRIGGER emprunt_trigger
  2  BEFORE INSERT ON Pret
  3  REFERENCING OLD AS OLD NEW AS NEW
  4  FOR EACH ROW
  5  DECLARE
  6  CURSOR Curseur IS
  7  	     SELECT statut
  8  	     FROM Exemplaire
  9  	     WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;
 10  
 11  statut VARCHAR(10);
 12  BEGIN
 13  OPEN Curseur;
 14  FETCH Curseur INTO statut;
 15  	     IF ((statut = 'prete') OR (statut = 'reserve') ) THEN
 16  		     raise_application_error(-20100,'Cet exemplaire ne peut pas etre emprunte.');
 17  
 18  	     ELSE
 19  		     UPDATE Exemplaire
 20  		     SET Exemplaire.statut='prete'
 21  		     WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;
 22  	     END IF;
 23  CLOSE Curseur;
 24  END emprunt_trigger;
 25  /

Trigger created.

SQL> SHOW ERRORS
No errors.
SQL> 
SQL> -- Verifie si un exemplaire est deja reserve (verifie la date de reservation)
SQL> -- si disponible ou emprunter, on change le statut a reserve.
SQL> CREATE OR REPLACE TRIGGER reserve_trigger
  2  BEFORE INSERT ON Reservation
  3  REFERENCING OLD AS OLD NEW AS NEW
  4  FOR EACH ROW
  5  DECLARE
  6  CURSOR Curseur IS
  7  	     SELECT statut
  8  	     FROM Exemplaire
  9  	     WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;
 10  
 11  statut VARCHAR(10);
 12  BEGIN
 13  OPEN Curseur;
 14  FETCH Curseur INTO statut;
 15  	     IF (statut = 'reserve') THEN
 16  		     raise_application_error(-20100, 'Cet exemplaire est deja reserve.');
 17  	     ELSE
 18  		     UPDATE Exemplaire
 19  		     SET Exemplaire.statut='reserve'
 20  		     WHERE Exemplaire.idExemplaire = :NEW.idExemplaire;
 21  	     END IF;
 22  CLOSE Curseur;
 23  END reserve_trigger;
 24  /

Trigger created.

SQL> SHOW ERRORS;
No errors.
SQL> SPOOL OFF
