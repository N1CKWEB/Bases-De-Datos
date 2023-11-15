
SELECT COUNT(*) AS cantidad_peliculas FROM movies;

#AVG nos devuelve solo un valor único, te devuelve un promedio
SELECT ROUND(AVG(rating),2) AS promedio_rating, COUNT(*) FROM movies
WHERE awards>5;

#SUM Función que calcula la sumatoria de una columna
SELECT SUM(awards) AS total_premios FROM movies
WHERE genre_id=5;

#MIN nos devuelve el valor mínimo
#MAX nos devuelve el valor maximo 
SELECT MIN(length) AS duracion_minima, MAX(length) AS duracion_maxima
FROM movies;

#GROUP BY nos sirve para agrupar registros sobre una columna

SELECT genre_id,COUNT(*) AS cantidad_peliculas,
SUM(awards) AS total_premios, AVG(length) AS promedio_duracion
FROM movies
GROUP BY genre_id;

#HAVING
SELECT genre_id
FROM movies;


#1 ¿Cuántas películas hay?
SELECT COUNT(*) AS cantidad_peliculas
FROM movies;

#2¿Cuántas películas tienen entre 3 y 7 premios?
SELECT COUNT(*) AS cantidad_peliculas
FROM movies
WHERE awards BETWEEN 3 AND 7;

#3Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
SELECT COUNT(*) AS cantidad_peliculas
FROM movies
WHERE awards BETWEEN 3 AND 7 AND rating>7;
  
#4 Encuentra la cantidad de actores en cada película.
SELECT movie_id, COUNT(actor_id) AS cantidad_actores
FROM actor_movie
GROUP BY movie_id;

#5 Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por id. de género.
SELECT genre_id, COUNT(*) AS listado
FROM  movies
GROUP BY genre_id;

#6 De la consulta anterior, listar sólo aquellos géneros que tengan como suma de premios un número mayor a 5.
SELECT genre_id, COUNT(*) AS cantidad_peliculas
FROM  movies
GROUP BY genre_id
HAVING SUM(awards)>5;

#7Encuentra los géneros que tienen las películas con un promedio de calificación mayor a 6.0.
SELECT genre_id, COUNT(*) AS cantidad_peliculas
FROM  movies
GROUP BY genre_id
HAVING AVG(rating)>6.0;

#8 Encuentra los géneros que tienen al menos 3 películas.
SELECT genre_id,COUNT(*) AS cantidad_peliculas
FROM movies
GROUP BY genre_id
HAVING cantidad_peliculas>=3;

