--HOLA MUNDO

CREATE FUNCTION CLINICA.HolaMundo() RETURNS VARCHAR(20) AS $$
DECLARE
     	mensaje VARCHAR(20) := 'HOLA MUNDO';
BEGIN 
     RETURN mensaje;
END;
$$ LANGUAGE plpgsql;


SELECT CLINICA.HolaMundo()



CREATE OR REPLACE FUNCTION CLINICA.HolaMundo(mensaje VARCHAR(20)) RETURNS VARCHAR(20) AS $$
BEGIN 
     RETURN mensaje;
END;
$$ LANGUAGE plpgsql;


SELECT CLINICA.HolaMundo('HOLA DESDE PL/PGSQL');