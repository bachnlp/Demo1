CREATE DATABASE bai_3;
GO
USE bai_3;
GO
-- FORM
CREATE TABLE movies(mcode int NOT NULL PRIMARY KEY, title VARCHAR(50) NOT NULL, rating CHAR(10)); 
GO
CREATE TABLE movie_theaters(tcode CHAR(10) NOT NULL PRIMARY KEY, name VARCHAR(50) NOT NULL, movie int NOT NULL, FOREIGN KEY(movie) REFERENCES movies(mcode));
GO
-- DATASET
INSERT INTO movies(mcode, title, rating) VALUES ('1', 'Citizen Kane', 'PG');
INSERT INTO movies(mcode, title, rating) VALUES ('2', 'Sing in the Rain', 'G');
INSERT INTO movies(mcode, title, rating) VALUES ('3', 'The Wizard of Oz', 'G');
INSERT INTO movies(mcode, title, rating) VALUES ('4', 'The Quiet Man', null);
INSERT INTO movies(mcode, title, rating) VALUES ('5', 'North by Northwest', null);
INSERT INTO movies(mcode, title, rating) VALUES ('6', 'The Last Tango in Paris', 'NC-17');
INSERT INTO movies(mcode, title, rating) VALUES ('7', 'Some Like it Hot', 'PG-13');
INSERT INTO movies(mcode, title, rating) VALUES ('8', 'A Night at the Opera', null);
INSERT INTO movies(mcode, title, rating) VALUES ('9', 'Citizen King', 'G');
GO
INSERT INTO movie_theaters(tcode, name, movie) VALUES ('1', 'Odeon', '5'); 
INSERT INTO movie_theaters(tcode, name, movie) VALUES ('2', 'Imperial', '1');
INSERT INTO movie_theaters(tcode, name, movie) VALUES ('3', 'Majestic', null);
INSERT INTO movie_theaters(tcode, name, movie) VALUES ('4', 'Royale', '6');
INSERT INTO movie_theaters(tcode, name, movie) VALUES ('5', 'Paraiso', '3');
INSERT INTO movie_theaters(tcode, name, movie) VALUES ('6', 'Nickelodeon', null);
GO
-- Get out the titles of all movies 
SELECT title FROM movies;
GO
-- Get out a list  of different (non-duplicate) ratings of movies 
SELECT DISTINCT rating FROM movies;
GO
-- Pull out a list of movies without ratings 
SELECT * FROM movies WHERE rating IS NULL;
GO
-- Take out a list of cinemas without movies 
SELECT name FROM movie_theaters WHERE movie IS NULL;
GO
-- Get a list of theaters and the movies that correspond to  that theaters (even theaters that don't have any movies need to return results). 
SELECT t.name, m.title FROM movie_theaters AS t LEFT JOIN movie m ON t.mcode = m.tcode;
GO
-- Get the titles of all films that are not shown at any theaters  
SELECT m.title FROM  movies m LEFT JOIN movie_theaters AS mt ON m.mcode = mt.tcode WHERE mt.movie IS NULL;
GO
-- Add a new record with the following information: | Title: ‘One, Two, Three’  | Rating: NULL  |
INSERT INTO movies(mcode, title, rating) VALUES('11', 'One, Two, Three', NULL);
GO
-- Updated information of all movies without ratings to "G" 
UPDATE movies SET rating = 'G' WHERE rating IS NULL;
GO
-- Remove all theaters whose films  have a rating of 'NC-17' 
DELETE mt FROM movie_theaters AS mt INNER JOIN movies AS m ON mt.movie = m.mcode WHERE m.rating = 'NC-17';
GO