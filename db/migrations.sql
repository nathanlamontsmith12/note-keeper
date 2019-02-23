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

CREATE TABLE user_notes (
	user_id INTEGER,
	note_id INTEGER
);

