DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Chauffeur CASCADE CONSTRAINTS;
DROP TABLE Depart CASCADE CONSTRAINTS;
DROP TABLE Vehicule CASCADE CONSTRAINTS;
DROP TABLE Arrivee CASCADE CONSTRAINTS;
DROP TABLE Heure_Arrivee CASCADE CONSTRAINTS;
DROP TABLE Heure_Depart CASCADE CONSTRAINTS;
DROP TABLE Dates CASCADE CONSTRAINTS;
DROP TABLE Meteo CASCADE CONSTRAINTS;


-- Création des tables de dimensions
-- Done
CREATE TABLE Client (
    ID_Client INT PRIMARY KEY,
    Nom  VARCHAR2(50),
    Prenom  VARCHAR2(50),
    Age INT,
    Sexe CHAR(1) CHECK (Sexe IN ('H', 'F')),
    Type_Client  VARCHAR2(20),
    Langue_Preferee  VARCHAR2(20),
    Email  VARCHAR2(50),
    Telephone  VARCHAR2(15),
    Point_gagnee INT
);

-- Done
CREATE TABLE Chauffeur (
    ID_Chauffeur INT PRIMARY KEY,
    Nom  VARCHAR2(26),
    Prenom  VARCHAR2(26),
    Date_Embauche DATE,
    Numero_Permis  VARCHAR2(20),
    Type_Permis  VARCHAR2(10),
    Telephone  VARCHAR2(15),
    Email  VARCHAR2(50),
    Statut  VARCHAR2(10) CHECK (Statut IN ('actif', 'inactif')),
    Zone_Principale  VARCHAR2(50)
);

-- Done
CREATE TABLE Depart (
    ID_DEPART INT PRIMARY KEY,
    Adresse  VARCHAR2(100) ,
    Ville  VARCHAR2(50),
    Code_Postal  VARCHAR2(10),
    Distance_Centre INT, -- Distance en mètres
    Zone_Urbaine Number(1,0),
    Prise_En_Charge  VARCHAR2(50) CHECK(Prise_En_Charge in ('Prise en charge', 'Annule', 'En_Attente')),
    Description_Depart  VARCHAR2(255)
);

--Done
CREATE TABLE Vehicule (
    ID_Vehicule INT PRIMARY KEY,
    Marque  VARCHAR2(30),
    Modele  VARCHAR2(30),
    Annee INT,
    Type_Vehicule  VARCHAR2(20) CHECK (Type_Vehicule IN ('Essence', 'Diesel', 'Electrique', 'Hybride')),
    Etat_Vehicule  VARCHAR2(20) CHECK (Etat_Vehicule IN ('Excellent', 'Bon', 'Mauvais')),
    Km_Parcourus INT,
    Derniere_Revision DATE,
    Consommation Number(10,2),
    Assurance_Valide Number(1,0)
);

-- Done
CREATE TABLE Arrivee(
    ID_ARRIVEE INT PRIMARY KEY,
    Adresse  VARCHAR2(100) ,
    Ville  VARCHAR2(50),
    Code_Postal  VARCHAR2(10),
    Distance_Centre INT, -- Distance en mètres
    Zone_Urbaine Number(1,0),
    Description_Arrivee  VARCHAR2(255)
);

--Done
CREATE TABLE Heure_Arrivee(
    ID_HEURE_ARRIVEE INT PRIMARY KEY,
    Heure_Complete VARCHAR2(8) ,
    Periode_Journee  VARCHAR2(15) CHECK (Periode_Journee IN ('matin', 'apres-midi', 'soir', 'nuit')),
    AM_PM  VARCHAR2(10) CHECK (AM_PM IN ('AM', 'PM')),
    Heure_Pointe Number(1,0), 
    Heure_Format24h VARCHAR2(8), 
    Fuseau_Horaire  VARCHAR2(10),
    Heure_UTC VARCHAR2(8)
);

CREATE TABLE Heure_Depart(
    ID_HEURE_DEPART INT PRIMARY KEY,
    Heure_Complete VARCHAR2(8) ,
    Periode_Journee  VARCHAR2(15) CHECK (Periode_Journee IN ('matin', 'apres-midi', 'soir', 'nuit')),
    AM_PM  VARCHAR2(10) CHECK (AM_PM IN ('AM', 'PM')),
    Heure_Pointe Number(1,0), 
    Heure_Format24h VARCHAR2(8), 
    Fuseau_Horaire  VARCHAR2(10),
    Heure_UTC VARCHAR2(8)
);

-- Done
CREATE TABLE Dates (
    ID_DATE INT PRIMARY KEY,
    Date_Complete DATE ,
    Jour INT ,
    Mois INT,
    Annee INT,
    Type_Jour  VARCHAR2(15) CHECK (Type_Jour IN ('semaine', 'weekend', 'ferie')),
    Trimestre INT,
    Jour_Semaine  VARCHAR2(15) CHECK (Jour_Semaine IN ('lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche')),
    Semaine_Annee INT,
    Est_Weekend Number(1,0), 
    Est_Ferie Number(1,0),
    Commentaire  VARCHAR2(255)
);

--Done 
CREATE TABLE Meteo (
    ID_METEO INT PRIMARY KEY,
    Date_Meteo DATE ,
    Temperature Number(10,2),
    Humidite INT CHECK (Humidite BETWEEN 0 AND 100),
    Precipitations Number(10,2) CHECK (Precipitations >= 0),
    Vent_Vitesse Number(10,2) CHECK (Vent_Vitesse >= 0),
    Vent_Direction  VARCHAR2(10),
    Condition_Meteo  VARCHAR2(50),
    Pression_Atmospherique Number(10,2),
    Indice_UV INT CHECK (Indice_UV BETWEEN 0 AND 11)
);

--dimension avec remplissage des données


INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(1, 'Dupont', 'Alice', 34, 'F', 'VIP', 'Français', 'alice.dupont@example.com', '0123456789', 120);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(2, 'Martin', 'Pierre', 29, 'H', 'Standard', 'Français', 'pierre.martin@example.com', '0123456790', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(3, 'Smith', 'John', 45, 'H', 'Premium', 'Anglais', 'john.smith@example.com', '0123456791', 95);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(4, 'Durand', 'Marie', 40, 'F', 'VIP', 'Français', 'marie.durand@example.com', '0123456792', 110);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(5, 'Lopez', 'Carlos', 30, 'H', 'Standard', 'Espagnol', 'carlos.lopez@example.com', '0123456793', 30);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(6, 'Garcia', 'Ana', 36, 'F', 'Premium', 'Espagnol', 'ana.garcia@example.com', '0123456794', 80);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(7, 'Johnson', 'Linda', 28, 'F', 'Standard', 'Anglais', 'linda.johnson@example.com', '0123456795', 45);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(8, 'Schmidt', 'Hans', 50, 'H', 'VIP', 'Allemand', 'hans.schmidt@example.com', '0123456796', 130);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(9, 'Yamada', 'Taro', 32, 'H', 'Standard', 'Japonais', 'taro.yamada@example.com', '0123456797', 60);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(10, 'Wong', 'Mei', 25, 'F', 'Standard', 'Chinois', 'mei.wong@example.com', '0123456798', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(11, 'Brown', 'Emma', 38, 'F', 'Premium', 'Anglais', 'emma.brown@example.com', '0123456799', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(12, 'Kim', 'Jin', 31, 'H', 'Standard', 'Coréen', 'jin.kim@example.com', '0123456800', 55);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(13, 'Kumar', 'Anil', 42, 'H', 'Premium', 'Hindi', 'anil.kumar@example.com', '0123456801', 75);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(14, 'Omar', 'Youssef', 37, 'H', 'VIP', 'Arabe', 'youssef.omar@example.com', '0123456802', 115);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(15, 'Nguyen', 'Linh', 27, 'F', 'Standard', 'Vietnamien', 'linh.nguyen@example.com', '0123456803', 35);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(16, 'Lee', 'Min', 33, 'H', 'Premium', 'Coréen', 'min.lee@example.com', '0123456804', 90),
(17, 'Chen', 'Wei', 40, 'H', 'VIP', 'Chinois', 'wei.chen@example.com', '0123456805', 120),
(18, 'Patel', 'Priya', 29, 'F', 'Standard', 'Hindi', 'priya.patel@example.com', '0123456806', 50),
(19, 'Moore', 'James', 44, 'H', 'Premium', 'Anglais', 'james.moore@example.com', '0123456807', 95),
(20, 'Müller', 'Sofia', 37, 'F', 'VIP', 'Allemand', 'sofia.mueller@example.com', '0123456808', 115),
(21, 'Fernandez', 'Luis', 31, 'H', 'Standard', 'Espagnol', 'luis.fernandez@example.com', '0123456809', 40),
(22, 'Nakamura', 'Sakura', 28, 'F', 'Standard', 'Japonais', 'sakura.nakamura@example.com', '0123456810', 60),
(23, 'Singh', 'Raj', 46, 'H', 'Premium', 'Hindi', 'raj.singh@example.com', '0123456811', 80),
(24, 'White', 'Olivia', 36, 'F', 'VIP', 'Anglais', 'olivia.white@example.com', '0123456812', 100),
(25, 'Kimura', 'Hiroshi', 39, 'H', 'Premium', 'Japonais', 'hiroshi.kimura@example.com', '0123456813', 85),
(26, 'Zhao', 'Lian', 42, 'F', 'VIP', 'Chinois', 'lian.zhao@example.com', '0123456814', 130),
(27, 'Hassan', 'Amina', 34, 'F', 'Standard', 'Arabe', 'amina.hassan@example.com', '0123456815', 55),
(28, 'Ivanov', 'Dmitry', 50, 'H', 'VIP', 'Russe', 'dmitry.ivanov@example.com', '0123456816', 120),
(29, 'Hansen', 'Nina', 32, 'F', 'Premium', 'Danois', 'nina.hansen@example.com', '0123456817', 90),
(30, 'Anderson', 'Lucas', 38, 'H', 'Standard', 'Anglais', 'lucas.anderson@example.com', '0123456818', 45),
(31, 'Garcia', 'Maria', 26, 'F', 'Standard', 'Espagnol', 'maria.garcia@example.com', '0123456819', 35),
(32, 'Rodriguez', 'Jorge', 43, 'H', 'Premium', 'Espagnol', 'jorge.rodriguez@example.com', '0123456820', 75),
(33, 'Park', 'Jiwoo', 29, 'F', 'VIP', 'Coréen', 'jiwoo.park@example.com', '0123456821', 110),
(34, 'Nguyen', 'Tuan', 35, 'H', 'Standard', 'Vietnamien', 'tuan.nguyen@example.com', '0123456822', 50),
(35, 'Brown', 'Sophia', 30, 'F', 'Premium', 'Anglais', 'sophia.brown@example.com', '0123456823', 85),
(36, 'Mehmet', 'Ali', 41, 'H', 'VIP', 'Turc', 'ali.mehmet@example.com', '0123456824', 125),
(37, 'Takahashi', 'Yuki', 28, 'F', 'Standard', 'Japonais', 'yuki.takahashi@example.com', '0123456825', 40),
(38, 'López', 'Isabella', 45, 'F', 'Premium', 'Espagnol', 'isabella.lopez@example.com', '0123456826', 95),
(39, 'Davis', 'William', 33, 'H', 'Standard', 'Anglais', 'william.davis@example.com', '0123456827', 50),
(40, 'Martinez', 'Lucia', 39, 'F', 'VIP', 'Espagnol', 'lucia.martinez@example.com', '0123456828', 120),
(41, 'Gonzalez', 'Carlos', 47, 'H', 'Premium', 'Espagnol', 'carlos.gonzalez@example.com', '0123456829', 90),
(42, 'Novak', 'Milan', 31, 'H', 'Standard', 'Tchèque', 'milan.novak@example.com', '0123456830', 55),
(43, 'Schneider', 'Klara', 38, 'F', 'VIP', 'Allemand', 'klara.schneider@example.com', '0123456831', 100),
(44, 'Wang', 'Chen', 29, 'H', 'Premium', 'Chinois', 'chen.wang@example.com', '0123456832', 70),
(45, 'Kumar', 'Seema', 36, 'F', 'Standard', 'Hindi', 'seema.kumar@example.com', '0123456833', 35),
(46, 'Ahmed', 'Omar', 49, 'H', 'VIP', 'Arabe', 'omar.ahmed@example.com', '0123456834', 110),
(47, 'Petrov', 'Natalia', 34, 'F', 'Premium', 'Russe', 'natalia.petrov@example.com', '0123456835', 85),
(48, 'Ricci', 'Marco', 40, 'H', 'Standard', 'Italien', 'marco.ricci@example.com', '0123456836', 60),
(49, 'Carvalho', 'Joana', 27, 'F', 'VIP', 'Portugais', 'joana.carvalho@example.com', '0123456837', 105),
(50, 'Blanc', 'Étienne', 44, 'H', 'Premium', 'Français', 'etienne.blanc@example.com', '0123456838', 95);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(51, 'Gomez', 'Elena', 31, 'F', 'Standard', 'Espagnol', 'elena.gomez@example.com', '0123456839', 50),
(52, 'Jensen', 'Erik', 28, 'H', 'Premium', 'Danois', 'erik.jensen@example.com', '0123456840', 75),
(53, 'Silva', 'Ana', 35, 'F', 'VIP', 'Portugais', 'ana.silva@example.com', '0123456841', 120),
(54, 'Evans', 'Chris', 38, 'H', 'Standard', 'Anglais', 'chris.evans@example.com', '0123456842', 40),
(55, 'Bauer', 'Laura', 42, 'F', 'Premium', 'Allemand', 'laura.bauer@example.com', '0123456843', 85),
(56, 'Dubois', 'Henri', 33, 'H', 'VIP', 'Français', 'henri.dubois@example.com', '0123456844', 110),
(57, 'Fischer', 'Julia', 30, 'F', 'Standard', 'Allemand', 'julia.fischer@example.com', '0123456845', 60),
(58, 'O’Connor', 'Sean', 46, 'H', 'Premium', 'Anglais', 'sean.oconnor@example.com', '0123456846', 95),
(59, 'Kovács', 'Árpád', 41, 'H', 'VIP', 'Hongrois', 'arpad.kovacs@example.com', '0123456847', 115),
(60, 'Meier', 'Stefan', 39, 'H', 'Standard', 'Allemand', 'stefan.meier@example.com', '0123456848', 35),
(61, 'Yang', 'Li', 29, 'F', 'Premium', 'Chinois', 'li.yang@example.com', '0123456849', 75),
(62, 'Vargas', 'Pedro', 32, 'H', 'Standard', 'Espagnol', 'pedro.vargas@example.com', '0123456850', 50),
(63, 'Hernandez', 'Lucia', 27, 'F', 'VIP', 'Espagnol', 'lucia.hernandez@example.com', '0123456851', 125),
(64, 'Weber', 'Maximilian', 36, 'H', 'Premium', 'Allemand', 'maximilian.weber@example.com', '0123456852', 90),
(65, 'Abe', 'Haruto', 44, 'H', 'VIP', 'Japonais', 'haruto.abe@example.com', '0123456853', 105),
(66, 'Pereira', 'Carlos', 38, 'H', 'Standard', 'Portugais', 'carlos.pereira@example.com', '0123456854', 40),
(67, 'Khan', 'Aisha', 31, 'F', 'Premium', 'Urdu', 'aisha.khan@example.com', '0123456855', 80),
(68, 'Stewart', 'Alex', 29, 'H', 'VIP', 'Anglais', 'alex.stewart@example.com', '0123456856', 95),
(69, 'Chang', 'Mei-Lin', 45, 'F', 'Standard', 'Chinois', 'mei-lin.chang@example.com', '0123456857', 30),
(70, 'Rossi', 'Giulia', 34, 'F', 'Premium', 'Italien', 'giulia.rossi@example.com', '0123456858', 85),
(71, 'Takahashi', 'Keiko', 37, 'F', 'VIP', 'Japonais', 'keiko.takahashi@example.com', '0123456859', 110),
(72, 'Moreno', 'Diego', 50, 'H', 'Standard', 'Espagnol', 'diego.moreno@example.com', '0123456860', 60),
(73, 'Nielsen', 'Sofie', 25, 'F', 'Premium', 'Danois', 'sofie.nielsen@example.com', '0123456861', 90),
(74, 'Rahman', 'Zara', 33, 'F', 'VIP', 'Bengali', 'zara.rahman@example.com', '0123456862', 100),
(75, 'Kowalski', 'Jan', 39, 'H', 'Standard', 'Polonais', 'jan.kowalski@example.com', '0123456863', 45),
(76, 'Bianchi', 'Francesco', 31, 'H', 'Premium', 'Italien', 'francesco.bianchi@example.com', '0123456864', 70),
(77, 'Huang', 'Ling', 29, 'F', 'VIP', 'Chinois', 'ling.huang@example.com', '0123456865', 115),
(78, 'Jovanovic', 'Milos', 44, 'H', 'Standard', 'Serbe', 'milos.jovanovic@example.com', '0123456866', 35),
(79, 'Popescu', 'Elena', 32, 'F', 'Premium', 'Roumain', 'elena.popescu@example.com', '0123456867', 80),
(80, 'Singh', 'Aarav', 40, 'H', 'VIP', 'Hindi', 'aarav.singh@example.com', '0123456868', 125),
(81, 'Ali', 'Fatima', 36, 'F', 'Standard', 'Arabe', 'fatima.ali@example.com', '0123456869', 50),
(82, 'Brown', 'Emma', 28, 'F', 'Premium', 'Anglais', 'emma.brown@example.com', '0123456870', 95),
(83, 'Santos', 'Joao', 47, 'H', 'VIP', 'Portugais', 'joao.santos@example.com', '0123456871', 120),
(84, 'Smith', 'Sophia', 25, 'F', 'Standard', 'Anglais', 'sophia.smith@example.com', '0123456872', 30),
(85, 'Lee', 'Jin', 45, 'H', 'Premium', 'Coréen', 'jin.lee@example.com', '0123456873', 75),
(86, 'Okafor', 'Chidi', 38, 'H', 'VIP', 'Igbo', 'chidi.okafor@example.com', '0123456874', 95),
(87, 'Ivanov', 'Olga', 29, 'F', 'Standard', 'Russe', 'olga.ivanov@example.com', '0123456875', 40),
(88, 'Nakamura', 'Hana', 27, 'F', 'Premium', 'Japonais', 'hana.nakamura@example.com', '0123456876', 85),
(89, 'Garcia', 'Antonio', 31, 'H', 'VIP', 'Espagnol', 'antonio.garcia@example.com', '0123456877', 100),
(90, 'Williams', 'John', 34, 'H', 'Standard', 'Anglais', 'john.williams@example.com', '0123456878', 45),
(91, 'Kim', 'Yuna', 33, 'F', 'Premium', 'Coréen', 'yuna.kim@example.com', '0123456879', 90),
(92, 'Fernandez', 'Isabel', 39, 'F', 'VIP', 'Espagnol', 'isabel.fernandez@example.com', '0123456880', 115),
(93, 'Weiss', 'Leon', 35, 'H', 'Standard', 'Allemand', 'leon.weiss@example.com', '0123456881', 35),
(94, 'Wang', 'Feng', 29, 'H', 'Premium', 'Chinois', 'feng.wang@example.com', '0123456882', 80),
(95, 'Jones', 'Elizabeth', 28, 'F', 'VIP', 'Anglais', 'elizabeth.jones@example.com', '0123456883', 110),
(96, 'Takahashi', 'Ken', 42, 'H', 'Standard', 'Japonais', 'ken.takahashi@example.com', '0123456884', 50),
(97, 'Perez', 'Rosa', 34, 'F', 'Premium', 'Espagnol', 'rosa.perez@example.com', '0123456885', 75),
(98, 'Hansen', 'Emma', 30, 'F', 'VIP', 'Danois', 'emma.hansen@example.com', '0123456886', 25);




INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(1, 'Lemoine', 'Pierre', '2015-06-12', '123456789012', 'B', '0612345678', 'pierre.lemoine@example.com', 'Actif', 'Paris'),
(2, 'Durand', 'Jean', '2016-03-05', '123456789013', 'B', '0612345679', 'jean.durand@example.com', 'Actif', 'Lyon'),
(3, 'Lemoine', 'Claire', '2017-07-19', '123456789014', 'B', '0612345680', 'claire.lemoine@example.com', 'Actif', 'Marseille'),
(4, 'Dupont', 'Michel', '2018-02-28', '123456789015', 'B', '0612345681', 'michel.dupont@example.com', 'Actif', 'Toulouse'),
(5, 'Martin', 'Sophie', '2015-11-12', '123456789016', 'B', '0612345682', 'sophie.martin@example.com', 'Actif', 'Nice'),
(6, 'Caron', 'Louis', '2019-09-22', '123456789017', 'B', '0612345683', 'louis.caron@example.com', 'Actif', 'Lille'),
(7, 'Bouchard', 'Isabelle', '2018-01-15', '123456789018', 'B', '0612345684', 'isabelle.bouchard@example.com', 'Actif', 'Bordeaux'),
(8, 'Thomas', 'Julien', '2017-08-21', '123456789019', 'B', '0612345685', 'julien.thomas@example.com', 'Actif', 'Nantes'),
(9, 'Blanc', 'Rémi', '2020-04-02', '123456789020', 'B', '0612345686', 'remi.blanc@example.com', 'Actif', 'Strasbourg'),
(10, 'Roussel', 'Camille', '2019-05-13', '123456789021', 'B', '0612345687', 'camille.roussel@example.com', 'Actif', 'Montpellier'),
(11, 'Leclerc', 'Victor', '2018-10-30', '123456789022', 'B', '0612345688', 'victor.leclerc@example.com', 'Actif', 'Lyon'),
(12, 'Girard', 'Hélène', '2017-12-07', '123456789023', 'B', '0612345689', 'helene.girard@example.com', 'Actif', 'Toulouse'),
(13, 'Gauthier', 'Thomas', '2016-06-25', '123456789024', 'B', '0612345690', 'thomas.gauthier@example.com', 'Actif', 'Paris'),
(14, 'Deschamps', 'Mélanie', '2015-03-03', '123456789025', 'B', '0612345691', 'melanie.deschamps@example.com', 'Actif', 'Marseille'),
(15, 'Fournier', 'Antoine', '2021-01-18', '123456789026', 'B', '0612345692', 'antoine.fournier@example.com', 'Actif', 'Nice'),
(16, 'Meyer', 'Sébastien', '2017-11-01', '123456789027', 'B', '0612345693', 'sebastien.meyer@example.com', 'Actif', 'Lille'),
(17, 'Pires', 'David', '2020-06-16', '123456789028', 'B', '0612345694', 'david.pires@example.com', 'Actif', 'Bordeaux'),
(18, 'Leclercq', 'Caroline', '2018-04-20', '123456789029', 'B', '0612345695', 'caroline.leclercq@example.com', 'Actif', 'Nantes'),
(19, 'Charpentier', 'Julien', '2019-10-11', '123456789030', 'B', '0612345696', 'julien.charpentier@example.com', 'Actif', 'Strasbourg'),
(20, 'Lemoine', 'Alice', '2021-02-03', '123456789031', 'B', '0612345697', 'alice.lemoine@example.com', 'Actif', 'Montpellier'),
(21, 'Lemoine', 'François', '2015-12-25', '123456789032', 'B', '0612345698', 'francois.lemoine@example.com', 'Actif', 'Paris'),
(22, 'Henri', 'Claire', '2020-08-21', '123456789033', 'B', '0612345699', 'claire.henri@example.com', 'Actif', 'Lyon'),
(23, 'Morel', 'Emilie', '2018-11-10', '123456789034', 'B', '0612345700', 'emilie.morel@example.com', 'Actif', 'Marseille'),
(24, 'Richard', 'Bernard', '2017-07-13', '123456789035', 'B', '0612345701', 'bernard.richard@example.com', 'Actif', 'Toulouse'),
(25, 'Lucas', 'Isabelle', '2019-03-18', '123456789036', 'B', '0612345702', 'isabelle.lucas@example.com', 'Actif', 'Nice'),
(26, 'Sanchez', 'François', '2020-07-22', '123456789037', 'B', '0612345703', 'francois.sanchez@example.com', 'Actif', 'Lille'),
(27, 'Pires', 'Ana', '2018-05-28', '123456789038', 'B', '0612345704', 'ana.pires@example.com', 'Actif', 'Bordeaux'),
(28, 'Marchand', 'Aurélie', '2019-04-19', '123456789039', 'B', '0612345705', 'aurelie.marchand@example.com', 'Actif', 'Nantes'),
(29, 'Clement', 'Mélissa', '2021-05-15', '123456789040', 'B', '0612345706', 'melissa.clement@example.com', 'Actif', 'Strasbourg'),
(30, 'Dupuis', 'Thierry', '2017-09-07', '123456789041', 'B', '0612345707', 'thierry.dupuis@example.com', 'Actif', 'Montpellier'),
(31, 'Gomez', 'Julien', '2015-08-25', '123456789042', 'B', '0612345708', 'julien.gomez@example.com', 'Actif', 'Paris'),
(32, 'Joubert', 'Aurore', '2016-12-18', '123456789043', 'B', '0612345709', 'aurore.joubert@example.com', 'Actif', 'Lyon'),
(33, 'Pape', 'Omar', '2020-01-07', '123456789044', 'B', '0612345710', 'omar.pape@example.com', 'Actif', 'Marseille'),
(34, 'Martinez', 'Lina', '2019-08-16', '123456789045', 'B', '0612345711', 'lina.martinez@example.com', 'Actif', 'Toulouse'),
(35, 'Dumont', 'Valérie', '2018-10-03', '123456789046', 'B', '0612345712', 'valerie.dumont@example.com', 'Actif', 'Nice'),
(36, 'Lambert', 'Sophie', '2020-09-01', '123456789047', 'B', '0612345713', 'sophie.lambert@example.com', 'Actif', 'Lille'),
(37, 'Fontaine', 'Élise', '2017-11-23', '123456789048', 'B', '0612345714', 'elise.fontaine@example.com', 'Actif', 'Bordeaux'),
(38, 'Maillard', 'Jacques', '2016-06-11', '123456789049', 'B', '0612345715', 'jacques.maillard@example.com', 'Actif', 'Nantes'),
(39, 'Vargas', 'Livia', '2018-03-06', '123456789050', 'B', '0612345716', 'livia.vargas@example.com', 'Actif', 'Strasbourg'),
(40, 'Lemoine', 'Thierry', '2017-04-22', '123456789051', 'B', '0612345717', 'thierry.lemoine@example.com', 'Actif', 'Montpellier');



INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(1, '10 Rue de la Paix', 'Paris', '75002', 1000, 1, 'Prise en charge', 'Proche de la place Vendôme');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(2, '25 Avenue du Prado', 'Marseille', '13006', 2000, 1, 'En_Attente', 'Centre ville');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(3, '5 Boulevard des Belges', 'Lyon', '69006', 3000, 0, 'Annule', 'Quartier résidentiel');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(4, '12 Rue du Bac', 'Paris', '75007', 1500, 1, 'Prise en charge', 'Près de la Tour Eiffel');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(5, '50 Rue Nationale', 'Lille', '59800', 500, 1, 'Prise en charge', 'Proche de la gare Lille Flandres');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(6, '8 Rue de Rivoli', 'Paris', '75004', 1800, 1, 'En_Attente', 'Près de l’Hôtel de Ville');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(7, '3 Place Bellecour', 'Lyon', '69002', 2700, 1, 'Annule', 'Centre de Lyon');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(8, '14 Cours Mirabeau', 'Aix-en-Provence', '13100', 3200, 1, 'Prise en charge', 'Près de la Fontaine de la Rotonde');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(9, '22 Rue Espariat', 'Marseille', '13001', 1900, 1, 'En_Attente', 'Centre historique');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(10, '7 Avenue Montaigne', 'Paris', '75008', 1400, 1, 'Prise en charge', 'Proche des Champs-Élysées');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(11, '9 Rue du Louvre', 'Paris', '75001', 900, 1, 'Annule', 'Près du musée du Louvre');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(12, '30 Rue de la Liberté', 'Dijon', '21000', 400, 0, 'Prise en charge', 'Centre de Dijon');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(13, '6 Rue Saint-Dominique', 'Paris', '75007', 1300, 1, 'En_Attente', 'Près des Invalides');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(14, '3 Rue Sainte-Catherine', 'Bordeaux', '33000', 1200, 1, 'Prise en charge', 'Centre de Bordeaux');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(15, '24 Place Stanislas', 'Nancy', '54000', 800, 0, 'Prise en charge', 'Centre historique de Nancy');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(16, '15 Rue de la République', 'Lyon', '69002', 500, 1, 'Prise en charge', 'Près de la gare Lyon Part-Dieu'),
(17, '40 Boulevard de la Liberté', 'Lille', '59000', 600, 1, 'En_Attente', 'Proche du centre commercial Euralille'),
(18, '12 Rue Montorgueil', 'Paris', '75001', 800, 1, 'Annule', 'Quartier historique du Marais'),
(19, '1 Place du Capitole', 'Toulouse', '31000', 1500, 1, 'Prise en charge', 'Place centrale de Toulouse'),
(20, '9 Rue de Verdun', 'Marseille', '13001', 1000, 1, 'En_Attente', 'Quartier des Antiquaires'),
(21, '18 Avenue Jean Médecin', 'Nice', '06000', 1200, 1, 'Prise en charge', 'Centre-ville, proche de la Promenade des Anglais'),
(22, '25 Boulevard Saint-Germain', 'Paris', '75005', 1200, 1, 'Annule', 'Quartier Latin'),
(23, '5 Rue de la Charité', 'Lyon', '69002', 900, 1, 'Prise en charge', 'Près de l’Opéra de Lyon'),
(24, '14 Rue de la Gare', 'Strasbourg', '67000', 1500, 1, 'En_Attente', 'Près de la gare TGV'),
(25, '3 Place de la République', 'Paris', '75003', 800, 1, 'Prise en charge', 'Centre de Paris, proche du Centre Pompidou'),
(26, '2 Rue des Écoles', 'Paris', '75005', 1300, 1, 'Annule', 'Quartier universitaire'),
(27, '6 Rue de lUniversité', 'Bordeaux', '33000', 600, 1, 'En_Attente', 'Quartier historique de Bordeaux'),
(28, '8 Avenue de la Gare', 'Marseille', '13003', 1800, 0, 'Prise en charge', 'Proche du Vieux-Port'),
(29, '22 Rue de la Paix', 'Paris', '75002', 500, 1, 'Prise en charge', 'Quartier des grands magasins'),
(30, '11 Rue des Frères Lumière', 'Lyon', '69008', 2500, 0, 'Annule', 'Quartier résidentiel'),
(31, '20 Rue de Lyon', 'Paris', '75012', 2000, 1, 'Prise en charge', 'Proche de la Gare de Lyon'),
(32, '3 Place de la Bourse', 'Bordeaux', '33000', 900, 0, 'En_Attente', 'Près de la place de la Bourse'),
(33, '7 Rue de la Vieille Draperie', 'Lille', '59000', 1400, 1, 'Prise en charge', 'Quartier historique'),
(34, '24 Rue Gambetta', 'Marseille', '13005', 1000, 1, 'En_Attente', 'Quartier des Chartreux'),
(35, '5 Boulevard Victor Hugo', 'Toulouse', '31000', 1600, 0, 'Prise en charge', 'Proche de la place Wilson'),
(36, '10 Rue de la Croix-Rousse', 'Lyon', '69004', 1100, 1, 'Annule', 'Quartier de la Croix-Rousse'),
(37, '8 Boulevard Jean Jaurès', 'Paris', '75019', 1200, 0, 'Prise en charge', 'Quartier Belleville'),
(38, '12 Place dItalie', 'Paris', '75013', 1500, 1, 'Prise en charge', 'Proche de la Bibliothèque François-Mitterrand'),
(39, '15 Rue des Trois Frères', 'Nice', '06000', 1700, 1, 'En_Attente', 'Vieux-Nice'),
(40, '21 Rue de la République', 'Marseille', '13002', 1900, 1, 'Annule', 'Quartier du Panier'),
(41, '13 Rue Danton', 'Paris', '75006', 600, 1, 'Prise en charge', 'Quartier Saint-Germain-des-Prés'),
(42, '9 Place de lOpéra', 'Paris', '75009', 500, 1, 'Annule', 'Proche de l’Opéra Garnier'),
(43, '2 Rue de la Poste', 'Lille', '59800', 1100, 1, 'Prise en charge', 'Proche de la gare Lille Europe'),
(44, '10 Rue Saint-Antoine', 'Paris', '75011', 1400, 1, 'En_Attente', 'Quartier Bastille'),
(45, '3 Rue Raspail', 'Paris', '75007', 1000, 1, 'Prise en charge', 'Proche du Musée dOrsay'),
(46, '16 Rue de la République', 'Marseille', '13002', 800, 0, 'Annule', 'Proche du Vieux-Port'),
(47, '14 Rue de la Paix', 'Paris', '75002', 400, 1, 'Prise en charge', 'Proche des Grands Boulevards'),
(48, '1 Place Victor Hugo', 'Bordeaux', '33000', 1000, 1, 'En_Attente', 'Proche de la gare Saint-Jean'),
(49, '5 Boulevard Montmartre', 'Paris', '75002', 1500, 1, 'Prise en charge', 'Quartier Montmartre'),
(50, '3 Rue de la Vieille Ville', 'Lyon', '69005', 800, 1, 'En_Attente', 'Proche de la basilique de Fourvière'),
(51, '10 Rue de la Digue', 'Strasbourg', '67000', 1100, 0, 'Prise en charge', 'Proche de la cathédrale'),
(52, '22 Rue Sainte-Catherine', 'Bordeaux', '33000', 2000, 1, 'Annule', 'Quartier des Chartrons'),
(53, '15 Rue de la Fontaine', 'Marseille', '13003', 1300, 0, 'Prise en charge', 'Quartier des Réformés'),
(54, '9 Rue de la Liberté', 'Toulouse', '31000', 1800, 1, 'Prise en charge', 'Centre-ville de Toulouse'),
(55, '4 Place de la Madeleine', 'Paris', '75008', 700, 1, 'Annule', 'Proche de l’église de la Madeleine'),
(56, '19 Boulevard de la Corderie', 'Lyon', '69007', 2000, 1, 'Prise en charge', 'Proche du Parc de la Tête d’Or'),
(57, '12 Rue du Faubourg Saint-Antoine', 'Paris', '75011', 1600, 1, 'En_Attente', 'Près du marché d’Aligre'),
(58, '3 Place des Vosges', 'Paris', '75003', 600, 1, 'Prise en charge', 'Quartier Le Marais'),
(59, '7 Rue de Paris', 'Aix-en-Provence', '13100', 2000, 0, 'En_Attente', 'Centre historique'),
(60, '5 Avenue de la République', 'Paris', '75011', 900, 1, 'Prise en charge', 'Quartier du Marais'),
(61, '17 Rue du Colonel Fabien', 'Paris', '75010', 1000, 0, 'Prise en charge', 'Quartier du Canal Saint-Martin'),
(62, '3 Rue du Commerce', 'Paris', '75015', 800, 1, 'Annule', 'Proche de la Tour Montparnasse'),
(63, '9 Place de la Concorde', 'Paris', '75008', 400, 1, 'Prise en charge', 'Proche du Jardin des Tuileries'),
(64, '2 Rue de la Montagne Sainte-Geneviève', 'Paris', '75005', 1000, 0, 'En_Attente', 'Quartier du Panthéon'),
(65, '10 Rue des Canuts', 'Lyon', '69004', 3000, 1, 'Prise en charge', 'Proche de la Croix-Rousse'),
(66, '4 Rue de la Montagne', 'Strasbourg', '67000', 2000, 1, 'En_Attente', 'Quartier de la Petite France'),
(67, '18 Rue de la République', 'Marseille', '13006', 800, 1, 'Prise en charge', 'Près de la gare Saint-Charles'),
(68, '8 Rue d’Antibes', 'Cannes', '06400', 1200, 0, 'Annule', 'Proche de la Croisette'),
(69, '5 Rue Victor Hugo', 'Toulouse', '31000', 1600, 1, 'Prise en charge', 'Quartier Carmes'),
(70, '14 Boulevard de la Villette', 'Paris', '75010', 700, 1, 'Annule', 'Près du parc des Buttes-Chaumont'),
(71, '17 Rue de lIndépendance', 'Nice', '06000', 900, 0, 'Prise en charge', 'Quartier de la Libération'),
(72, '11 Rue de l’Église', 'Nantes', '44000', 1200, 1, 'En_Attente', 'Quartier de l’île de Nantes'),
(73, '19 Rue du Faubourg', 'Paris', '75011', 1300, 1, 'Prise en charge', 'Proche du Père Lachaise'),
(74, '6 Boulevard de la Mer', 'Marseille', '13007', 800, 1, 'Prise en charge', 'Proche de l’Estaque'),
(75, '2 Rue de la Libération', 'Aix-en-Provence', '13100', 900, 0, 'En_Attente', 'Près du Palais des Congrès'),
(76, '10 Avenue de l’Opéra', 'Paris', '75001', 500, 1, 'Prise en charge', 'Près du Musée du Louvre'),
(77, '3 Rue d’Alger', 'Paris', '75001', 1000, 1, 'Prise en charge', 'Près de la Comédie-Française'),
(78, '12 Rue de la Douane', 'Bordeaux', '33000', 1500, 1, 'Annule', 'Quartier de la Bastide'),
(79, '7 Boulevard Victor Hugo', 'Lille', '59000', 1700, 1, 'Prise en charge', 'Proche de la place de la République'),
(80, '1 Place Jean Jaurès', 'Paris', '75019', 500, 1, 'Prise en charge', 'Proche de la Cité des Sciences'),
(81, '16 Avenue de la Liberté', 'Nice', '06000', 900, 1, 'En_Attente', 'Quartier du port'),
(82, '12 Rue des Pyramides', 'Paris', '75001', 1200, 1, 'Annule', 'Proche du jardin des Tuileries'),
(83, '6 Rue des Chênes', 'Strasbourg', '67000', 700, 1, 'Prise en charge', 'Proche du parc de l’Orangerie'),
(84, '10 Rue de la Gare', 'Nantes', '44000', 2000, 0, 'Prise en charge', 'Proche de la gare SNCF'),
(85, '7 Rue de la Loire', 'Tours', '37000', 1000, 1, 'Annule', 'Proche du pont Wilson'),
(86, '1 Place de l’Opéra', 'Paris', '75009', 700, 1, 'En_Attente', 'Quartier des Grands Boulevards'),
(87, '9 Rue de la Place', 'Marseille', '13001', 900, 0, 'Prise en charge', 'Proche du Vieux-Port'),
(88, '4 Place Carnot', 'Lyon', '69002', 800, 1, 'Annule', 'Proche de la gare de Lyon Perrache'),
(89, '13 Rue des Boulets', 'Paris', '75011', 1300, 1, 'En_Attente', 'Quartier de la Bastille'),
(90, '12 Rue du Poids de l’Huile', 'Marseille', '13001', 2000, 0, 'Prise en charge', 'Quartier du Panier'),
(91, '11 Rue du Quatre Septembre', 'Paris', '75002', 1000, 0, 'En_Attente', 'Proche de l’Opéra Garnier'),
(92, '8 Place des Terreaux', 'Lyon', '69001', 1200, 1, 'Prise en charge', 'Quartier historique'),
(93, '14 Rue des Champs', 'Paris', '75008', 800, 0, 'Annule', 'Proche des Champs-Élysées'),
(94, '20 Rue de la Croix', 'Nantes', '44000', 1500, 1, 'Prise en charge', 'Proche de l’île de Nantes'),
(95, '10 Rue de la Bourse', 'Marseille', '13001', 700, 0, 'Prise en charge', 'Quartier du Vieux-Port'),
(96, '3 Avenue de Paris', 'Versailles', '78000', 1300, 1, 'Annule', 'Proche du Château de Versailles'),
(97, '4 Rue de la Liberté', 'Strasbourg', '67000', 1600, 0, 'En_Attente', 'Quartier de la Petite France'),
(98, '16 Rue de lYser', 'Paris', '75010', 1000, 1, 'Prise en charge', 'Proche du Canal Saint-Martin'),
(99, '7 Rue de la Pomme', 'Marseille', '13001', 900, 1, 'Prise en charge', 'Quartier du Panier'),
(100, '3 Rue du Marché', 'Lyon', '69002', 1500, 1, 'Prise en charge', 'Proche de la place des Terreaux');


INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (1, 'Chevrolet', 'Cruze', 2022, 'Diesel', 'Excellent', 18193, TO_DATE('2023-12-16', 'YYYY-MM-DD'), 5.5, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (2, 'Chevrolet', 'Cruze', 2023, 'Diesel', 'Excellent', 21080, TO_DATE('2023-07-21', 'YYYY-MM-DD'), 7.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (3, 'Nissan', 'Altima', 2017, 'Electrique', 'Mauvais', 65747, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (4, 'BMW', '320i', 2017, 'Diesel', 'Bon', 12912, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 8.1, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (5, 'Audi', 'A3', 2020, 'Diesel', 'Excellent', 95474, TO_DATE('2023-08-08', 'YYYY-MM-DD'), 8.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (6, 'Honda', 'Civic', 2017, 'Diesel', 'Moyen', 81627, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 4.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (7, 'Toyota', 'Corolla', 2024, 'Diesel', 'Mauvais', 89100, TO_DATE('2023-02-09', 'YYYY-MM-DD'), 7.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (8, 'Volkswagen', 'Golf', 2022, 'Essence', 'Excellent', 67939, TO_DATE('2023-09-21', 'YYYY-MM-DD'), 4.7, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (9, 'Audi', 'A3', 2019, 'Electrique', 'Moyen', 51620, TO_DATE('2024-10-08', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (10, 'Chevrolet', 'Cruze', 2016, 'Essence', 'Bon', 42036, TO_DATE('2024-08-21', 'YYYY-MM-DD'), 7.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (11, 'Volkswagen', 'Golf', 2021, 'Hybride', 'Excellent', 37287, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 9.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (12, 'Toyota', 'Corolla', 2020, 'Diesel', 'Bon', 11424, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 6.5, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (13, 'Ford', 'Focus', 2015, 'Electrique', 'Excellent', 96076, TO_DATE('2024-02-23', 'YYYY-MM-DD'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (14, 'Volkswagen', 'Golf', 2018, 'Essence', 'Excellent', 83919, TO_DATE('2024-07-23', 'YYYY-MM-DD'), 6.5, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (15, 'Honda', 'Civic', 2017, 'Diesel', 'Moyen', 58214, TO_DATE('2024-02-21', 'YYYY-MM-DD'), 4.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (16, 'Honda', 'Civic', 2022, 'Hybride', 'Moyen', 11011, TO_DATE('2024-05-30', 'YYYY-MM-DD'), 5.2, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (17, 'Chevrolet', 'Cruze', 2024, 'Diesel', 'Bon', 56031, TO_DATE('2024-02-08', 'YYYY-MM-DD'), 7.4, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (18, 'Honda', 'Civic', 2019, 'Diesel', 'Excellent', 39068, TO_DATE('2024-07-25', 'YYYY-MM-DD'), 8.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (19, 'Tesla', 'Model 3', 2021, 'Electrique', 'Moyen', 66018, TO_DATE('2023-01-05', 'YYYY-MM-DD'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (20, 'Honda', 'Civic', 2017, 'Essence', 'Mauvais', 90126, TO_DATE('2023-08-17', 'YYYY-MM-DD'), 9.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (21, 'Tesla', 'Model 3', 2023, 'Hybride', 'Bon', 93615, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 5.3, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (22, 'BMW', '320i', 2016, 'Electrique', 'Bon', 16911, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (23, 'Tesla', 'Model 3', 2023, 'Electrique', 'Excellent', 20608, TO_DATE('2023-03-24', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (24, 'Nissan', 'Altima', 2016, 'Hybride', 'Bon', 23026, TO_DATE('2023-07-27', 'YYYY-MM-DD'), 6.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (25, 'Ford', 'Focus', 2016, 'Essence', 'Bon', 91709, TO_DATE('2023-01-04', 'YYYY-MM-DD'), 8.3, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (26, 'Honda', 'Civic', 2020, 'Electrique', 'Excellent', 94718, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (27, 'Honda', 'Civic', 2024, 'Essence', 'Mauvais', 39196, TO_DATE('2024-07-14', 'YYYY-MM-DD'), 6.2, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (28, 'Honda', 'Civic', 2019, 'Hybride', 'Moyen', 54967, TO_DATE('2023-11-19', 'YYYY-MM-DD'), 5.4, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (29, 'Hyundai', 'Elantra', 2017, 'Hybride', 'Bon', 62159, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 5.1, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (30, 'Tesla', 'Model 3', 2015, 'Hybride', 'Mauvais', 72229, TO_DATE('2024-01-04', 'YYYY-MM-DD'), 5.2, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (31, 'Toyota', 'Corolla', 2022, 'Electrique', 'Bon', 40559, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (32, 'Volkswagen', 'Golf', 2018, 'Electrique', 'Mauvais', 43121, TO_DATE('2024-01-11', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (33, 'BMW', '320i', 2018, 'Electrique', 'Bon', 58081, TO_DATE('2023-11-24', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (34, 'Tesla', 'Model 3', 2019, 'Electrique', 'Excellent', 61567, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (35, 'Tesla', 'Model 3', 2017, 'Diesel', 'Excellent', 47349, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 9.8, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (36, 'Toyota', 'Corolla', 2023, 'Electrique', 'Bon', 16344, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (37, 'Honda', 'Civic', 2021, 'Essence', 'Moyen', 67334, TO_DATE('2024-02-04', 'YYYY-MM-DD'), 7.1, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (38, 'Nissan', 'Altima', 2024, 'Electrique', 'Excellent', 34759, TO_DATE('2024-06-25', 'YYYY-MM-DD'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (39, 'Ford', 'Focus', 2015, 'Diesel', 'Excellent', 42535, TO_DATE('2023-11-13', 'YYYY-MM-DD'), 7.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (40, 'Ford', 'Focus', 2019, 'Electrique', 'Mauvais', 51705, TO_DATE('2024-05-23', 'YYYY-MM-DD'), 0.0, 0);


INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (1, '22 Rue de la République', 'Paris', '75003', 1500, 1, 'Arrivée près du Marais');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (2, '14 Rue de la Canebière', 'Marseille', '13001', 1000, 1, 'Arrivée à proximité du Vieux-Port');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (3, '8 Place des Terreaux', 'Lyon', '69001', 2000, 0, 'Arrivée dans le quartier historique');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (4, '16 Avenue des Champs-Élysées', 'Paris', '75008', 1000, 1, 'Arrivée au cœur de Paris');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (5, '30 Boulevard de la Liberté', 'Lille', '59000', 500, 1, 'Arrivée à proximité de la gare Lille Flandres');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (6, '5 Rue de la Concorde', 'Paris', '75008', 1800, 1, 'Arrivée près de l’Hôtel de Ville');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (7, '10 Rue de la République', 'Lyon', '69002', 2200, 1, 'Arrivée dans le quartier des Brotteaux');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (8, '25 Rue d\Italie', 'Aix-en-Provence', '13100', 3000, 1, 'Arrivée proche du Cours Mirabeau');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (9, '17 Rue de la Palud', 'Marseille', '13006', 1600, 1, 'Arrivée dans le centre historique');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (10, '6 Rue de Rivoli', 'Paris', '75001', 1200, 1, 'Arrivée au bord de la Seine');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (11, '4 Rue de la Montagne Sainte-Geneviève', 'Paris', '75005', 800, 1, 'Arrivée près du Panthéon');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (12, '20 Place François Rude', 'Dijon', '21000', 500, 0, 'Arrivée au cœur du centre-ville');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (13, '12 Rue de Grenelle', 'Paris', '75007', 1500, 1, 'Arrivée à proximité du musée d\Orsay');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (14, '9 Place de la Bourse', 'Bordeaux', '33000', 1200, 1, 'Arrivée au centre de Bordeaux');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (15, '7 Rue de la Vieille-Draperie', 'Nancy', '54000', 800, 0, 'Arrivée près de la Place Stanislas');

INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(1, '08:00:00', 'matin', 'AM', 1, '08:00', 'CET', '07:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(2, '12:30:00', 'apres-midi', 'PM', 0, '12:30', 'CET', '11:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(3, '17:45:00', 'soir', 'PM', 1, '17:45', 'CET', '16:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(4, '23:15:00', 'nuit', 'PM', 0, '23:15', 'CET', '22:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(5, '06:30:00', 'matin', 'AM', 1, '06:30', 'CET', '05:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(6, '14:00:00', 'apres-midi', 'PM', 0, '14:00', 'CET', '13:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(7, '19:30:00', 'soir', 'PM', 1, '19:30', 'CET', '18:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(8, '22:00:00', 'nuit', 'PM', 0, '22:00', 'CET', '21:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(9, '07:15:00', 'matin', 'AM', 1, '07:15', 'CET', '06:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(10, '13:45:00', 'apres-midi', 'PM', 0, '13:45', 'CET', '12:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(11, '18:00:00', 'soir', 'PM', 1, '18:00', 'CET', '17:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(12, '21:30:00', 'nuit', 'PM', 0, '21:30', 'CET', '20:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(13, '05:45:00', 'matin', 'AM', 1, '05:45', 'CET', '04:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(14, '15:30:00', 'apres-midi', 'PM', 0, '15:30', 'CET', '14:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(15, '20:15:00', 'soir', 'PM', 1, '20:15', 'CET', '19:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(16, '04:30:00', 'matin', 'AM', 1, '04:30', 'CET', '03:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(17, '11:00:00', 'matin', 'AM', 1, '11:00', 'CET', '10:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(18, '14:30:00', 'apres-midi', 'PM', 0, '14:30', 'CET', '13:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(19, '19:45:00', 'soir', 'PM', 1, '19:45', 'CET', '18:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(20, '23:00:00', 'nuit', 'PM', 0, '23:00', 'CET', '22:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(21, '05:00:00', 'matin', 'AM', 1, '05:00', 'CET', '04:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(22, '09:30:00', 'matin', 'AM', 1, '09:30', 'CET', '08:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(23, '12:45:00', 'apres-midi', 'PM', 0, '12:45', 'CET', '11:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(24, '17:30:00', 'soir', 'PM', 1, '17:30', 'CET', '16:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(25, '22:15:00', 'nuit', 'PM', 0, '22:15', 'CET', '21:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(26, '06:30:00', 'matin', 'AM', 1, '06:30', 'CET', '05:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(27, '08:00:00', 'matin', 'AM', 1, '08:00', 'CET', '07:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(28, '13:00:00', 'apres-midi', 'PM', 0, '13:00', 'CET', '12:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(29, '16:30:00', 'apres-midi', 'PM', 0, '16:30', 'CET', '15:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(30, '21:00:00', 'soir', 'PM', 1, '21:00', 'CET', '20:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(31, '04:00:00', 'matin', 'AM', 1, '04:00', 'CET', '03:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(32, '10:15:00', 'matin', 'AM', 1, '10:15', 'CET', '09:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(33, '14:45:00', 'apres-midi', 'PM', 0, '14:45', 'CET', '13:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(34, '19:00:00', 'soir', 'PM', 1, '19:00', 'CET', '18:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(34, '22:45:00', 'nuit', 'PM', 0, '22:45', 'CET', '21:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(35, '06:00:00', 'matin', 'AM', 1, '06:00', 'CET', '05:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(36, '09:15:00', 'matin', 'AM', 1, '09:15', 'CET', '08:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(37, '11:30:00', 'matin', 'AM', 1, '11:30', 'CET', '10:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(38, '13:00:00', 'apres-midi', 'PM', 0, '13:00', 'CET', '12:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(39, '16:30:00', 'apres-midi', 'PM', 0, '16:30', 'CET', '15:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(40, '19:00:00', 'soir', 'PM', 1, '19:00', 'CET', '18:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(41, '21:30:00', 'soir', 'PM', 1, '21:30', 'CET', '20:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(42, '23:45:00', 'nuit', 'PM', 0, '23:45', 'CET', '22:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(43, '05:30:00', 'matin', 'AM', 1, '05:30', 'CET', '04:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(44, '08:45:00', 'matin', 'AM', 1, '08:45', 'CET', '07:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(45, '11:00:00', 'matin', 'AM', 1, '11:00', 'CET', '10:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(46, '14:00:00', 'apres-midi', 'PM', 0, '14:00', 'CET', '13:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(47, '17:15:00', 'soir', 'PM', 1, '17:15', 'CET', '16:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(48, '19:30:00', 'soir', 'PM', 1, '19:30', 'CET', '18:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(49, '22:00:00', 'nuit', 'PM', 0, '22:00', 'CET', '21:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(50, '23:15:00', 'nuit', 'PM', 0, '23:15', 'CET', '22:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(51, '04:00:00', 'matin', 'AM', 1, '04:00', 'CET', '03:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(52, '07:30:00', 'matin', 'AM', 1, '07:30', 'CET', '06:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(53, '10:15:00', 'matin', 'AM', 1, '10:15', 'CET', '09:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(54, '12:30:00', 'apres-midi', 'PM', 0, '12:30', 'CET', '11:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(55, '15:00:00', 'apres-midi', 'PM', 0, '15:00', 'CET', '14:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(56, '17:45:00', 'soir', 'PM', 1, '17:45', 'CET', '16:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(57, '20:00:00', 'soir', 'PM', 1, '20:00', 'CET', '19:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(58, '22:30:00', 'nuit', 'PM', 0, '22:30', 'CET', '21:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(59, '01:30:00', 'nuit', 'AM', 0, '01:30', 'CET', '00:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(60, '04:15:00', 'matin', 'AM', 1, '04:15', 'CET', '03:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(61, '07:00:00', 'matin', 'AM', 1, '07:00', 'CET', '06:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(62, '09:45:00', 'matin', 'AM', 1, '09:45', 'CET', '08:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(63, '12:00:00', 'apres-midi', 'PM', 0, '12:00', 'CET', '11:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(64, '14:30:00', 'apres-midi', 'PM', 0, '14:30', 'CET', '13:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(65, '17:00:00', 'soir', 'PM', 1, '17:00', 'CET', '16:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(66, '19:30:00', 'soir', 'PM', 1, '19:30', 'CET', '18:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(67, '22:00:00', 'nuit', 'PM', 0, '22:00', 'CET', '21:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(68, '00:30:00', 'nuit', 'AM', 0, '00:30', 'CET', '23:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(69, '03:00:00', 'matin', 'AM', 1, '03:00', 'CET', '02:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(70, '06:15:00', 'matin', 'AM', 1, '06:15', 'CET', '05:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(71, '08:30:00', 'matin', 'AM', 1, '08:30', 'CET', '07:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(72, '11:00:00', 'matin', 'AM', 1, '11:00', 'CET', '10:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(73, '13:15:00', 'apres-midi', 'PM', 0, '13:15', 'CET', '12:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(74, '16:30:00', 'apres-midi', 'PM', 0, '16:30', 'CET', '15:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(75, '19:45:00', 'soir', 'PM', 1, '19:45', 'CET', '18:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(76, '22:00:00', 'nuit', 'PM', 0, '22:00', 'CET', '21:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(77, '00:15:00', 'nuit', 'AM', 0, '00:15', 'CET', '23:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(78, '03:45:00', 'matin', 'AM', 1, '03:45', 'CET', '02:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(79, '06:30:00', 'matin', 'AM', 1, '06:30', 'CET', '05:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(80, '09:00:00', 'matin', 'AM', 1, '09:00', 'CET', '08:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(81, '12:30:00', 'apres-midi', 'PM', 0, '12:30', 'CET', '11:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(82, '14:45:00', 'apres-midi', 'PM', 0, '14:45', 'CET', '13:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(83, '17:00:00', 'soir', 'PM', 1, '17:00', 'CET', '16:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(84, '19:15:00', 'soir', 'PM', 1, '19:15', 'CET', '18:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(85, '21:45:00', 'nuit', 'PM', 0, '21:45', 'CET', '20:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(86, '00:00:00', 'nuit', 'AM', 0, '00:00', 'CET', '23:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(87, '03:15:00', 'matin', 'AM', 1, '03:15', 'CET', '02:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(88, '06:00:00', 'matin', 'AM', 1, '06:00', 'CET', '05:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(89, '08:30:00', 'matin', 'AM', 1, '08:30', 'CET', '07:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(90, '11:15:00', 'matin', 'AM', 1, '11:15', 'CET', '10:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(91, '14:00:00', 'apres-midi', 'PM', 0, '14:00', 'CET', '13:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(92, '16:30:00', 'apres-midi', 'PM', 0, '16:30', 'CET', '15:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(93, '19:00:00', 'soir', 'PM', 1, '19:00', 'CET', '18:00');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(94, '21:30:00', 'soir', 'PM', 1, '21:30', 'CET', '20:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(95, '00:45:00', 'nuit', 'AM', 0, '00:45', 'CET', '23:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(96, '03:30:00', 'matin', 'AM', 1, '03:30', 'CET', '02:30');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(97, '06:45:00', 'matin', 'AM', 1, '06:45', 'CET', '05:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(98, '09:15:00', 'matin', 'AM', 1, '09:15', 'CET', '08:15');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(99, '11:45:00', 'matin', 'AM', 1, '11:45', 'CET', '10:45');
INSERT INTO Heure_Depart (ID_HEURE_DEPART, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(100, '14:15:00', 'apres-midi', 'PM', 0, '14:15', 'CET', '13:15');

-- Insertions pour Heure_Arrivee (ID_HEURE_ARRIVEE de 1 à 100)
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(1, '00:00:00', 'nuit', 'AM', 0, '00:00', 'CET', '23:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(2, '02:00:00', 'nuit', 'AM', 1, '02:00', 'CET', '01:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(3, '04:30:00', 'matin', 'AM', 1, '04:30', 'CET', '03:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(4, '07:00:00', 'matin', 'AM', 1, '07:00', 'CET', '06:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(5, '09:15:00', 'matin', 'AM', 0, '09:15', 'CET', '08:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(6, '11:30:00', 'matin', 'AM', 1, '11:30', 'CET', '10:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(7, '14:00:00', 'apres-midi', 'PM', 0, '14:00', 'CET', '13:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(8, '16:45:00', 'apres-midi', 'PM', 1, '16:45', 'CET', '15:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(9, '19:00:00', 'soir', 'PM', 0, '19:00', 'CET', '18:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(10, '21:15:00', 'soir', 'PM', 1, '21:15', 'CET', '20:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(11, '00:30:00', 'nuit', 'AM', 1, '00:30', 'CET', '23:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(12, '03:00:00', 'matin', 'AM', 0, '03:00', 'CET', '02:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(13, '05:30:00', 'matin', 'AM', 1, '05:30', 'CET', '04:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(14, '08:00:00', 'matin', 'AM', 1, '08:00', 'CET', '07:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(15, '10:15:00', 'matin', 'AM', 0, '10:15', 'CET', '09:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(16, '12:30:00', 'apres-midi', 'PM', 1, '12:30', 'CET', '11:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(17, '15:00:00', 'apres-midi', 'PM', 1, '15:00', 'CET', '14:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(18, '17:30:00', 'soir', 'PM', 0, '17:30', 'CET', '16:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(19, '20:00:00', 'soir', 'PM', 1, '20:00', 'CET', '19:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(20, '22:15:00', 'nuit', 'PM', 0, '22:15', 'CET', '21:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(21, '00:45:00', 'nuit', 'AM', 1, '00:45', 'CET', '23:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(22, '03:15:00', 'matin', 'AM', 0, '03:15', 'CET', '02:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(23, '05:45:00', 'matin', 'AM', 1, '05:45', 'CET', '04:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(24, '08:15:00', 'matin', 'AM', 0, '08:15', 'CET', '07:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(25, '10:30:00', 'matin', 'AM', 1, '10:30', 'CET', '09:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(26, '12:45:00', 'apres-midi', 'PM', 0, '12:45', 'CET', '11:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(27, '15:15:00', 'apres-midi', 'PM', 1, '15:15', 'CET', '14:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(28, '17:45:00', 'soir', 'PM', 0, '17:45', 'CET', '16:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(29, '20:15:00', 'soir', 'PM', 1, '20:15', 'CET', '19:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(30, '22:30:00', 'nuit', 'PM', 0, '22:30', 'CET', '21:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(31, '00:00:00', 'nuit', 'AM', 1, '00:00', 'CET', '23:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(32, '02:30:00', 'nuit', 'AM', 0, '02:30', 'CET', '01:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(33, '05:00:00', 'matin', 'AM', 1, '05:00', 'CET', '04:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(34, '07:30:00', 'matin', 'AM', 0, '07:30', 'CET', '06:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(35, '10:00:00', 'matin', 'AM', 1, '10:00', 'CET', '09:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(36, '12:15:00', 'apres-midi', 'PM', 0, '12:15', 'CET', '11:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(37, '14:45:00', 'apres-midi', 'PM', 1, '14:45', 'CET', '13:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(38, '17:00:00', 'soir', 'PM', 0, '17:00', 'CET', '16:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(39, '19:30:00', 'soir', 'PM', 1, '19:30', 'CET', '18:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(40, '22:00:00', 'nuit', 'PM', 0, '22:00', 'CET', '21:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(41, '00:30:00', 'nuit', 'AM', 1, '00:30', 'CET', '23:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(42, '03:00:00', 'nuit', 'AM', 0, '03:00', 'CET', '02:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(43, '05:30:00', 'matin', 'AM', 1, '05:30', 'CET', '04:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(44, '08:00:00', 'matin', 'AM', 0, '08:00', 'CET', '07:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(45, '10:30:00', 'matin', 'AM', 1, '10:30', 'CET', '09:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(46, '13:00:00', 'apres-midi', 'PM', 0, '13:00', 'CET', '12:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(47, '15:30:00', 'apres-midi', 'PM', 1, '15:30', 'CET', '14:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(48, '18:00:00', 'soir', 'PM', 0, '18:00', 'CET', '17:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(49, '20:30:00', 'soir', 'PM', 1, '20:30', 'CET', '19:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(50, '23:00:00', 'nuit', 'PM', 0, '23:00', 'CET', '22:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(51, '01:30:00', 'nuit', 'AM', 1, '01:30', 'CET', '00:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(52, '04:00:00', 'nuit', 'AM', 0, '04:00', 'CET', '03:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(53, '06:30:00', 'matin', 'AM', 1, '06:30', 'CET', '05:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(54, '09:00:00', 'matin', 'AM', 0, '09:00', 'CET', '08:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(55, '11:30:00', 'matin', 'AM', 1, '11:30', 'CET', '10:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(56, '14:00:00', 'apres-midi', 'PM', 0, '14:00', 'CET', '13:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(57, '16:30:00', 'apres-midi', 'PM', 1, '16:30', 'CET', '15:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(58, '19:00:00', 'soir', 'PM', 0, '19:00', 'CET', '18:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(59, '21:30:00', 'soir', 'PM', 1, '21:30', 'CET', '20:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(60, '00:00:00', 'nuit', 'AM', 0, '00:00', 'CET', '23:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(61, '02:30:00', 'nuit', 'AM', 1, '02:30', 'CET', '01:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(62, '05:00:00', 'matin', 'AM', 0, '05:00', 'CET', '04:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(63, '07:30:00', 'matin', 'AM', 1, '07:30', 'CET', '06:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(64, '10:00:00', 'matin', 'AM', 0, '10:00', 'CET', '09:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(65, '12:15:00', 'apres-midi', 'PM', 1, '12:15', 'CET', '11:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(66, '14:45:00', 'apres-midi', 'PM', 0, '14:45', 'CET', '13:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(67, '17:00:00', 'soir', 'PM', 1, '17:00', 'CET', '16:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(68, '19:30:00', 'soir', 'PM', 0, '19:30', 'CET', '18:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(69, '22:00:00', 'nuit', 'PM', 1, '22:00', 'CET', '21:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(70, '00:30:00', 'nuit', 'AM', 0, '00:30', 'CET', '23:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(71, '03:00:00', 'nuit', 'AM', 1, '03:00', 'CET', '02:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(72, '05:30:00', 'matin', 'AM', 0, '05:30', 'CET', '04:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(73, '08:00:00', 'matin', 'AM', 1, '08:00', 'CET', '07:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(74, '10:30:00', 'matin', 'AM', 0, '10:30', 'CET', '09:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(75, '13:00:00', 'apres-midi', 'PM', 1, '13:00', 'CET', '12:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(76, '15:30:00', 'apres-midi', 'PM', 0, '15:30', 'CET', '14:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(77, '18:00:00', 'soir', 'PM', 1, '18:00', 'CET', '17:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(78, '20:30:00', 'soir', 'PM', 0, '20:30', 'CET', '19:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(79, '23:00:00', 'nuit', 'PM', 1, '23:00', 'CET', '22:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(80, '01:30:00', 'nuit', 'AM', 0, '01:30', 'CET', '00:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(81, '04:00:00', 'nuit', 'AM', 1, '04:00', 'CET', '03:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(82, '06:30:00', 'matin', 'AM', 0, '06:30', 'CET', '05:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(83, '09:00:00', 'matin', 'AM', 1, '09:00', 'CET', '08:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(84, '11:30:00', 'matin', 'AM', 0, '11:30', 'CET', '10:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(85, '14:00:00', 'apres-midi', 'PM', 1, '14:00', 'CET', '13:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(86, '16:30:00', 'apres-midi', 'PM', 0, '16:30', 'CET', '15:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(87, '19:00:00', 'soir', 'PM', 1, '19:00', 'CET', '18:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(88, '21:30:00', 'soir', 'PM', 0, '21:30', 'CET', '20:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(89, '00:00:00', 'nuit', 'AM', 1, '00:00', 'CET', '23:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(90, '02:30:00', 'nuit', 'AM', 0, '02:30', 'CET', '01:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(91, '05:00:00', 'matin', 'AM', 1, '05:00', 'CET', '04:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(92, '07:30:00', 'matin', 'AM', 0, '07:30', 'CET', '06:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(93, '10:00:00', 'matin', 'AM', 1, '10:00', 'CET', '09:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(94, '12:15:00', 'apres-midi', 'PM', 0, '12:15', 'CET', '11:15');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(95, '14:45:00', 'apres-midi', 'PM', 1, '14:45', 'CET', '13:45');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(96, '17:00:00', 'soir', 'PM', 0, '17:00', 'CET', '16:00');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(97, '19:30:00', 'soir', 'PM', 1, '19:30', 'CET', '18:30');
INSERT INTO Heure_Arrivee (ID_HEURE_ARRIVEE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(98, '22:00:00', 'nuit', 'PM', 0, '22:00', 'CET', '21:00');


INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (1, TO_DATE('2024-01-23', 'YYYY-MM-DD'), 23.3, 99, 9.9, 7.4, 'Est', 'Ensoleillé', 1020.7, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (2, TO_DATE('2023-10-17', 'YYYY-MM-DD'), 0.1, 47, 3.2, 7.3, 'Sud-Est', 'Orageux', 1022.8, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (3, TO_DATE('2024-08-05', 'YYYY-MM-DD'), -1.1, 64, 1.8, 2.1, 'Sud-Est', 'Nuageux', 1040.0, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (4, TO_DATE('2024-07-18', 'YYYY-MM-DD'), 13.5, 34, 19.0, 6.0, 'Sud-Est', 'Ensoleillé', 1031.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (5, TO_DATE('2024-01-09', 'YYYY-MM-DD'), 25.3, 56, 10.3, 3.3, 'Nord-Est', 'Neigeux', 1027.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (6, TO_DATE('2022-12-07', 'YYYY-MM-DD'), 1.4, 68, 6.5, 7.1, 'Nord', 'Orageux', 1009.9, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (7, TO_DATE('2023-04-25', 'YYYY-MM-DD'), 23.5, 96, 19.4, 9.5, 'Sud-Est', 'Ensoleillé', 1011.8, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (8, TO_DATE('2023-04-18', 'YYYY-MM-DD'), 39.5, 69, 1.1, 5.8, 'Nord-Ouest', 'Brouillard', 1000.5, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (9, TO_DATE('2024-09-08', 'YYYY-MM-DD'), 20.4, 100, 10.0, 12.2, 'Sud-Ouest', 'Brouillard', 1040.2, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (10, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 0.6, 45, 15.3, 11.3, 'Ouest', 'Nuageux', 989.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (11, TO_DATE('2023-04-27', 'YYYY-MM-DD'), 27.9, 70, 15.1, 13.1, 'Nord-Est', 'Nuageux', 1016.4, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (12, TO_DATE('2022-12-06', 'YYYY-MM-DD'), -5.1, 56, 18.1, 14.3, 'Sud-Est', 'Pluvieux', 1009.5, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (13, TO_DATE('2023-08-16', 'YYYY-MM-DD'), 36.9, 62, 4.0, 6.9, 'Ouest', 'Orageux', 1028.8, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (14, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 0.8, 59, 17.3, 3.8, 'Sud', 'Orageux', 1035.8, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (15, TO_DATE('2024-08-04', 'YYYY-MM-DD'), 20.6, 30, 15.1, 6.1, 'Nord-Est', 'Ensoleillé', 1049.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (16, TO_DATE('2022-12-03', 'YYYY-MM-DD'), 40.0, 50, 2.2, 4.6, 'Nord', 'Brouillard', 1034.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (17, TO_DATE('2022-11-18', 'YYYY-MM-DD'), 11.6, 67, 0.5, 1.6, 'Nord-Est', 'Ensoleillé', 1026.4, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (18, TO_DATE('2024-10-31', 'YYYY-MM-DD'), 16.1, 81, 2.9, 3.0, 'Sud', 'Pluvieux', 1005.6, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (19, TO_DATE('2023-12-17', 'YYYY-MM-DD'), 14.3, 32, 14.5, 1.2, 'Sud-Est', 'Nuageux', 1031.5, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (20, TO_DATE('2023-07-29', 'YYYY-MM-DD'), 21.4, 31, 19.7, 3.8, 'Sud', 'Ensoleillé', 989.8, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (21, TO_DATE('2023-01-11', 'YYYY-MM-DD'), 24.0, 65, 17.1, 2.6, 'Sud', 'Partiellement nuageux', 1014.8, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (22, TO_DATE('2024-05-27', 'YYYY-MM-DD'), 35.0, 82, 11.2, 4.5, 'Nord-Est', 'Brouillard', 1049.8, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (23, TO_DATE('2023-06-08', 'YYYY-MM-DD'), 39.0, 49, 14.5, 8.2, 'Ouest', 'Partiellement nuageux', 1023.4, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (24, TO_DATE('2023-08-11', 'YYYY-MM-DD'), -6.1, 62, 5.4, 4.0, 'Sud-Est', 'Neigeux', 1043.2, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (25, TO_DATE('2023-01-23', 'YYYY-MM-DD'), 33.7, 73, 12.9, 4.9, 'Est', 'Orageux', 1018.4, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (26, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 12.1, 99, 17.7, 11.3, 'Nord-Est', 'Orageux', 1038.5, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (27, TO_DATE('2024-06-17', 'YYYY-MM-DD'), 32.7, 79, 17.0, 9.6, 'Sud', 'Brouillard', 1041.6, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (28, TO_DATE('2023-01-22', 'YYYY-MM-DD'), 23.4, 50, 9.3, 2.5, 'Ouest', 'Partiellement nuageux', 1049.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (29, TO_DATE('2024-07-17', 'YYYY-MM-DD'), 29.1, 51, 12.7, 3.4, 'Sud-Est', 'Pluvieux', 1031.4, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (30, TO_DATE('2024-09-04', 'YYYY-MM-DD'), 39.4, 84, 3.7, 12.5, 'Est', 'Ensoleillé', 1034.1, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (31, TO_DATE('2022-12-09', 'YYYY-MM-DD'), 14.9, 96, 19.7, 9.8, 'Nord-Est', 'Partiellement nuageux', 996.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (32, TO_DATE('2024-05-26', 'YYYY-MM-DD'), 38.2, 58, 1.2, 3.5, 'Sud-Ouest', 'Neigeux', 1008.8, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (33, TO_DATE('2024-10-26', 'YYYY-MM-DD'), 27.4, 68, 17.8, 11.6, 'Est', 'Nuageux', 988.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (34, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 4.5, 85, 17.5, 14.8, 'Sud', 'Orageux', 998.1, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (35, TO_DATE('2023-06-20', 'YYYY-MM-DD'), 23.7, 94, 9.8, 10.9, 'Nord-Est', 'Neigeux', 1035.9, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (36, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 35.5, 38, 12.1, 1.2, 'Est', 'Pluvieux', 1045.1, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (37, TO_DATE('2023-03-19', 'YYYY-MM-DD'), 20.4, 93, 15.9, 12.4, 'Nord-Est', 'Nuageux', 990.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (38, TO_DATE('2023-05-25', 'YYYY-MM-DD'), -1.7, 66, 4.4, 1.2, 'Nord', 'Partiellement nuageux', 983.0, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (39, TO_DATE('2024-06-22', 'YYYY-MM-DD'), 35.1, 54, 18.1, 11.8, 'Est', 'Pluvieux', 1042.1, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (40, TO_DATE('2024-02-14', 'YYYY-MM-DD'), 34.8, 78, 0.4, 7.9, 'Sud-Est', 'Orageux', 1006.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (41, TO_DATE('2023-06-07', 'YYYY-MM-DD'), 0.6, 82, 3.0, 0.3, 'Ouest', 'Orageux', 1034.7, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (42, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 17.1, 81, 8.8, 3.6, 'Nord-Ouest', 'Brouillard', 1046.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (43, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 14.2, 32, 1.2, 14.3, 'Ouest', 'Pluvieux', 995.7, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (44, TO_DATE('2024-07-08', 'YYYY-MM-DD'), 10.4, 34, 16.2, 5.9, 'Sud-Ouest', 'Pluvieux', 985.0, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (45, TO_DATE('2023-07-06', 'YYYY-MM-DD'), 15.8, 93, 2.9, 8.5, 'Nord', 'Neigeux', 1013.7, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (46, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 6.0, 62, 5.3, 5.6, 'Nord-Ouest', 'Pluvieux', 1014.8, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (47, TO_DATE('2023-07-27', 'YYYY-MM-DD'), 19.6, 50, 10.4, 12.3, 'Sud-Est', 'Brouillard', 1049.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (48, TO_DATE('2024-07-27', 'YYYY-MM-DD'), 23.7, 89, 3.0, 7.6, 'Est', 'Ensoleillé', 1003.7, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (49, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 0.9, 37, 10.4, 2.6, 'Nord-Ouest', 'Partiellement nuageux', 1034.8, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (50, TO_DATE('2024-01-21', 'YYYY-MM-DD'), 13.9, 59, 5.8, 9.9, 'Nord-Ouest', 'Neigeux', 1026.1, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (51, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 39.1, 38, 14.4, 14.6, 'Nord-Est', 'Nuageux', 1006.2, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (52, TO_DATE('2023-06-12', 'YYYY-MM-DD'), 37.5, 39, 14.0, 13.1, 'Sud', 'Ensoleillé', 1004.2, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (53, TO_DATE('2024-02-04', 'YYYY-MM-DD'), 6.7, 48, 17.3, 2.1, 'Nord-Est', 'Pluvieux', 1043.1, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (54, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 13.7, 70, 16.1, 9.8, 'Sud', 'Ensoleillé', 1041.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (55, TO_DATE('2023-01-07', 'YYYY-MM-DD'), 26.9, 71, 15.4, 10.2, 'Sud-Est', 'Partiellement nuageux', 1034.3, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (56, TO_DATE('2023-05-25', 'YYYY-MM-DD'), -9.0, 73, 14.4, 15.0, 'Nord', 'Orageux', 1014.5, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (57, TO_DATE('2024-08-22', 'YYYY-MM-DD'), 36.1, 50, 10.4, 4.7, 'Sud', 'Neigeux', 1047.2, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (58, TO_DATE('2023-08-29', 'YYYY-MM-DD'), 25.9, 38, 11.8, 13.2, 'Nord', 'Partiellement nuageux', 983.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (59, TO_DATE('2024-08-04', 'YYYY-MM-DD'), 8.0, 35, 9.9, 12.5, 'Ouest', 'Nuageux', 1029.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (60, TO_DATE('2024-06-16', 'YYYY-MM-DD'), -5.4, 32, 10.7, 13.7, 'Ouest', 'Ensoleillé', 1045.0, 0);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (61, TO_DATE('2024-07-04', 'YYYY-MM-DD'), 18.5, 82, 0.4, 13.8, 'Nord-Est', 'Orageux', 1014.0, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (62, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 16.0, 56, 18.2, 7.9, 'Sud-Ouest', 'Orageux', 984.9, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (63, TO_DATE('2023-08-13', 'YYYY-MM-DD'), 13.8, 57, 3.0, 2.2, 'Ouest', 'Brouillard', 1014.9, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (64, TO_DATE('2023-05-31', 'YYYY-MM-DD'), 30.7, 54, 14.8, 9.6, 'Nord-Ouest', 'Partiellement nuageux', 1048.7, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (65, TO_DATE('2024-08-10', 'YYYY-MM-DD'), 23.2, 56, 10.4, 12.2, 'Sud-Est', 'Nuageux', 1001.6, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (66, TO_DATE('2023-03-08', 'YYYY-MM-DD'), -9.6, 54, 17.9, 9.3, 'Sud-Ouest', 'Pluvieux', 993.4, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (67, TO_DATE('2024-01-29', 'YYYY-MM-DD'), 29.3, 73, 14.8, 14.3, 'Est', 'Orageux', 1021.4, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (68, TO_DATE('2023-08-04', 'YYYY-MM-DD'), 4.3, 62, 4.3, 8.2, 'Ouest', 'Nuageux', 1045.0, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (69, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 11.2, 30, 18.4, 10.6, 'Sud', 'Brouillard', 997.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (70, TO_DATE('2024-05-18', 'YYYY-MM-DD'), 6.0, 37, 4.0, 4.0, 'Sud-Est', 'Pluvieux', 1004.6, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (71, TO_DATE('2023-10-29', 'YYYY-MM-DD'), 20.4, 44, 8.4, 3.2, 'Sud-Est', 'Neigeux', 992.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (72, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 27.2, 34, 20.0, 2.8, 'Sud-Est', 'Ensoleillé', 1027.9, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (73, TO_DATE('2024-06-25', 'YYYY-MM-DD'), -5.4, 52, 17.1, 4.7, 'Sud', 'Orageux', 1038.9, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (74, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 9.7, 73, 16.6, 1.9, 'Ouest', 'Ensoleillé', 1019.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (75, TO_DATE('2023-01-11', 'YYYY-MM-DD'), 36.7, 57, 16.6, 11.5, 'Sud-Ouest', 'Partiellement nuageux', 992.9, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (76, TO_DATE('2023-07-13', 'YYYY-MM-DD'), 12.5, 38, 19.9, 12.5, 'Sud-Est', 'Nuageux', 1044.5, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (77, TO_DATE('2023-06-09', 'YYYY-MM-DD'), -8.7, 57, 13.2, 11.3, 'Nord', 'Partiellement nuageux', 1006.0, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (78, TO_DATE('2023-08-28', 'YYYY-MM-DD'), -6.8, 45, 10.9, 12.8, 'Nord', 'Nuageux', 997.3, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (79, TO_DATE('2023-01-25', 'YYYY-MM-DD'), 15.8, 90, 12.8, 11.7, 'Nord', 'Neigeux', 1012.6, 0);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (80, TO_DATE('2023-06-24', 'YYYY-MM-DD'), -2.2, 54, 18.1, 14.2, 'Ouest', 'Neigeux', 1000.8, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (81, TO_DATE('2023-04-15', 'YYYY-MM-DD'), 3.0, 91, 0.9, 6.6, 'Sud-Ouest', 'Pluvieux', 1008.0, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (82, TO_DATE('2024-05-03', 'YYYY-MM-DD'), -3.8, 67, 16.1, 5.5, 'Est', 'Brouillard', 1017.5, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (83, TO_DATE('2023-01-12', 'YYYY-MM-DD'), 22.0, 90, 18.9, 4.9, 'Nord', 'Ensoleillé', 1044.5, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (84, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 29.9, 36, 0.4, 0.9, 'Sud-Ouest', 'Ensoleillé', 1049.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (85, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 21.0, 94, 13.0, 14.2, 'Nord-Ouest', 'Nuageux', 981.5, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (86, TO_DATE('2024-08-06', 'YYYY-MM-DD'), 13.0, 61, 12.7, 9.2, 'Nord-Ouest', 'Partiellement nuageux', 1021.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (87, TO_DATE('2023-06-06', 'YYYY-MM-DD'), 35.1, 83, 18.6, 8.6, 'Sud', 'Orageux', 986.6, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (88, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 13.7, 86, 5.6, 3.8, 'Ouest', 'Pluvieux', 1017.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (89, TO_DATE('2024-02-02', 'YYYY-MM-DD'), 20.3, 100, 9.0, 12.8, 'Nord-Est', 'Pluvieux', 1005.7, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (90, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 4.4, 67, 16.8, 6.3, 'Ouest', 'Neigeux', 1033.5, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (91, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 4.7, 98, 11.2, 1.6, 'Ouest', 'Nuageux', 1031.2, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (92, TO_DATE('2023-03-19', 'YYYY-MM-DD'), 28.2, 64, 7.7, 11.6, 'Ouest', 'Neigeux', 1048.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (93, TO_DATE('2024-09-19', 'YYYY-MM-DD'), -1.2, 36, 3.1, 13.9, 'Nord-Ouest', 'Partiellement nuageux', 1037.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (94, TO_DATE('2023-02-05', 'YYYY-MM-DD'), 4.9, 72, 13.8, 2.7, 'Nord-Est', 'Brouillard', 1043.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (95, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 30.6, 77, 1.3, 11.0, 'Nord', 'Orageux', 985.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (96, TO_DATE('2024-09-26', 'YYYY-MM-DD'), 25.8, 85, 18.6, 8.8, 'Nord', 'Nuageux', 1010.2, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (97, TO_DATE('2023-11-17', 'YYYY-MM-DD'), -4.6, 98, 6.2, 1.3, 'Sud', 'Ensoleillé', 1028.8, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (98, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 1.9, 34, 14.0, 5.2, 'Ouest', 'Ensoleillé', 986.6, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (99, TO_DATE('2023-08-26', 'YYYY-MM-DD'), 22.3, 75, 8.2, 6.6, 'Sud', 'Neigeux', 1007.3, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (100, TO_DATE('2023-10-12', 'YYYY-MM-DD'), 21.6, 51, 9.0, 2.9, 'Est', 'Brouillard', 1049.9, 8);

INSERT INTO Dates(ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(1, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 14, 11, 2024, 'semaine', 4, 'jeudi', 46, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(2, TO_DATE('2024-11-13', 'YYYY-MM-DD'), 13, 11, 2024, 'semaine', 4, 'mercredi', 46, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(3, TO_DATE('2024-11-12', 'YYYY-MM-DD'), 12, 11, 2024, 'semaine', 4, 'mardi', 46, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(4, TO_DATE('2024-11-11', 'YYYY-MM-DD'), 11, 11, 2024, 'ferie', 4, 'lundi', 46, 0, 1, 'Jour férié - Armistice');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(5, TO_DATE('2024-11-10', 'YYYY-MM-DD'), 10, 11, 2024, 'weekend', 4, 'dimanche', 45, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(6, TO_DATE('2024-11-09', 'YYYY-MM-DD'), 9, 11, 2024, 'weekend', 4, 'samedi', 45, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(7, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 8, 11, 2024, 'semaine', 4, 'vendredi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(8, TO_DATE('2024-11-07', 'YYYY-MM-DD'), 7, 11, 2024, 'semaine', 4, 'jeudi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(9, TO_DATE('2024-11-06', 'YYYY-MM-DD'), 6, 11, 2024, 'semaine', 4, 'mercredi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(10, TO_DATE('2024-11-05', 'YYYY-MM-DD'), 5, 11, 2024, 'semaine', 4, 'mardi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(11, TO_DATE('2024-11-04', 'YYYY-MM-DD'), 4, 11, 2024, 'semaine', 4, 'lundi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates(ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(12, TO_DATE('2024-11-03', 'YYYY-MM-DD'), 3, 11, 2024, 'weekend', 4, 'dimanche', 44, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(13, TO_DATE('2024-11-02', 'YYYY-MM-DD'), 2, 11, 2024, 'weekend', 4, 'samedi', 44, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(14, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 1, 11, 2024, 'ferie', 4, 'vendredi', 44, 0, 1, 'Jour férié - Toussaint');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(15, TO_DATE('2024-10-31', 'YYYY-MM-DD'), 31, 10, 2024, 'semaine', 4, 'jeudi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(16, TO_DATE('2024-10-30', 'YYYY-MM-DD'), 30, 10, 2024, 'semaine', 4, 'mercredi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(17, TO_DATE('2024-10-29', 'YYYY-MM-DD'), 29, 10, 2024, 'semaine', 4, 'mardi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(18, TO_DATE('2024-10-28', 'YYYY-MM-DD'), 28, 10, 2024, 'semaine', 4, 'lundi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(19, TO_DATE('2024-10-27', 'YYYY-MM-DD'), 27, 10, 2024, 'weekend', 4, 'dimanche', 43, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(20, TO_DATE('2024-10-26', 'YYYY-MM-DD'), 26, 10, 2024, 'weekend', 4, 'samedi', 43, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(21, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 25, 10, 2024, 'semaine', 4, 'vendredi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(22, TO_DATE('2024-10-24', 'YYYY-MM-DD'), 24, 10, 2024, 'semaine', 4, 'jeudi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(23, TO_DATE('2024-10-23', 'YYYY-MM-DD'), 23, 10, 2024, 'semaine', 4, 'mercredi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(24, TO_DATE('2024-10-22', 'YYYY-MM-DD'), 22, 10, 2024, 'semaine', 4, 'mardi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(25, TO_DATE('2024-10-21', 'YYYY-MM-DD'), 21, 10, 2024, 'semaine', 4, 'lundi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(26, TO_DATE('2024-10-20', 'YYYY-MM-DD'), 20, 10, 2024, 'weekend', 4, 'dimanche', 42, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(27, TO_DATE('2024-10-19', 'YYYY-MM-DD'), 19, 10, 2024, 'weekend', 4, 'samedi', 42, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(28, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 18, 10, 2024, 'semaine', 4, 'vendredi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(29, TO_DATE('2024-10-17', 'YYYY-MM-DD'), 17, 10, 2024, 'semaine', 4, 'jeudi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(30, TO_DATE('2024-10-16', 'YYYY-MM-DD'), 16, 10, 2024, 'semaine', 4, 'mercredi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(31, TO_DATE('2024-10-15', 'YYYY-MM-DD'), 15, 10, 2024, 'semaine', 4, 'mardi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(32, TO_DATE('2024-10-14', 'YYYY-MM-DD'), 14, 10, 2024, 'semaine', 4, 'lundi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(33, TO_DATE('2024-10-13', 'YYYY-MM-DD'), 13, 10, 2024, 'weekend', 4, 'dimanche', 41, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(34, TO_DATE('2024-10-12', 'YYYY-MM-DD'), 12, 10, 2024, 'weekend', 4, 'samedi', 41, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(35, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 11, 10, 2024, 'semaine', 4, 'vendredi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(36, TO_DATE('2024-10-10', 'YYYY-MM-DD'), 10, 10, 2024, 'semaine', 4, 'jeudi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(37, TO_DATE('2024-10-09', 'YYYY-MM-DD'), 9, 10, 2024, 'semaine', 4, 'mercredi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(38, TO_DATE('2024-10-08', 'YYYY-MM-DD'), 8, 10, 2024, 'semaine', 4, 'mardi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(39, TO_DATE('2024-10-07', 'YYYY-MM-DD'), 7, 10, 2024, 'semaine', 4, 'lundi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(40, TO_DATE('2024-10-06', 'YYYY-MM-DD'), 6, 10, 2024, 'weekend', 4, 'dimanche', 40, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(41, TO_DATE('2024-10-05', 'YYYY-MM-DD'), 5, 10, 2024, 'weekend', 4, 'samedi', 40, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(42, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 4, 10, 2024, 'semaine', 4, 'vendredi', 40, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(43, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 3, 10, 2024, 'semaine', 4, 'jeudi', 40, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(44, TO_DATE('2024-10-02', 'YYYY-MM-DD'), 2, 10, 2024, 'semaine', 4, 'mercredi', 40, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(45, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 1, 10, 2024, 'semaine', 4, 'mardi', 40, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(46, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 30, 9, 2024, 'semaine', 4, 'lundi', 39, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(47, TO_DATE('2024-09-29', 'YYYY-MM-DD'), 29, 9, 2024, 'weekend', 4, 'dimanche', 38, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(48, TO_DATE('2024-09-28', 'YYYY-MM-DD'), 28, 9, 2024, 'weekend', 4, 'samedi', 38, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(49, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 27, 9, 2024, 'semaine', 4, 'vendredi', 38, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(50, TO_DATE('2024-09-26', 'YYYY-MM-DD'), 26, 9, 2024, 'semaine', 4, 'jeudi', 38, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(51, TO_DATE('2024-09-25', 'YYYY-MM-DD'), 25, 9, 2024, 'semaine', 4, 'mercredi', 38, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(52, TO_DATE('2024-09-24', 'YYYY-MM-DD'), 24, 9, 2024, 'semaine', 4, 'mardi', 38, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(53, TO_DATE('2024-09-23', 'YYYY-MM-DD'), 23, 9, 2024, 'semaine', 4, 'lundi', 38, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(54, TO_DATE('2024-09-22', 'YYYY-MM-DD'), 22, 9, 2024, 'weekend', 4, 'dimanche', 37, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(55, TO_DATE('2024-09-21', 'YYYY-MM-DD'), 21, 9, 2024, 'weekend', 4, 'samedi', 37, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(56, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 20, 9, 2024, 'semaine', 4, 'vendredi', 37, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(57, TO_DATE('2024-09-19', 'YYYY-MM-DD'), 19, 9, 2024, 'semaine', 4, 'jeudi', 37, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(58, TO_DATE('2024-09-18', 'YYYY-MM-DD'), 18, 9, 2024, 'semaine', 4, 'mercredi', 37, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(59, TO_DATE('2024-09-17', 'YYYY-MM-DD'), 17, 9, 2024, 'semaine', 4, 'mardi', 37, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(60, TO_DATE('2024-09-16', 'YYYY-MM-DD'), 16, 9, 2024, 'semaine', 4, 'lundi', 37, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(61, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 15, 9, 2024, 'weekend', 4, 'dimanche', 36, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(62, TO_DATE('2024-09-14', 'YYYY-MM-DD'), 14, 9, 2024, 'weekend', 4, 'samedi', 36, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(63, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 13, 9, 2024, 'semaine', 4, 'vendredi', 36, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(64, TO_DATE('2024-09-12', 'YYYY-MM-DD'), 12, 9, 2024, 'semaine', 4, 'jeudi', 36, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(65, TO_DATE('2024-09-11', 'YYYY-MM-DD'), 11, 9, 2024, 'semaine', 4, 'mercredi', 36, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(66, TO_DATE('2024-09-10', 'YYYY-MM-DD'), 10, 9, 2024, 'semaine', 4, 'mardi', 36, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(67, TO_DATE('2024-09-09', 'YYYY-MM-DD'), 9, 9, 2024, 'semaine', 4, 'lundi', 36, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(68, TO_DATE('2024-09-08', 'YYYY-MM-DD'), 8, 9, 2024, 'weekend', 4, 'dimanche', 35, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(69, TO_DATE('2024-09-07', 'YYYY-MM-DD'), 7, 9, 2024, 'weekend', 4, 'samedi', 35, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(70, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 6, 9, 2024, 'semaine', 4, 'vendredi', 35, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(71, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 5, 9, 2024, 'semaine', 4, 'jeudi', 35, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(72, TO_DATE('2024-09-04', 'YYYY-MM-DD'), 4, 9, 2024, 'semaine', 4, 'mercredi', 35, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(73, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 3, 9, 2024, 'semaine', 4, 'mardi', 35, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(74, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 2, 9, 2024, 'ferie', 4, 'lundi', 35, 0, 1, 'Jour férié - Fête du Travail');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(75, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 1, 9, 2024, 'weekend', 4, 'dimanche', 34, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(76, TO_DATE('2024-08-31', 'YYYY-MM-DD'), 31, 8, 2024, 'weekend', 4, 'samedi', 34, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(77, TO_DATE('2024-08-30', 'YYYY-MM-DD'), 30, 8, 2024, 'semaine', 4, 'vendredi', 34, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(78, TO_DATE('2024-08-29', 'YYYY-MM-DD'), 29, 8, 2024, 'semaine', 4, 'jeudi', 34, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(79, TO_DATE('2024-08-28', 'YYYY-MM-DD'), 28, 8, 2024, 'semaine', 4, 'mercredi', 34, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(80, TO_DATE('2024-08-27', 'YYYY-MM-DD'), 27, 8, 2024, 'semaine', 4, 'mardi', 34, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(81, TO_DATE('2024-08-26', 'YYYY-MM-DD'), 26, 8, 2024, 'semaine', 4, 'lundi', 34, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(82, TO_DATE('2024-08-25', 'YYYY-MM-DD'), 25, 8, 2024, 'weekend', 4, 'dimanche', 33, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(83, TO_DATE('2024-08-24', 'YYYY-MM-DD'), 24, 8, 2024, 'weekend', 4, 'samedi', 33, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(84, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 23, 8, 2024, 'semaine', 4, 'vendredi', 33, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(85, TO_DATE('2024-08-22', 'YYYY-MM-DD'), 22, 8, 2024, 'semaine', 4, 'jeudi', 33, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(86, TO_DATE('2024-08-21', 'YYYY-MM-DD'), 21, 8, 2024, 'semaine', 4, 'mercredi', 33, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(87, TO_DATE('2024-08-20', 'YYYY-MM-DD'), 20, 8, 2024, 'semaine', 4, 'mardi', 33, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(88, TO_DATE('2024-08-19', 'YYYY-MM-DD'), 19, 8, 2024, 'semaine', 4, 'lundi', 33, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(89, TO_DATE('2024-08-18', 'YYYY-MM-DD'), 18, 8, 2024, 'weekend', 4, 'dimanche', 32, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(90, TO_DATE('2024-08-17', 'YYYY-MM-DD'), 17, 8, 2024, 'weekend', 4, 'samedi', 32, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(91, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 16, 8, 2024, 'semaine', 4, 'vendredi', 32, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(92, TO_DATE('2024-08-15', 'YYYY-MM-DD'), 15, 8, 2024, 'ferie', 3, 'jeudi', 32, 0, 1, 'Jour férié - Assomption');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(93, TO_DATE('2024-08-14', 'YYYY-MM-DD'), 14, 8, 2024, 'semaine', 3, 'mercredi', 32, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(94, TO_DATE('2024-08-13', 'YYYY-MM-DD'), 13, 8, 2024, 'semaine', 3, 'mardi', 32, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(95, TO_DATE('2024-08-12', 'YYYY-MM-DD'), 12, 8, 2024, 'semaine', 3, 'lundi', 32, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(96, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 11, 8, 2024, 'weekend', 3, 'dimanche', 31, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(97, TO_DATE('2024-08-10', 'YYYY-MM-DD'), 10, 8, 2024, 'weekend', 3, 'samedi', 31, 1, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(98, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 9, 8, 2024, 'semaine', 3, 'vendredi', 31, 0, 0, 'Aucune particularité');

INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(99, TO_DATE('2024-08-08', 'YYYY-MM-DD'), 8, 8, 2024, 'semaine', 3, 'jeudi', 31, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(100, TO_DATE('2024-08-07', 'YYYY-MM-DD'), 7, 8, 2024, 'semaine', 3, 'mercredi', 31, 0, 0, 'Aucune particularité');

