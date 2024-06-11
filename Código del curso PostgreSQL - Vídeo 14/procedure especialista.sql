CREATE OR REPLACE PROCEDURE CLINICA.InsertarEspecialista
(nombre VARCHAR(20), apellido VARCHAR(20), sexo CHAR(1), fechaNacimiento DATE, especialidad VARCHAR(30)) 
LANGUAGE plpgsql
AS $$
DECLARE
	idEspecialista CHAR(7);
	idEspecialistaAux CHAR(4);
BEGIN
	
	IF NOT EXISTS (SELECT pk_idEspecialista FROM CLINICA.ESPECIALISTA WHERE pk_idEspecialista = 'ME-0001' ) THEN
		idEspecialista = 'ME-0001';
	ELSE
		idEspecialista := (SELECT pk_idEspecialista FROM CLINICA.ESPECIALISTA ORDER BY pk_idEspecialista DESC LIMIT 1);
		idEspecialistaAux := (SELECT SUBSTRING(idEspecialista, 4, 7));
		idEspecialistaAux := CAST(idEspecialistaAux AS INT)+1;
		
		IF idEspecialistaAux < '9' THEN
			idEspecialista = 'ME-000' || idEspecialistaAux;
		ELSEIF idEspecialistaAux BETWEEN '10' AND '99' THEN
			idEspecialista = 'ME-00' ||  idEspecialistaAux;
		ELSEIF idEspecialistaAux BETWEEN '100' AND '999' THEN
			idEspecialista = 'ME-0' ||  idEspecialistaAux;	
		END IF;
	END IF;
	
	INSERT INTO CLINICA.ESPECIALISTA
	VALUES (idEspecialista, nombre, apellido, sexo, fechanacimiento, especialidad);

	RAISE NOTICE 'ESPECIALISTA INGRESADO CORRECTAMENTE';
END; $$

CALL CLINICA.InsertarEspecialista('EJEMPLO', 'EJEMPLO', 'M', '2000-01-01', 'MEDICO GENERAL');

SELECT * FROM CLINICA.ESPECIALISTA;

DELETE FROM CLINICA.ESPECIALISTA WHERE pk_idEspecialista = 'ME-0006';