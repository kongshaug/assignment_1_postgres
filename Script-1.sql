DROP TABLE IF EXISTS Dog CASCADE;
DROP TABLE IF EXISTS Cat CASCADE;
DROP TABLE IF EXISTS PetCaretaker CASCADE;
DROP TABLE IF EXISTS Pet;
DROP TABLE IF EXISTS Vet;
DROP TABLE IF EXISTS Caretaker CASCADE;
DROP TABLE IF EXISTS City;

---


CREATE TABLE City (
    zipCode int PRIMARY KEY NOT NULL,
    cityName varchar(50) UNIQUE NOT NULL 
    );


CREATE TABLE Caretaker (
	id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	phone int NOT NULL,
	street varchar(50) NOT NULL,
	zipCode int REFERENCES City NOT NULL
    );


CREATE TABLE Vet (
	id int PRIMARY KEY REFERENCES Caretaker NOT NULL,
    cvr char(8) 
    );

CREATE TABLE Pet (
	id SERIAL PRIMARY KEY,
	name varchar(20) NOT NULL,
	age int NOT null,
	VetId int references VET NOT NULL
	);


CREATE TABLE PetCaretaker (
	CaretakerId int REFERENCES Caretaker NOT NULL,
	PetId int REFERENCES Pet NOT NULL
	);


CREATE TABLE Cat (
	id int PRIMARY KEY REFERENCES Pet NOT NULL,
	lifeCount int DEFAULT (9)
	);

CREATE TABLE Dog (
	id int PRIMARY KEY REFERENCES Pet NOT NULL,
	BarkPitch char(2)
	);
