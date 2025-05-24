--5. Puede pasar que haya inconsistencias en la forma en la que están escritos los nombres de las ciudades, ¿cómo se corrige esto? Agregar la query correspondiente.
/*Nuestra idea es primero limpiar la columna ciudad de espacios anteriores y posteriores. Luego, armar una tabla con todas las ciudades, 
en este caso provincias de Argentina de forma estandarizada. Y luego usar una extensión de PostgreSQL llamada pg_trgm que se basa en
encontrar similitudes entre textos usando trigramas. Los trigramas son sets de 3 caracteres consecutivos. 
Esta función mide la cantidad de trigramas que comparten dos cadenas de texto y permite calcular la similitud entre ellas. 
De esta forma, se propone tomar cada ciudad de la tabla pacientes, calcular la similitud con cada ciudad de la nueva 
tabla estándar y luego reemplazar la ciudad en la tabla pacientes por la ciudad escrita en formato estándar mas similar. 
*/

UPDATE Pacientes 
SET ciudad = TRIM(ciudad); --Remueve los espacios anteriores y posteriores

CREATE TABLE Provincia ( -- Creamos una tabla con las provincias escritas de forma estándar
  provincia VARCHAR(100)
);

INSERT INTO Provincia (provincia) VALUES
('Buenos Aires'),
('Córdoba'),
('Santa Fe'),
('Mendoza'),
('Rosario'),
('Tucumán'),
('Salta'),
('Corrientes'),
('Chaco'),
('San Luis'),
('Misiones'),
('San Juan'),
('Neuquén'),
('Jujuy'),
('Entre Ríos'),
('La Rioja'),
('Catamarca'),
('Santiago del Estero'),
('Formosa'),
('Río Negro'),
('La Pampa'),
('Chubut'),
('Santa Cruz'),
('Tierra del Fuego');

CREATE EXTENSION IF NOT EXISTS pg_trgm; --Activa la extensión pg_trgm

SELECT DISTINCT ON (Pacientes.ciudad) -- Busca el mejor match basándose en similitudes de trigramas. Para cada valor de ciudad en la tabla Pacientes, se queda con la fila que tenga la mayor similitud con alguna provincia
  Pacientes.ciudad, -- Tomo la ciudad de la tabla pacientes
  Provincia.provincia, -- Tomo la provincia de la tabla Provincia
  similarity(Pacientes.ciudad, Provincia.provincia) AS similitud -- devuelve un número entre 0 y 1 que representa qué tan parecidas son las dos palabras
FROM Pacientes 
JOIN Provincia ON similarity(Pacientes.ciudad, Provincia.provincia) > 0.3 -- hace un JOIN entre Pacientes y Provincia, solo si la similitud es mayor a 0.3
ORDER BY Pacientes.ciudad, similarity(Pacientes.ciudad, Provincia.provincia) DESC; -- ordena las coincidencias de mayor a menor similitud para cada ciudad para que DISTINCT ON se quede con la más parecida por cada ciudad

UPDATE Pacientes -- actualiza la columna ciudad en la tabla Pacientes con la ciudad bien escrita buscando la provincia de la tabla Provincia con la que tenga mayor similitud
SET ciudad = sub.provincia -- cambia la ciudad por la provincia hallada en la sub query
FROM ( -- subquery que calcula cuál es la provincia más parecida a la ciudad
  SELECT DISTINCT ON (Pacientes.id_paciente) -- selecciona la provincia más parecida a la ciudad 
    Pacientes.id_paciente,
    Provincia.provincia
  FROM Pacientes
  JOIN Provincia 
    ON similarity(Pacientes.ciudad, Provincia.provincia) > 0.3
  ORDER BY Pacientes.id_paciente, similarity(Pacientes.ciudad, Provincia.provincia) DESC -- ordena por similitud de mayor a menor
) AS sub
WHERE Pacientes.id_paciente = sub.id_paciente; -- se actualiza la ciudad con la provincia que tenga mayor similitud en el paciente que corresponde 

