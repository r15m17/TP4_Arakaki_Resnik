-- 18. Obtener el nombre del médico junto con el total de pacientes a los que ha atendido, ordenado por el total de pacientes en orden descendente.

SELECT 
  Medicos.nombre AS medico,
  COUNT(DISTINCT Consultas.id_paciente) AS total_pacientes
FROM Consultas 
JOIN Medicos ON Consultas.id_medico = Medicos.id_medico
GROUP BY Medicos.nombre
ORDER BY total_pacientes DESC; 
