-- 13. Obtener el nombre de los pacientes junto con la cantidad total de recetas que han recibido

SELECT 
  Pacientes.nombre,
  COUNT(*) AS cantidad_recetas
FROM Recetas
JOIN Pacientes ON Recetas.id_paciente = Pacientes.id_paciente
GROUP BY Pacientes.nombre; 
