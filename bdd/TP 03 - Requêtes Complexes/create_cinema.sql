drop schema if exists cinema;
-- Création du schéma
CREATE SCHEMA cinema;
use cinema;
-- Création des tables;
CREATE TABLE Personne(
idPersonne INTEGER PRIMARY KEY,
nom VARCHAR(30),
prénom VARCHAR(30));

CREATE TABLE Film(
idFilm INTEGER PRIMARY KEY,
idRéalisateur INTEGER,
titre VARCHAR(50),
genre VARCHAR(20),
année YEAR 
);

CREATE TABLE Jouer(
idActeur INTEGER,
idFilm INTEGER,
rôle VARCHAR(15),
CONSTRAINT pk_Jouer PRIMARY KEY (idActeur,idFilm)
);

CREATE TABLE Cinema(
idCinema INTEGER PRIMARY KEY,
nom VARCHAR(20),
adresse VARCHAR(40)
);

CREATE TABLE Projection(
idProjection INTEGER PRIMARY KEY AUTO_INCREMENT,
idCinema INTEGER,
idFilm INTEGER,
jour DATE
);



# Partie 1

# Première requête
/*
Compte le nombre de personne dans la table Personne
*/

# Deuxième requête
/*
Affiche le film le plus ancien
*/

# Troisième requête
/*
Affiche le nombre de films joués par chaque acteur
*/



# Partie 2

