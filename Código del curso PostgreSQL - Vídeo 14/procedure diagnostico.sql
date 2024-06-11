CREATE OR REPLACE PROCEDURE CLINICA.InsertarDiagnostico
(fk_idEspecialista CLINICA.ID_MEESPECIALISTA, fk_idPaciente CLINICA.ID_PACIENTE, edad CHAR(2), peso CHAR(3),
	altura CHAR(3), presionArterial CHAR(6), diagnostico VARCHAR(100), recetario VARCHAR(100)) 
LANGUAGE plpgsql
AS $$
DECLARE
	imc REAL;
	pesoNum INT;
	alturaNum REAL;
	nivelPeso CHAR(10);
	fechaCreacion TIMESTAMP := (SELECT LEFT(CAST (CURRENT_TIMESTAMP AS CHAR(30)), 19 ));
BEGIN
	pesoNum := peso;
	alturaNum := altura;
	imc := pesoNum / (alturaNum*alturaNum);
	imc := CAST (imc AS CHAR(5));
	
	IF imc < '18.5' THEN
		nivelPeso := 'BAJO';
	ELSEIF imc BETWEEN '18.5' AND '24.9' THEN
		nivelPeso := 'NORMAL';
	ELSEIF imc BETWEEN '25.0' AND '29.9' THEN
		nivelPeso := 'SOBREPESO';
	ELSE
		nivelPeso := 'OBESIDAD';
	END IF;
	
	INSERT INTO CLINICA.EXPEDIENTE_DIAGNOSTICO(
	fk_idespecialista, fk_idpaciente, edad, peso, altura, imc, nivelpeso, presionarterial, 
		diagnostico, recetario, fechacreacion)
	VALUES (fk_idEspecialista, fk_idPaciente, edad, peso, altura, imc, nivelPeso, 
			presionArterial, diagnostico, recetario, fechaCreacion);
	
	RAISE NOTICE 'EXPEDIENTE DIAGNOSTICO INSERTADO';
END; $$

CALL CLINICA.InsertarDiagnostico
('ME-0001', 'P-0001', '20', '80', '1.75', '120/70', 'NA', 'NA');

SELECT * FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;