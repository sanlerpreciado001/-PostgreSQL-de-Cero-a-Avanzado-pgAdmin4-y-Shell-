--REPLACE

SELECT REPLACE ('MENSAJX', 'X', 'E');

-- LAMINA 76

SELECT * FROM CLINICA.EXPEDIENTE;

-- LAMINA 77

UPDATE CLINICA.EXPEDIENTE SET tipoSangre = REPLACE (tipoSangre, 'B', 'O') 
WHERE tipoAlergia='NA' AND padecimientoCro='NA';





						