CREATE OR REPLACE PROCEDURE CLINICA.CitaStatusRealizada(idCita CLINICA.ID_CITA)
LANGUAGE  plpgsql 
AS $$
DECLARE
	status CHAR(10) := (SELECT status FROM CLINICA.AGENDAR_CITA WHERE fk_idCita = idCita);
BEGIN
	IF NOT EXISTS (SELECT pk_idCita FROM CLINICA.CITA WHERE pk_idCita = idCita) THEN
		RAISE NOTICE 'EL ID DE CITA NO EXISTE DENTRO DE LA BASE DE DATOS';
	ELSEIF status = 'CANCELADA' THEN
		RAISE NOTICE 'LA CITA YA HA SIDO CANCELADA ANTERIORMENTE';
	ELSE
		UPDATE CLINICA.AGENDAR_CITA SET status = 'REALIZADA' 
		WHERE fk_idCita = idCita;
		RAISE NOTICE 'CITA REALIZADA CORRECTAMENTE';
	END IF;
END; $$


CALL CLINICA.CitaStatusRealizada('CM-0008');

SELECT * FROM CLINICA.AGENDAR_CITA;