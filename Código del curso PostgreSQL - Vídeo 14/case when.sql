CREATE OR REPLACE FUNCTION CLINICA.MesesAño(numeroMes INT) 
RETURNS VARCHAR(30) AS $$
DECLARE
	mensaje VARCHAR(30) := 'El número del mes es: ';---
BEGIN 
     CASE
	 WHEN numeroMes = 1 THEN
	 RETURN mensaje || 'Enero';
	 WHEN numeroMes = 2 THEN
	 RETURN mensaje || 'Febrero';
	 WHEN numeroMes = 3 THEN
	 RETURN mensaje || 'Marzo';
	 WHEN numeroMes = 4 THEN
	 RETURN mensaje || 'Abril';
	 WHEN numeroMes = 5 THEN
	 RETURN mensaje || 'Mayo';
	 WHEN numeroMes = 6 THEN
	 RETURN mensaje || 'Junio';
	 WHEN numeroMes = 7 THEN
	 RETURN mensaje || 'Julio';
	 WHEN numeroMes = 8 THEN
	 RETURN mensaje || 'Agosto';
	 WHEN numeroMes = 9 THEN
	 RETURN mensaje || 'Septiembre';
	 WHEN numeroMes = 10 THEN
	 RETURN mensaje || 'Octubre';
	 WHEN numeroMes = 11 THEN
	 RETURN mensaje || 'Noviembre';
	 WHEN numeroMes = 12 THEN
	 RETURN mensaje ||'Diciembre';
	 ELSE
	 RETURN 'El número no corresponde al mes o no está declarado';
	END CASE;
END;
$$ LANGUAGE plpgsql;

SELECT CLINICA.MesesAño(15);


