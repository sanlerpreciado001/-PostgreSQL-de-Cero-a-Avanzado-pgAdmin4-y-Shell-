--RECEPCIONISTA
--CREAR ROLE DE RECEPCIONISTA
CREATE ROLE recepcionista;

GRANT USAGE ON SCHEMA CLINICA TO recepcionista;

GRANT SELECT, INSERT, UPDATE 
ON CLINICA.PACIENTE, CLINICA.CITA, CLINICA.AGENDAR_CITA
TO recepcionista WITH GRANT OPTION;

GRANT DELETE ON CLINICA.PACIENTE TO recepcionista WITH GRANT OPTION;

CREATE USER recepcionista_1 WITH PASSWORD '12345' CONNECTION LIMIT 1 IN ROLE recepcionista;
CREATE USER recepcionista_2 WITH PASSWORD '12345' CONNECTION LIMIT 1 IN ROLE recepcionista;
CREATE USER recepcionista_3 WITH PASSWORD '12345' CONNECTION LIMIT 1 IN ROLE recepcionista;
SELECT * FROM CLINICA.PACIENTE;