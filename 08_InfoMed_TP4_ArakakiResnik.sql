-- 8. Cantidad de pacientes por sexo que viven en cada ciudad.

SELECT 
  ciudad,
  SUM(CASE WHEN sexobiologico.descripcion = 'Femenino' THEN 1 ELSE 0 END) AS Femenino, -- Cuento la cantidad de pacientes femeninos por cada ciudad
  SUM(CASE WHEN sexobiologico.descripcion = 'Masculino' THEN 1 ELSE 0 END) AS Masculino -- Cuento la cantidad de pacientes masculinos por cada ciudad
FROM pacientes
JOIN sexobiologico ON pacientes.id_sexo = sexobiologico.id_sexo -- El JOIN entre la tabla pacientes y sexobiologico se hace mediante la clave id_sexo para acceder a la descripcion del sexo de cada paciente
GROUP BY ciudad; -- Agrupo por ciudad 