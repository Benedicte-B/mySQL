--Exo1 : Créér la BDD stockImage avec l'encodage utf-8
CREATE DATABASE stockImage CHARACTER SET utf8

--Exo2 : Supprimer la BDD stockImage
DROP DATABASE stockImage 

--Exo3 : Créér la BDD mediaBank avec l'encodage utf-8
CREATE DATABASE mediaBank CHARACTER SET utf8

--Exo4 : Créer un utilisateur ayant tous les droits sur la BDD mediaBank
-- Connectez vous à phpMyAdmin avec l'utilisateur créé
CREATE USER 'benediiiicte'@'localhost' IDENTIFIED BY 'mdp1234';
GRANT ALL PRIVILEGES ON * . * TO 'benediiiicte'@'localhost';
FLUSH PRIVILEGES;
-- ++ Voir la liste des users
SELECT User FROM mysql.user;
-- Se connecter 


--Ex5 : Créer une table image contenant 8 colonnes : 
        -- Id = INT = numéro d'identité, toujours positif donc UNSIGNED
        -- Si on n'ajoute pas NOT NULL, NULL par défaut. -- Name bleu car fonction SQL ?
CREATE TABLE images (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    name VARCHAR(50),  
    link VARCHAR(225),
    width INT, 
    hieght INT, 
    format VARCHAR(5),
    description TEXT,
    publicationDate DATE,
	PRIMARY KEY (id)
    )
ENGINE = INNODB;
-- Créer une table video contenant 6 colonnes : 
CREATE TABLE videos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    name VARCHAR(50),  
    link VARCHAR(225),
    duration time, 
    description TEXT,
    publicationDate DATE,
	PRIMARY KEY (id)
    )
ENGINE = INNODB;
-- Attention : Tables créer dans mySQL et non mediaBank
    DROP TABLE images 
    DROP TABLE videos 
-- OK : Création dans la bonne BDD
-- ++ Afficher les tables et leurs caractéristiques :
    SHOW DATABASES -- Affiche la BDD mediaBank
    DESCRIBE images -- X Fonctionne pas 
    SHOW FULL COLUMNS FROM images -- Affiche les colonnes de la table
    SHOW FULL COLUMNS FROM videos -- Attention : ne pas mettre de , à la fin de la requete si requete unique


--Ex6 : Insérer des lignes dans des tables 
INSERT INTO images 
    VALUES (1, 'orwellPortrait', 'https://upload.wikimedia.org/wikipedia/commons/7/7e/George_Orwell_press_photo.jpg', '1176', '1596', 'jpg', 'Portrait de l’auteur George Orwell', '2020-05-10');
INSERT INTO images 
    VALUES (2, 'steinbeckPortrait', 'https://live.staticflickr.com/525/18306511889_1c9606e8ea_z.jpg', '640', '476', 'jpg', 'Portrait de l’auteur John Steinbeck', '2020-01-02');
-- Afficher le contenu de la table
SELECT * FROM images;

INSERT INTO videos (id, name, link, duration, description, publicationDate) 
VALUES ('1', '1984_trailer', 'https://www.youtube.com/watch?v=Z4rBDUJTnNU&t=4s', '02:39', 'Bande annonce du film 1984', '2020-05-15'),
        ('2', 'micemen_trailer', 'https://www.youtube.com/watch?v=2QnM6hsXxNE', '10:41', 'Bande annonce du film des Souris et des hommes', '2020-01-02');
SELECT * FROM videos;

-- Ex7 : Modifier la ligne d'une table
-- Modifier la date de la ligne 1 de la table images
UPDATE images SET publicationDate = '2021-05-20' WHERE id = 1
-- Afficher la ligne 
SELECT * FROM images WHERE id='1'
-- Modifier la durée de la ligne 2 de la table videos
UPDATE videos SET duration = '1:41' WHERE id = 2
-- Afficher la ligne
SELECT * FROM videos WHERE id='2'

-- Ex8 : Supprimer la ligne d'une table
-- Supprimer la 2ème ligne de la table images
DELETE FROM images WHERE id='1'
-- Supprimer la 1ère ligne de la table videos
DELETE FROM videos WHERE id='2'

-- Ex9 : SUpprimer la table videos
DROP TABLE videos