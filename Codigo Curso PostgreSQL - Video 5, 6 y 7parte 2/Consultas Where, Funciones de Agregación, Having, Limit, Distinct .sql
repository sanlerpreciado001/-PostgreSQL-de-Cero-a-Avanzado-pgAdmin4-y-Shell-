Consultas: Where, Funciones de Agregación, Having, Limit, Distinct 

 
	--1. Consulta Básica
	SELECT * FROM CLINICA.PACIENTE;
	
	--2. Consulta Especifica
	SELECT pk_idPaciente, nombre, apellido FROM CLINICA.PACIENTE;
	
	--3. IN
	SELECT * FROM CLINICA.PACIENTE 
	WHERE ciudad IN ('PORTOVIEJO');
	
	--4. IN NOT
	SELECT * FROM CLINICA.PACIENTE 
	WHERE ciudad NOT IN ('PORTOVIEJO');
	
	--5. LIKE 
	SELECT * FROM CLINICA.PACIENTE 
	WHERE apellido LIKE '%Z';
	
	--6. BETWEEN
	SELECT * FROM CLINICA.AGENDAR_CITA
	WHERE (fechacita BETWEEN '2022-10-05' AND '2022-10-06')
	AND (turno = 'MATUTINO');
	
	--7. DIFERENTE <>
	SELECT * FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
	WHERE nivelPeso <> 'NORMAL';
	
	--8. COUNT
	SELECT COUNT (*) AS cantidad_paciente FROM CLINICA.PACIENTE 
	WHERE ciudad = 'PORTOVIEJO';
	
	--9. SUM Y CAST
	SELECT SUM(CAST(peso AS INT)) AS suma_peso
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;

	--8. MAX
	SELECT MAX(peso) AS peso_Maximo
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;
	
	--9. MIN
	SELECT MIN(peso) AS peso_Maximo
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;
	
	--10. AVG
	SELECT AVG(CAST(peso AS INT)) AS promedio_peso
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;
	
	--11. EJEMPLOS DE ALGUNAS FUNCIONES DE AGREGACIONES
	SELECT MAX(edad) as edad_max, MIN(edad), SUM(CAST (edad AS INT)) AS suma_edad,
	AVG(CAST (edad AS INT)) AS edad_promedio, COUNT(*) AS cantidad_diagnostico
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;
	
	--12. GROUP BY y ORDER BY
	SELECT fk_idEspecialista FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
	GROUP BY fk_idEspecialista; 
	
	SELECT COUNT (nivelPeso) AS cantidad_peso, nivelPeso FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
	GROUP BY nivelPeso ; 

	SELECT fk_idPaciente, AVG( CAST( peso AS INT))
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
	GROUP BY fk_idPaciente ORDER BY fk_idPaciente DESC;  
	
	SELECT * FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
	ORDER BY folio ASC
	
	--13. HAVING 
	SELECT fk_idEspecialista, COUNT (fk_idEspecialista) AS citas_realizar 
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
	GROUP BY fk_idEspecialista 
	HAVING COUNT (fk_idEspecialista) > 1
	
	SELECT fk_idPaciente, AVG( CAST (peso AS INT)) AS promedio_peso
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO
	GROUP BY fk_idPaciente, peso
	HAVING AVG( CAST (peso AS INT)) < 70
	
	--14. DISTINCT
	SELECT DISTINCT fk_idEspecialista
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO 
	ORDER BY fk_idEspecialista;
	
	SELECT fk_idEspecialista
	FROM CLINICA.EXPEDIENTE_DIAGNOSTICO 
	ORDER BY fk_idEspecialista;
	
	--15. LIMIT 
	SELECT * FROM CLINICA.PACIENTE
	ORDER BY fechanacimiento DESC
	LIMIT 4;
	