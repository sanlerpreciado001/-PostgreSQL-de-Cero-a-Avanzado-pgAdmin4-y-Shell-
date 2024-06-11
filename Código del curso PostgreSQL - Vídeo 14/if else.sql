--IF ELSE

CREATE OR REPLACE FUNCTION CLINICA.NumeroMayorMenor(numero1 INT, numero2 INT) 
RETURNS VARCHAR(30) AS $$

BEGIN 
     IF numero1 > numero2 THEN
	     RETURN 'El número:' || numero1 || ' es mayor que el Número:' || numero2;
	 ELSEIF numero1 < numero2 THEN
		 RETURN 'El número:' || numero1 || ' es menor que el Número:' || numero2;
	 ELSE
	 	RETURN 'El número:' || numero1 || ' es igual que el Número:' || numero2;
	END IF;
END;
$$ LANGUAGE plpgsql;


SELECT CLINICA.NumeroMayorMenor(5,2);
SELECT CLINICA.NumeroMayorMenor(2,5);
SELECT CLINICA.NumeroMayorMenor(5,5);