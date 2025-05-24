-- 1. Cuando se realizan consultas sobre la tabla paciente agrupando por ciudad los tiempos de respuesta son demasiado largos. Proponer mediante una query SQL una solución a este problema.
CREATE INDEX indice_pacientes_ciudad
ON Pacientes (ciudad);

/* Para reducir los tiempos de respuesta de las consultas agrupadas por ciudad que se hacen sobre la tabla paciente, 
lo que se puede hacer es crear un índice en base a la columna ciudad de esta misma tabla. 
Esto se debe a que el índice permite que la base de datos acceda a los valores de esa columna de forma más eficiente, 
sin tener que recorrer la tabla fila por fila. Luego de crear el índice, las agrupaciones por ciudad se procesarían usando este índice 
haciendo que las consultas como GROUP BY, ORDER BY entre otras se ejecutan más rápido.*/

SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'pacientes';