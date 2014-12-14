--
-- Script de remplissage
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
--
SET LINESIZE 160
SET ECHO ON

INSERT INTO Utilisateur VALUES ('1','GARS13069209', 'Garnier', 'Simon'); 
INSERT INTO Utilisateur VALUES ('2','LACF18048601', 'Lacoste', 'Francis'); 
INSERT INTO Utilisateur VALUES ('3','PHAC02579100', 'Pham', 'Caroline'); 
INSERT INTO Utilisateur VALUES ('4','AMIS25119000', 'Amirthagunabalasingam', 'Sivapalan'); 
INSERT INTO Utilisateur VALUES ('5','bd2', 'Zaier', 'Zaid'); 
INSERT INTO Utilisateur VALUES ('6','bd', 'Godin', 'Robert');
INSERT INTO Utilisateur VALUES ('7', 'agile', 'Berger', 'Jacques'); 

INSERT INTO Employe VALUES ('5','zz', 'bibliothecaire');
INSERT INTO Employe VALUES ('6','gg', 'responsable des adherents');
INSERT INTO Employe VALUES ('3', 'pp', 'responsable des oeuvres');
INSERT INTO Employe VALUES ('1', 'ggs', 'employe');

INSERT INTO Adherent VALUES ('2', '2010','Berri','514-111-1111','3','4');
INSERT INTO Adherent VALUES ('4', '2020','Bleury','514-222-2222','3','4');
INSERT INTO Adherent VALUES ('7', '4000','Parc','514-444-4444','3','4');

INSERT INTO Oeuvre VALUES ('10','Systèmes de gestion de bases de données par exemple');
INSERT INTO Emplacement VALUES ('74','005.74 G585s','5','Collection Livres');
INSERT INTO Exemplaire VALUES ('35','10','disponible','livre',1,'74');
INSERT INTO Auteur VALUES ('6','Godin','Robert');
INSERT INTO Editeur VALUES ('12','Longueuil : Loze-Dion, ©2012');
INSERT INTO Categorie VALUES ('56','Base de données');
INSERT INTO AuteurOeuvre VALUES ('6','10');
INSERT INTO EditeurOeuvre VALUES ('12','10');
INSERT INTO CategorieOeuvre VALUES ('56','10');
INSERT INTO Livre VALUES ('35','978-2-923-56557-6','920');

INSERT INTO Oeuvre VALUES ('25','UML 2 pour les bases de données');
INSERT INTO Emplacement VALUES ('75','005.74 S7289u','7','Documentaires');
INSERT INTO Emplacement VALUES ('32', '005.93 S935u', '1', 'Informatique');
INSERT INTO Emplacement VALUES ('48', '005.37. S112u', '3', 'UML');
INSERT INTO Exemplaire VALUES ('23','25','disponible','livre',0,'75');
INSERT INTO Exemplaire VALUES ('22','25','disponible','livre',0,'32');
INSERT INTO Exemplaire VALUES ('24','25','reserve','livre',0,'48');
INSERT INTO Auteur VALUES ('45','Soutou','Christian');
INSERT INTO Editeur VALUES ('34','Paris : Eyrolles,c2012.');
INSERT INTO Categorie VALUES ('78','UML');
INSERT INTO AuteurOeuvre VALUES ('45','25');
INSERT INTO EditeurOeuvre VALUES ('34','25');
INSERT INTO CategorieOeuvre VALUES ('56','10');
INSERT INTO Livre VALUES ('23','978-2-212-12091-2','321');
INSERT INTO Livre VALUES ('22','978-2-212-12091-1','321');
INSERT INTO Livre VALUES ('24','978-2-212-12091-3','321');

INSERT INTO Oeuvre VALUES ('28','A mind of winter');
INSERT INTO Emplacement VALUES ('69','CLA 1 B4683-1m','1','Disques compacts');
INSERT INTO Exemplaire VALUES ('46','28','disponible','CD',0,'69');
INSERT INTO Auteur VALUES ('77','Benjamin','George');
INSERT INTO Editeur VALUES ('88','[Wyastone Leys, Monmouth, England] : Nimbus Records, p2000.');
INSERT INTO Categorie VALUES ('99','Orchestre');
INSERT INTO AuteurOeuvre VALUES ('77','28');
INSERT INTO EditeurOeuvre VALUES ('88','28');
INSERT INTO CategorieOeuvre VALUES ('99','28');
INSERT INTO Musique VALUES ('46','71');

INSERT INTO Oeuvre VALUES ('98','Informatique');
INSERT INTO Emplacement VALUES ('55','004 I433 1998','3','Vidéo Cassette');
INSERT INTO Exemplaire VALUES ('33','98','disponible','cassette',0,'55');
INSERT INTO Auteur VALUES ('48','Guy', 'Simonin');
INSERT INTO Auteur VALUES ('50','Jacques', 'Bosc');
INSERT INTO Editeur VALUES ('6','[Paris ] : Centre national de documentation pédagogique ; [Montréal] : Amérimage Québec : TéléQuébec, c1998.');
INSERT INTO Categorie VALUES ('123','Informatique');
INSERT INTO AuteurOeuvre VALUES ('48','98');
INSERT INTO AuteurOeuvre VALUES ('50','98');
INSERT INTO EditeurOeuvre VALUES ('6','98');
INSERT INTO CategorieOeuvre VALUES ('123','98');
INSERT INTO Film VALUES ('33','60');

INSERT INTO Oeuvre VALUES ('15','Les oubliés du XXIe siècle ou la fin du travail');
INSERT INTO Emplacement VALUES ('827','004 V235 0900','8','Électronique');
INSERT INTO Exemplaire VALUES ('2','15','prete','DVD',1,'827');
INSERT INTO Auteur VALUES ('9','Tremblay','Marc');
INSERT INTO Editeur VALUES ('7','Montréal : Office national du film du Canada, 2000.');
INSERT INTO Categorie VALUES ('456','Économie');
INSERT INTO AuteurOeuvre VALUES ('9','15');
INSERT INTO EditeurOeuvre VALUES ('7','15');
INSERT INTO CategorieOeuvre VALUES ('456','15');
INSERT INTO Film VALUES ('2','52');

INSERT INTO Reservation VALUES ('009',TO_DATE('2014/12/03 21:02:44','yyyy/mm/dd hh24:mi:ss'),'2','22');
INSERT INTO Reservation VALUES ('010',TO_DATE('2014/12/03 21:05:50','yyyy/mm/dd hh24:mi:ss'),'2','35');

INSERT INTO Pret VALUES ('800', TO_DATE('2014/12/02 10:02:44','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','23');
INSERT INTO Pret VALUES ('801', TO_DATE('2014/12/02 10:05:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','46');
INSERT INTO Pret VALUES ('802', TO_DATE('2014/12/02 10:08:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','33');



COMMIT;

SET ECHO OFF
SET PAGESIZE 30
