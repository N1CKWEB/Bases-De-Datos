SELECT * 
FROM pokemon;
#Where

#1)_Where Mostrar el nombre, peso y altura de los pokémon cuyo peso sea mayor a 150.
#Tablas: pokemon
#Campos: nombre, peso, altura


SELECT nombre nombre_de_pokemon,peso peso_de_pokemon,altura altura_de_pokemon
FROM pokemon
WHERE peso>=150;

#2)_Muestra los nombres y potencias de los movimientos que tienen una precisión mayor 90.
#Tablas: movimiento, tipo
#Campos: m.nombre, t.nombre, potencia


SELECT m.nombre,t.nombre,m.potencia
FROM movimiento m
INNER JOIN tipo t ON t.id_tipo=m.id_tipo
WHERE m.precision_mov>90;

#Operadores & joins

#1)_Mostrar tipo, nombre y potencia de los movimientos que tienen una potencia mayor igual que 120.
#Tablas: movimiento, tipo
#Campos: m.nombre, t.nombre, potencia

SELECT m.nombre AS tipo_de_pokemon,t.nombre AS nombre_de_pokemones,m.potencia AS potencias_de_pokemones
 FROM movimiento m
INNER JOIN tipo t ON t.id_tipo=m.id_tipo
WHERE m.potencia>120;

#2)_Muestra los nombres de los tipos de Pokémon junto con sus tipos de ataque correspondientes de aquellos cuya potencia sea igual a 0.
#Tablas: tipo, tipo_ataque, movimiento
#Campos: t.nombre ta.tipo m.potencia

SELECT t.nombre,tq.tipo,mv.potencia
FROM tipo t
INNER JOIN tipo_ataque tq ON tq.id_tipo_ataque=t.id_tipo_ataque
INNER JOIN movimiento mv ON mv.id_tipo=t.id_tipo
WHERE mv.potencia=0;


#Order By
#1)_Muestra los nombres y números de Pokédex de los primeros 10 Pokémon en orden alfabético.
#Tablas: pokemon
#Campos: numero_pokedex, nombre

SELECT nombre AS nombre_de_pokemones,numero_pokedex AS numero_de_pokedex 
FROM pokemon
ORDER BY nombre
LIMIT 10;

#2)_Muestra los nombres y alturas de los Pokémon de tipo "Eléctrico", ordenados por altura de forma descendente.
#Tablas: pokemon, pokemon_tipo, tipo
#Campos: nombre, altura

SELECT p.nombre AS nombre_de_pokemones, p.altura AS altura_de_los_pokemones
FROM pokemon p
INNER JOIN pokemon_tipo p_t ON p_t.id_tipo=p.numero_pokedex
INNER JOIN  tipo t ON t.id_tipo=p_t.id_tipo
WHERE t.nombre LIKE "%Electrico%" 
ORDER BY p.nombre DESC;

#Funciones de Agregación

#1)_¿Cuál es la suma total de los valores de "Defensa" en todas las estadísticas base?
#Tablas: estadistidefensacas_base
#Campos: defensa

SELECT  SUM(defensa)
FROM estadisticas_base; #Suma Total es:(10256).

#2)_¿Cuántos Pokémon tienen el tipo "Fuego"?
#Tablas: pokemon_tipo, tipo
#Campos: *

SELECT COUNT(*) AS cantidad_de_tipo_fuego
FROM tipo t
INNER JOIN pokemon_tipo p_t ON p_t.id_tipo=t.id_tipo_ataque
WHERE t.nombre LIKE "Fuego%";

#Group By

#1)_Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo.
#Tablas: pokemon_tipo, tipo
#Campos: nombre, numero_pokedex

SELECT t.nombre,COUNT(p_t.numero_pokedex) AS tipos_de_pokemones
FROM tipo t
INNER JOIN pokemon_tipo p_t ON p_t.id_tipo=t.id_tipo
GROUP BY t.nombre;

#2)_Muestra los nombres de los tipos de Pokémon junto con el promedio de peso de los Pokémon de cada tipo. Ordena los resultados de manera descendente según el promedio de peso.
#Tablas: pokemon, pokemon_tipo, tipo
#Campos: t.nombre, p.peso

SELECT 