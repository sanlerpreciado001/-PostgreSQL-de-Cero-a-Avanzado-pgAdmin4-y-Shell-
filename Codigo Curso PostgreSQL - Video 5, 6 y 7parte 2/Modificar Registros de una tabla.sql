Modificar Registros de una tabla

	--1. OND
		UPDATE CLINICA.PACIENTE
		SET CIUDAD = 'MONTECRISTI'
		WHERE sexo = 'F' AND estado = 'MANABI';
	--2. OR
		UPDATE CLINICA.PACIENTE
		SET CIUDAD = 'MANTA'
		WHERE sexo = 'F' AND estado = 'MANABI';