# Partie 1

DROP TABLE IF EXISTS pays;
CREATE TABLE pays (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(50),
    region_id VARCHAR(50)
);

DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    location_id INT NULL
)

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(50),
    hire_date DATE,
    job_id INT,
    salary INT UNSIGNED,
    commission INT,
    manager_id INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

DROP TABLE IF EXISTS job_history;
CREATE TABLE job_history (
    emplyee_id INT,
    start_date DATE,
    end_date DATE,
    job_id INT,
    department_id INT,
    top8salary INT UNSIGNED,
    FOREIGN KEY (emplyee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

DROP SCHEMA IF EXISTS Cinema;
CREATE SCHEMA Cinema;
USE Cinema;

DROP TABLE IF EXISTS realisateur;
CREATE TABLE realisateur (
    id_realisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(12)
);

DROP TABLE IF EXISTS film;
CREATE TABLE film (
    id_film INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(50) NOT NULL,
    genre VARCHAR(50),
    recette DECIMAL UNSIGNED DEFAULT 0,
    date_sortie DATE,
    pays_id INT NOT NULL,
    nb_entrees INT UNSIGNED,
    date_heure_saisie DATETIME DEFAULT NOW(),
    resume VARCHAR(255)
);

ALTER TABLE film ADD COLUMN id_real INT;
ALTER TABLE film ADD FOREIGN KEY (id_real) REFERENCES realisateur(id_realisateur);

CREATE VIEW FILM2 AS
SELECT id_film, titre, annee, genre, resume
FROM film;

DROP VIEW FILM2;

ALTER TABLE film RENAME filmold;


# Partie 2

ALTER TABLE filmold RENAME film;

INSERT INTO film (id_film, titre, date_sortie, genre, resume, nb_entrees, recette)
VALUES (1, 'Subway', 1985, 'Policier', 'Conte les aventures de la population souterraine dans les couloirs du métro parisien', 45662, 4569392),
(2, 'Nikita', 1990, 'Drame', 'Nikita condamnée à la prison à perpétuité est contrainte à travailler secrètement pour le gouvernement en tant que agent hautement qualifiée des services secrets.', 95662, 155025);

DELETE FROM realisateur;
DELETE FROM film;

UPDATE film SET genre = 'Anticipation' WHERE id_film = 1;

SELECT * FROM film;
SELECT titre FROM film;
SELECT titre FROM film ORDER BY titre ASC;
SELECT titre FROM film ORDER BY titre DESC;
SELECT * FROM film WHERE genre = 'Policier';
SELECT * FROM film WHERE genre = 'Policier' || genre = 'Comédie';
SELECT titre, date_sortie FROM film;
SELECT COUNT(*) AS nb_films FROM film;
SELECT titre, nb_entrees*3 as benefice FROM film;
SELECT AVG(recette) FROM film;
SELECT * FROM film WHERE titre LIKE '%a%';


# P1
CREATE SCHEMA Animalerie;
USE Animalerie;

DROP TABLE IF EXISTS Animaux;
CREATE TABLE Animaux (
    id_animal INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    proprietaire VARCHAR(50),
    espece VARCHAR(50),
    sexe VARCHAR(50),
    naissance DATE,
    mort DATE
);

LOAD DATA INFILE 'C:/Users/Thieu/Documents/Cours/ESEO2/Semestre 7/BDD/bdd/TP 01 - DDL & DML/Animaux.txt'
INTO TABLE Animaux
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 0 ROWS
(@nom, @proprietaire, @espece, @sexe, @date_naissance, @date_mort)
SET nom = @nom,
    proprietaire = @proprietaire,
    espece = @espece,
    sexe = @sexe,
    naissance = @date_naissance,
    mort = @date_mort;

INSERT INTO animaux (nom, proprietaire, espece, sexe, naissance) VALUES ('Jojo', 'Diane', 'hamster', 'F', '1999-03-30');
INSERT INTO animaux (nom, proprietaire, espece, sexe, naissance) VALUES ('Arthur', 'Gilles', 'chien', 'm', '2013-11-30');


# P2
SELECT * FROM animaux;
SELECT proprietaire FROM animaux;
SELECT DISTINCT(proprietaire) FROM animaux;
SELECT * FROM animaux WHERE UPPER(espece) = 'CHIEN' && UPPER(sexe) = 'F';
SELECT * FROM animaux WHERE UPPER(espece) = 'SERPENT' || UPPER(espece) = 'OISEAU';
SELECT COUNT(*) AS nb_animaux FROM animaux;
SELECT espece, COUNT(*) AS nb_animaux FROM animaux GROUP BY espece;
SELECT sexe, COUNT(*) AS nb_animaux FROM animaux GROUP BY sexe;
SELECT UPPER(sexe), espece, COUNT(*) AS nb_animaux FROM animaux GROUP BY UPPER(espece), UPPER(sexe);


# P3
SELECT nom, naissance, mort FROM animaux;
SELECT nom, DATEDIFF(NOW(), naissance)/365 AS age FROM animaux;
SELECT nom, DATEDIFF(NOW(), naissance)/365 AS age FROM animaux ORDER BY nom ASC, age DESC;
SELECT nom, DATEDIFF(mort, naissance)/365 AS age FROM animaux WHERE mort IS NOT NULL;



# P4
SELECT * FROM animaux WHERE DATE_FORMAT(naissance, '%m') = DATE_FORMAT(NOW(), '%m')+1;
SELECT * FROM animaux WHERE UPPER(nom) LIKE 'F%';
SELECT * FROM animaux WHERE UPPER(nom) LIKE '%W%';
SELECT * FROM animaux WHERE UPPER(nom) LIKE '%FY';
SELECT * FROM animaux WHERE LENGTH(nom) = 5;


# Partie 5

CREATE SCHEMA Echec;
USE Echec;

DROP TABLE IF EXISTS Tournoi;
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS Joueur;
DROP TABLE IF EXISTS Partie;
DROP TABLE IF EXISTS Coups;
CREATE TABLE Tournoi (
    id_tournoi INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    lieu VARCHAR(50),
    date_debut DATE NOT NULL,
    date_fin DATE
)

CREATE TABLE Club (
    id_club INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
)

CREATE TABLE Joueur (
    id_joueur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(25) NOT NULL,
    elo VARCHAR(25) NOT NULL,
    id_club INT,
    FOREIGN KEY (id_club) REFERENCES Club(id_club)
)

CREATE TABLE Partie (
    id_partie INT PRIMARY KEY AUTO_INCREMENT,
    id_tournoi INT,
    id_joueur1 INT NOT NULL,
    id_joueur2 INT NOT NULL,
    date_partie DATETIME,
    num_round INT,
    num_table INT,
    resultat VARCHAR(50),
    FOREIGN KEY (id_tournoi) REFERENCES Tournoi(id_tournoi),
    FOREIGN KEY (id_joueur1) REFERENCES Joueur(id_joueur),
    FOREIGN KEY (id_joueur2) REFERENCES Joueur(id_joueur)
)

CREATE TABLE Coups(
    id_coup INT PRIMARY KEY AUTO_INCREMENT,
    nuemro_coup INT UNSIGNED NOT NULL,
    id_partie INT NOT NULL,
    is_black INT DEFAULT false,
    coup VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_partie) REFERENCES Partie(id_partie)
)

CREATE TABLE feuille (
    id_feuille INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    adresse VARCHAR(50),
    ville VARCHAR(50),
    code_postal INT,
    id_partie INT NOT NULL,
    FOREIGN KEY (id_partie) REFERENCES Partie(id_partie)
);

