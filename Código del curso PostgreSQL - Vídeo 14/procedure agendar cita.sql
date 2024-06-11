CREATE OR REPLACE PROCEDURE CLINICA.InsertarCitaAgendarCita
(idPaciente CLINICA.ID_PACIENTE, idEspecialista CLINICA.ID_MEESPECIALISTA, consultorio VARCHAR(20),
	fechaCita DATE, horaCita TIME, observaciones VARCHAR(100)) 
LANGUAGE plpgsql
AS $$
DECLARE
	idCita CHAR(7);
	idCitaAux CHAR(4);
	fechaActual DATE := (SELECT CURRENT_DATE);
	horaActual TIME := (SELECT CURRENT_TIME);
	Turno VARCHAR(10);
BEGIN
	
	IF NOT EXISTS (SELECT pk_idCita FROM CLINICA.CITA WHERE pk_idCita = 'CM-0001' ) THEN
		idCita = 'CM-0001';
	ELSE
		idCita := (SELECT pk_idCita FROM CLINICA.CITA ORDER BY pk_idCita DESC LIMIT 1);
		idCitaAux := (SELECT SUBSTRING(idCita, 4, 7));
		idCitaAux := CAST(idCitaAux AS INT)+1;
		
		IF idCitaAux < '9' THEN
			idCita = 'CM-00' || idCitaAux;
		ELSEIF idCitaAux BETWEEN '10' AND '99' THEN
			idCita = 'CM-0' ||  idCitaAux;
		ELSEIF idCitaAux BETWEEN '100' AND '999' THEN
			idCita = 'CM-' ||  idCitaAux;	
		END IF;
	END IF;
	
	IF horaActual >= '12:00' THEN
		turno = 'VESPERTINO';
	ELSE 
		turno = 'MATUTINO';
	END IF;
	
	IF fechaCita < fechaActual THEN
		RAISE NOTICE 'NO SE PUEDEN HACER CITAS EN FECHAS ANTERIORES - CITA NO INGRESADA';
	ELSE
		INSERT INTO CLINICA.CITA VALUES (idCita, idPaciente, fechaActual, horaActual);

		INSERT INTO CLINICA.AGENDAR_CITA VALUES
		(idCita, idEspecialista, consultorio, fechaCita, horaCita, turno, 'ESPERA', observaciones);

		RAISE NOTICE 'CITA INGRESADA CORRECTAMENTE';
	END IF;
END; $$

CALL CLINICA.InsertarCitaAgendarCita('P-0001', 'ME-0001', 'CONSULTORIO 1', '2022-01-01', '12:00', 'NA');


SELECT * FROM CLINICA.CITA;

SELECT * FROM CLINICA.AGENDAR_CITA;