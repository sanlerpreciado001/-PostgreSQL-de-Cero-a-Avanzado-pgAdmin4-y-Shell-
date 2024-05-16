--DATE PART

SELECT DATE_PART('year', '2012-01-01'::date) - DATE_PART('year', '2011-01-01'::date) AS DIF_AÑO;

-- LAMINA 85

SELECT DATE_PART('month', '2011-10-01'::date) - DATE_PART('month', '2011-02-01'::date) AS DIF_MES;


SELECT DATE_PART('day', '2011-10-10'::date) - DATE_PART('day', '2011-10-01'::date) AS DIF_DIA;

-- LAMINA 86

SELECT DATE_PART('hour', '2011-12-10 15:00'::timestamp) - DATE_PART('hour', '2011-12-10 09:00'::timestamp) AS DIF_HORA;


SELECT DATE_PART('min', '2011-12-30 15:40'::timestamp) - DATE_PART('min', '2011-12-20 15:00'::timestamp) AS DIF_MIN;

-- LAMINA 87

SELECT CONCAT ( DATE_PART ('sec', '2011-12-30 09:00:59'::timestamp - '2011-12-30 09:00:00'::timestamp), ' Segundos') 
AS DIF_SEG;









						