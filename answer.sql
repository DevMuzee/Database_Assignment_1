--CREATE DATABASE hospital; 

--USE [hospital]

--Patient table syntax
CREATE TABLE patients (
	patient_id INT PRIMARY KEY IDENTITY (1,1),
	first_name VARCHAR (50) NOT NULL, 
	last_name VARCHAR (50) NOT NULL,
	date_of_birth DATE NOT NULL,
	gender VARCHAR(10) NOT NULL,
	language VARCHAR(20) NOT NULL
);

--Providers table syntax
CREATE TABLE providers (
	provider_id INT PRIMARY KEY IDENTITY(1,1),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	provider_speciality VARCHAR(50) NOT NULL,
	email_address VARCHAR(100),
	phone_number VARCHAR(20),
	date_joined DATE NOT NULL
);

--Visits table syntax
CREATE TABLE visits (
	visit_id INT PRIMARY KEY IDENTITY(1,1),
	patient_id INT FOREIGN  KEY REFERENCES patients(patient_id),
	provider_id INT FOREIGN  KEY REFERENCES providers(provider_id),
	date_of_visit DATE NOT NULL,
	date_scheduled DATE NOT NULL,
	visit_department_id INT NOT NULL,
	visit_type VARCHAR(255) NOT NULL,
	blood_pressure_systollic INT,
	blood_pressure_diastollic DECIMAL,
	pulse DECIMAL,
	visit_status VARCHAR NOT NULL

);


--ed_visits table syntax
CREATE TABLE ed_visits (
	ed_visits_id INT PRIMARY KEY IDENTITY(1,1),
	visit_id INT FOREIGN KEY REFERENCES visits(visit_id),
	patient_id INT FOREIGN KEY REFERENCES patients(patient_id),
	acuity INT NOT NULL,
	reason_for_visit VARCHAR(255) NOT NULL,
	disposition VARCHAR(255) NOT NULL
);

--admission table syntax
CREATE TABLE admissions (
	admission_id INT PRIMARY KEY IDENTITY(1,1),
	patient_id INT FOREIGN KEY REFERENCES patients(patient_id),
	admission_date DATE NOT NULL,
	discharge_date DATE NOT NULL,
	discharge_disposition VARCHAR(255) NOT NULL,
	[service] VARCHAR(255) NOT NULL,
	primary_diagnosis VARCHAR(255) NOT NULL
);

--Discharge table syntax
CREATE TABLE discharges (
	discharge_id INT PRIMARY KEY IDENTITY(1,1),
	admission_id INT FOREIGN KEY REFERENCES admissions(admission_id),
	patient_id INT FOREIGN KEY REFERENCES patients(patient_id),
	discharge_date DATE NOT NULL,
	discharge_disposition VARCHAR(255) NOT NULL
);
