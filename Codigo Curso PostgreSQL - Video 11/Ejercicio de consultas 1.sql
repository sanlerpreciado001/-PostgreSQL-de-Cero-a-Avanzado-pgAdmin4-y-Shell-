
--1.- SELECCIONAR LOS PACIENTE CUYOS NOMBRES TERMINEN CON UNA A O QUE SUS APELLIDOS TERMINEN CON UNA Z
--ORDENARLOS POR SU ID DE FORMA DESCENDENTE.

SELECT * FROM CLINICA.PACIENTE
WHERE nombre LIKE '%A' OR apellido LIKE '%Z'
ORDER BY pk_idPaciente DESC;

--2.- CONTAR LOS ESPECIALISTAS Y AGRUPARLOS POR SU ESPECIALIDAD
--RENOMBRAR COLUMNA EN CASO QUE SEA NECESARIO

SELECT COUNT(pk_idEspecialista) AS cantidad_especialistas, especialidad FROM CLINICA.ESPECIALISTA
GROUP BY especialidad;

--3.- SELECCIONAR LOS EXPEDIENTES DIAGNOSTICOS CUYO peso sea mayor a 50 o la edad mayor a 30

SELECT fk_idPaciente, edad, peso, altura FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
WHERE (peso < '50' OR edad > '30')


