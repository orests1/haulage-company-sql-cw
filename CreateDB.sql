
--Author: Lampros Valais
--Author Orestis Christou

DROP TABLE manifest;
DROP TABLE customer;
DROP TABLE category;
DROP TABLE trip;
DROP TABLE driver;
DROP TABLE vehicle;
DROP SEQUENCE vehicle_type_id_seq;
DROP TABLE model;

/* Create tables from ER diagram*/
CREATE TABLE model
(
vehicle_type_id INTEGER PRIMARY KEY,
model VARCHAR2(20),
make VARCHAR2(20)
);
/* Create Sequence to increment the vehicle_type_id*/
CREATE SEQUENCE vehicle_type_id_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 50;
  
CREATE TABLE vehicle
(
registration VARCHAR2(13) PRIMARY KEY,
vehicle_type_id INTEGER,
gvw INTEGER,
body VARCHAR2(20),
year INTEGER ,
FOREIGN KEY (vehicle_type_id) REFERENCES model(vehicle_type_id)
);

CREATE TABLE driver
(
employee_no VARCHAR2(10) PRIMARY KEY,
first_name VARCHAR2(20),
last_name VARCHAR2(20),
ni_no VARCHAR2(15),
telephone VARCHAR2(20),
mobile VARCHAR2(20),
hazardous_goods VARCHAR2(1)
);


CREATE TABLE trip
(
trip_id INTEGER PRIMARY KEY,
departure_date DATE,
return_date DATE,
registration VARCHAR2(10),
employee_no VARCHAR2(10), 
FOREIGN KEY (registration) REFERENCES vehicle(registration),
FOREIGN KEY (employee_no) REFERENCES driver(employee_no)
);

CREATE TABLE category
(
category VARCHAR2(1) PRIMARY KEY,
description VARCHAR2(15),
requirement VARCHAR2 (40)
);

CREATE TABLE customer
(
reference INTEGER PRIMARY KEY,
company_name VARCHAR2(40),
address VARCHAR2(50),
town VARCHAR2(30),
post_code VARCHAR2(10),
telephone VARCHAR2(30),
contact_fname VARCHAR2 (20),
contact_sname VARCHAR2 (25),
contact_email VARCHAR2 (50)
);

CREATE TABLE manifest
(
barcode INTEGER PRIMARY KEY,
trip_id INTEGER,
pickup_customer_ref INTEGER,
delivery_customer_ref INTEGER,
category VARCHAR2(1),
weight INTEGER,
FOREIGN KEY (trip_id) REFERENCES trip(trip_id),
FOREIGN KEY (category) REFERENCES category(category),
FOREIGN KEY (pickup_customer_ref) REFERENCES customer(reference),
FOREIGN KEY (delivery_customer_ref) REFERENCES customer(reference)
); 
/* Start to populate the table model with data from excel*/ 
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'ALBION','RIEVER');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'ATKINSON','ATKINSON');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'DAF','FT85.400');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'DAF','FTGCF85.430');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'DAF','FTGCF85.460E');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'DAF','FTGCF85.460V');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'DAF','FTGXF105.510');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'Scania','P310 6x2');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'Scania','R620 6x2*4');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'Scania','P230 4x2');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'Scania','R270 6x2');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'Scania','P94 4x2');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'MAN','TGM');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'MAN','M 2000');
INSERT INTO model(vehicle_type_id, model, make) VALUES (vehicle_type_id_seq.NEXTVAL,'MAN','TGL');

/* Start to populate the table vehicle with data from excel*/ 
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('4585 AW','1','20321','','1963');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('SDU 567M','2','32520','','1974');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('P525 CAO','3','40000','','1996');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY55 CGO','4','40000','','2005');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY06 BYP','4','40000','','2006');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY56 BZR','5','40000','','2006');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY56 BZS','5','40000','','2006');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY56 BZT','5','40000','','2007');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY56 BZU','5','40000','','2007');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY07 DFZ','5','40000','','2007');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY57 XZG','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY57 XZH','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY57 XZK','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PW08 BVZ','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PW08 EKJ','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PW08 LDA','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY58 OGK','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY58 UHB','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY58 UHF','5','40000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY09 XRG','5','40000','','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY09 XRH','5','40000','','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PW09 EKX','5','40000','','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PW59 OSR','5','40000','','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY59 OSU','5','40000','','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY59 OSW','5','40000','','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY10 OPL','6','40000','','2010');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY10 OPM','6','40000','','2010');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY10 OPN','6','40000','','2010');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY60 XPM','6','40000','','2011');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY11 OAA','6','40000','','2011');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY11 XJP','7','80000','','2011');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY61 RNU','6','44000','','2011');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY61 RNV','6','44000','','2011');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY12 RSU','6','44000','','2012');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY12 RSV','7','80000','','2012');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY12 ZYA','6','44000','','2012');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('PY12 ZYB','6','44000','','2012');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('MR58UMH','8','26100','Box','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('KN10WDG','9','26000','Chassis','2010');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BD60BVF','10','18000','Box','2010');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BD10AYV','10','18000','Box','2010');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BD10AYC','10','18000','Box','2010');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BD09FNE','10','18000','Curtainsider','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BD08AOG','11','26000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BD08AOC','11','26000','','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BD08AOF','11','26000','Curtainsider','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('WY51OLV','12','18000','','2002');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR57BXF','13','18000','Curtainsider','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR58BXG','14','18000','Box','2005');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR58BXJ','13','18000','Box','2009');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR58BXE','13','18000','Box','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR58BXV','13','18000','Box','2006');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR58BXM','13','18000','Box','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR58BXC','15','7500','Box','2008');
INSERT INTO vehicle(registration,vehicle_type_id, gvw, body,year) VALUES ('BR58BXA','15','7500','Box','2008');


/* Populate driver table */ 

INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0045619','Eamon','O''Looney','JJ 56 53 26 B','0165 6727840','07659 9770175','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0117094','Albert','Phillimore','SS 80 84 13 A','01317 2769995','07140 6644976','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0049743','Crispin','Cleobury','BB 83 85 43 F','0197 2482608','07267 2373966','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0071609','Seth','Nappin','NN 46 94 29 D','01578 9961473','07821 8889692','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0021604','Rudyard','Basillon','GG 88 39 27 B','01174 1662454','07640 6205582','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0052861','Salim','Danton','ZZ 41 75 52 G','01751 4051131','07363 7295341','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0112122','Solomon','Alessandrucci','YY 27 43 21 A','01534 1184812','07828 3874655','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0032946','Eden','Blackbrough','DD 48 25 56 E','0175 2325436','07448 8200575','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0122085','Norris','Vasyutichev','EE 91 44 59 G','01809 7872896','07610 2265827','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0046793','Angelo','Brydon','ZZ 16 61 13 E','01664 9419992','07211 7346507','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0116204','Durant','Dankersley','NN 47 54 55 A','01494 7504134','0767 6333200','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0011614','Benedict','Brawley','FF 58 52 98 B','01896 4566329','07571 4556797','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0036989','Rodger','Puddefoot','HH 98 71 38 D','01685 5277509','07191 3559787','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0039136','Neil','Parlott','PP 30 20 18 C','01297 2128437','07704 5067655','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0007565','Durant','Kewzick','MM 26 94 68 B','01569 7406772','07560 2398775','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0064734','Gavin','Brandon','SS 29 72 70 D','01903 7818854','07520 7827191','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0071272','Daniel','Miliffe','JJ 49 95 89 A','01132 6195893','07638 2716708','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0103275','Graeme','McCrainor','QQ 20 32 26 C','01368 8510191','07592 6815579','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0081817','Finlay','Berzin','GG 51 18 93 G','01259 5036960','07890 1312428','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0040079','Frederick','Sambidge','XX 39 50 75 G','01720 5376232','07228 3349690','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0019383','Langley','O''Canavan','YY 33 92 76 F','01353 1643083','07398 4851545','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0032481','Ernst','A''field','WW 96 29 21 E','01491 7070174','07178 6641268','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0054864','Solomon','Gorhardt','FF 85 32 69 D','01237 1542386','07818 2003871','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0088611','Angelo','Duchart','II 24 61 48 G','01979 9209138','07605 8528591','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0028539','Igor','Woodruffe','BB 80 31 73 F','0198 2086959','07282 5816166','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0012437','Cecil','Chellingworth','PP 49 25 28 E','01735 2100075','07148 9600175','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0010399','Barry','Thayre','VV 21 38 51 C','01356 8289116','0790 4390643','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0080919','Ahmed','Leer','EE 92 66 33 B','01151 9172710','07467 4893211','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0115752','Rex','Akrigg','II 66 93 73 C','01599 2875544','0728 9345308','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0037759','Blake','Heyball','UU 38 30 29 A','01495 2558090','0793 6677965','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0065101','Reginald','Barlas','QQ 32 42 28 D','01299 1130424','07483 5450917','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0067779','Vivian','Robak','TT 70 97 31 E','01770 3429690','07791 6189017','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0013322','Clifton','Dufore','GG 60 14 27 D','01653 6521786','07907 7095944','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0003483','Ryan','Molian','LL 11 15 11 C','01958 9854655','0749 3238422','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0115692','Desdemona','Dublin','FF 67 59 67 C','01228 3678525','07477 2579986','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0083413','Tristan','Crumbie','UU 48 19 76 F','01546 2176414','07874 9667649','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0000350','Elan','Eslie','HH 42 43 38 D','01600 4429521','0756 2845913','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0044597','Shakir','Johansson','SS 29 60 68 C','01578 2019309','07281 4639962','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0018243','Philip','Slaight','HH 46 80 88 G','01731 9881487','07454 9021287','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0096114','Nadir','Millbank','UU 57 29 72 D','01878 2614015','07625 8619154','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0024097','Gareth','Cruickshank','RR 95 86 66 F','0169 8422542','07895 3130119','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0042735','Oscar','Nutten','AA 12 56 67 G','01394 4709770','0794 9454479','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0056286','Waldo','Jannequin','BB 91 27 89 F','01280 3430687','07503 5092578','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0009037','Dirk','Inde','HH 96 59 38 B','01638 1307471','07278 9230184','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0019623','Leonardo','Charlet','YY 84 35 24 C','01981 5543978','07486 4878682','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0077517','Lee','Rookledge','ZZ 84 10 32 C','01421 3611807','07205 3737653','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0059009','Eamon','Darko','DD 42 50 64 D','01573 8171709','07507 8887382','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0049547','Morgan','Bohills','ZZ 64 88 22 B','0169 5000410','07396 4563542','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0067304','Doug','Vango','FF 45 61 87 B','01392 5946068','07144 3520421','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0059411','Anson','Donnan','II 23 78 95 B','01947 9231583','07935 6275053','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0054638','Akram','Milnes','VV 40 62 88 B','01965 8675768','07160 8706655','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0041668','Amon','Pavluk','RR 82 81 98 B','0189 2423370','07280 5696760','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0016462','Henry','Cobelli','MM 73 12 85 A','01889 7061950','07614 2588082','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0035819','Dexter','Shevell','DD 74 66 28 F','01277 5867761','07893 4519107','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0072181','Edgar','Strank','II 24 23 98 B','01239 1225498','07232 9896356','N');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0041353','Sunreet','Balderstone','JJ 91 59 84 A','01933 8361916','07946 3472763','Y');

/* populated category table */ 
INSERT INTO category(category, description, requirement) VALUES ('A','Normal','');
INSERT INTO category(category, description, requirement) VALUES ('B','Fragile','Packing sign-off required');
INSERT INTO category(category, description, requirement) VALUES ('C','Hazardous','Qualified drivers only');


/* populated customer table */
set DEFINE off

INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('1','Calash Ltd.','88 Rinkomania Lane','Cardigan','SA55 8BA','01167 1595763','Cameron','Dunnico','c.dunnico@calash.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('2','Stichomancy & Co','17 Suspiration Street','Okehampton','EX48 4CG','01450 2312678','Henry','Petts','h.petts@stichomancy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('3','Trochiline Services','15 Upcast Street','Carrbridge','PH24 0BF','01222 9556982','Richard','Hanford','r.hanford@trochiline.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('4','Evaginate Inc.','9 Miniaceous Mount','Longfield','DA20 1DE','01231 7692992','Edmund','Janson','e.janson@evaginate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('5','Medius Inc.','30 Emiction Street','Darwen','BB94 8BA','01635 9715635','Adrian','Munkley','a.munkley@medius.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('6','Queenright Services','46 Telson Passage','Wells','BA84 7GF','0169 3657311','Marley','Bedburrow','m.bedburrow@queenright.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('7','Noumenalism Plc','50 Tirocinium Road','Tighnabruaich','PA94 1EC','01965 3354820','Ronan','Mackerel','r.mackerel@noumenalism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('8','Homologate Ltd.','99 Amaxophobia Green','Blandford Forum','DT62 7CD','01908 1302626','Cliff','MacQueen','c.macqueen@homologate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('9','Privative Inc.','88 Schematonics Gardens','Staines-upon-Thames','TW46 1GB','01385 6814908','Crispin','MacCallister','c.maccallister@privative.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('10','Falciform Services','41 Ingannation Gardens','Shrewsbury','SY44 6AA','01135 1234939','Igor','Hains','i.hains@falciform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('11','Lollop Group','87 Anticryptic Avenue','Glasgow','G66 4BD','01112 4839043','Arden','Cow','a.cow@lollop.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('12','Afforest Group','71 Faburden Road','Killin','FK2 8FD','01231 5591921','Taylor','Windaybank','t.windaybank@afforest.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('13','Trangam Retail','81 Inquinate Road','Lymm','WA52 2FE','01115 8973091','Hamilton','McGuckin','h.mcguckin@trangam.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('14','Salutary Industrial','68 Obsequent Gardens','Aberfeldy','PH17 5GC','01767 5938733','Stanley','Magog','s.magog@salutary.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('15','Noctidiurnal Ltd.','87 Phengite Avenue','Bath','BA67 5GE','01298 5876286','Leroy','Monnelly','l.monnelly@noctidiurnal.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('16','Cocotte Inc.','69 Chiliomb Road','Cowes','PO62 5FF','01760 6319406','Chris','Curless','c.curless@cocotte.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('17','Iatrogenic Ltd.','54 Wantage Road','Gordon','TD10 6AG','01131 4437249','Glyn','Bedow','g.bedow@iatrogenic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('18','Parados Services','93 Saltigrade Road','New Malden','KT26 1BF','01730 6367575','Christian','Saffran','c.saffran@parados.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('19','Sylph Fabrication','6 Venencia Circle','Grange-over-Sands','LA52 5AG','01204 2943611','Salim','Blencoe','s.blencoe@sylph.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('20','Gallipot Inc.','34 Haurient Row','Basildon','SS24 2CD','01868 4327697','Grant','Rowlands','g.rowlands@gallipot.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('21','Sponsion & Co','76 Urbiculture Path','Clitheroe','BB14 4GE','01407 4478738','Joshua','Van der Daal','j.van.der.daal@sponsion.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('22','Tubicornous Fabrication','62 Lutestring Road','Dulas','LL83 3DA','01466 1750823','Elan','Lenchenko','e.lenchenko@tubicornous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('23','Jaconet Group','36 Regolith Gate','Barnoldswick','BB89 3GC','01147 8327287','Chris','Froschauer','c.froschauer@jaconet.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('24','Benefice Retail','33 Febricant Hill','Malton','YO28 3FC','01772 1802720','Earle','Elan','e.elan@benefice.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('25','Tholus Fabrication','33 Versiform Parkway','Petworth','GU26 4DE','01529 9639453','Xenos','De Andisie','x.de.andisie@tholus.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('26','Psaltery Fabrication','47 Wallydrag Street','Bucknell','SY68 1EA','01993 3239511','Amal','Francisco','a.francisco@psaltery.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('27','Vibraslap Services','92 Bagging Street','Herne Bay','CT19 3CF','0122 3344500','Charlie','Eouzan','c.eouzan@vibraslap.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('28','Boniform Retail','29 Gossypine Canyon','Porth','CF87 5CB','01364 4257720','Norris','Dahlman','n.dahlman@boniform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('29','Parvis Fabrication','21 Murrain Dell','Kingussie','PH79 3CC','01693 4283053','Ernst','Letson','e.letson@parvis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('30','Succinic Industrial','41 Beeskep Hill','Sutton','SM31 7AD','01501 4034312','George','Nunnery','g.nunnery@succinic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('31','Macerate Fabrication','39 Batiste Passage','Bedworth','CV33 2AB','01244 3464789','Lysander','Summerrell','l.summerrell@macerate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('32','Lissome Inc.','36 Aubergine Dell','Dartmouth','TQ21 1ED','01393 8601859','Mark','Helsby','m.helsby@lissome.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('33','Formic Fabrication','25 Sapor Place','Grange-over-Sands','LA86 7BG','01688 2636192','Angus','Cawdell','a.cawdell@formic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('34','Tubulure Fabrication','11 Cabriolet Road','Markfield','LE77 0GA','01471 6836122','Heathcliff','Ragat','h.ragat@tubulure.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('35','Demiurge Inc.','82 Narcolepsy Causeway','Kilwinning','KA71 8DD','01848 7106959','Mungo','Cote','m.cote@demiurge.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('36','Primitial Fabrication','68 Synchroscope Street','Burntisland','KY92 1EE','01412 8350708','Adil','Munnery','a.munnery@primitial.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('37','Helicon Industrial','10 Formate Place','Melton Constable','NR24 2EE','01755 7031734','Sherman','Seacroft','s.seacroft@helicon.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('38','Ambulatory Inc.','21 Scotoma Gate','North Tawton','EX8 3AB','01238 2766059','Jack','Gronw','j.gronw@ambulatory.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('39','Tourbillon Services','95 Sederunt Avenue','Kingussie','PH74 6DE','01876 7011236','Sebastian','Searson','s.searson@tourbillon.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('40','Tempore Retail','9 Chanticleer Drive','Coventry','CV75 6EE','01259 2190483','Keane','O''Feeney','k.ofeeney@tempore.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('41','Equanimity & Co','47 Textuary Canyon','West Molesey','KT86 1BE','01283 1210366','Yusuf','Tourry','y.tourry@equanimity.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('42','Kinkle Services','85 Protogenic Road','Llanon','SY75 0GD','01319 8511255','Leonardo','Beeson','l.beeson@kinkle.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('43','Pectize Services','53 Tenue Lane','Mayfield','TN8 3AD','01966 9036741','Reuben','Grund','r.grund@pectize.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('44','Abarticular Industrial','60 Ostraceous Drive','Nuneaton','CV39 8FF','01724 1741357','Earle','Kopman','e.kopman@abarticular.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('45','Foinery Plc','24 Welkin Street','Llanidloes','SY49 7FG','01149 3002377','Erin','Cloy','e.cloy@foinery.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('46','Papyrocracy Ltd.','48 Ripieno Road','Bexleyheath','DA74 1BF','01792 3334605','Argus','Scandroot','a.scandroot@papyrocracy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('47','Grabble Retail','11 Gynocracy Gardens','Peebles','EH8 3GA','01863 8745298','Chris','Ivan','c.ivan@grabble.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('48','Throstle Group','18 Synecdoche Canyon','Menstrie','FK29 6GD','0151 5090882','Fritz','Cherm','f.cherm@throstle.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('49','Dubitate Inc.','2 Indue Gardens','North Ferriby','HU94 7BG','01737 7632357','Paco','Bristo','p.bristo@dubitate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('50','Messuage & Co','25 Beloid Avenue','Ringwood','BH58 8CC','01540 9822467','Broderick','Josowitz','b.josowitz@messuage.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('51','Elephantine Ltd.','22 Plosion Street','Cranbrook','TN77 6EA','01546 1496259','Cain','Lillo','c.lillo@elephantine.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('52','Nosophobia Fabrication','39 Trifarious Dell','Gateshead','NE95 2AD','01930 7579193','Cliff','Sinkinson','c.sinkinson@nosophobia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('53','Jejune Group','93 Earing Road','Juniper Green','EH59 5AE','01321 5774066','Samuel','Flament','s.flament@jejune.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('54','Cagamosis Inc.','36 Muchity Green','Dunblane','FK47 7EC','01162 7892608','Gareth','Tolcher','g.tolcher@cagamosis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('55','Palillogy Industrial','7 Hyperdulia Rise','Kilwinning','KA25 1EF','01436 4692974','Fergus','Bushen','f.bushen@palillogy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('56','Octroi Ltd.','24 Halophilous Row','Gillingham','ME73 6AA','01139 7616881','James','Rustidge','j.rustidge@octroi.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('57','Maskirovka Fabrication','82 Exarch Hill','Fivemiletown','BT84 7CB','0125 7659423','Reece','Hurdedge','r.hurdedge@maskirovka.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('58','Quixotic Inc.','88 Jesuitocracy Dell','Lincoln','LN94 7CB','01475 8558624','Mustafa','Storrier','m.storrier@quixotic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('59','Frieze Inc.','47 Landocracy Avenue','Purley','CR45 4BG','01392 4288297','Aladdin','Skade','a.skade@frieze.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('60','Disbosom Fabrication','37 Quartic Square','Melton Mowbray','LE20 2EG','01916 9630480','Ulric','Stickel','u.stickel@disbosom.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('61','Peristyle Industrial','14 Postprandial Passage','Ibstock','LE47 4EF','01218 9515255','Eugene','Derrick','e.derrick@peristyle.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('62','Cocotte & Co','28 Neophobia Street','Haddington','EH37 0FA','01428 6995716','Connor','Braunton','c.braunton@cocotte.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('63','Trochoid Industrial','49 Eurythermic Gate','Enniskillen','BT21 6AE','01828 1447231','Carl','Delgua','c.delgua@trochoid.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('64','Cantle Inc.','25 Subaltern Mount','Irvine','KA23 7CD','01863 7743245','Fabio','Baistow','f.baistow@cantle.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('65','Impropriate Inc.','33 Gestatorial Mews','Newtonmore','PH37 8FD','01374 2096753','Ferdinand','Beese','f.beese@impropriate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('66','Zubrowka & Co','70 Procuratory Street','Builth Wells','LD86 6EF','01543 3857829','Oliver','Simo','o.simo@zubrowka.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('67','Dromophobia & Co','70 Sidelight Causeway','Rochford','SS61 4BB','01405 9874926','Neville','Dimitriev','n.dimitriev@dromophobia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('68','Telegnosis Plc','89 Accend Canyon','Chinnor','OX5 3CB','01434 8466691','Ardal','Bothwell','a.bothwell@telegnosis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('69','Washball & Co','7 Crebrous Gate','Liss','GU56 3CE','01368 9699799','Xerxes','Curedale','x.curedale@washball.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('70','Aesthesia & Co','60 Hedonics Circle','Buckingham','MK14 0CB','01309 1667988','Curt','Krysztowczyk','c.krysztowczyk@aesthesia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('71','Whistler Ltd.','78 Illinition Place','Middlewich','CW0 7FB','0122 6848366','Travis','Keizman','t.keizman@whistler.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('72','Succorrhoea Group','96 Filiform Avenue','Ayr','KA58 7EE','01811 3048632','Gideon','Weed','g.weed@succorrhoea.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('73','Tondo Fabrication','15 Motiferous Drive','Fort Augustus','PH25 8BF','01334 3944443','Ulric','Leblanc','u.leblanc@tondo.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('74','Zoolatry Retail','46 Vortical Passage','Buckfastleigh','TQ83 6AA','01215 6944964','Alvin','Goolding','a.goolding@zoolatry.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('75','Ergomania Services','53 Echinuliform Hill','Pembroke Dock','SA98 6DE','01238 4735235','Barry','Wheelan','b.wheelan@ergomania.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('76','Usitative Retail','63 Deiparous Square','Stanmore','HA16 4EG','01255 9605173','Francis','Craw','f.craw@usitative.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('77','Carfax & Co','98 Emblements Square','Portsmouth','PO46 5GE','01126 7511835','Miles','Lander','m.lander@carfax.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('78','Congiary Fabrication','94 Burgage Mount','Chippenham','SN49 8GA','01437 9954041','Alden','Czajka','a.czajka@congiary.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('79','Exsert Plc','100 Theca Dell','Portland','DT2 5BG','0181 7341641','Shakir','Ellerington','s.ellerington@exsert.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('80','Wurzel Group','11 Adhocracy Square','Plymouth','PL93 8EB','01397 8369693','Andre','Mathews','a.mathews@wurzel.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('81','Rhytidectomy Retail','6 Genitive Green','Southampton','SO0 5FB','01798 5614549','Thomas','Texton','t.texton@rhytidectomy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('82','Medusiform Industrial','69 Spall Lane','Juniper Green','EH8 5AG','01932 9993905','Niall','Scrane','n.scrane@medusiform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('83','Spall Industrial','90 Subreptary Street','Insch','AB95 5AF','0111 7090401','Godfrey','Girton','g.girton@spall.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('84','Sarcous Ltd.','59 Vermigerous Gardens','Llanerchymedd','LL39 4EB','01907 4314281','Barney','Felce','b.felce@sarcous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('85','Sundog Group','92 Eosophobia Street','Oldham','OL88 1BD','0166 9438913','Bartram','Fritschel','b.fritschel@sundog.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('86','Anguine & Co','26 Univoltine Green','Attleborough','NR49 7EA','01736 6772508','Benet','Boulding','b.boulding@anguine.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('87','Jockteleg Retail','94 Sarcotic Gardens','Frodsham','WA85 3GB','01803 1419252','Sadiq','Beazer','s.beazer@jockteleg.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('88','Surcingle Ltd.','18 Avalement Street','Stourbridge','DY78 7FC','01627 4362452','Dirk','Sand','d.sand@surcingle.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('89','Inoperculate Retail','32 Glandiferous Parkway','Beverley','HU37 8FG','0158 3525895','Homer','Furzer','h.furzer@inoperculate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('90','Kissel Fabrication','19 Deasil Square','Runcorn','WA19 8AF','01787 7014375','Wilson','Dickings','w.dickings@kissel.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('91','Smalt Services','53 Backstay Road','Rotherham','S43 1DB','01842 8456583','Brennan','Surcombe','b.surcombe@smalt.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('92','Radicivorous Inc.','93 Scantling Place','Lichfield','WS6 6FD','01539 7297860','Ogden','Raikes','o.raikes@radicivorous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('93','Recaption Inc.','69 Lactescent Rise','Harpenden','AL63 4BG','01346 1078827','Ahmed','Freschini','a.freschini@recaption.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('94','Isostere Retail','85 Rampant Street','Jarrow','NE53 3FD','0155 5792803','Vaughan','MacCostye','v.maccostye@isostere.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('95','Incede Plc','17 Absentaneous Passage','Hailsham','BN90 6DF','01130 5470277','Glen','Snare','g.snare@incede.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('96','Stipiform Fabrication','77 Synastry Rise','Sheerness','ME46 6AE','01276 6598360','Nikko','Jarret','n.jarret@stipiform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('97','Wuffler & Co','92 Loxodromy Circle','Aldeburgh','IP24 0AF','01825 8513835','Jeremy','Coldbath','j.coldbath@wuffler.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('98','Remueur Inc.','35 Hearsecloth Passage','North Walsham','NR11 0AB','01342 2368209','Raphael','Vickerman','r.vickerman@remueur.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('99','Temerarious & Co','32 Zibeline Street','Arisaig','PH81 3CE','01912 5106009','Gunther','Poge','g.poge@temerarious.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('100','Stevedorage Group','91 Dorsiventral Parkway','Tenterden','TN41 6CE','01378 9650488','Bram','Shimmans','b.shimmans@stevedorage.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('101','Ondoyant & Co','76 Aeriform Rise','Rhyl','LL16 8DE','01544 6018280','Norman','Jagiela','n.jagiela@ondoyant.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('102','Rubescent Plc','34 Disomus Green','Burford','OX38 1DD','01123 4407910','Graham','Bartoletti','g.bartoletti@rubescent.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('103','Gazar Ltd.','7 Exungulation Canyon','Dereham','NR73 2EA','01689 6140136','Rogan','Scarre','r.scarre@gazar.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('104','Mewling Inc.','77 Hierocracy Gardens','Bures','CO9 7EE','01959 7925209','Gilbert','Rugge','g.rugge@mewling.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('105','Homomerous Retail','26 Opsimath Causeway','Barrow-upon-Humber','DN80 7CA','01152 7421448','Gerald','Harsent','g.harsent@homomerous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('106','Bosselated & Co','30 Patulous Rise','Paisley','PA11 4GE','01971 3144966','Wallace','Culleton','w.culleton@bosselated.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('107','Shide Industrial','31 Plangorous Circle','Kington','HR62 4DC','01104 8040677','Ogden','Juara','o.juara@shide.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('108','Pelagic Inc.','53 Clypeate Green','Umberleigh','EX36 2GE','01762 2567675','Jason','Orta','j.orta@pelagic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('109','Kennebecker Retail','47 Increscent Road','Whitehaven','CA95 1DA','01446 2631117','Aswad','Clavey','a.clavey@kennebecker.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('110','Bordure Services','91 Cryptarchy Hill','Latheron','KW26 0GG','01994 6094621','Noah','Zamorano','n.zamorano@bordure.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('111','Uvelloid & Co','3 Fantasticate Row','Mauchline','KA4 5DB','01590 5976045','Anton','Norquoy','a.norquoy@uvelloid.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('112','Onymy Industrial','4 Lanuginose Road','Godalming','GU47 3GE','01784 4379272','Audley','Vanni','a.vanni@onymy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('113','Succinic Retail','80 Malleation Parkway','Abergavenny','NP17 7FE','01662 4626609','Hayden','Magnay','h.magnay@succinic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('114','Runnel Ltd.','34 Pendicle Dell','Malmesbury','SN47 7FA','01941 9474572','Ainsley','Spurrett','a.spurrett@runnel.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('115','Apocrisiary Group','33 Carpophagous Row','Newhaven','BN78 6GE','01337 1072755','Charles','Comrie','c.comrie@apocrisiary.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('116','Quagswag Group','75 Zosteriform Road','Berriedale','KW86 1AG','01788 3854851','Charlie','Hellmore','c.hellmore@quagswag.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('117','Mimetic Industrial','72 Craquelure Road','Castle Douglas','DG58 3BE','01782 2293559','Hari','Baitey','h.baitey@mimetic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('118','Polonaise Ltd.','58 Parity Parkway','Coniston','LA24 8FE','01774 1017864','Vijay','Flips','v.flips@polonaise.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('119','Scatomancy Group','46 Ossia Road','Campbeltown','PA63 4FE','01817 7073667','Waseem','Boultwood','w.boultwood@scatomancy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('120','Phytogenesis Fabrication','46 Guipure Road','Penryn','TR59 8AB','01325 5340483','Walter','Aucutt','w.aucutt@phytogenesis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('121','Woolpack Ltd.','69 Breviary Canyon','Pevensey','BN82 3GF','01156 7140062','Cuthbert','Greenman','c.greenman@woolpack.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('122','Postern Industrial','28 Jawhole Street','Rhosgoch','LL54 7FE','01801 2475948','Durant','Bofield','d.bofield@postern.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('123','Colluctation Industrial','11 Scotoma Drive','Sutton Coldfield','B86 8GC','01439 4712749','Drew','Clemendet','d.clemendet@colluctation.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('124','Benefactive Fabrication','21 Cataplasm Hill','Chigwell','IG76 7AA','01417 4509421','Salim','Lawfull','s.lawfull@benefactive.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('125','Maculomancy Group','93 Chatelaine Passage','Shoreham-by-Sea','BN70 5GC','01839 6582301','Muhammad','Oventon','m.oventon@maculomancy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('126','Trilaminar Industrial','32 Adventitious Road','Diss','IP34 3GC','01897 9455333','Fagan','De Ortega','f.de.ortega@trilaminar.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('127','Rusticate & Co','50 Visibilia Rise','Guisborough','TS95 0FF','01792 4521014','Vijay','Guilford','v.guilford@rusticate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('128','Hylomania Plc','8 Subreptary Mount','Newry','BT33 7DC','01625 8354711','Amos','MacDonogh','a.macdonogh@hylomania.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('129','Pecuniary Inc.','1 Undern Place','Northwood','HA48 3BE','01481 7507978','Brennan','Ollerhad','b.ollerhad@pecuniary.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('130','Mollitious Inc.','27 Torquated Green','Caterham','CR80 6GD','01276 1587660','Salvador','Ziehm','s.ziehm@mollitious.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('131','Pontage Group','67 Sable Rise','Auchterarder','PH78 1FD','01908 3214320','Anand','Longega','a.longega@pontage.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('132','Flysch & Co','73 Quiddle Road','Mallaig','PH28 8BB','01972 6808836','Abdul','Gregorio','a.gregorio@flysch.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('133','Vermigrade Inc.','1 Erythropsia Hill','Leven','KY18 1GF','01277 2727782','Patrick','Imms','p.imms@vermigrade.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('134','Bletherskate Ltd.','77 Jumboism Street','Kinlochleven','PH83 2FB','01342 6149445','Wayne','Ellington','w.ellington@bletherskate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('135','Pityroid Inc.','91 Gigue Path','Castlederg','BT96 0CD','01853 8990165','Jacob','Itzhayek','j.itzhayek@pityroid.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('136','Statolatry Fabrication','22 Amphipneust Circle','Crumlin','BT78 2BG','01591 7934454','Hanif','Jiles','h.jiles@statolatry.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('137','Vespine & Co','67 Chimerical Causeway','Cleator','CA51 7BG','01484 1382043','Clinton','Mazdon','c.mazdon@vespine.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('138','Tautomerism Plc','94 Epuration Street','Bakewell','DE88 1EB','01640 1940745','Oliver','Spennock','o.spennock@tautomerism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('139','Ziganka Plc','84 Timarchy Hill','Llanwrtyd Wells','LD84 0BE','01420 6361796','Humphrey','Briggdale','h.briggdale@ziganka.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('140','Mollipilose Inc.','23 Aphicide Road','Torpoint','PL4 5AF','01643 9554036','William','Langdale','w.langdale@mollipilose.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('141','Profligate Plc','6 Fusee Drive','Colne','BB72 7GE','01597 7442589','Oscar','Cranstone','o.cranstone@profligate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('142','Prevoyant Fabrication','85 Mollycoddle Circle','Herne Bay','CT7 3GB','01578 7805746','Bill','Eastbrook','b.eastbrook@prevoyant.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('143','Eulogomania Group','45 Sericulture Street','Stamford','PE55 7EC','01961 7852878','Jed','Edds','j.edds@eulogomania.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('144','Inoperculate Services','20 Darcy Green','Penrhyndeudraeth','LL91 2EB','01361 4081343','Drew','Acutt','d.acutt@inoperculate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('145','Aesthesia Group','85 Atactic Passage','Caledon','BT91 5DC','01238 3812431','Stephen','Atkyns','s.atkyns@aesthesia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('146','Ratline Plc','31 Pyrrhuline Causeway','Crediton','EX82 5DC','0112 3217738','Niall','Strowlger','n.strowlger@ratline.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('147','Aerostatics & Co','5 Bumicky Hill','Strome Ferry','IV16 4GB','01226 9456635','Magnus','Ogglebie','m.ogglebie@aerostatics.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('148','Statolith Fabrication','37 Monoliteral Square','Exeter','EX27 6BB','01251 5369501','Marcus','Francois','m.francois@statolith.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('149','Syssitia & Co','2 Cancrizans Path','Lichfield','WS23 1CD','01384 7032960','Nasser','Di Napoli','n.di.napoli@syssitia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('150','Stipiform Industrial','24 Poult Street','Milltimber','AB63 6EE','01601 9775731','Warren','Etherington','w.etherington@stipiform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('151','Sphingal & Co','31 Jactation Hill','Hemel Hempstead','HP29 8DA','01564 4141846','Amon','Beggs','a.beggs@sphingal.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('152','Quiddany Industrial','34 Sprag Road','Exeter','EX26 8GC','01850 1734178','Wesley','Foynes','w.foynes@quiddany.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('153','Sarmentum & Co','28 Abreuvoir Street','Lechlade','GL17 8EF','01714 5974985','Sheridan','Rowes','s.rowes@sarmentum.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('154','Pyrognomic Inc.','28 Exiguous Green','Sheffield','S96 3GA','01715 3076339','Boris','Petch','b.petch@pyrognomic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('155','Waldhorn Plc','50 Zinnia Circle','Manningtree','CO37 1FA','01314 7202121','Adair','Dilnot','a.dilnot@waldhorn.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('156','Pyrosis Group','79 Concetto Rise','Corby','NN71 0CG','01601 6931213','Romeo','Bilston','r.bilston@pyrosis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('157','Poaceous & Co','3 Cryoscope Dell','Cleckheaton','BD7 4EG','0155 3760815','Fabian','Blackey','f.blackey@poaceous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('158','Kritarchy Plc','58 Scapigerous Gardens','Whitchurch','RG11 6FA','01433 2479885','Ferdinand','Bendley','f.bendley@kritarchy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('159','Chintz Inc.','39 Herbarium Parkway','Doncaster','DN15 5AB','01520 1959752','Gene','Perllman','g.perllman@chintz.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('160','Misaunter Fabrication','7 Deckle Mount','Cardiff','CF69 0CE','01865 3779512','Alastair','Bowdler','a.bowdler@misaunter.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('161','Creophagous Retail','65 Officious Road','Sheringham','NR96 0EG','01867 8332333','Jethro','Dawks','j.dawks@creophagous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('162','Pogonotomy & Co','55 Kennebecker Drive','Currie','EH32 7FG','01779 6560582','Warren','Peskett','w.peskett@pogonotomy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('163','Pencilliform Plc','71 Slumberous Gate','Alston','CA33 0FB','01805 9247888','Theodore','Lenormand','t.lenormand@pencilliform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('164','Amphipneust Industrial','59 Octarius Mount','Isle of Mull','PA73 2AF','01301 1136567','Elan','Tellenbrook','e.tellenbrook@amphipneust.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('165','Cardialgia Ltd.','20 Estrade Parkway','Carterton','OX1 0DG','01769 7285016','Campbell','Fairest','c.fairest@cardialgia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('166','Bourdon Ltd.','40 Satyrism Street','Rugeley','WS45 5BG','01283 9744355','Anton','Feak','a.feak@bourdon.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('167','Wholestitch Group','51 Locative Mount','Guildford','GU74 6FD','01183 8622860','Michael','Vautin','m.vautin@wholestitch.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('168','Oryzivorous Retail','84 Isostere Parkway','Boat of Garten','PH23 4CG','01291 9006531','Benjamin','McGilleghole','b.mcgilleghole@oryzivorous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('169','Resorb Ltd.','91 Senectuous Parkway','Kendal','LA38 8BA','0174 6716926','Aswad','Bennell','a.bennell@resorb.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('170','Myriarchy Inc.','22 Metaplasm Gardens','Salcombe','TQ48 6CB','01331 9569446','Arden','Carwithim','a.carwithim@myriarchy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('171','Collegialism Ltd.','60 Ebeneous Passage','Littlehampton','BN49 0FG','01884 9896633','Addison','Fernehough','a.fernehough@collegialism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('172','Boston Fabrication','50 Abditive Gardens','Newcastle Emlyn','SA67 5AD','0168 9566786','Geraint','Navarre','g.navarre@boston.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('173','Frottage Plc','31 Mazarine Canyon','Frodsham','WA25 6FB','01339 9965857','Lee','Machans','l.machans@frottage.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('174','Araneous & Co','59 Libration Rise','Dinas Powys','CF25 8AE','01381 9800802','Archibald','Vasilischev','a.vasilischev@araneous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('175','Prepollence Services','83 Conation Canyon','Prestatyn','LL6 1FA','01317 4566591','Hubert','Louden','h.louden@prepollence.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('176','Obrogate & Co','14 Antichthon Circle','Baldock','SG0 6BF','01549 4842949','Pablo','Zavattero','p.zavattero@obrogate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('177','Railophone Services','52 Gilderoy Mews','Glenfinnan','PH40 4BG','01589 4000573','Crispin','Goering','c.goering@railophone.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('178','Meteorism Retail','27 Spleniculus Parkway','Virginia Water','GU74 8CG','01154 3279864','Errol','Binion','e.binion@meteorism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('179','Epulotic Group','69 Thalweg Street','Kings Langley','WD31 3BE','01801 2459906','Keir','Velte','k.velte@epulotic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('180','Geotechnics & Co','45 Countenance Passage','South Molton','EX38 2EA','01951 3530593','Tariq','Slot','t.slot@geotechnics.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('181','Pathogenesis Industrial','6 Vinolent Dell','Auchterarder','PH79 7FB','01873 4860041','Rodney','Bourthoumieux','r.bourthoumieux@pathogenesis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('182','Aplanatic Fabrication','84 Vivandiere Hill','Innerleithen','EH94 8FD','01321 7535362','Sadiq','Sprigin','s.sprigin@aplanatic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('183','Superfetate Inc.','70 Skellum Street','West Molesey','KT12 3AA','01796 7251379','Leonard','Seivertsen','l.seivertsen@superfetate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('184','Pygal Retail','14 Poetomachia Circle','Lynton','EX56 0BC','01551 2336463','Solomon','Vella','s.vella@pygal.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('185','Wigan Industrial','23 Triplopia Green','Larbert','FK63 1CF','01209 8803446','Romeo','Stag','r.stag@wigan.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('186','Megathermic Inc.','93 Internuncio Street','Crewe','CW95 3AF','01416 1943205','Andrew','Olivia','a.olivia@megathermic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('187','Guidon Plc','10 Subturbary Avenue','Macclesfield','SK22 0FF','01672 8244048','Ulric','Roggers','u.roggers@guidon.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('188','Matriotism Plc','71 Phytogenesis Avenue','Calne','SN21 0FE','01921 3232418','Saul','Kimblen','s.kimblen@matriotism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('189','Milquetoast Group','95 Asperge Circle','Radstock','BA82 3DC','01376 3302628','Edward','Lampke','e.lampke@milquetoast.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('190','Cenote Plc','54 Callithump Street','Romsey','SO56 4BE','01362 6797786','Abbas','Domonkos','a.domonkos@cenote.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('191','Gigot Group','76 Duramen Street','Chichester','PO63 8FG','01305 8030377','Gene','Debell','g.debell@gigot.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('192','Penniform Services','67 Lucripetous Hill','Bungay','NR92 8CC','01378 6896757','Fraser','MacAlroy','f.macalroy@penniform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('193','Coadunate Retail','55 Creant Street','Tighnabruaich','PA51 5FD','01353 7769687','Noah','Wasselin','n.wasselin@coadunate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('194','Judogi Fabrication','82 Aquaphobia Road','Stevenston','KA54 2EC','01668 1902205','Abraham','Braams','a.braams@judogi.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('195','Lageniform Group','14 Whinstone Road','Insch','AB6 0GB','01694 4474940','Denzil','Wight','d.wight@lageniform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('196','Epithesis Group','63 Desultory Causeway','Kenley','CR20 8EA','01178 3959279','Byron','Lovejoy','b.lovejoy@epithesis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('197','Enation Plc','66 Pronograde Dell','Forfar','DD97 0DE','01926 3997504','Bill','Wolford','b.wolford@enation.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('198','Afore Industrial','97 Aplanatic Green','Manchester','M60 8AD','01190 3824125','Aswad','Minillo','a.minillo@afore.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('199','Jebel Inc.','56 Subnubilar Gate','Carshalton','SM50 5FB','0155 9467309','Gerald','O''Corrin','g.ocorrin@jebel.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('200','Flapdoodle Plc','18 Vimen Gardens','Penryn','TR72 7BD','01300 2151882','Gerald','Meachan','g.meachan@flapdoodle.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('201','Exsanguinous Ltd.','18 Minimism Dell','Alnwick','NE14 4GC','01475 9479272','Carl','Goodbarne','c.goodbarne@exsanguinous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('202','Lithophilous & Co','34 Tyrannicide Street','Rugeley','WS0 1BA','01678 3812167','Bailey','Koschke','b.koschke@lithophilous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('203','Witherling Group','64 Lurdan Drive','Newport Pagnell','MK45 6BG','01164 2564531','Andrew','Sealove','a.sealove@witherling.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('204','Intrados Industrial','78 Trochiform Circle','Lancaster','LA80 8FF','01263 6136215','Sherman','Golder','s.golder@intrados.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('205','Halitus & Co','30 Volvelle Lane','Bonnyrigg','EH34 8BD','01644 5440696','Calvin','Glancy','c.glancy@halitus.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('206','Iconomachy Services','46 Synaeresis Square','Aberfeldy','PH65 3FE','01660 2260220','Brett','Inglefield','b.inglefield@iconomachy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('207','Theophile Ltd.','11 Gigue Gardens','Cumnock','KA94 1CF','01465 1092929','Kirk','Janas','k.janas@theophile.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('208','Resiniferous & Co','32 Monachise Canyon','Newtownabbey','BT30 2BF','01793 8708793','Michael','Boncoeur','m.boncoeur@resiniferous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('209','Cocket Services','91 Chirospasm Lane','Colintraive','PA40 7DG','01720 4870059','Basil','Wychard','b.wychard@cocket.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('210','Induviae Plc','92 Plumbless Path','Axbridge','BS26 6EG','01556 3488019','Tristram','Mousby','t.mousby@induviae.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('211','Georgette Ltd.','29 Lineament Gate','Kenley','CR52 8CA','01984 2024248','Gilbert','Arguile','g.arguile@georgette.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('212','Quarter Retail','95 Brontophobia Street','Bo''ness','EH55 7FF','01453 2055671','Warren','Ioannou','w.ioannou@quarter.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('213','Brontomancy Services','24 Brash Gate','Ipswich','IP14 4FC','01562 9674658','Horatio','Balaisot','h.balaisot@brontomancy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('214','Chapbook Fabrication','7 Pangram Mount','Canterbury','CT6 6CB','01964 6456311','Bede','Dominicacci','b.dominicacci@chapbook.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('215','Hortulan Retail','8 Wagtail Circle','Mallaig','PH3 2EG','01308 4842971','Boyd','Clive','b.clive@hortulan.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('216','Grauncher Services','45 Esotropic Square','Ely','CB38 6GG','01685 8794982','Peter','Guirard','p.guirard@grauncher.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('217','Dispread Group','38 Slumberous Street','Stockton-on-Tees','TS64 4BF','01777 9794994','Maximilian','Smithend','m.smithend@dispread.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('218','Mechanism Retail','38 Qually Square','Bracknell','RG81 4FD','01498 9469952','Theobald','Bainton','t.bainton@mechanism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('219','Pediform Group','46 Poplin Road','Innerleithen','EH34 0FE','01375 3381642','Marley','Stamps','m.stamps@pediform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('220','Crepitus Industrial','27 Logocracy Circle','Llanbrynmair','SY97 6GB','01449 6592347','David','Matthewman','d.matthewman@crepitus.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('221','Scranch Fabrication','70 Paragenesis Passage','Normanton','WF23 7CB','01476 2619948','Oscar','Menure','o.menure@scranch.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('222','Barton Ltd.','28 Secund Hill','Lanark','ML9 7DG','01518 1145636','Hiroshi','Le Guin','h.le.guin@barton.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('223','Insipience Plc','9 Barras Road','Henfield','BN45 5FB','01180 4618408','Arun','Poli','a.poli@insipience.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('224','Webster Industrial','77 Escutcheon Avenue','Taynuilt','PA75 3AA','01648 4402492','Dirk','Youngs','d.youngs@webster.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('225','Byrnie Services','25 Tallage Mount','Grantham','NG45 5AE','01812 7294412','Rogan','Waggatt','r.waggatt@byrnie.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('226','Choreomania Ltd.','77 Polyphyletic Gate','Buckie','AB52 5CF','01917 2007904','Kenneth','Cauldfield','k.cauldfield@choreomania.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('227','Philomelian Industrial','28 Codicil Gate','Swaffham','PE76 8GA','01847 2779052','Gregory','Dudny','g.dudny@philomelian.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('228','Fandango Group','4 Volitant Gate','Street','BA92 8GC','0184 2882142','Marvin','Elis','m.elis@fandango.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('229','Inculpate Plc','20 Bestiarian Circle','Umberleigh','EX86 0EB','01305 2402787','Keith','McKelvie','k.mckelvie@inculpate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('230','Isorithm Group','95 Pantomorphic Avenue','Colne','BB73 7CF','01109 8303697','Tate','Chatelain','t.chatelain@isorithm.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('231','Idolothyte Fabrication','34 Angary Mount','Newton Stewart','DG95 8EA','01752 9987108','Horace','Seear','h.seear@idolothyte.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('232','Apolaustic Inc.','13 Silenus Road','Llanfechain','SY35 8AG','01257 3843576','Maximilian','Dobbyn','m.dobbyn@apolaustic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('233','Spinnaker Industrial','48 Syndicalism Parkway','Linlithgow','EH11 8GA','01666 7497846','Keane','Gomm','k.gomm@spinnaker.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('234','Sempiternal & Co','78 Phanerosis Road','Birchington','CT7 1FF','01853 4914269','Addison','Cortnay','a.cortnay@sempiternal.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('235','Rhonchial Retail','95 Operose Street','Holywell','CH94 0ED','01532 7600338','Nicholas','Blackledge','n.blackledge@rhonchial.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('236','Melanochroic Ltd.','85 Acrologic Canyon','Hyde','SK35 7BA','01965 2700949','Campbell','Ivakhin','c.ivakhin@melanochroic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('237','Estival Retail','22 Hypomania Street','Saltash','PL90 3BE','01263 1276148','Horace','Gillise','h.gillise@estival.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('238','Decamerous Fabrication','39 Almagest Gardens','Harrogate','HG74 5GA','01296 7679711','Barney','Ineson','b.ineson@decamerous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('239','Gawdelpus & Co','34 Hyperbaton Lane','Ashby-de-la-Zouch','LE21 0DG','01715 2108126','Casper','Jiggens','c.jiggens@gawdelpus.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('240','Howdah Ltd.','50 Curate Rise','Aberfeldy','PH2 8AD','01175 2091713','Granville','Rubenfeld','g.rubenfeld@howdah.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('241','Chaplet Retail','2 Rhabdos Place','Llanerchymedd','LL55 0BE','01527 8012161','Desmond','Reyburn','d.reyburn@chaplet.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('242','Phrontistery Ltd.','42 Navalism Passage','Hertford','SG39 4FE','0165 4738136','Magnus','Haglington','m.haglington@phrontistery.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('243','Kylin Ltd.','9 Saffron Gate','Bakewell','DE96 6CG','01118 5964303','Broderick','Kissick','b.kissick@kylin.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('244','Verruca Group','17 Chypre Green','Lampeter','SA85 7GC','01107 1487546','Bartholomew','Bidgod','b.bidgod@verruca.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('245','Verily Group','52 Zebrinny Square','Orkney','KW43 3DE','01725 1549059','Ewan','Finlry','e.finlry@verily.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('246','Circumpose Plc','48 Aciniform Lane','Gateshead','NE77 6GB','01893 6634451','Samuel','Scobbie','s.scobbie@circumpose.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('247','Riant Inc.','78 Noosphere Hill','Herne Bay','CT64 5CB','01887 4061228','Nadim','Thomson','n.thomson@riant.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('248','Nymphean Retail','22 Xeric Street','Great Yarmouth','NR90 0BB','01625 9256128','Kelvin','Keningley','k.keningley@nymphean.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('249','Ligniform & Co','82 Incunabulist Avenue','Alford','AB55 1EF','01582 1776551','Elden','Tinker','e.tinker@ligniform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('250','Tovarish Retail','12 Sejunction Canyon','Glossop','SK39 6AA','01191 7005432','Bruce','Burl','b.burl@tovarish.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('251','Headstock Plc','75 Bulliform Canyon','Cleator','CA78 8DE','01188 4455812','Gregory','Raden','g.raden@headstock.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('252','Fungiform Inc.','22 Pornocracy Canyon','Pentre','CF81 1FB','01347 1303403','Rudyard','McVicker','r.mcvicker@fungiform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('253','Piscatorial Industrial','45 Portmanteau Road','Weston-super-Mare','BS34 1GF','01361 3783713','Sidney','Dawdary','s.dawdary@piscatorial.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('254','Panopticon Services','9 Tressure Gate','Henley-on-Thames','RG74 6AG','0176 2404068','Niall','Ryland','n.ryland@panopticon.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('255','Spicaceous Industrial','26 Excresence Street','Pontypool','NP61 5BB','01201 7695030','Regan','Daley','r.daley@spicaceous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('256','Splenium Industrial','58 Etesian Circle','New Tredegar','NP94 1FA','01854 4774810','Damien','Bwye','d.bwye@splenium.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('257','Plantar Plc','22 Charterhouse Dell','Wigton','CA64 2EC','0182 1840556','Owen','Pressman','o.pressman@plantar.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('258','Dysaesthesia Services','4 Onychoid Road','Beckenham','BR91 8FF','01987 5781834','Magnus','Jarad','m.jarad@dysaesthesia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('259','Officialism & Co','54 Linaceous Mount','Attleborough','NR2 1EG','01922 9561484','Magnus','McCarrick','m.mccarrick@officialism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('260','Lamelliform Plc','97 Acanthous Drive','Gerrards Cross','SL39 8EA','01745 7396305','Edmund','Whimpenny','e.whimpenny@lamelliform.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('261','Tiromancy Inc.','28 Infaust Road','Balerno','EH30 7AE','01603 6093388','Vincent','Jeskin','v.jeskin@tiromancy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('262','Gyrostatics Group','12 Vidimus Mount','Bingley','BD46 3EA','01597 6216564','Earle','Manes','e.manes@gyrostatics.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('263','Tuille Inc.','35 Steric Lane','Callington','PL78 0AF','01798 1752084','Prince','MacCoveney','p.maccoveney@tuille.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('264','Byssiferous Industrial','68 Nanism Green','Bromyard','HR68 1DF','01199 2636644','Kevin','Mossom','k.mossom@byssiferous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('265','Cryptonym & Co','59 Oxygeusia Gardens','Llanon','SY58 1DF','01741 4675178','Errol','Pauleit','e.pauleit@cryptonym.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('266','Mariculture Fabrication','86 Peirastic Street','Torpoint','PL62 4BE','01615 5211332','Wynn','O''Kelly','w.okelly@mariculture.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('267','Prolusion Industrial','52 Helobious Passage','Peterhead','AB10 8GA','01104 1418229','Raphael','Scarlin','r.scarlin@prolusion.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('268','Gummiferous Inc.','21 Pseudacusis Row','Westcliff-on-Sea','SS29 0FF','01694 4058879','Francisco','Thing','f.thing@gummiferous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('269','Succise Industrial','91 Locutory Road','Beaumaris','LL37 8DG','01782 9528943','Stephen','Villaret','s.villaret@succise.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('270','Statolatry Inc.','82 Dwile Circle','Newtown','SY19 0EC','01588 2081310','Theobald','Grigoriev','t.grigoriev@statolatry.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('271','Russophobia Plc','6 Sferics Dell','Roslin','EH46 1GE','0160 7573614','Fagan','Joliffe','f.joliffe@russophobia.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('272','Bismer Inc.','63 Dispurvey Road','Lightwater','GU27 4CG','01128 2812975','Ian','Frushard','i.frushard@bismer.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('273','Solacious Inc.','73 Enervate Lane','Newmilns','KA17 6BD','01925 3690476','Walter','Scouller','w.scouller@solacious.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('274','Phugoid Retail','99 Custrel Parkway','Meifod','SY15 1AB','01358 2764772','Nelson','Lenham','n.lenham@phugoid.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('275','Wilding & Co','69 Pisiform Gate','St. Agnes','TR58 5EB','01956 1146324','Beau','Howard - Gater','b.howard.-.gater@wilding.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('276','Turriferous Group','54 Murally Circle','Newbridge','EH18 6BD','01956 2000818','Gilbert','Speerman','g.speerman@turriferous.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('277','Irrisory Group','57 Hierophant Street','Monmouth','NP75 7AD','01636 7763009','Landon','Kleinsinger','l.kleinsinger@irrisory.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('278','Longeron Plc','95 Nankeen Drive','Dinas Powys','CF63 1GG','01248 2789831','Fritz','Leetham','f.leetham@longeron.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('279','Plicated Fabrication','3 Nidatory Dell','Hassocks','BN19 2DC','01531 1874593','Xavier','Golborn','x.golborn@plicated.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('280','Alluvion Fabrication','64 Loxodrome Causeway','Ledbury','HR86 1FB','01529 6666817','Caldwell','Gasticke','c.gasticke@alluvion.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('281','Jointure Ltd.','26 Stapediform Circle','Cranleigh','GU52 4FA','0119 1150554','Doran','Bickford','d.bickford@jointure.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('282','Durity Services','63 Agnosic Avenue','Congleton','CW35 6DC','01322 3029826','Francisco','Wethey','f.wethey@durity.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('283','Contemper Retail','13 Spurion Mount','Colchester','CO22 2AC','01115 2101442','Erin','Keays','e.keays@contemper.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('284','Paraclete Group','86 Saburration Circle','Hornchurch','RM80 7DC','01296 4449238','Audley','Wharby','a.wharby@paraclete.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('285','Forcipate Industrial','98 Zelotic Gate','Chester le Street','DH83 5AG','01830 8430262','Caleb','Ricciardo','c.ricciardo@forcipate.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('286','Postmundane Industrial','75 Forfend Street','Downham Market','PE0 1CG','01692 3126827','Murray','Roback','m.roback@postmundane.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('287','Crachoir Fabrication','56 Zemindar Avenue','Driffield','YO60 1DE','01415 9040867','Price','Hillaby','p.hillaby@crachoir.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('288','Mizmaze Retail','33 Panophobia Street','Dunstable','LU38 3FC','01378 2988898','Eamon','Gurner','e.gurner@mizmaze.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('289','Solarism Plc','83 Theomancy Path','Holyhead','LL60 5AD','01127 4103718','Cary','Battabee','c.battabee@solarism.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('290','Bathykolpian Services','20 Lugubrious Mews','Duns','TD94 4BG','01771 1066099','Kevin','Binnie','k.binnie@bathykolpian.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('291','Sybil Plc','38 Weighage Green','Ayr','KA61 7AG','01622 6382696','Stanley','Gatenby','s.gatenby@sybil.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('292','Geotaxis Plc','44 Oroide Street','Cobham','KT53 3DF','01490 3237392','Charlie','Wrought','c.wrought@geotaxis.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('293','Acaulescent Group','94 Geocentrism Path','Newbury','RG56 3EG','01848 2821928','Errol','Palatini','e.palatini@acaulescent.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('294','Pewfellow Plc','87 Chaetiferous Path','Fleetwood','FY65 5CB','01981 4299832','Nathan','D''Alwis','n.dalwis@pewfellow.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('295','Chevon Retail','91 Vorant Green','Isle of Jura','PA13 4DA','01148 7144473','Price','Tanzer','p.tanzer@chevon.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('296','Isophote Plc','83 Flaughter Place','Portland','DT52 5FB','01775 7797441','Hayden','Jirus','h.jirus@isophote.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('297','Hesychastic Retail','12 Agrizoiatry Road','Romsey','SO21 6DD','01323 7887024','Roy','Yole','r.yole@hesychastic.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('298','Theurgy Industrial','93 Burdet Avenue','Haverfordwest','SA89 3CC','01429 9621758','Bede','Twidell','b.twidell@theurgy.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('299','Staysail Fabrication','25 Curiosa Street','Glenfinnan','PH90 5GF','01579 6328130','Malik','Tetford','m.tetford@staysail.co.uk');
INSERT INTO customer(reference, company_name, address, town, post_code, telephone, contact_fname, contact_sname, contact_email) VALUES ('300','Diabrotic Fabrication','51 Conglutinate Passage','Gateshead','NE20 3BD','01827 9525678','Norris','Lochrie','n.lochrie@diabrotic.co.uk');
set DEFINE on