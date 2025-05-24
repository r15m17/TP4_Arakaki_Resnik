--11. Obtener el nombre de los pacientes junto con la fecha y el diagnóstico de todas las consultas médicas realizadas en agosto del 2024.
SELECT 
  Pacientes.nombre,
  Consultas.fecha,
  Consultas.diagnostico
FROM Consultas
JOIN Pacientes ON Consultas.id_paciente = Pacientes.id_paciente
WHERE Consultas.fecha BETWEEN '2024-08-01' AND '2024-08-31'; 