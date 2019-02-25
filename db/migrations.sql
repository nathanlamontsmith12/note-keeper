DROP DATABASE IF EXISTS note_keeper;

CREATE DATABASE note_keeper;

\c note_keeper 


CREATE TABLE users(
	id SERIAL PRIMARY KEY, 
	username VARCHAR(255)
);

CREATE TABLE notes (
	id SERIAL PRIMARY KEY,
	content TEXT
);

-- RELATIONS -- user has many notes; (each) note belongs to (one) user 
-- through table (aka intermediate table) relating notes to users 
CREATE TABLE user_notes (
	id SERIAL PRIMARY KEY,
	user_id INTEGER REFERENCES users(id),
	note_id INTEGER REFERENCES notes(id)
);

