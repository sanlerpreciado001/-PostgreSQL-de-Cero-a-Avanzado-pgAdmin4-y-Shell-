-- CONCAT:

SELECT CONCAT ('El Paciente con ID:', fk_idPaciente, ' Tiene un Peso de: ', peso, ' KG')
FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;

-- LAMINA 72

SELECT (nombre || ' ' || apellido) AS NOMBRE_COMPLETO FROM CLINICA.PACIENTE;




						