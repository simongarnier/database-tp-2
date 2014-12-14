SQL> 
SQL> INSERT INTO Utilisateur VALUES ('1','GARS13069209', 'Garnier', 'Simon');

1 row created.

SQL> INSERT INTO Utilisateur VALUES ('2','LACF18048601', 'Lacoste', 'Francis');

1 row created.

SQL> INSERT INTO Utilisateur VALUES ('3','PHAC02579100', 'Pham', 'Caroline');

1 row created.

SQL> INSERT INTO Utilisateur VALUES ('4','AMIS25119000', 'Amirthagunabalasingam', 'Sivapalan');

1 row created.

SQL> INSERT INTO Utilisateur VALUES ('5','bd2', 'Zaier', 'Zaid');

1 row created.

SQL> INSERT INTO Utilisateur VALUES ('6','bd', 'Godin', 'Robert');

1 row created.

SQL> INSERT INTO Utilisateur VALUES ('7', 'agile', 'Berger', 'Jacques');

1 row created.

SQL> 
SQL> INSERT INTO Employe VALUES ('5','zz', 'bibliothecaire');

1 row created.

SQL> INSERT INTO Employe VALUES ('6','gg', 'responsable des adherents');

1 row created.

SQL> INSERT INTO Employe VALUES ('3', 'pp', 'responsable des oeuvres');

1 row created.

SQL> INSERT INTO Employe VALUES ('1', 'ggs', 'employe');

1 row created.

SQL> 
SQL> INSERT INTO Adherent VALUES ('2', '2010','Berri','514-111-1111','3','4');

1 row created.

SQL> INSERT INTO Adherent VALUES ('4', '2020','Bleury','514-222-2222','3','4');

1 row created.

SQL> INSERT INTO Adherent VALUES ('7', '4000','Parc','514-444-4444','3','4');

1 row created.

SQL> 
SQL> INSERT INTO Oeuvre VALUES ('10','Systèmes de gestion de bases de données par exemple');

1 row created.

SQL> INSERT INTO Emplacement VALUES ('74','005.74 G585s','5','Collection Livres');

1 row created.

SQL> INSERT INTO Exemplaire VALUES ('35','10','disponible','livre',1,'74', '#RS2382-01');

1 row created.

SQL> INSERT INTO Auteur VALUES ('6','Godin','Robert');

1 row created.

SQL> INSERT INTO Editeur VALUES ('12','Longueuil : Loze-Dion, ©2012');

1 row created.

SQL> INSERT INTO Categorie VALUES ('56','Base de données');

1 row created.

SQL> INSERT INTO AuteurOeuvre VALUES ('6','10');

1 row created.

SQL> INSERT INTO EditeurOeuvre VALUES ('12','10');

1 row created.

SQL> INSERT INTO CategorieOeuvre VALUES ('56','10');

1 row created.

SQL> INSERT INTO Livre VALUES ('35','978-2-923-56557-6','920');

1 row created.

SQL> 
SQL> INSERT INTO Oeuvre VALUES ('25','UML 2 pour les bases de données');

1 row created.

SQL> INSERT INTO Emplacement VALUES ('75','005.74 S7289u','7','Documentaires');

1 row created.

SQL> INSERT INTO Emplacement VALUES ('32', '005.93 S935u', '1', 'Informatique');

1 row created.

SQL> INSERT INTO Emplacement VALUES ('48', '005.37. S112u', '3', 'UML');

1 row created.

SQL> INSERT INTO Exemplaire VALUES ('23','25','disponible','livre',0,'75','#RS4563-01');

1 row created.

SQL> INSERT INTO Exemplaire VALUES ('22','25','disponible','livre',0,'32','#RS4563-02');

1 row created.

SQL> INSERT INTO Exemplaire VALUES ('24','25','reserve','livre',0,'48','#RS4563-03');

1 row created.

SQL> INSERT INTO Auteur VALUES ('45','Soutou','Christian');

1 row created.

SQL> INSERT INTO Editeur VALUES ('34','Paris : Eyrolles,c2012.');

1 row created.

SQL> INSERT INTO Categorie VALUES ('78','UML');

1 row created.

SQL> INSERT INTO AuteurOeuvre VALUES ('45','25');

1 row created.

SQL> INSERT INTO EditeurOeuvre VALUES ('34','25');

1 row created.

SQL> INSERT INTO CategorieOeuvre VALUES ('56','10');

1 row created.

SQL> INSERT INTO Livre VALUES ('23','978-2-212-12091-2','321');

1 row created.

SQL> INSERT INTO Livre VALUES ('22','978-2-212-12091-1','321');

1 row created.

SQL> INSERT INTO Livre VALUES ('24','978-2-212-12091-3','321');

1 row created.

SQL> 
SQL> INSERT INTO Oeuvre VALUES ('28','A mind of winter');

1 row created.

SQL> INSERT INTO Emplacement VALUES ('69','CLA 1 B4683-1m','1','Disques compacts');

1 row created.

SQL> INSERT INTO Exemplaire VALUES ('46','28','disponible','CD',0,'69','#RS8796-01');

1 row created.

SQL> INSERT INTO Auteur VALUES ('77','Benjamin','George');

1 row created.

SQL> INSERT INTO Editeur VALUES ('88','[Wyastone Leys, Monmouth, England] : Nimbus Records, p2000.');

1 row created.

SQL> INSERT INTO Categorie VALUES ('99','Orchestre');

1 row created.

SQL> INSERT INTO AuteurOeuvre VALUES ('77','28');

1 row created.

SQL> INSERT INTO EditeurOeuvre VALUES ('88','28');

1 row created.

SQL> INSERT INTO CategorieOeuvre VALUES ('99','28');

1 row created.

SQL> INSERT INTO Musique VALUES ('46','71');

1 row created.

SQL> 
SQL> INSERT INTO Oeuvre VALUES ('98','Informatique');

1 row created.

SQL> INSERT INTO Emplacement VALUES ('55','004 I433 1998','3','Vidéo Cassette');

1 row created.

SQL> INSERT INTO Exemplaire VALUES ('33','98','disponible','cassette',0,'55','#RS8796-01');

1 row created.

SQL> INSERT INTO Auteur VALUES ('48','Guy', 'Simonin');

1 row created.

SQL> INSERT INTO Auteur VALUES ('50','Jacques', 'Bosc');

1 row created.

SQL> INSERT INTO Editeur VALUES ('6','[Paris ] : Centre national de documentation pédagogique ; [Montréal] : Amérimage Québec : TéléQuébec, c1998.');

1 row created.

SQL> INSERT INTO Categorie VALUES ('123','Informatique');

1 row created.

SQL> INSERT INTO AuteurOeuvre VALUES ('48','98');

1 row created.

SQL> INSERT INTO AuteurOeuvre VALUES ('50','98');

1 row created.

SQL> INSERT INTO EditeurOeuvre VALUES ('6','98');

1 row created.

SQL> INSERT INTO CategorieOeuvre VALUES ('123','98');

1 row created.

SQL> INSERT INTO Film VALUES ('33','60');

1 row created.

SQL> 
SQL> INSERT INTO Oeuvre VALUES ('15','Les oubliés du XXIe siècle ou la fin du travail');

1 row created.

SQL> INSERT INTO Emplacement VALUES ('827','004 V235 0900','8','Électronique');

1 row created.

SQL> INSERT INTO Exemplaire VALUES ('2','15','prete','DVD',1,'827','#RS8275-01');

1 row created.

SQL> INSERT INTO Auteur VALUES ('9','Tremblay','Marc');

1 row created.

SQL> INSERT INTO Editeur VALUES ('7','Montréal : Office national du film du Canada, 2000.');

1 row created.

SQL> INSERT INTO Categorie VALUES ('456','Économie');

1 row created.

SQL> INSERT INTO AuteurOeuvre VALUES ('9','15');

1 row created.

SQL> INSERT INTO EditeurOeuvre VALUES ('7','15');

1 row created.

SQL> INSERT INTO CategorieOeuvre VALUES ('456','15');

1 row created.

SQL> INSERT INTO Film VALUES ('2','52');

1 row created.

SQL> 
SQL> INSERT INTO Reservation VALUES ('009',TO_DATE('2014/12/03 21:02:44','yyyy/mm/dd hh24:mi:ss'),'2','22');

1 row created.

SQL> INSERT INTO Reservation VALUES ('010',TO_DATE('2014/12/03 21:05:50','yyyy/mm/dd hh24:mi:ss'),'2','35');

1 row created.

SQL> 
SQL> INSERT INTO Pret VALUES ('800', TO_DATE('2014/12/02 10:02:44','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','23');

1 row created.

SQL> INSERT INTO Pret VALUES ('801', TO_DATE('2014/12/02 10:05:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','46');

1 row created.

SQL> INSERT INTO Pret VALUES ('802', TO_DATE('2014/12/02 10:08:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','33');

1 row created.

SQL> 
SQL> 
SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> -- Trigger : nbPrets_triggers
SQL> INSERT INTO Pret VALUES ('803', TO_DATE('2014/12/02 10:10:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/20 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','2');
INSERT INTO Pret VALUES ('803', TO_DATE('2014/12/02 10:10:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/20 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','2')
            *
ERROR at line 1:
ORA-20100: Cet exemplaire ne peut pas etre emprunte. 
ORA-06512: a "DH691105.EMPRUNT_TRIGGER", ligne 12 
ORA-04088: erreur lors d'execution du declencheur 'DH691105.EMPRUNT_TRIGGER' 


SQL> ROLLBACK;

Rollback complete.

SQL> 
SQL> --Trigger : nbJours_triggers
SQL> INSERT INTO Pret VALUES ('804', TO_DATE('2014/12/02 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/20 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','2');
INSERT INTO Pret VALUES ('804', TO_DATE('2014/12/02 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/20 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','2')
            *
ERROR at line 1:
ORA-20100: Cet exemplaire ne peut pas etre emprunte. 
ORA-06512: a "DH691105.EMPRUNT_TRIGGER", ligne 12 
ORA-04088: erreur lors d'execution du declencheur 'DH691105.EMPRUNT_TRIGGER' 


SQL> ROLLBACK;

Rollback complete.

SQL> 
SQL> --Trigger : consult_triggers
SQL> INSERT INTO Pret VALUES ('805', TO_DATE('2014/12/02 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','35');
INSERT INTO Pret VALUES ('805', TO_DATE('2014/12/02 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','35')
            *
ERROR at line 1:
ORA-20100: Cet exemplaire ne peut pas etre emprunte. 
ORA-06512: a "DH691105.EMPRUNT_TRIGGER", ligne 12 
ORA-04088: erreur lors d'execution du declencheur 'DH691105.EMPRUNT_TRIGGER' 


SQL> ROLLBACK;

Rollback complete.

SQL> 
SQL> -- Trigger : date_trigger
SQL> INSERT INTO Pret VALUES ('806', TO_DATE('2014/12/04 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/02 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','2');
INSERT INTO Pret VALUES ('806', TO_DATE('2014/12/04 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/02 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','2')
            *
ERROR at line 1:
ORA-20100: Cet exemplaire ne peut pas etre emprunte. 
ORA-06512: a "DH691105.EMPRUNT_TRIGGER", ligne 12 
ORA-04088: erreur lors d'execution du declencheur 'DH691105.EMPRUNT_TRIGGER' 


SQL> ROLLBACK;

Rollback complete.

SQL> 
SQL> -- Trigger : emprunt_trigger
SQL> INSERT INTO Pret VALUES ('807', TO_DATE('2014/12/02 10:08:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','33');
INSERT INTO Pret VALUES ('807', TO_DATE('2014/12/02 10:08:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','33')
            *
ERROR at line 1:
ORA-20100: Cet exemplaire ne peut pas etre emprunte. 
ORA-06512: a "DH691105.EMPRUNT_TRIGGER", ligne 12 
ORA-04088: erreur lors d'execution du declencheur 'DH691105.EMPRUNT_TRIGGER' 


SQL> ROLLBACK;

Rollback complete.

SQL> 
SQL> -- Trigger : reserve_trigger
SQL> INSERT INTO Reservation VALUES ('808',TO_DATE('2014/12/03 21:02:44','yyyy/mm/dd hh24:mi:ss'),'7','22');
INSERT INTO Reservation VALUES ('808',TO_DATE('2014/12/03 21:02:44','yyyy/mm/dd hh24:mi:ss'),'7','22')
            *
ERROR at line 1:
ORA-20100: Cet exemplaire est deja reserve. 
ORA-06512: a "DH691105.RESERVE_TRIGGER", ligne 12 
ORA-04088: erreur lors d'execution du declencheur 'DH691105.RESERVE_TRIGGER' 


SQL> ROLLBACK;

Rollback complete.

SQL> 
SQL> DELETE FROM EditeurOeuvre;

5 rows deleted.

SQL> DELETE FROM AuteurOeuvre;

6 rows deleted.

SQL> DELETE FROM CategorieOeuvre;

5 rows deleted.

SQL> DELETE FROM Pret;

3 rows deleted.

SQL> DELETE FROM Reservation;

2 rows deleted.

SQL> DELETE FROM Employe;

4 rows deleted.

SQL> DELETE FROM Adherent;

3 rows deleted.

SQL> DELETE FROM Utilisateur;

7 rows deleted.

SQL> DELETE FROM Auteur;

6 rows deleted.

SQL> DELETE FROM Editeur;

5 rows deleted.

SQL> DELETE FROM Categorie;

5 rows deleted.

SQL> DELETE FROM Livre;

4 rows deleted.

SQL> DELETE FROM Musique;

1 row deleted.

SQL> DELETE FROM Film;

2 rows deleted.

SQL> DELETE FROM Exemplaire;

7 rows deleted.

SQL> DELETE FROM Emplacement;

7 rows deleted.

SQL> DELETE FROM Oeuvre;

5 rows deleted.

SQL> SPOOL OFF
