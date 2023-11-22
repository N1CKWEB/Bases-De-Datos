
SELECT movies.title,movies.id
as genres_id,genre.name 
FROM movies,genres;


#JOIN para unir dos tablas
SELECT DISTINCT a.first_name, a.last_name,m.title
FROM actors a
INNER JOIN actor_movie am ON a.id=am.actor_id
INNER JOIN movies  m ON m.id=am.movie_id
WHERE m.title LIKE"Toy%";

#DISTINCT sirve para eliminar duplicados

#JOIN PRÁCTICA:

#1)_Utilizando la base de datos de movies, queremos conocer, 
#por un lado, los títulos 
#y el nombre del género de todas las series de la base de datos.

SELECT series.title,genres.name AS genero 
FROM series 
INNER JOIN genres  ON genres.id=series.genre_id;

#2)_Por otro, necesitamos listar los títulos de 
#los episodios junto con el nombre
#y apellido de los actores que trabajan en cada uno de ellos.

SELECT episodes.title AS titulo,actors.first_name,actors.last_name
FROM episodes
INNER JOIN actor_episode ON actor_episode.episode_id=episodes.id
INNER JOIN  actors ON  actor_episode.actor_id=actors.id;

#3)_Para nuestro próximo desafío,
#necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) 
#que han trabajado en cualquier película de la saga de La Guerra de las galaxias.

SELECT DISTINCT actors.first_name,actors.last_name,movies.title
FROM actors
INNER JOIN  actor_movie ON actor_movie.actor_id=actors.id
INNER JOIN movies ON actor_movie.movie_id=movies.id
WHERE movies.title LIKE "La Guerra de las galaxias%";

#4)_Crear un listado a partir de la tabla de películas, 
#mostrar un reporte de la cantidad de películas por nombre de género.

SELECT g.name Genero, COUNT(movies.id) cantidad_de_pelicula
FROM movies 
INNER JOIN genres g ON g.id=movies.genre_id
GROUP BY Genero;

