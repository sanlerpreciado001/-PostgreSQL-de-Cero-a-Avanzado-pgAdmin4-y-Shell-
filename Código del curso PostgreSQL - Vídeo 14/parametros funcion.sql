CREATE FUNCTION CLINICA.SumaNumeros(numero1 INT, numero2 INT) 
RETURNS INT AS $$
BEGIN 
     RETURN numero1 + numero2;
END;
$$ LANGUAGE plpgsql;


SELECT CLINICA.SumaNumeros(2,2);