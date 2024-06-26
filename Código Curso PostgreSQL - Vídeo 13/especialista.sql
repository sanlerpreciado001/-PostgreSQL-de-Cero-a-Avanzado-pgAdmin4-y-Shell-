--ESPECIALISTA
--CREAR ROLE DE ESPECIALISTA
CREATE ROLE especialista;

GRANT USAGE ON SCHEMA CLINICA TO especialista; 

GRANT SELECT, INSERT, UPDATE 
ON CLINICA.EXPEDIENTE, CLINICA.EXPEDIENTE_DIAGNOSTICO
TO especialista WITH GRANT OPTION;

GRANT SELECT ON CLINICA.PACIENTE TO especialista WITH GRANT OPTION;

CREATE USER especialista_1 WITH PASSWORD '12345' CONNECTION LIMIT 1 IN ROLE especialista;
CREATE USER especialista_2 WITH PASSWORD '12345' CONNECTION LIMIT 1 IN ROLE especialista;
CREATE USER especialista_3 WITH PASSWORD '12345' CONNECTION LIMIT 1 IN ROLE especialista;

INSERT INTO CLINICA.PACIENTE VALUES 
('P-0011', 'DANIEL', 'HERNANDEZ', 'M', '1990-01-01', 'MEXICO', 'MEXICO', '662342122');