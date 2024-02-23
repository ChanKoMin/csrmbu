SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Image;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Brand;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Showroom_Salesperson;
DROP TABLE IF EXISTS Salesperson;
DROP TABLE IF EXISTS Showroom;




/* Create Tables */

CREATE TABLE Admin
(
	admin_id int NOT NULL,
	admin_name varchar(25),
	admin_password varchar(25),
	username varchar(25),
	password varchar(25),
	contact_number varchar(25),
	created_at date,
	PRIMARY KEY (admin_id)
);


CREATE TABLE Brand
(
	brand_id int NOT NULL,
	brand_name varchar(25),
	brand_img int NOT NULL,
	created_at date,
	PRIMARY KEY (brand_id)
);


CREATE TABLE Car
(
	car_id int NOT NULL,
	showroom_id int NOT NULL,
	brand_id int NOT NULL,
	car_name varchar(25),
	car_model varchar(25),
	car_type varchar(25),
	car_cost float(10),
	created_at date,
	PRIMARY KEY (car_id)
);


CREATE TABLE Customer
(
	customer_id int NOT NULL,
	first_name varchar(25),
	last_name varchar(25),
	contact_number varchar(25),
	email_id varchar(25),
	password varchar(25),
	address text,
	created_at date,
	PRIMARY KEY (customer_id)
);


CREATE TABLE Image
(
	img_id int NOT NULL,
	car_id int NOT NULL,
	img_name varchar(25),
	default_img int,
	created_at date,
	PRIMARY KEY (img_id)
);


CREATE TABLE Sales
(
	sales_id int NOT NULL,
	car_id int NOT NULL,
	customer_id int NOT NULL,
	showroom_salesperson_id int NOT NULL,
	order_date date,
	delivery_date date,
	created_at date,
	PRIMARY KEY (sales_id)
);


CREATE TABLE Salesperson
(
	salesperson_id int NOT NULL,
	company_name varchar(25),
	first_name varchar(25),
	last_name varchar(25),
	user_name varchar(25),
	password varchar(25),
	contact_number varchar(25),
	address text,
	created_at date,
	PRIMARY KEY (salesperson_id)
);


CREATE TABLE Showroom
(
	showroom_id int NOT NULL,
	showroom_name varchar(50),
	contact_number varchar(25),
	address text,
	created_at date,
	PRIMARY KEY (showroom_id)
);


CREATE TABLE Showroom_Salesperson
(
	showroom_salesperson_id int NOT NULL,
	salesperson_id int NOT NULL,
	showroom_id int NOT NULL,
	PRIMARY KEY (showroom_salesperson_id)
);



/* Create Foreign Keys */

ALTER TABLE Car
	ADD FOREIGN KEY (brand_id)
	REFERENCES Brand (brand_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Image
	ADD FOREIGN KEY (car_id)
	REFERENCES Car (car_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Sales
	ADD FOREIGN KEY (car_id)
	REFERENCES Car (car_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Sales
	ADD FOREIGN KEY (customer_id)
	REFERENCES Customer (customer_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Showroom_Salesperson
	ADD FOREIGN KEY (salesperson_id)
	REFERENCES Salesperson (salesperson_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Car
	ADD FOREIGN KEY (showroom_id)
	REFERENCES Showroom (showroom_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Showroom_Salesperson
	ADD FOREIGN KEY (showroom_id)
	REFERENCES Showroom (showroom_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Sales
	ADD FOREIGN KEY (showroom_salesperson_id)
	REFERENCES Showroom_Salesperson (showroom_salesperson_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



