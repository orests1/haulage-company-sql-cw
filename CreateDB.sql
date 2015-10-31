--Author: Lampros Valais
--Author Orestis Christou
DROP TABLE manifest;
DROP TABLE customer;
DROP TABLE category;
DROP TABLE trip;
DROP TABLE driver;
DROP TABLE vehicle;
DROP TABLE model;

CREATE TABLE model
(
vehicle_type_id INTEGER PRIMARY KEY,
model VARCHAR2(20),
make VARCHAR2(10)
);

CREATE TABLE vehicle
(
registration VARCHAR2(10) PRIMARY KEY,
vehicle_type_id INTEGER UNIQUE,
gvw INTEGER,
body VARCHAR2(10),
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

