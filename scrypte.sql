-- Exercice 1
CREATE DATABASE languages;

-- Exercice 2
CREATE DATABASE webDevelopment CHARACTER SET 'utf8';

-- Exercice 3
use

-- Exercice 4
CREATE DATABASE IF NOT EXISTS ,
 CHARACTER SET 'utf8';

-- Exercice 5
DROP DATABASE
;

-- Exercice 6
DROP DATABASE frameworks;

-- Exercice 6
DROP DATABASE IF EXISTS languages;

-- PARTIE 2
-- EXO1
CREATE TABLE `languages`(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `language` VARCHAR(255)
)
-- EXO2
CREATE TABLE `tools`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `tool` VARCHAR(200)
    )
    ENGINE=INNODB;

-- EXO3
CREATE TABLE `frameworks`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
    )
    ENGINE=INNODB;

    -- EXO4
    CREATE TABLE `libraries`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `library` VARCHAR(200)
    )
    ENGINE=INNODB;

     --EXO5
 CREATE TABLE `ide`(
     `id` INT AUTO_INCREMENT PRIMARY KEY,
     `ideName` VARCHAR(50)
     )
     ENGINE=INNODB;

     -- EXO6
 CREATE TABLE IF NOT EXISTS `frameworks`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
    )
    ENGINE=INNODB;

    -- EXO7
  DROP TABLE IF EXISTS `tools`;

  --EXO8
  DROP TABLE `libraries`;

-- TP
CREATE TABLE `clients`(
   `id` INT AUTO_INCREMENT PRIMARY KEY,
   `lastname` DATE,
   `firstname`VARCHAR(50),
   `birdthDate` DATE,
   `address` VARCHAR(150),
   `irstPhone Number` INT,
   `secondPhoneNumber` INT,
   `mail` VARCHAR(50)
   )
   ENGINE=INNODB;

-- PARTI3
-- EXO1
USE webDevelopment
ALTER TABLE languages
  ADD COLUMN versions VARCHAR(100);

  --EXO2
ALTER TABLE frameworks
   ADD COLUMN version INT;

   --EXO3
ALTER TABLE languages
  CHANGE versions version VARCHAR(100);

  -- EXO4
ALTER TABLE frameworks
  CHANGE name framework VARCHAR(50);

  -- EXO5
ALTER TABLE frameworks
  CHANGE version version VARCHAR(10);

  -- TP
ALTER TABLE clients
  DROP COLUMN secondPhoneNumber;

ALTER TABLE clients
   CHANGE firstPhoneNumber phoneNumber INT;

ALTER TABLE clients
  ADD COLUMN zipCode VARCHAR(50),
  ADD COLUMN city VARCHAR(50);

  -- PARTIE4
  -- EXO1
  INSERT INTO languages (language, version)
     VALUES ('JavaScript','5'),
     ('PHP', '5.2'),
     ('PHP', '5.4'),
     ('HTML', '5.1'),
     ('JavaScript', '6'),
     ('JavaScript', '7'),
     ('JavaScript', '8'),
     ('PHP', '7');

     -- EXO2
     INSERT INTO frameworks (framework, version)
        VALUES ('Symfony','2.8'),
        ('Symfony', '3'),
        ('Jquery', '1.6'),
        ('Jquery', '2.10');



    -- PARTIE 5
    -- EXO1
  SELECT * FROM languages;

    -- EXO2
  SELECT * FROM `languages`
    where language='PHP';

     -- EXO3
  SELECT *  FROM languages
    WHERE language IN ('PHP', 'JavaScript');

    -- EXO4
  SELECT *  FROM frameworks
    WHERE id IN ('3', '5', '7');

     -- EXO5
  SELECT * FROM `languages`
    WHERE language='JavaScript'
    LIMIT 2;

     -- EXO6
  SELECT * FROM `languages`
   WHERE language <> 'PHP';

     -- EXO7
  SELECT * FROM `languages`
    ORDER BY language;

    -- PARTIE6
    -- EXO1
  SELECT * FROM `frameworks`
   WHERE version like '2.%';

    -- EXO2
  SELECT *  FROM `frameworks`
    WHERE `id`=1 AND `id`=3;

    -- EXO3
  SELECT * FROM `ide`
    WHERE date <= '2011-12-01'
    AND date >= '2010-01-01';

  SELECT * FROM `ide`
   WHERE date BETWEEN '2010-01-01' AND '2011-12-01';

   -- PARTIE7
   -- EXO1
   DELETE FROM `languages`
   WHERE `vertion` = 'HTML';

  DELETE FROM `languages`
  WHERE `vertion` LIKE '%HTML%';

  DELETE FROM `languages`
  WHERE `id`=8;

   -- EXO2
   UPDATE `frameworks`
   SET `vertion` = 'Symfony2'
   WHERE `vertion`='Symfony';

   -- EXO3
   UPDATE `languages`
   SET version='version 5' WHERE version='version 5.1' AND language='Javascript';

   -- PARTIE8
   -- EXO1
   USE `development`;
    SELECT languages.name, frameworks.name
    FROM `languages`
    LEFT JOIN `frameworks`
    ON frameworks.languagesId = languages.id;

  -- EXO2
  SELECT languages.name, frameworks.name
  FROM `languages`
  INNER JOIN `frameworks`
  ON frameworks.languagesId = languages.id;

  -- Exo3
  SELECT COUNT(frameworks.name) AS `frameworks`
  FROM `languages`
  INNER JOIN `frameworks`
  ON frameworks.languagesId = languages.id
  --point commun entre les deux tables,  frameworks.languagesId = clé étrangére
  GROUP BY languages.name;
  --GROUP BY ne peut pas etre utiliser avec un WHERE
  -- Regrouper les langages similaires

  -- Exo4
  SELECT languages.name,COUNT(frameworks.name) AS `moreThreeFrameworks`
  FROM `languages`
  INNER JOIN `frameworks`
  ON frameworks.languagesId = languages.id
  GROUP BY languages.name
  HAVING `moreThreeFrameworks` > 3;
  --Cela permet donc de SÉLECTIONNER les colonnes DE la table “nom_table” en GROUPANT
  --les lignes qui ont des valeurs identiques sur la colonne “colonne1” et que la condition
  --de HAVING soit respectée.

  GRANT ALL ON *.* TO 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'taniapav7388' WITH GRANT OPTION;
FLUSH PRIVILEGES;
QUIT;

-- BIBLIOTHEQUE
-- afficher les lignes du registre (titre, nom et prénom du client, date d'emprunt et de retour du livre).
SELECT `title`, oui21_clients.lastname, oui21_clients.firstname, borrowDay, returnDay FROM oui21_clients
INNER JOIN `oui21_registre`
ON oui21_clients.id = oui21_registre.id
INNER JOIN `oui21_livres`
ON oui21_livres.id = oui21_registre.id
-- lister tous les livres (titre, genre, nom et prénom de l'auteur, disponibilité).
SELECT `title`, oui21_livres.lastname, oui21_livres.firstname, type, returnDay FROM `oui21_livres`
INNER JOIN `oui21_registre`
ON oui21_livres.id = oui21_registre.id
INNER JOIN `oui21_genres`
ON oui21_genres.id = oui21_registre.id

-- Il faudra pouvoir afficher le nombre total de livres par genre (nom du genre, total de livres correspondants).
SELECT type, COUNT(title) AS `livresParGenres`
FROM `oui21_livres`
INNER JOIN `oui21_genres`
ON `id_oui21_genres` = oui21_genres.Id
GROUP BY type;

-- Exo Pdo1
CREATE DATABASE colyseum CHARACTER SET 'utf8';
USE colyseum;
CREATE TABLE `clients` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastName` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `birthDate` DATE NOT NULL,
  `card` BOOLEAN NOT NULL,
  `cardNumber` INT UNSIGNED,
  PRIMARY KEY (Id)
);

CREATE TABLE `cards` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cardNumber` INT UNSIGNED NOT NULL,
  `cardTypesId` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE `cardTypes` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `discount` INT UNSIGNED NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE `shows` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `performer` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `showTypesId` SMALLINT UNSIGNED NOT NULL,
  `firstGenresId` SMALLINT UNSIGNED NOT NULL,
  `secondGenreId` SMALLINT UNSIGNED NOT NULL,
  `duration` TIME NOT NULL,
  `startTime` TIME NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE `tickets` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` FLOAT NOT NULL,
  `bookingsId` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE `bookings` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clientId` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE `showTypes` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR (45) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE `genres` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  `showTypesId` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (Id)
);

INSERT INTO `clients` (`lastName`,`firstName`,`birthDate`,`card`,`cardNumber`)
VALUES ('Brennan','Guinevere','1994-02-05',1,2627),
('Dean','Ori','1973-11-23',0,NULL),
('Sharpe','Nora','1983-03-10',0,NULL),
('Hampton','Wade','2000-03-05',1,2022),
('Conner','Kibo','1979-11-04',0,NULL),
('Klein','Hilary','1972-12-16',0,NULL),
('Tyler','Lawrence','1996-05-13',0,NULL),
('Dudley','Tanya','1966-12-28',0,NULL),
('Terrell','Kim','1997-07-27',1,2608),
('Mclaughlin','Laura','1977-02-16',0,NULL),
('Lewis','Linda','1983-07-18',0,NULL),
('Ware','Gemma','1969-10-17',1,2377),
('Roth','Jolie','1981-02-24',0,NULL),
('Michael','Harriet','1961-11-27',1,1869),
('Simpson','Paloma','1998-01-07',0,NULL),
('Cote','Fulton','1967-11-01',1,2403),
('Wheeler','Echo','1965-10-10',0,NULL),
('Snider','Desiree','1996-07-28',0,NULL),
('Vaughan','Vanna','1992-09-13',1,1263),
('Barnes','Preston','1988-12-20',1,2198),
('Padilla','Britanney','2015-04-03',1,2927),
('Perry','Gabriel','1974-04-09',1,2775),
('Mccormick','Hyatt','1968-05-02',0,NULL),
('Stark','Keiko','1985-04-08',0,NULL),
('London','Sean','1975-02-02',0,NULL);

INSERT INTO `cards` (`cardNumber`,`cardTypesId`)
VALUES (2627,3),
(2022,3),
(2608,3),
(2377,1),
(1869,4),
(2403,4),
(1263,3),
(2198,1),
(2927,2),
(2775,2);

INSERT INTO `cardTypes` (`type`,`discount`)
VALUES ('Fidélité',20),
('Famille Nombreuse',30),
('Etudiant',40),
('Employé',50);

INSERT INTO `shows` (`title`,`performer`,`date`,`showTypesId`,`firstGenresId`,`secondGenreId`,`duration`,`startTime`)
VALUES ('Vestibulum accumsan','Osborn','2016-10-15',1,4,3,'02:00:00','20:00:00'),
('Venenatis lacus','Dale','2017-01-05',1,1,8,'02:00:00','20:00:00'),
('Sem egestas','Juarez','2017-02-01',1,8,21,'02:00:00','20:00:00'),
('Nec urna','Tate','2018-05-02',1,3,21,'02:00:00','20:00:00'),
('Neque et','Hays','2016-12-24',1,6,15,'02:00:00','20:00:00'),
('Convallis convallis','Boone','2019-12-18',1,9,21,'02:00:00','20:00:00'),
('Cursus. Nunc','Prince','2020-05-02',1,6,10,'02:00:00','20:00:00'),
('Ornare lectus','Butler','2016-12-25',1,10,9,'02:00:00','20:00:00');

INSERT INTO `tickets` (`price`,`bookingsId`)
VALUES (40,1),(40,1),(40,1),(40,1),(40,1),(40,2),(40,2),(40,2),(40,2),(40,2),(40,3),(40,3),(40,3),(40,4),(40,5),(40,6),
(40,6),(40,6),(40,6),(40,6),(40,7),(40,7),(40,8),(40,9),(40,9),(40,9),(40,9),(40,9),(40,9),(40,9),(40,10),(40,10),
(40,10),(40,10),(40,11),(40,11),(40,11),(40,11),(40,11),(40,11),(40,12),(40,12),(40,12),(40,12),(40,12),(40,12),(40,12),
(40,12),(40,12),(40,12),(40,13),(40,13),(40,13),(40,13),(40,13),(40,13),(40,13),(40,13),(40,13),(40,13),(40,14),(40,14),
(40,14),(40,15),(40,15),(40,15),(40,15),(40,16),(40,17),(40,17),(40,17),(40,17),(40,17),(40,18),(40,18),(40,18),(40,18),
(40,19),(40,19),(40,19),(40,19),(40,20),(40,20),(40,20),(40,21),(40,21),(40,21),(40,21),(40,22),(40,22),(40,22),(40,23),
(40,23),(40,23),(40,24),(40,24),(40,24),(40,25),(40,25),(40,25);

INSERT INTO `bookings` (`clientId`)
VALUES (1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25);

INSERT INTO `showTypes` (`type`)
VALUES ('Concert'),
('Théâtre'),
('Humour'),
('Danse');

INSERT INTO `genres` (`genre`,`showTypesId`)
VALUES ('Variété et chanson française',1),
('Variété internationale',1),
('Pop/Rock',1),
('Musique électronique',1),
('Folk',1),
('Rap',1),
('Hip Hop',1),
('Slam',1),('Reggae',1),
('Clubbing',1),
('RnB',1),
('Soul',1),
('Funk',1),
('Jazz',1),
('Blues',1),
('Country',1),
('Gospel',1),
('Musique du monde',1),
('Classique',1),
('Opéra',1),
('Autres',1),
('Drame',2),
('Comédie',2),
('Comtemporain',2),
('Monologue',2),
('One Man / Woman Show',3),
('Café-Théâtre',3),
('Stand Up',3),
('Autres',3),
('Comtemporaine',4),
('Classique',4),
('Urbaine',4);

-- PDO2--
#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `hospitalE2N` CHARACTER SET 'utf8';
USE `hospitalE2N`;

#------------------------------------------------------------
# Table: patients
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patients`(
        `id`        INT (11) AUTO_INCREMENT  NOT NULL ,
        `lastname`  VARCHAR (25) NOT NULL ,
        `firstname` VARCHAR (25) NOT NULL ,
        `birthdate` DATE NOT NULL ,
        `phone`     VARCHAR (25) ,
        `mail`      VARCHAR (100) NOT NULL ,
        PRIMARY KEY (`id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: appointments
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `appointments`(
        `id`         INT (11) AUTO_INCREMENT  NOT NULL ,
        `dateHour`   DATETIME NOT NULL ,
        `idPatients` INT (11) NOT NULL ,
        PRIMARY KEY (`id`)
)ENGINE=InnoDB;

ALTER TABLE appointments
ADD CONSTRAINT FK_appointments_id_patients
  FOREIGN KEY (idPatients)
  REFERENCES patients (id)
  ON DELETE CASCADE
ON UPDATE NO ACTION;




#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: p13r_users
#------------------------------------------------------------

CREATE TABLE p13r_users(
        id                Int  Auto_increment  NOT NULL ,
        lastname          Varchar (50) NOT NULL ,
        firstname         Varchar (50) NOT NULL ,
        mail              Varchar (50) NOT NULL ,
        password          Varchar (255) NOT NULL ,
        phone             Varchar (50) NOT NULL ,
        birthdate         Varchar (50) NOT NULL ,
        gender            Varchar (50) NOT NULL ,
        login             Varchar (250) NOT NULL
	,CONSTRAINT users_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_userRoles
#------------------------------------------------------------

CREATE TABLE p13r_userRoles(
        id       Int  Auto_increment  NOT NULL ,
        userRole Varchar (50) NOT NULL
	,CONSTRAINT userRoles_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_testimonialsStatus
#------------------------------------------------------------

CREATE TABLE p13r_testimonialsStatus(
        id     Int  Auto_increment  NOT NULL ,
        status Varchar (50) NOT NULL
	,CONSTRAINT testimonialsStatus_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_testimonials
#------------------------------------------------------------

CREATE TABLE p13r_testimonials(
        id                    Int  Auto_increment  NOT NULL ,
        text                  Text NOT NULL ,
        rank                  Int NOT NULL ,
        dateHour              Datetime NOT NULL ,
        id_users              Int NOT NULL ,
        id_testimonialsStatus Int NOT NULL
	,CONSTRAINT testimonials_PK PRIMARY KEY (id)

	,CONSTRAINT testimonials_users_FK FOREIGN KEY (id_users) REFERENCES users(id)
	,CONSTRAINT testimonials_testimonialsStatus0_FK FOREIGN KEY (id_testimonialsStatus) REFERENCES testimonialsStatus(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_speciality
#------------------------------------------------------------

CREATE TABLE p13r_speciality(
        id         Int  Auto_increment  NOT NULL ,
        speciality Varchar (50) NOT NULL
	,CONSTRAINT speciality_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_professionnalSpecialities
#------------------------------------------------------------

CREATE TABLE p13r_professionnalSpecialities(
        id            Int  Auto_increment  NOT NULL ,
        id_users      Int NOT NULL ,
        id_speciality Int NOT NULL
	,CONSTRAINT professionnalSpecialities_PK PRIMARY KEY (id)

	,CONSTRAINT professionnalSpecialities_users_FK FOREIGN KEY (id_users) REFERENCES users(id)
	,CONSTRAINT professionnalSpecialities_speciality0_FK FOREIGN KEY (id_speciality) REFERENCES speciality(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_timeSlots
#------------------------------------------------------------

CREATE TABLE p13r_timeSlots(
        id       Int  Auto_increment  NOT NULL ,
        timeSlot Varchar (50) NOT NULL
	,CONSTRAINT timeSlots_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_appointments
#------------------------------------------------------------

CREATE TABLE p13r_appointments(
        id           Int  Auto_increment  NOT NULL ,
        date         Date NOT NULL ,
        id_users     Int NOT NULL ,
        id_timeSlots Int NOT NULL
	,CONSTRAINT appointments_PK PRIMARY KEY (id)

	,CONSTRAINT appointments_users_FK FOREIGN KEY (id_users) REFERENCES users(id)
	,CONSTRAINT appointments_timeSlots0_FK FOREIGN KEY (id_timeSlots) REFERENCES timeSlots(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_workshop
#------------------------------------------------------------

CREATE TABLE p13r_workshop(
        id              Int  Auto_increment  NOT NULL ,
        name            Varchar (50) NOT NULL ,
        startTime       Time NOT NULL ,
        endTime         Time NOT NULL ,
        date            Date NOT NULL ,
        program         Text NOT NULL ,
        placesAvailable Int NOT NULL ,
        places          Varchar (10) NOT NULL ,
        id_users        Int NOT NULL
	,CONSTRAINT atelier_PK PRIMARY KEY (id)

	,CONSTRAINT atelier_users_FK FOREIGN KEY (id_users) REFERENCES users(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_participations
#------------------------------------------------------------

CREATE TABLE p13r_participations(
        id         Int  Auto_increment  NOT NULL ,
        id_users   Int NOT NULL ,
        id_atelier Int NOT NULL
	,CONSTRAINT participations_PK PRIMARY KEY (id)

	,CONSTRAINT participations_users_FK FOREIGN KEY (id_users) REFERENCES users(id)
	,CONSTRAINT participations_atelier0_FK FOREIGN KEY (id_atelier) REFERENCES atelier(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: p13r_usersHaveRoles
#------------------------------------------------------------

CREATE TABLE p13r_usersHaveRoles(
        id       Int NOT NULL ,
        id_users Int NOT NULL
	,CONSTRAINT usersHaveRoles_PK PRIMARY KEY (id,id_users)

	,CONSTRAINT usersHaveRoles_userRoles_FK FOREIGN KEY (id) REFERENCES userRoles(id)
	,CONSTRAINT usersHaveRoles_users0_FK FOREIGN KEY (id_users) REFERENCES users(id)
)ENGINE=InnoDB;


    About
