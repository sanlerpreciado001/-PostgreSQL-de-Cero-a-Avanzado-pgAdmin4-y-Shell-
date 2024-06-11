--WHILE
--numeros pares


CREATE OR REPLACE FUNCTION CLINICA.WhileNumeroPares(numero INT) 
RETURNS INT AS $$
DECLARE
	i INT :=0;
BEGIN 
     WHILE i < numero LOOP
	 	IF (i%2)=0 THEN
			 RAISE NOTICE 'CONTADOR %', i;
		END IF;
	 i = i + 1;
		END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT CLINICA.WhileNumeroPares(20);