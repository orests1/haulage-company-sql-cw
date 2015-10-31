
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

INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0045619','Eamon','O"'"Looney','JJ 56 53 26 B','0165 6727840','07659 9770175','N');
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
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0019383','Langley','O"'"Canavan','YY 33 92 76 F','01353 1643083','07398 4851545','Y');
INSERT INTO driver(employee_no,first_name,last_name,ni_no,telephone,mobile,hazardous_goods) VALUES ('0032481','Ernst','A"'"field','WW 96 29 21 E','01491 7070174','07178 6641268','N');
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
