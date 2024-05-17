
--7.- SELECCIONAR CUÁNTOS DIAGNOSTICOS TIENEN CADA PACIENTE INGRESADO Y 
--AGRUPARLOS POR SU ID, ORDENARLO LA CANTIDAD DE CITAS DE MAYOR A MENOR

SELECT fk_idPaciente, COUNT(fk_idPaciente) AS cantidad_diagnosticos
FROM CLINICA.EXPEDIENTE_DIAGNOSTICO 
GROUP BY fk_idPaciente 
ORDER BY COUNT(fk_idPaciente) DESC;

--8.- SELECCIONA LOS EXPEDIENTES DE LOS PACIENTES QUE TENGAN NIVELES DE PESO EN NORMAL Y SOBREPESO, 
-- ADEMÁS QUE LOS HAYAN ATENDIDO LOS ESPECIALISTA CUYA ESPECIALIDAD NO SEA DE MEDICO GENERAL

SELECT * FROM CLINICA.EXPEDIENTE_DIAGNOSTICO 
WHERE nivelPeso IN('NORMAL', 'SOBREPESO') 
AND fk_idEspecialista IN (SELECT pk_idEspecialista FROM CLINICA.ESPECIALISTA
						 WHERE especialidad NOT IN ('MEDICO GENERAL'))
						 
--9.- SELECCIONAR LOS PACIENTES QUE VIVAN EN LA CIUDAD DE MANTA Y QUE HALLAN NACIDE DEPUES DE 1990, 
--ADEMÁS QUE NO TENGAN ALERGÍAS O PADECIMIENTOS CRONICOS
--POR ÚLTIMO QUE HALLAN RECIBIDO DIAGNOSTICOS DE LOS ESPECIALISTAS CUYOS ID SEAN: ME-0001, ME-0002 Y ME-0003 

SELECT * FROM CLINICA.PACIENTE 
WHERE ciudad = 'MANTA' AND fechaNacimiento >= '1990-01-01' 
AND pk_idPaciente IN (SELECT pk_idPaciente FROM CLINICA.EXPEDIENTE
					  WHERE tipoAlergia = 'NA' OR padecimientoCro = 'NA')
AND pk_idPaciente IN (SELECT fk_idPaciente FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
					  WHERE fk_idEspecialista IN('ME-0001', 'ME-0002', 'ME-0003'));	
					  


