--
-- Script de test des triggers
-- Auteurs
-- Code permanent: GARS13069209, LACF18048601
-- Code permanent: PHAC02579100, AMIS25119000
--
SET LINESIZE 160
SET ECHO ON

-- Trigger : nbPrets_triggers
INSERT INTO Pret VALUES ('803', TO_DATE('2014/12/02 10:10:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/20 10:05:33','yyyy/mm/dd hh24:mi:ss'),'4','2');
ROLLBACK;

--Trigger : nbJours_triggers
INSERT INTO Pret VALUES ('804', TO_DATE('2014/12/02 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/20 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','2');
ROLLBACK;

--Trigger : consult_triggers
INSERT INTO Pret VALUES ('805', TO_DATE('2014/12/02 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','35');
ROLLBACK;

-- Trigger : date_trigger
INSERT INTO Pret VALUES ('806', TO_DATE('2014/12/04 10:10:43','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/02 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','2');
ROLLBACK;

-- Trigger : emprunt_trigger
INSERT INTO Pret VALUES ('807', TO_DATE('2014/12/02 10:08:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','33');
ROLLBACK;

-- Trigger : reserve_trigger
INSERT INTO Pret VALUES ('808', TO_DATE('2014/12/02 10:08:49','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/12/05 10:05:33','yyyy/mm/dd hh24:mi:ss'),'7','24');
ROLLBACK;

SET ECHO OFF
SET PAGESIZE 30

