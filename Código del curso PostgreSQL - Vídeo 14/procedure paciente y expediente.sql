CREATE OR REPLACE PROCEDURE CLINICA.InsertarPacienteExpediente
(nombre VARCHAR(20), apellido VARCHAR(20), sexo CHAR(1), fechaNacimiento DATE, 
	ciudad VARCHAR(30), estado VARCHAR(30), telefono CHAR(10), tipoSangre VARCHAR(10),
		tipoAlergia VARCHAR(30), padecimientoCro VARCHAR(30)) 
LANGUAGE plpgsql
AS $$
DECLARE
	idPaciente CHAR(6);
	idPacienteAux CHAR(4);
	fechaCreacion TIMESTAMP:= (SELECT LEFT(CAST (CURRENT_TIMESTAMP AS CHAR(30)), 19 ));
BEGIN
	
	IF NOT EXISTS (SELECT pk_idPaciente FROM CLINICA.PACIENTE WHERE pk_idPaciente = 'P-0001' ) THEN
		idPaciente = 'P-0001';
	ELSE
		idPaciente := (SELECT pk_idPaciente FROM CLINICA.PACIENTE ORDER BY pk_idPaciente DESC LIMIT 1);
		idPacienteAux := (SELECT SUBSTRING(idPaciente, 3, 6));
		idPacienteAux := CAST(idPacienteAux AS INT)+1;
		
		IF idPacienteAux < '9' THEN
			idPaciente = 'P-00' || idPacienteAux;
		ELSEIF idPacienteAux BETWEEN '10' AND '99' THEN
			idPaciente = 'P-0' ||  idPacienteAux;
		ELSEIF idPacienteAux BETWEEN '100' AND '999' THEN
			idPaciente = 'P-' ||  idPacienteAux;	
		END IF;
	END IF;
	
	INSERT INTO CLINICA.PACIENTE 
	VALUES (idPaciente, nombre, apellido, sexo, fechanacimiento, ciudad, estado, telefono );
	
	INSERT INTO CLINICA.EXPEDIENTE
	VALUES (idPaciente, tipoSangre, tipoAlergia, padecimientoCro, fechaCreacion);

	RAISE NOTICE 'PACIENTE Y EXPEDIENTE INGRESADO CORRECTAMENTE';
END; $$

CALL CLINICA.InsertarPacienteExpediente
('DANIEL', 'CARMONA', 'M', '1999-01-01', 'MEXICO', 'MEXICO', '5549809822', 'O POSITIVO', 'NA', 'NA' );

SELECT * FROM CLINICA.PACIENTE;