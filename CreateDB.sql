
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
