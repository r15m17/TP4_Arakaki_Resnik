-- 15. Obtener el nombre del paciente junto con la fecha de su última consulta y el diagnóstico asociado.

SELECT DISTINCT ON (Pacientes.id_paciente)
  Pacientes.nombre as Paciente,
  Consultas.fecha as Fecha,
  Consultas.diagnostico as Diagnóstico
FROM Consultas
JOIN Pacientes ON Consultas.id_paciente = Pacientes.id_paciente
ORDER BY pacientes.id_paciente, consultas.fecha DESC;



