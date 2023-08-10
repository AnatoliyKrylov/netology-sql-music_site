-- Задание 2
-- Название и продолжительность самого длительного трека.
SELECT name, duration FROM tracks
 ORDER BY duration DESC
 LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name FROM tracks
 WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name FROM collections
 WHERE release_date BETWEEN '2018-01-01' AND '2020-12-31';

-- Исполнители, чьё имя состоит из одного слова.
SELECT name FROM artists
 WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my».
SELECT name FROM tracks
 WHERE name LIKE '%мой%' OR name LIKE '%my%';

-- Задание 3
-- Количество исполнителей в каждом жанре.
SELECT name, COUNT(g.genre_id) FROM genres AS g
  JOIN genres_artists AS ga ON g.genre_id = ga.genre_id
 GROUP BY name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.name) FROM tracks AS t
  JOIN albums AS a ON t.album_id = a.album_id
 WHERE release_date BETWEEN '2019-01-01' AND '2020-12-31';

-- Средняя продолжительность треков по каждому альбому.
SELECT a.name, AVG(t.duration) FROM albums AS a
  JOIN tracks AS t ON a.album_id = t.album_id
 GROUP BY a.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT ar.name FROM artists AS ar
  JOIN albums_artists AS aa ON ar.artist_id = aa.artist_id
  JOIN albums AS al ON aa.album_id = al.album_id
 WHERE al.release_date NOT BETWEEN '2020-01-01' AND '2020-12-31'
 GROUP BY ar.name;

-- Названия сборников, в которых присутствует конкретный исполнитель (Michael Jackson).
SELECT c.name FROM artists AS ar
  JOIN albums_artists AS aa ON ar.artist_id = aa.artist_id
  JOIN albums AS al ON aa.album_id = al.album_id
  JOIN tracks AS t ON al.album_id = t.album_id
  JOIN collection_tracks AS ct ON t.track_id = ct.track_id
  JOIN collections AS c ON ct.collection_id = c.collection_id
 WHERE ar.name LIKE 'Michael Jackson'
 GROUP BY c.name;