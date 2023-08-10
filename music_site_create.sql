CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres_Artists (
	artist_id INTEGER REFERENCES Artists(artist_id),
	genre_id INTEGER REFERENCES Genres(genre_id),
	CONSTRAINT g_a PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Albums_Artists (
	artist_id INTEGER REFERENCES Artists(artist_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT a_a PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Collection_Tracks (
	track_id INTEGER REFERENCES Tracks(track_id),
	collection_id INTEGER REFERENCES Collections(collection_id),
	CONSTRAINT c_t PRIMARY KEY (track_id, collection_id)
);
