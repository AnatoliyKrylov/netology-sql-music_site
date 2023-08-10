CREATE TABLE IF NOT EXISTS genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	release_date DATE NOT NULL CHECK (release_date > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS aracks (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL CHECK (duration > 0),
	album_id INTEGER NOT NULL REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	release_date DATE NOT NULL CHECK (release_date > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS genres_artists (
	artist_id INTEGER REFERENCES artists(artist_id),
	genre_id INTEGER REFERENCES genres(genre_id),
	CONSTRAINT g_a PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS albums_artists (
	artist_id INTEGER REFERENCES artists(artist_id),
	album_id INTEGER REFERENCES albums(album_id),
	CONSTRAINT a_a PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS collection_tracks (
	track_id INTEGER REFERENCES tracks(track_id),
	collection_id INTEGER REFERENCES collections(collection_id),
	CONSTRAINT c_t PRIMARY KEY (track_id, collection_id)
);
