# Parte 1: Bases de Datos

## 1. Tipo de Base de Datos


## 2. Diagrama Entidad-Relación


## 3. Modelo lógico entidad-relación

## 4. Normalización

---

# Parte 2: Consultas SQL

## Consulta 01

Cuando se realizan consultas sobre la tabla paciente agrupando por ciudad los tiempos de respuesta son demasiado largos. Proponer mediante una query SQL una solución a este problema.

Para reducir los tiempos de respuesta de las consultas agrupadas por ciudad que se hacen sobre la tabla paciente, lo que se puede hacer es crear un índice en base a la columna ciudad de esta misma tabla. Esto se debe a que el índice permite que la base de datos acceda a los valores de esa columna de forma más eficiente, sin tener que recorrer la tabla fila por fila. Luego de crear el índice, las agrupaciones por ciudad se procesarían usando este índice haciendo que las consultas como GROUP BY, ORDER BY entre otras se ejecutan más rápido.

```sql
CREATE INDEX indice_pacientes_ciudad
ON Pacientes (ciudad);

SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'pacientes';

```
![Optimización por ciudad](Imágenes/1.a.png)
![Optimización por ciudad](Imágenes/1.b.png)

## Consulta 02 

Se tiene la fecha de nacimiento de los pacientes. Se desea calcular la edad de los pacientes y almacenarla de forma dinámica en el sistema ya que es un valor típicamente consultado, junto con otra información relevante del paciente.

En este ejercicio, no queremos guardar la edad como una columna fija en la base de datos porque se desactualiza con el tiempo. 
Por lo que la solución sería crear una vista que incluya la edad calculada de forma dinámica. Adicionalmente, unimos dos tablas, 
la tabla pacientes y la tabla sexobiologico para crear una vista que contenga la edad calculada junto con la descripción del sexo para poder 
mostrar la información relevante del paciente de manera directa sin tener que hacer consultas combinadas. 

```sql
CREATE VIEW vista_pacientes_con_edad AS
SELECT 
  Pacientes.id_paciente,
  Pacientes.nombre,
  Pacientes.fecha_nacimiento,
  EXTRACT(YEAR FROM age(CURRENT_DATE, Pacientes.fecha_nacimiento)) AS edad,
  SexoBiologico.descripcion AS sexo,
  Pacientes.numero,
  Pacientes.calle,
  Pacientes.ciudad
FROM 
  Pacientes
JOIN 
  SexoBiologico ON Pacientes.id_sexo = SexoBiologico.id_sexo;

```

![vista](Imágenes/2.png)

