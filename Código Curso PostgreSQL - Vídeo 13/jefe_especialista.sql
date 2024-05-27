--JEFE_ESPECIALISTA
--CREAR ROLE DE JEFE_ESPECIALISTA
CREATE ROLE jefe_especialista;

GRANT USAGE ON SCHEMA CLINICA TO jefe_especialista;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA CLINICA TO jefe_especialista WITH GRANT OPTION; 

GRANT SELECT, INSERT, UPDATE 
ON CLINICA.EXPEDIENTE, CLINICA.EXPEDIENTE_DIAGNOSTICO, CLINICA.ESPECIALISTA
TO jefe_especialista WITH GRANT OPTION;

GRANT DELETE ON CLINICA.ESPECIALISTA 
TO jefe_especialista WITH GRANT OPTION;

CREATE USER jefe_especialista_1 WITH PASSWORD '12345' CONNECTION LIMIT 1 IN ROLE jefe_especialista;