-- Задание 1
-- Вставляем 4 исполнителя
INSERT INTO artists(name)
VALUES ('Alvin and the Chipmunks'),
       ('Batman'),
       ('Cristiano Ronaldo'),
       ('Michael Jackson');
      
-- Вставляем 3 жанра
INSERT INTO genres(name)
VALUES ('Pop'),
       ('Memes'),
       ('Pop Rock');
      
-- Вставляем 3 альбома
INSERT INTO albums(name, release_date)
VALUES ('Alvin and the Chipmunks vol.1', '2007-12-14'),
       ('Heroes: real and non-real', '2019-08-08'),
       ('Bad', '1987-08-31');

-- Вставляем 6 треков
INSERT INTO tracks(name, duration, album_id)
VALUES ('The Chipmunk Song is my generation', '240', '1'),
       ('Where is the detonator?', '30', '2'),
       ('Joker - my enemy', '120', '2'),
       ('SIUUU', '10', '2'),
       ('Bad', '247', '3'),
       ('Smooth Criminal', '257', '3');

-- Вставляем 4 сборника
INSERT INTO collections(name, release_date)
VALUES ('There is no Batman', '2020-01-01'),
       ('We are real', '2021-01-01'),
       ('Strange', '2018-01-01'),
       ('What?', '2017-01-01');
       
-- Вставляем связи в соответствующие таблицы
INSERT INTO genres_artists(artist_id, genre_id)
VALUES ('1', '1'),
       ('2', '2'),
       ('3', '2'),
       ('4', '3');
       
INSERT INTO albums_artists(artist_id, album_id)
VALUES ('1', '1'),
       ('2', '2'),
       ('3', '2'),
       ('4', '3');

INSERT INTO collection_tracks(track_id, collection_id)
VALUES ('1', '1'),
       ('1', '3'),
       ('1', '4'),
       ('2', '3'),
       ('2', '4'),
       ('3', '3'),
       ('4', '4'),
       ('5', '1'),
       ('5', '2'),
       ('6', '1'),
       ('6', '2'),
       ('6', '4');