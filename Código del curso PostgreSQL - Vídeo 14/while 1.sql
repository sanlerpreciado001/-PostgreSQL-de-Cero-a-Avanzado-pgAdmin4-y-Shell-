--WHILE

CREATE OR REPLACE FUNCTION CLINICA.While(numero INT) 
RETURNS INT AS $$
DECLARE
	i INT :=0;
BEGIN 
     WHILE i < numero LOOP
	 RAISE NOTICE 'CONTADOR %', i;
	 i = i + 1;
		END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT CLINICA.While(5);
