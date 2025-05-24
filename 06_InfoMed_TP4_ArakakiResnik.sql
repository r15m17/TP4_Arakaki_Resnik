-- 6. Obtener el nombre y la dirección de los pacientes que viven en Buenos Aires.

SELECT 
  nombre,
  calle,
  numero
FROM Pacientes
WHERE ciudad = 'Buenos Aires'; -- Destacamos que como en el punto anterior normalizamos las ciudades, podemos buscar efectivamente 
-- todos los pacientes que viven en Buenos Aires sin tener que usar funciones adicionales como LOWER o TRIM para corregir las inconsistencias que podría haber

