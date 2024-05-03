-- CREACION DE DOMINOS 

CREATE DOMAIN CLINICA.ID_PACIENTE AS CHAR(6) NOT NULL
	CHECK (VALUE ~ '^[P]{1}[-]{1}\D{4}$'); 

CREATE DOMAIN CLINICA.ID_MEESPECIALISTA AS CHAR(7) NOT NULL
	CHECK (VALUE ~ '^[ME]{2}[-]{1}\D{4}$');
	
CREATE DOMAIN CLINICA.ID_CITA AS CHAR(7) NOT NULL
	CHECK (VALUE ~ '^[CM]{2}[-]{1}\d{4}$'); 
	

--CREATE TABLE CLINICA.ESPECIALISTA(
	pk_idEspecialista CLINICA.ID_MEESPECIALISTA,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	sexo CHAR(1) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	especialidad VARCHAR(30) NOT NULL,
	PRIMARY KEY (pk_idEspecialista)