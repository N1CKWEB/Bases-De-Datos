SELECT CONCAT(first_name, last_name) AS nombre_completo
FROM actors;

SELECT title,REPLACE(title,"Harry","Nico") FROM movies
WHERE title LIKE"Harry%";

SELECT COUNT(title) FROM movies;

SELECT LENGTH(title) FROM movies
WHERE LENGTH(release_date)>20;

SELECT PI();

SELECT RAND();

SELECT TRUNCATE(RAND()*(10-5)+5,2) AS truncador_de_movies;

#Devuelve fecha,hora y dia
SELECT DAY(NOW());

#Extrae el año el día y el mes
SELECT EXTRACT(YEAR FROM NOW());

#Muestra la diferencia entre valores
SELECT DATEDIFF(release_date,end_date) FROM series;
SELECT DATEDIFF(end_date,release_date) FROM series;

SELECT DATE_ADD(NOW(),INTERVAL 1 YEAR) AS date;
SET lc_time_names="es_ES";
SELECT 	DATE_FORMAT(release_date,"%d/%m/%y") FROM movies AS date;

#Recibe la columna 
SELECT title,
COALESCE(length,"No sé conoce la duración") FROM movies;

#Condicionales 
SELECT title,awards, IF(awards>8,"Muy premiado","Es terriblemente mala") FROM movies;

SELECT title,rating,
CASE
     WHEN rating<4 THEN "Muy mala" 
     WHEN rating BETWEEN 4 AND 6  THEN "Regular con soda"
     WHEN rating BETWEEN 6 AND 9  THEN "Esta buena"
     ELSE "PERFECTA"
END AS Valoraciones_de_rating
 FROM movies;

