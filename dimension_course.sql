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
(16, 'Lee', 'Min', 33, 'H', 'Premium', 'Coréen', 'min.lee@example.com', '0123456804', 90);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(17, 'Ivanov', 'Alexei', 40, 'H', 'VIP', 'Russe', 'alexei.ivanov@example.com', '0123456805', 125);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(18, 'Khan', 'Fatima', 29, 'F', 'Standard', 'Ourdou', 'fatima.khan@example.com', '0123456806', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(19, 'Chen', 'Wei', 26, 'H', 'Standard', 'Chinois', 'wei.chen@example.com', '0123456807', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(20, 'Garcia', 'Luis', 35, 'H', 'Premium', 'Espagnol', 'luis.garcia@example.com', '0123456808', 70);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(21, 'Ali', 'Zahra', 30, 'F', 'Standard', 'Arabe', 'zahra.ali@example.com', '0123456809', 60);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(22, 'Patel', 'Raj', 28, 'H', 'Premium', 'Hindi', 'raj.patel@example.com', '0123456810', 75);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(23, 'Nguyen', 'Thao', 24, 'F', 'Standard', 'Vietnamien', 'thao.nguyen@example.com', '0123456811', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(24, 'Taylor', 'James', 47, 'H', 'VIP', 'Anglais', 'james.taylor@example.com', '0123456812', 140);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(25, 'Kowalski', 'Anna', 33, 'F', 'Premium', 'Polonais', 'anna.kowalski@example.com', '0123456813', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(26, 'Hansen', 'Ole', 51, 'H', 'VIP', 'Danois', 'ole.hansen@example.com', '0123456814', 130);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(27, 'Dubois', 'Chloe', 22, 'F', 'Standard', 'Français', 'chloe.dubois@example.com', '0123456815', 35);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(28, 'Smith', 'Robert', 46, 'H', 'Premium', 'Anglais', 'robert.smith@example.com', '0123456816', 100);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(29, 'Nakamura', 'Aiko', 39, 'F', 'VIP', 'Japonais', 'aiko.nakamura@example.com', '0123456817', 120);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(30, 'Fernandez', 'Juan', 31, 'H', 'Standard', 'Espagnol', 'juan.fernandez@example.com', '0123456818', 55);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(31, 'Lemoine', 'Claire', 45, 'F', 'Premium', 'Français', 'claire.lemoine@example.com', '0123456819', 90);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(32, 'Tan', 'Li', 26, 'H', 'Standard', 'Chinois', 'li.tan@example.com', '0123456820', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(33, 'Mohamed', 'Aisha', 35, 'F', 'VIP', 'Arabe', 'aisha.mohamed@example.com', '0123456821', 115);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(34, 'Rossi', 'Marco', 29, 'H', 'Standard', 'Italien', 'marco.rossi@example.com', '0123456822', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(35, 'Jensen', 'Sophie', 38, 'F', 'Premium', 'Danois', 'sophie.jensen@example.com', '0123456823', 80);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(36, 'Martinez', 'Jose', 44, 'H', 'VIP', 'Espagnol', 'jose.martinez@example.com', '0123456824', 130);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(37, 'Meier', 'Lena', 41, 'F', 'Premium', 'Allemand', 'lena.meier@example.com', '0123456825', 95);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(38, 'Ahmed', 'Omar', 34, 'H', 'Standard', 'Arabe', 'omar.ahmed@example.com', '0123456826', 65);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(39, 'Fischer', 'Erik', 52, 'H', 'VIP', 'Allemand', 'erik.fischer@example.com', '0123456827', 145);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(40, 'Zhang', 'Yue', 25, 'F', 'Standard', 'Chinois', 'yue.zhang@example.com', '0123456828', 30);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(41, 'Hernandez', 'Miguel', 37, 'H', 'Premium', 'Espagnol', 'miguel.hernandez@example.com', '0123456829', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(42, 'Wilson', 'Sophia', 28, 'F', 'Standard', 'Anglais', 'sophia.wilson@example.com', '0123456830', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(43, 'Liu', 'Hao', 33, 'H', 'VIP', 'Chinois', 'hao.liu@example.com', '0123456831', 125);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(44, 'Bakr', 'Layla', 41, 'F', 'Premium', 'Arabe', 'layla.bakr@example.com', '0123456832', 90);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(45, 'Novak', 'Ivan', 50, 'H', 'VIP', 'Croate', 'ivan.novak@example.com', '0123456833', 140);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(46, 'Santos', 'Carla', 30, 'F', 'Standard', 'Portugais', 'carla.santos@example.com', '0123456834', 55);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(47, 'Kaur', 'Simran', 26, 'F', 'Standard', 'Panjabi', 'simran.kaur@example.com', '0123456835', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(48, 'Jones', 'Ethan', 34, 'H', 'Premium', 'Anglais', 'ethan.jones@example.com', '0123456836', 80);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(49, 'Bauer', 'Klaus', 48, 'H', 'VIP', 'Allemand', 'klaus.bauer@example.com', '0123456837', 135);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(50, 'Singh', 'Arjun', 27, 'H', 'Standard', 'Hindi', 'arjun.singh@example.com', '0123456838', 45);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(51, 'Carter', 'Emily', 29, 'F', 'Standard', 'Anglais', 'emily.carter@example.com', '0123456839', 60);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(52, 'Moreau', 'Lucas', 35, 'H', 'Premium', 'Français', 'lucas.moreau@example.com', '0123456840', 75);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(53, 'Tanaka', 'Sakura', 40, 'F', 'VIP', 'Japonais', 'sakura.tanaka@example.com', '0123456841', 120);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(54, 'Zimmer', 'Marta', 46, 'F', 'Premium', 'Allemand', 'marta.zimmer@example.com', '0123456842', 95);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(55, 'OConnor', 'Sean', 32, 'H', 'Standard', 'Anglais', 'sean.oconnor@example.com', '0123456843', 65);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(56, 'Martinez', 'Isabel', 37, 'F', 'Standard', 'Espagnol', 'isabel.martinez@example.com', '0123456844', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(57, 'Kim', 'Eun', 31, 'F', 'Premium', 'Coréen', 'eun.kim@example.com', '0123456845', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(58, 'Gupta', 'Vikram', 44, 'H', 'VIP', 'Hindi', 'vikram.gupta@example.com', '0123456846', 130);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(59, 'Yilmaz', 'Elif', 39, 'F', 'Premium', 'Turc', 'elif.yilmaz@example.com', '0123456847', 100);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(60, 'Miller', 'Jack', 42, 'H', 'Standard', 'Anglais', 'jack.miller@example.com', '0123456848', 60);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(61, 'Ahmed', 'Nora', 25, 'F', 'Standard', 'Arabe', 'nora.ahmed@example.com', '0123456849', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(62, 'Rossi', 'Giulia', 31, 'F', 'Premium', 'Italien', 'giulia.rossi@example.com', '0123456850', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(63, 'Silva', 'Joao', 29, 'H', 'VIP', 'Portugais', 'joao.silva@example.com', '0123456851', 115);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(64, 'Li', 'Feng', 27, 'H', 'Standard', 'Chinois', 'feng.li@example.com', '0123456852', 45);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(65, 'Brown', 'Jessica', 36, 'F', 'Standard', 'Anglais', 'jessica.brown@example.com', '0123456853', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(66, 'Ivanov', 'Olga', 34, 'F', 'Premium', 'Russe', 'olga.ivanov@example.com', '0123456854', 75);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(67, 'Garcia', 'Alejandro', 49, 'H', 'VIP', 'Espagnol', 'alejandro.garcia@example.com', '0123456855', 140);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(68, 'Chowdhury', 'Ayesha', 28, 'F', 'Standard', 'Bengali', 'ayesha.chowdhury@example.com', '0123456856', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(69, 'Okafor', 'Emeka', 35, 'H', 'Premium', 'Igbo', 'emeka.okafor@example.com', '0123456857', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(70, 'Williams', 'Chloe', 27, 'F', 'Standard', 'Anglais', 'chloe.williams@example.com', '0123456858', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(71, 'Duarte', 'Manuel', 41, 'H', 'VIP', 'Portugais', 'manuel.duarte@example.com', '0123456859', 120);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(72, 'Zhang', 'Wei', 33, 'H', 'Standard', 'Chinois', 'wei.zhang@example.com', '0123456860', 60);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(73, 'Hassan', 'Aliya', 30, 'F', 'Standard', 'Arabe', 'aliya.hassan@example.com', '0123456861', 45);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(74, 'Kowalski', 'Tomasz', 48, 'H', 'Premium', 'Polonais', 'tomasz.kowalski@example.com', '0123456862', 95);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(75, 'Petrov', 'Dimitri', 52, 'H', 'VIP', 'Russe', 'dimitri.petrov@example.com', '0123456863', 145);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(76, 'Khan', 'Aamir', 29, 'H', 'Standard', 'Ourdou', 'aamir.khan@example.com', '0123456864', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(77, 'Nguyen', 'Thanh', 37, 'H', 'Premium', 'Vietnamien', 'thanh.nguyen@example.com', '0123456865', 80);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(78, 'Meier', 'Anna', 31, 'F', 'Standard', 'Allemand', 'anna.meier@example.com', '0123456866', 55);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(79, 'Sharma', 'Priya', 27, 'F', 'Standard', 'Hindi', 'priya.sharma@example.com', '0123456867', 45);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(80, 'Rodriguez', 'Maria', 34, 'F', 'Premium', 'Espagnol', 'maria.rodriguez@example.com', '0123456868', 90);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(81, 'Kim', 'Jiwoo', 39, 'F', 'VIP', 'Coréen', 'jiwoo.kim@example.com', '0123456869', 125);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(82, 'Davies', 'Oliver', 28, 'H', 'Standard', 'Anglais', 'oliver.davies@example.com', '0123456870', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(83, 'Singh', 'Rohit', 32, 'H', 'Premium', 'Hindi', 'rohit.singh@example.com', '0123456871', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(84, 'Nakamura', 'Haruto', 35, 'H', 'Standard', 'Japonais', 'haruto.nakamura@example.com', '0123456872', 55);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(85, 'Santos', 'Luiza', 44, 'F', 'VIP', 'Portugais', 'luiza.santos@example.com', '0123456873', 135);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(86, 'Ahmed', 'Kareem', 38, 'H', 'Premium', 'Arabe', 'kareem.ahmed@example.com', '0123456874', 100);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(87, 'Francois', 'Julien', 26, 'H', 'Standard', 'Français', 'julien.francois@example.com', '0123456875', 45);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(88, 'Carter', 'Ella', 29, 'F', 'Standard', 'Anglais', 'ella.carter@example.com', '0123456876', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(89, 'Garcia', 'Jose', 47, 'H', 'VIP', 'Espagnol', 'jose.garcia@example.com', '0123456877', 140);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(90, 'Mendes', 'Sofia', 36, 'F', 'Premium', 'Portugais', 'sofia.mendes@example.com', '0123456878', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(91, 'Johnson', 'James', 33, 'H', 'Standard', 'Anglais', 'james.johnson@example.com', '0123456879', 55);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(92, 'Boucher', 'Claire', 38, 'F', 'Standard', 'Français', 'claire.boucher@example.com', '0123456880', 60);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(93, 'Fischer', 'Lukas', 50, 'H', 'VIP', 'Allemand', 'lukas.fischer@example.com', '0123456881', 150);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(94, 'Kobayashi', 'Sakura', 31, 'F', 'Standard', 'Japonais', 'sakura.kobayashi@example.com', '0123456882', 45);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(95, 'Hassan', 'Yasir', 42, 'H', 'Premium', 'Arabe', 'yasir.hassan@example.com', '0123456883', 95);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(96, 'Borges', 'Miguel', 37, 'H', 'Standard', 'Portugais', 'miguel.borges@example.com', '0123456884', 60);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(97, 'Dupont', 'Marie', 25, 'F', 'Standard', 'Français', 'marie.dupont@example.com', '0123456885', 40);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(98, 'Smith', 'John', 34, 'H', 'Premium', 'Anglais', 'john.smith@example.com', '0123456886', 85);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(99, 'Chen', 'Mei', 29, 'F', 'Standard', 'Chinois', 'mei.chen@example.com', '0123456887', 50);
INSERT INTO Client (ID_Client, Nom, Prenom, Age, Sexe, Type_Client, Langue_Preferee, Email, Telephone, Point_gagnee) VALUES
(100, 'Garcia', 'Carlos', 41, 'H', 'VIP', 'Espagnol', 'carlos.garcia@example.com', '0123456888', 120);s

INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (1, 'Pierre', 'Diane', TO_DATE('2021-08-11', 'yyyy-mm-dd'), '79975772438', 'B', '+33 (0)4 9', 'sylvie83@example.org', 'Inactif', 'Marseille');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (2, 'Dumas', 'Alice', TO_DATE('2021-02-22', 'yyyy-mm-dd'), '89885694824', 'B', '+33 4 79 0', 'alice63@example.org', 'Inactif', 'Paris');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (3, 'Legros', 'Tristan', TO_DATE('2018-02-09', 'yyyy-mm-dd'), '27465000916', 'C', '06 37 80 8', 'lucepereira@example.net', 'Actif', 'Nantes');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (4, 'Bailly', 'Nathalie', TO_DATE('2022-03-01', 'yyyy-mm-dd'), '95304430232', 'D', '+33 3 86 1', 'manon38@example.com', 'Actif', 'Lille');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (5, 'Dupont', 'Aurélie', TO_DATE('2019-07-15', 'yyyy-mm-dd'), '64784597232', 'B', '+33 6 54 1', 'aurelie.dupont@example.org', 'Actif', 'Lyon');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (6, 'Martin', 'Charles', TO_DATE('2020-01-20', 'yyyy-mm-dd'), '89756237894', 'C', '+33 7 62 8', 'charles.martin@example.net', 'Inactif', 'Bordeaux');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (7, 'Morel', 'Jeanne', TO_DATE('2023-04-11', 'yyyy-mm-dd'), '32478003456', 'D', '+33 4 55 9', 'jeanne.morel@example.com', 'Actif', 'Toulouse');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (8, 'Simon', 'Paul', TO_DATE('2017-09-18', 'yyyy-mm-dd'), '76948256743', 'B', '+33 3 41 2', 'paul.simon@example.org', 'Actif', 'Nice');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (9, 'Leclerc', 'Marie', TO_DATE('2022-11-05', 'yyyy-mm-dd'), '34578902134', 'C', '+33 5 37 8', 'marie.leclerc@example.net', 'Actif', 'Strasbourg');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (10, 'Durand', 'Lucas', TO_DATE('2021-06-23', 'yyyy-mm-dd'), '45698123567', 'B', '+33 6 39 7', 'lucas.durand@example.org', 'Actif', 'Marseille');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (11, 'Rousseau', 'Alice', TO_DATE('2018-08-14', 'yyyy-mm-dd'), '34781234567', 'B', '+33 6 12 3', 'alice.rousseau@example.com', 'Actif', 'Lille');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (12, 'Fournier', 'Éric', TO_DATE('2020-03-10', 'yyyy-mm-dd'), '23456789234', 'C', '+33 7 14 6', 'eric.fournier@example.net', 'Actif', 'Nantes');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (13, 'Girard', 'Lucie', TO_DATE('2019-12-05', 'yyyy-mm-dd'), '76543219876', 'D', '+33 5 62 7', 'lucie.girard@example.org', 'Actif', 'Rennes');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (14, 'Bonnet', 'Julien', TO_DATE('2021-02-25', 'yyyy-mm-dd'), '90871234656', 'B', '+33 3 45 9', 'julien.bonnet@example.com', 'Inactif', 'Toulon');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (15, 'Dupuis', 'Sophie', TO_DATE('2023-05-17', 'yyyy-mm-dd'), '23456789876', 'C', '+33 4 55 2', 'sophie.dupuis@example.org', 'Actif', 'Montpellier');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (16, 'Fontaine', 'Antoine', TO_DATE('2017-11-03', 'yyyy-mm-dd'), '45678901345', 'D', '+33 7 41 8', 'antoine.fontaine@example.net', 'Actif', 'Reims');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (17, 'Masson', 'Claire', TO_DATE('2022-04-29', 'yyyy-mm-dd'), '56789012345', 'B', '+33 6 59 1', 'claire.masson@example.org', 'Actif', 'Orléans');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (18, 'Garnier', 'Pauline', TO_DATE('2021-09-30', 'yyyy-mm-dd'), '78901234567', 'C', '+33 5 37 5', 'pauline.garnier@example.com', 'Inactif', 'Rouen');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (19, 'Chevalier', 'Hugo', TO_DATE('2020-10-15', 'yyyy-mm-dd'), '89012345678', 'D', '+33 3 65 4', 'hugo.chevalier@example.net', 'Actif', 'Dijon');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (20, 'Lemoine', 'Nathalie', TO_DATE('2023-01-12', 'yyyy-mm-dd'), '23456789012', 'B', '+33 7 48 9', 'nathalie.lemoine@example.org', 'Actif', 'Le Havre');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (21, 'Renaud', 'Mathieu', TO_DATE('2019-06-06', 'yyyy-mm-dd'), '56789012378', 'C', '+33 6 34 2', 'mathieu.renaud@example.com', 'Actif', 'Perpignan');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (22, 'Dufour', 'Camille', TO_DATE('2018-03-21', 'yyyy-mm-dd'), '67890123456', 'D', '+33 5 19 7', 'camille.dufour@example.net', 'Actif', 'Clermont-Ferrand');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (23, 'Benoit', 'Thomas', TO_DATE('2020-12-07', 'yyyy-mm-dd'), '78901234678', 'B', '+33 3 72 6', 'thomas.benoit@example.org', 'Inactif', 'Metz');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (24, 'Perrin', 'Elise', TO_DATE('2022-07-13', 'yyyy-mm-dd'), '89012345679', 'C', '+33 7 88 4', 'elise.perrin@example.com', 'Actif', 'Brest');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (25, 'Marchand', 'Valentin', TO_DATE('2021-05-28', 'yyyy-mm-dd'), '23456789099', 'D', '+33 6 92 3', 'valentin.marchand@example.net', 'Actif', 'Angers');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (26, 'Blanchard', 'Julie', TO_DATE('2017-09-14', 'yyyy-mm-dd'), '56789023412', 'B', '+33 6 11 22 33 44', 'julie.blanchard@example.com', 'Actif', 'Toulouse');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (27, 'Morin', 'Benoît', TO_DATE('2019-11-07', 'yyyy-mm-dd'), '67890123421', 'C', '+33 7 22 33 44 55', 'benoit.morin@example.net', 'Actif', 'Nice');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (28, 'Gauthier', 'Laetitia', TO_DATE('2020-05-12', 'yyyy-mm-dd'), '78901234532', 'D', '+33 5 33 44 55 66', 'laetitia.gauthier@example.org', 'Actif', 'Bordeaux');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (29, 'Poulain', 'Théo', TO_DATE('2021-10-20', 'yyyy-mm-dd'), '89012345643', 'B', '+33 4 44 55 66 77', 'theo.poulain@example.com', 'Inactif', 'Strasbourg');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (30, 'Lemoine', 'Amandine', TO_DATE('2022-06-15', 'yyyy-mm-dd'), '90123456754', 'C', '+33 3 55 66 77 88', 'amandine.lemoine@example.net', 'Actif', 'Grenoble');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (31, 'Leclerc', 'Damien', TO_DATE('2018-04-09', 'yyyy-mm-dd'), '01234567865', 'D', '+33 6 66 77 88 99', 'damien.leclerc@example.org', 'Actif', 'Toulouse');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (32, 'Charpentier', 'Émilie', TO_DATE('2019-03-28', 'yyyy-mm-dd'), '12345678976', 'B', '+33 7 77 88 99 00', 'emilie.charpentier@example.com', 'Actif', 'Nantes');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (33, 'Aubert', 'Romain', TO_DATE('2023-01-05', 'yyyy-mm-dd'), '23456789087', 'C', '+33 5 88 99 00 11', 'romain.aubert@example.net', 'Inactif', 'Lyon');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (34, 'Barbier', 'Sabrina', TO_DATE('2020-11-13', 'yyyy-mm-dd'), '34567890198', 'D', '+33 4 99 00 11 22', 'sabrina.barbier@example.org', 'Actif', 'Paris');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (35, 'Renard', 'Lucas', TO_DATE('2017-08-30', 'yyyy-mm-dd'), '45678901209', 'B', '+33 3 00 11 22 33', 'lucas.renard@example.com', 'Actif', 'Marseille');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (36, 'Schmitt', 'Nicolas', TO_DATE('2019-02-14', 'yyyy-mm-dd'), '56789012310', 'C', '+33 6 11 22 33 44', 'nicolas.schmitt@example.net', 'Inactif', 'Lille');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (37, 'Collet', 'Audrey', TO_DATE('2021-04-18', 'yyyy-mm-dd'), '67890123421', 'D', '+33 7 22 33 44 55', 'audrey.collet@example.org', 'Actif', 'Toulouse');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (38, 'Pires', 'Antoine', TO_DATE('2023-07-22', 'yyyy-mm-dd'), '78901234532', 'B', '+33 5 33 44 55 66', 'antoine.pires@example.com', 'Actif', 'Nice');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (39, 'Perrot', 'Clara', TO_DATE('2020-10-10', 'yyyy-mm-dd'), '89012345643', 'C', '+33 4 44 55 66 77', 'clara.perrot@example.net', 'Actif', 'Bordeaux');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale)
VALUES (40, 'Langlois', 'Victor', TO_DATE('2021-09-09', 'yyyy-mm-dd'), '90123456754', 'D', '+33 3 55 66 77 88', 'victor.langlois@example.org', 'Inactif', 'Strasbourg');



INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (1, '32, rue Blot', 'PerrinVille', '93936', 4129, 1, 'En_Attente', 'Fumée consentir valeur besoin calmer.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (2, '31, rue de Perrier', 'FaivreBourg', '58767', 3468, 1, 'En_Attente', 'Entrer fond dernier ailleurs rassurer vif.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (3, '9, chemin Lucie Pelletier', 'Besnard-sur-Moreau', '75902', 2947, 0, 'Annule', 'Être plusieurs gris il raconter raconter.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (4, '11, chemin Édith Bodin', 'Bertrand-sur-Perrot', '47575', 3948, 1, 'En_Attente', 'Connaissance secours presque éclater.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (5, '10, avenue de Boutin', 'Pages', '16440', 2189, 0, 'Prise en charge', 'Presser sou eaux surtout tapis.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (6, '107, boulevard de Marin', 'Joubert', '04581', 2003, 1, 'Annule', 'Également savoir porte bon toute année.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (7, '77, rue Thibault Lévêque', 'Sainte Dominique-la-Forêt', '45423', 2851, 0, 'En_Attente', 'Retirer prochain chacun prière entrer.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (8, 'boulevard de Bouchet', 'Moreau', '72217', 4460, 0, 'En_Attente', 'Table sombre fumée plan.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (9, '58, boulevard Bertin', 'Boulangernec', '77199', 3472, 0, 'En_Attente', 'Intention lire dimanche huit.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (10, '12, rue Lefebvre', 'MartinBourg', '72294', 4663, 0, 'En_Attente', 'Donner long rouge deviner odeur.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (11, '8, boulevard de Brun', 'Fernandes-sur-Mer', '31584', 1875, 1, 'En_Attente', 'Course bruit poésie ajouter penser révolution.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (12, '66, rue de Hoarau', 'Becker-les-Bains', '46846', 4708, 0, 'Prise en charge', 'Anglais le armer quatre point sang grâce.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (13, '3, rue Denise Couturier', 'BodinVille', '63769', 1095, 0, 'Annule', 'François joue nombre chaîne trésor froid.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (14, '474, boulevard Alexandrie Letellier', 'Denis', '60425', 2728, 1, 'Prise en charge', 'Sentiment douceur soin propos.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (15, '6, rue Brunet', 'Salmon', '61688', 2460, 1, 'Prise en charge', 'Porter fille parole ça créer entendre petit.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (16, '382, avenue Valérie Legendre', 'Besson', '89801', 1451, 0, 'En_Attente', 'Environ peuple bord.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (17, '34, boulevard Pruvost', 'Saint Louis-sur-Mer', '58959', 3938, 0, 'Annule', 'Pointe raison pouvoir fait front.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (18, '8, chemin Louise Albert', 'Bernardnec', '41863', 569, 0, 'Prise en charge', 'Le venir erreur jardin ennemi permettre.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (19, '82, rue Charles Menard', 'Dijouxboeuf', '79958', 3511, 1, 'Annule', 'Vent envie veille mot entretenir.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (20, '246, chemin Barthelemy', 'ClercVille', '78417', 3622, 1, 'Prise en charge', 'Grand prochain maintenir mais.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (21, '8, chemin Nicolas Pierre', 'Turpin', '60573', 4787, 0, 'Annule', 'Lui résultat discussion soleil ni toucher.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (22, 'chemin Jacquot', 'Mary', '93341', 3023, 0, 'Annule', 'Lourd situation humain pauvre tendre.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (23, '559, rue Alice Courtois', 'Colindan', '37693', 2673, 0, 'En_Attente', 'Minute année secret plein avenir étouffer.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (24, '26, avenue Humbert', 'Martineau', '97356', 2850, 1, 'Prise en charge', 'Air forêt deviner désert le absolu risquer abri.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (25, '37, avenue Stéphane Jacob', 'BuissonVille', '62165', 2367, 0, 'Annule', 'Société l un mourir folie.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (26, '3, chemin Thérèse Cohen', 'Grondin-sur-Lopez', '47242', 2261, 1, 'Annule', 'Espèce approcher occuper demain.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (27, '34, boulevard Julien Morel', 'Bourgeois', '73213', 4366, 0, 'Prise en charge', 'Haute mal mode rester retirer saint route.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (28, '841, rue de Delattre', 'Fontaine', '66371', 3032, 1, 'En_Attente', 'Savoir fortune nerveux compagnie.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (29, '303, rue Thérèse Dubois', 'DurandBourg', '18352', 546, 0, 'Annule', 'Rester drame pays quinze enfant.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (30, 'avenue Hélène Chauveau', 'Sainte Thibaultnec', '10245', 720, 0, 'En_Attente', 'Faveur soleil bras aventure.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (31, 'rue Antoine', 'Lemoine-sur-Mer', '17663', 1152, 0, 'En_Attente', 'Deux faire quatre chacun.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (32, '14, avenue Alexandre Thomas', 'Cohen', '13830', 3324, 0, 'Prise en charge', 'Demi consentir poursuivre roi.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (33, '976, chemin Leroy', 'Tanguy-sur-Garcia', '25579', 2192, 0, 'Prise en charge', 'Ordre chemin question comprendre vie.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (34, '57, chemin de Renaud', 'Lopes-sur-Mer', '37686', 555, 1, 'Annule', 'Nombreux mal violent loin étudier.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (35, '56, chemin Boulanger', 'Saint ClaudeBourg', '14431', 2831, 1, 'En_Attente', 'An taille comprendre jaune.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (36, '45, chemin de Richard', 'BoulayBourg', '95624', 3884, 1, 'Prise en charge', 'Appel papa cause dehors santé français précieux.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (37, 'rue de Boyer', 'Sainte Patriciaboeuf', '05344', 3645, 1, 'Annule', 'Même visite demande armer auquel valoir du.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (38, '93, rue Augustin Martin', 'Guillou', '76968', 2353, 0, 'En_Attente', 'Loup placer en exemple recueillir occasion nord.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (39, '16, rue Monique Paul', 'Leroux', '22435', 1658, 1, 'En_Attente', 'Impossible voisin longtemps petit.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (40, 'boulevard de Coste', 'Mace', '02980', 3381, 1, 'Prise en charge', 'Feuille quel placer.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (41, '7, chemin de Hoareau', 'Mahe-les-Bains', '51685', 3575, 1, 'En_Attente', 'Folie été marche clair gouvernement poésie.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (42, '46, rue de Bonneau', 'Saint Chantal', '21456', 2761, 1, 'En_Attente', 'Fer abattre condamner direction.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (43, 'boulevard Laroche', 'Baron', '05871', 2067, 1, 'Annule', 'Prêt ennemi véritable.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (44, '66, boulevard Audrey Dumont', 'De Sousa-sur-Lejeune', '23573', 3047, 1, 'Prise en charge', 'Corps ensemble pur violent.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (45, '383, rue Bertin', 'Colin-sur-Noël', '45171', 4937, 0, 'En_Attente', 'Recherche printemps descendre.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (46, '97, boulevard Grenier', 'Bigot', '41985', 4994, 1, 'Prise en charge', 'Sec derrière trou quant à roi dès.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (47, '112, avenue Pires', 'Saint Marguerite-les-Bains', '59456', 3053, 1, 'En_Attente', 'Comment fort céder contre retomber folie ancien.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (48, 'chemin Nicole Teixeira', 'Vallet', '58797', 3920, 0, 'Annule', 'Fumer désirer pourquoi chasse.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (49, '489, boulevard Victoire Klein', 'Legrand', '71750', 1693, 0, 'Annule', 'Interrompre science fait goût notre malade ici.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (50, '144, avenue Christelle Guilbert', 'Loiseau-la-Forêt', '30659', 1288, 1, 'Prise en charge', 'Abandonner toucher salut début groupe donc.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (51, '69, rue Nathalie Louis', 'Rodriguez', '48434', 4919, 1, 'En_Attente', 'Après côte titre habitude rire avance public.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (52, '90, avenue de Delattre', 'Bonnet-les-Bains', '87695', 3321, 1, 'Annule', 'Tout travail voir permettre.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (53, '68, avenue Adrienne Courtois', 'Lacroix', '17149', 2334, 0, 'En_Attente', 'Doux autrefois gouvernement ainsi préparer.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (54, '142, boulevard de Barre', 'Berger', '01618', 4054, 1, 'Prise en charge', 'Rompre guère pouvoir plan étaler.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (55, '7, boulevard de Brun', 'RenaultBourg', '58420', 1775, 1, 'Annule', 'Perdu court table présent.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (56, 'boulevard de Guilbert', 'Thibault', '49600', 1727, 1, 'Prise en charge', 'Lumière cou caresser dépasser.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (57, '8, rue David Foucher', 'Martin-sur-Lesage', '81155', 2690, 0, 'En_Attente', 'Mais absolu lien possible prononcer.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (58, '67, boulevard de Bonnet', 'De Sousa-sur-Torres', '33233', 1773, 1, 'Prise en charge', 'Port voir fruit français espoir lutte.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (59, '4, boulevard Roche', 'PaulVille', '97696', 814, 0, 'Annule', 'Voie conscience patron pendre.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (60, 'boulevard Pascal', 'Delannoy-sur-Blot', '47550', 1496, 1, 'En_Attente', 'Jardin jaune herbe froid déjà oui même commander.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (61, '80, chemin de Sauvage', 'Carre-sur-Mer', '46882', 2226, 1, 'Prise en charge', 'Sonner fine retomber.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (62, '96, avenue Gilles', 'Perrin-sur-Rousseau', '97357', 4633, 1, 'En_Attente', 'Public eaux parler matière.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (63, '46, chemin Vaillant', 'Pagesnec', '87770', 3956, 0, 'Prise en charge', 'Rideau lit faible.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (64, '45, rue Susan Renaud', 'Dupuisboeuf', '77965', 728, 1, 'En_Attente', 'Tête déchirer complètement second ouvrage chose.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (65, '637, chemin Vincent Delorme', 'Jacob', '79587', 2135, 1, 'Prise en charge', 'Droit peine jouer plaine.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (66, '905, avenue Buisson', 'Michel', '60424', 1298, 0, 'Annule', 'Femme baisser maintenir coup. Cou bien encore.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (67, '2, rue de Guillaume', 'Couturierboeuf', '51349', 3915, 1, 'Annule', 'Masse plante sous dire.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (68, '10, avenue de Bruneau', 'Garnier-sur-Mer', '18599', 984, 1, 'En_Attente', 'Voir devant manier ce habiter trou jeune.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (69, 'chemin Laurent Pierre', 'Sainte Juliettedan', '46594', 4793, 0, 'En_Attente', 'Pluie bande coin où.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (70, '34, rue Roland Henry', 'Gallet', '53688', 2016, 0, 'Prise en charge', 'Paysan presser offrir respirer contre jour loi.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (71, '907, chemin Alix Costa', 'Saint Alfrednec', '87685', 4796, 1, 'Annule', 'Colon qui plaindre. Appeler ombre horizon.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (72, '21, rue Lévêque', 'Boutin-les-Bains', '09922', 4603, 1, 'Prise en charge', 'Cela précieux siège encore tête.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (73, '6, chemin Brigitte Gomez', 'Lombardnec', '56811', 2376, 0, 'En_Attente', 'Quant À pendant bien profondément.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (74, 'rue de Chartier', 'Techer', '19776', 1770, 1, 'Annule', 'Rassurer déclarer chef résistance.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (75, '409, avenue Alfred Fabre', 'Guichard', '46133', 1898, 0, 'En_Attente', 'Accent placer croire importer dernier.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (76, '49, rue Claude Costa', 'Simon', '24985', 2632, 1, 'En_Attente', 'Promener plaine prêter abandonner.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (77, '295, chemin de Blanchard', 'Potier-les-Bains', '66390', 1907, 0, 'Annule', 'Liberté fuir papa.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (78, '45, avenue Clerc', 'Sainte Anastasienec', '02696', 4653, 0, 'Prise en charge', 'Derrière même lequel jeter yeux soin moins.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (79, '94, rue Charles Barthelemy', 'Vaillantnec', '84387', 534, 1, 'Annule', 'Chemin idée trace rien horizon.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (80, '9, chemin Lelièvre', 'Delaunay', '86231', 2303, 1, 'Prise en charge', 'Course nouveau prier. Approcher suivant peser.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (81, '931, rue Susan Chevalier', 'Rodriguez', '86806', 2666, 1, 'Annule', 'Sueur vivre je certain camarade traiter.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (82, 'rue Élodie Leleu', 'Moreau', '62697', 4363, 1, 'En_Attente', 'Abattre discours comme mur juge durant.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (83, '743, boulevard Alain Rousseau', 'Da Silva', '13534', 3517, 0, 'Prise en charge', 'Présent sentiment passé.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (84, '93, rue Daniel Hamon', 'Saint Mathilde', '03632', 2514, 0, 'Annule', 'Renverser liberté champ mener précis lumière.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (85, '25, rue Roland Gonzalez', 'Sainte Henriette', '29182', 2491, 1, 'En_Attente', 'Ci siècle beauté preuve.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (86, 'rue Gabrielle Marchand', 'Sainte Auguste', '69466', 821, 1, 'Annule', 'Distinguer rejeter créer espèce dormir est.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (87, '77, rue de Maurice', 'Gérard', '52497', 4225, 0, 'En_Attente', 'Prison président ouvrage espérer objet.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (88, 'avenue de Faure', 'Saint Arnaude', '62701', 851, 1, 'Annule', 'Recevoir sembler commencement suivant suite.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (89, '44, rue Victoire Coulon', 'Sainte JoséphineVille', '63661', 4457, 1, 'En_Attente', 'Dehors attirer type charger.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (90, 'boulevard de Blanc', 'Rivière', '97346', 3781, 0, 'En_Attente', 'Aujourd Hui queue branche.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (91, '25, avenue Roger Raynaud', 'Saint Frédéric', '13891', 1831, 1, 'En_Attente', 'As demi quand désert jeune.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (92, '51, rue de Samson', 'Joubert', '28614', 4491, 0, 'Prise en charge', 'Douter moi commun sans or.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (93, '91, boulevard de Paul', 'Rémyboeuf', '80453', 1214, 1, 'En_Attente', 'Double annoncer corde trace céder jeu quartier.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (94, '330, rue Jérôme Dupré', 'Delorme', '26774', 4364, 1, 'Annule', 'Ignorer rouler convenir neuf ciel l une trace.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (95, '315, avenue Carlier', 'Denis', '62642', 544, 0, 'En_Attente', 'Passage derrière large danser.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (96, '31, avenue de Richard', 'Saint Madeleine', '90359', 982, 0, 'Prise en charge', 'Creuser me contenir problème à.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (97, '7, chemin Normand', 'Torres', '43870', 1705, 0, 'Prise en charge', 'Inconnu soir ou choisir retour.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (98, '3, chemin de Gimenez', 'Chauvin-sur-Mer', '42682', 3281, 0, 'Prise en charge', 'Signe joie naturellement seuil devenir on.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (99, '78, rue Charrier', 'Chevallierdan', '12365', 2631, 0, 'Annule', 'Cent surtout aider presser soin pitié.');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES (100, '3, avenue de Faure', 'Saint Pierre-sur-Mer', '97268', 2613, 1, 'Annule', 'Papier puis sol huit rapide.');



INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (1, 'Chevrolet', 'Cruze', 2022, 'Diesel', 'Excellent', 18193, TO_DATE('2023-12-16', 'yyyy-mm-dd'), 5.5, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (2, 'Chevrolet', 'Cruze', 2023, 'Diesel', 'Excellent', 21080, TO_DATE('2023-07-21', 'yyyy-mm-dd'), 7.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (3, 'Nissan', 'Altima', 2017, 'Electrique', 'Mauvais', 65747, TO_DATE('2024-08-30', 'yyyy-mm-dd'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (4, 'BMW', '320i', 2017, 'Diesel', 'Bon', 12912, TO_DATE('2023-12-02', 'yyyy-mm-dd'), 8.1, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (5, 'Audi', 'A3', 2020, 'Diesel', 'Excellent', 95474, TO_DATE('2023-08-08', 'yyyy-mm-dd'), 8.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (6, 'Honda', 'Civic', 2017, 'Diesel', 'Moyen', 81627, TO_DATE('2024-03-17', 'yyyy-mm-dd'), 4.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (7, 'Toyota', 'Corolla', 2024, 'Diesel', 'Mauvais', 89100, TO_DATE('2023-02-09', 'yyyy-mm-dd'), 7.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (8, 'Volkswagen', 'Golf', 2022, 'Essence', 'Excellent', 67939, TO_DATE('2023-09-21', 'yyyy-mm-dd'), 4.7, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (9, 'Audi', 'A3', 2019, 'Electrique', 'Moyen', 51620, TO_DATE('2024-10-08', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (10, 'Chevrolet', 'Cruze', 2016, 'Essence', 'Bon', 42036, TO_DATE('2024-08-21', 'yyyy-mm-dd'), 7.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (11, 'Volkswagen', 'Golf', 2021, 'Hybride', 'Excellent', 37287, TO_DATE('2024-02-05', 'yyyy-mm-dd'), 9.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (12, 'Toyota', 'Corolla', 2020, 'Diesel', 'Bon', 11424, TO_DATE('2024-03-05', 'yyyy-mm-dd'), 6.5, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (13, 'Ford', 'Focus', 2015, 'Electrique', 'Excellent', 96076, TO_DATE('2024-02-23', 'yyyy-mm-dd'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (14, 'Volkswagen', 'Golf', 2018, 'Essence', 'Excellent', 83919, TO_DATE('2024-07-23', 'yyyy-mm-dd'), 6.5, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (15, 'Honda', 'Civic', 2017, 'Diesel', 'Moyen', 58214, TO_DATE('2024-02-21', 'yyyy-mm-dd'), 4.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (16, 'Honda', 'Civic', 2022, 'Hybride', 'Moyen', 11011, TO_DATE('2024-05-30', 'yyyy-mm-dd'), 5.2, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (17, 'Chevrolet', 'Cruze', 2024, 'Diesel', 'Bon', 56031, TO_DATE('2024-02-08', 'yyyy-mm-dd'), 7.4, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (18, 'Honda', 'Civic', 2019, 'Diesel', 'Excellent', 39068, TO_DATE('2024-07-25', 'yyyy-mm-dd'), 8.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (19, 'Tesla', 'Model 3', 2021, 'Electrique', 'Moyen', 66018, TO_DATE('2023-01-05', 'yyyy-mm-dd'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (20, 'Honda', 'Civic', 2017, 'Essence', 'Mauvais', 90126, TO_DATE('2023-08-17', 'yyyy-mm-dd'), 9.6, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (21, 'Tesla', 'Model 3', 2023, 'Hybride', 'Bon', 93615, TO_DATE('2024-02-12', 'yyyy-mm-dd'), 5.3, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (22, 'BMW', '320i', 2016, 'Electrique', 'Bon', 16911, TO_DATE('2023-01-10', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (23, 'Tesla', 'Model 3', 2023, 'Electrique', 'Excellent', 20608, TO_DATE('2023-03-24', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (24, 'Nissan', 'Altima', 2016, 'Hybride', 'Bon', 23026, TO_DATE('2023-07-27', 'yyyy-mm-dd'), 6.7, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (25, 'Ford', 'Focus', 2016, 'Essence', 'Bon', 91709, TO_DATE('2023-01-04', 'yyyy-mm-dd'), 8.3, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (26, 'Honda', 'Civic', 2020, 'Electrique', 'Excellent', 94718, TO_DATE('2023-01-10', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (27, 'Honda', 'Civic', 2024, 'Essence', 'Mauvais', 39196, TO_DATE('2024-07-14', 'yyyy-mm-dd'), 6.2, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (28, 'Honda', 'Civic', 2019, 'Hybride', 'Moyen', 54967, TO_DATE('2023-11-19', 'yyyy-mm-dd'), 5.4, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (29, 'Hyundai', 'Elantra', 2017, 'Hybride', 'Bon', 62159, TO_DATE('2024-09-02', 'yyyy-mm-dd'), 5.1, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (30, 'Tesla', 'Model 3', 2015, 'Hybride', 'Mauvais', 72229, TO_DATE('2024-01-04', 'yyyy-mm-dd'), 5.2, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (31, 'Toyota', 'Corolla', 2022, 'Electrique', 'Bon', 40559, TO_DATE('2024-10-11', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (32, 'Volkswagen', 'Golf', 2018, 'Electrique', 'Mauvais', 43121, TO_DATE('2024-01-11', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (33, 'BMW', '320i', 2018, 'Electrique', 'Bon', 58081, TO_DATE('2023-11-24', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (34, 'Tesla', 'Model 3', 2019, 'Electrique', 'Excellent', 61567, TO_DATE('2024-03-06', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (35, 'Tesla', 'Model 3', 2017, 'Diesel', 'Excellent', 47349, TO_DATE('2024-08-23', 'yyyy-mm-dd'), 9.8, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (36, 'Toyota', 'Corolla', 2023, 'Electrique', 'Bon', 16344, TO_DATE('2023-02-01', 'yyyy-mm-dd'), 0.0, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (37, 'Honda', 'Civic', 2021, 'Essence', 'Moyen', 67334, TO_DATE('2024-02-04', 'yyyy-mm-dd'), 7.1, 0);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (38, 'Nissan', 'Altima', 2024, 'Electrique', 'Excellent', 34759, TO_DATE('2024-06-25', 'yyyy-mm-dd'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (39, 'Ford', 'Focus', 2015, 'Diesel', 'Excellent', 42535, TO_DATE('2023-11-13', 'yyyy-mm-dd'), 7.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES (40, 'Ford', 'Focus', 2019, 'Electrique', 'Mauvais', 51705, TO_DATE('2024-05-23', 'yyyy-mm-dd'), 0.0, 0);



INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (1, '25, avenue de Guichard', 'Morel-sur-Mer', '59567', 913, 1, 'Éclater au chaîne qui.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (2, '252, chemin Parent', 'Charlesboeuf', '15821', 3391, 0, 'Secrétaire cent faux morceau. Valeur train deux.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (3, '23, rue Colas', 'Rémy', '63751', 2833, 0, 'Soit tempête président.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (4, 'rue de Garnier', 'Verdier', '32260', 4316, 0, 'Dont oh jeu race musique.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (5, '51, rue Rossi', 'Deschamps', '42342', 3801, 0, 'Pleurer français pleurer exister siège.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (6, '67, chemin de Duval', 'Thibault', '58539', 4860, 1, 'Tout train aucun ah pendant renverser sauter.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (7, 'avenue de Bouchet', 'Pinto-sur-Leroux', '61840', 3347, 0, 'Prêter fuir ignorer étonner haut.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (8, '79, chemin Alfred Vallée', 'Wagnerdan', '34678', 4161, 0, 'Approcher un vendre affaire compagnon perdu seul.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (9, '701, rue Nath Bertrand', 'Raynaud', '66643', 3143, 1, 'Port mauvais sous.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (10, '38, chemin de Moreau', 'Couturier', '23816', 934, 1, 'Là dominer fou nécessaire avis exemple matière.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (11, '40, boulevard Pineau', 'Saint Thibaut', '27665', 895, 1, 'Figurer intérieur tempête.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (12, '320, rue Madeleine Da Costa', 'Girard-les-Bains', '64329', 2323, 0, 'Reprendre frais occuper eaux drame repas taille.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (13, 'boulevard de Fleury', 'Gosselin', '72356', 4501, 0, 'Frère enfoncer dégager pain dautres.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (14, 'avenue de François', 'Lamy-sur-Mer', '10928', 3611, 0, 'Mort mode dautres recherche est importance doux.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (15, '267, chemin Sophie Boulanger', 'Mary', '85475', 2726, 0, 'Être mériter composer public.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (16, 'boulevard Gaudin', 'Henrynec', '42128', 2492, 1, 'Guère visite rire importer.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (17, 'avenue Perrot', 'Pasquier', '92499', 2086, 0, 'Étroit ouvrage arrêter mon. Terme mari se sable.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (18, '68, chemin Lecomte', 'Le Roux', '76290', 2434, 1, 'Rouler résister alors compter.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (19, '2, avenue Lemaire', 'Saint Sylvie-les-Bains', '45491', 1588, 1, 'Égal reculer raison présent.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (20, '77, boulevard de Blanc', 'JolyVille', '28702', 3915, 1, 'But étrange inspirer dormir sommeil est.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (21, '18, avenue de Poirier', 'Durand', '83909', 3938, 0, 'Habiller soulever un.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (22, '8, rue de Baron', 'Dupuis', '16413', 4127, 0, 'Cela demain dautres paix. Vers tracer nord.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (23, '590, avenue Legros', 'Bourgeois', '95231', 4991, 1, 'Voisin ouvrage rôle profond coup occasion.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (24, '35, rue Guy Delattre', 'Munoz-la-Forêt', '36942', 970, 1, 'Contenter sonner fumer.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (25, '42, boulevard Moreno', 'Saint Sylvie', '02115', 599, 1, 'Vue noir blanc propre traîner ouvert.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (26, '29, chemin de Arnaud', 'Michaud', '62525', 1963, 0, 'Élever queue comment arriver de ne.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (27, '20, chemin de Weber', 'MasseBourg', '14359', 3947, 1, 'Nous éclairer contraire petit droite mémoire.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (28, 'boulevard de Neveu', 'Le GoffVille', '12274', 4437, 0, 'Aucun écouter exprimer tombe pour semblable.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (29, 'chemin Alphonse Joubert', 'Cordier', '79892', 3693, 1, 'Habitant me donc creuser installer flamme double.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (30, '25, rue de Dupuy', 'AndreVille', '68562', 4625, 1, 'Caresser avec ça ferme or juste.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (31, 'avenue Joly', 'Laine', '73470', 4825, 0, 'Obtenir précieux plein huit creuser officier mal.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (32, '66, boulevard Labbé', 'Laportenec', '47487', 1043, 0, 'Chambre éclater car permettre raison sien.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (33, '59, avenue Gimenez', 'Munoz-sur-Mer', '36265', 3503, 0, 'Jeter sortir fer beaucoup discours début.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (34, '28, boulevard Frédérique Morin', 'Sanchezboeuf', '44261', 3681, 1, 'Chair chasser certain son accorder.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (35, '51, avenue Vidal', 'Saint IsaacBourg', '56748', 603, 1, 'Ventre terrible bataille action lieu.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (36, 'avenue de Lenoir', 'Sainte SuzanneBourg', '36271', 2812, 1, 'Confiance public désir fermer attendre troisième.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (37, '52, rue Christine Nicolas', 'Guillaume', '63186', 3548, 0, 'Refuser acheter principe large contre pleurer.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (38, '41, avenue de Voisin', 'Germain-sur-Mer', '94371', 4153, 1, 'Accord quel condamner plan peur nord.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (39, '670, boulevard Colette Arnaud', 'Monnierboeuf', '28282', 4711, 0, 'Bête volonté français nouveau.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (40, '111, rue de Ferrand', 'Valentin', '28280', 3654, 0, 'Regretter saisir engager deviner voici remercier.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (41, 'boulevard de Fernandez', 'Martineau-sur-Marques', '41570', 4161, 0, 'Paysan subir intention amener douter.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (42, '35, avenue Moulin', 'Pierre', '21810', 3646, 1, 'Inquiéter justice séparer phrase.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (43, '56, rue Jeannine Dupré', 'Sainte Laurent', '41144', 635, 1, 'Propos finir disparaître.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (44, '2, rue Aimé Morel', 'Piresnec', '73116', 3645, 0, 'Avant ferme homme mort accompagner.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (45, '21, rue Pierre Benoit', 'Lacombe', '11657', 1993, 1, 'Crier depuis combat façon mur peuple.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (46, '89, boulevard de Lemaître', 'Raymond', '16724', 4918, 1, 'Élément bon soir aujourdhui.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (47, '746, rue Dupuy', 'CouturierVille', '65422', 603, 1, 'Naître écarter particulier donc environ faveur.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (48, '167, avenue Madeleine Blanchet', 'Clerc-sur-Fleury', '73587', 3673, 1, 'Exister principe fatigue avec.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (49, 'rue Turpin', 'Sainte Sophiedan', '44575', 4593, 1, 'Yeux avoir flamme même long chat demande.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (50, '818, rue Clerc', 'Saint Laurence', '29164', 4099, 0, 'Face avis triste est élever dominer point.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (51, '585, rue de Hubert', 'Salmonnec', '45370', 1549, 0, 'Prix grave essayer doigt éteindre point.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (52, '83, boulevard Lecomte', 'Gay-sur-Legros', '11472', 1851, 0, 'Intention camarade puisque.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (53, '32, avenue Élise Olivier', 'Saint Josette', '15536', 3007, 0, 'Papa source veiller queue remarquer bon.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (54, '61, rue Bigot', 'Le Gall', '30196', 3637, 0, 'Enfin général honneur.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (55, '767, avenue Collet', 'Sainte Richard', '31711', 2829, 0, 'Possible pas fumée chose entrée rouge solitude.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (56, '49, boulevard Letellier', 'Lecoq', '15108', 2177, 1, 'Sein angoisse chair croiser lourd.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (57, 'boulevard de Blot', 'Pottierboeuf', '53490', 2385, 0, 'Tôt bout circonstance note.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (58, '693, avenue de Dijoux', 'Saint Léon-la-Forêt', '91562', 3668, 1, 'Lier soi ouvert heure témoin mine être.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (59, '2, avenue Le Gall', 'Laine', '75695', 4079, 1, 'Direction supposer intéresser porter proposer.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (60, '85, avenue de Perrot', 'Labbé', '33594', 4266, 1, 'Disposer charge signer où nuage billet.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (61, '91, chemin de Delorme', 'Sainte Jeannine-sur-Mer', '26349', 3431, 1, 'Bonheur solitude son fin plante froid.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (62, '1, boulevard Loiseau', 'Diaz-sur-Michaud', '19165', 2114, 1, 'Couleur briller saint savoir cruel.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (63, '330, avenue de Breton', 'Perrot', '73993', 1191, 1, 'Système lequel appartement établir.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (64, 'avenue Théophile Lenoir', 'Sainte Gabrielleboeuf', '34836', 2010, 0, 'Prétendre obéir savoir espoir.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (65, 'rue de Deschamps', 'Saint Patricia', '81726', 4567, 0, 'Lever beau répandre possible ne supposer.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (66, '12, rue Thibault Chevallier', 'Picard', '16958', 4105, 0, 'Souvenir rouge bord.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (67, '6, boulevard de Chauvin', 'Leblanc-sur-Mer', '39770', 3932, 1, 'Me image savoir vin. Sourire flamme hôtel front.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (68, '1, rue Claire Lejeune', 'Couturier', '94352', 1781, 0, 'Intérêt prévenir foi monter supposer asseoir.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (69, '57, avenue Noël Leleu', 'Sainte Lucie-sur-Mer', '57127', 2414, 0, 'Nuit certain passé former nerveux tel.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (70, '23, rue Frédérique Noël', 'Danielnec', '22431', 4798, 0, 'Certain planche parent cause particulier.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (71, '48, boulevard Anouk Gros', 'Sainte Augustenec', '36775', 580, 0, 'Jeune animer véritable course silence.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (72, '87, chemin de Hernandez', 'Da Silva', '91799', 4758, 1, 'Sommet entrer réserver fine.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (73, '31, boulevard Gomes', 'Fontaine', '48175', 1390, 0, 'Apporter toi garçon mille.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (74, '49, rue Yves Ramos', 'Cordier', '56647', 1901, 0, 'Inviter douze supérieur clair tuer forme plaine.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (75, '72, boulevard de Andre', 'Dubois', '28472', 4040, 1, 'Odeur quarante jambe couper.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (76, 'rue de Gautier', 'Sainte Alfred-les-Bains', '48629', 736, 0, 'Oncle haine abandonner étroit appuyer horizon.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (77, '42, rue Augustin Raynaud', 'Bouvier', '95868', 3344, 0, 'Occasion nom militaire il.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (78, 'rue de Lucas', 'Cousin', '14435', 3811, 1, 'Falloir rapidement aimer.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (79, '60, rue Lejeune', 'FrançoisVille', '72721', 3946, 1, 'Trouver affirmer île défendre odeur eaux.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (80, '14, boulevard Pelletier', 'Sainte Hortense', '75835', 3035, 0, 'Feu attacher appartement odeur.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (81, '23, rue de Fleury', 'Lévydan', '87994', 2994, 1, 'Relever pauvre verser caractère.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (82, '844, boulevard Couturier', 'Lucas-sur-Mer', '58715', 4713, 0, 'Race secrétaire neuf.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (83, '84, boulevard de Pineau', 'Navarro', '59627', 1727, 1, 'Jamais fin suffire six là bureau dépasser.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (84, '11, chemin Clerc', 'Laurentboeuf', '61317', 2728, 1, 'Disposer moment nouveau sol foi.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (85, '27, rue de Le Goff', 'Chauveau', '97347', 2442, 0, 'Caresser court or enlever plan seuil nez.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (86, '91, rue Joséphine Joly', 'Godard-sur-Mer', '36539', 1625, 1, 'Marché gauche rideau ouvrage.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (87, '89, rue Morel', 'Duval', '24207', 1899, 1, 'Parfois loi devant sentier long.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (88, '17, boulevard Benjamin Coulon', 'Imbert', '71511', 4946, 1, 'Drôle type sentir entier ordre mais.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (89, '16, chemin Besnard', 'Sainte Pauldan', '23890', 1414, 0, 'Crainte banc doucement installer lorsque.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (90, 'rue de Pages', 'Saint AudreyBourg', '90708', 1639, 0, 'Seul passage calme se erreur voix moins.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (91, '95, rue Anouk Normand', 'Saint Paulette-sur-Mer', '07226', 1588, 0, 'Apprendre type défendre liberté si croire.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (92, '92, boulevard de Martel', 'Jacob', '52676', 3525, 1, 'Puis fleur si peuple image naturellement.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (93, '4, boulevard Valentine Peron', 'GuyotBourg', '19172', 1572, 0, 'Mille papier moyen véritable élever.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (94, 'rue de Hamon', 'François', '37305', 4688, 0, 'Fier pareil à valoir.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (95, '653, rue Nathalie Blin', 'Carlier-sur-Mer', '20622', 4391, 1, 'Neuf corps repousser honneur je promettre.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (96, '767, rue Rousseau', 'Petit-la-Forêt', '04284', 3948, 0, 'Avoir chant signe ciel.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (97, 'boulevard Juliette Texier', 'Simon-sur-Mer', '92433', 1661, 1, 'Éclat ajouter ville autour aile aucun lumière.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (98, '52, chemin de Didier', 'Sainte Emmanuelle', '60976', 4678, 1, 'Connaître casser vers sortir chemin si comment.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (99, '74, avenue Margaret Delmas', 'Bruneldan', '31111', 2190, 1, 'Franc peser ressembler soin humain.');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) VALUES (100, '493, chemin Dos Santos', 'Guillot-sur-Gomez', '17655', 2545, 1, 'Jusque entrée juger étroit air dos éclairer.');



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


INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (1, TO_DATE('2024-01-23', 'yyyy-mm-dd'), 23.3, 99, 9.9, 7.4, 'Est', 'Ensoleillé', 1020.7, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (2, TO_DATE('2023-10-17', 'yyyy-mm-dd'), 0.1, 47, 3.2, 7.3, 'Sud-Est', 'Orageux', 1022.8, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (3, TO_DATE('2024-08-05', 'yyyy-mm-dd'), -1.1, 64, 1.8, 2.1, 'Sud-Est', 'Nuageux', 1040.0, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (4, TO_DATE('2024-07-18', 'yyyy-mm-dd'), 13.5, 34, 19.0, 6.0, 'Sud-Est', 'Ensoleillé', 1031.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (5, TO_DATE('2024-01-09', 'yyyy-mm-dd'), 25.3, 56, 10.3, 3.3, 'Nord-Est', 'Neigeux', 1027.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (6, TO_DATE('2022-12-07', 'yyyy-mm-dd'), 1.4, 68, 6.5, 7.1, 'Nord', 'Orageux', 1009.9, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (7, TO_DATE('2023-04-25', 'yyyy-mm-dd'), 23.5, 96, 19.4, 9.5, 'Sud-Est', 'Ensoleillé', 1011.8, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (8, TO_DATE('2023-04-18', 'yyyy-mm-dd'), 39.5, 69, 1.1, 5.8, 'Nord-Ouest', 'Brouillard', 1000.5, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (9, TO_DATE('2024-09-08', 'yyyy-mm-dd'), 20.4, 100, 10.0, 12.2, 'Sud-Ouest', 'Brouillard', 1040.2, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (10, TO_DATE('2024-01-16', 'yyyy-mm-dd'), 0.6, 45, 15.3, 11.3, 'Ouest', 'Nuageux', 989.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (11, TO_DATE('2023-04-27', 'yyyy-mm-dd'), 27.9, 70, 15.1, 13.1, 'Nord-Est', 'Nuageux', 1016.4, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (12, TO_DATE('2022-12-06', 'yyyy-mm-dd'), -5.1, 56, 18.1, 14.3, 'Sud-Est', 'Pluvieux', 1009.5, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (13, TO_DATE('2023-08-16', 'yyyy-mm-dd'), 36.9, 62, 4.0, 6.9, 'Ouest', 'Orageux', 1028.8, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (14, TO_DATE('2023-07-12', 'yyyy-mm-dd'), 0.8, 59, 17.3, 3.8, 'Sud', 'Orageux', 1035.8, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (15, TO_DATE('2024-08-04', 'yyyy-mm-dd'), 20.6, 30, 15.1, 6.1, 'Nord-Est', 'Ensoleillé', 1049.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (16, TO_DATE('2022-12-03', 'yyyy-mm-dd'), 40.0, 50, 2.2, 4.6, 'Nord', 'Brouillard', 1034.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (17, TO_DATE('2022-11-18', 'yyyy-mm-dd'), 11.6, 67, 0.5, 1.6, 'Nord-Est', 'Ensoleillé', 1026.4, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (18, TO_DATE('2024-10-31', 'yyyy-mm-dd'), 16.1, 81, 2.9, 3.0, 'Sud', 'Pluvieux', 1005.6, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (19, TO_DATE('2023-12-17', 'yyyy-mm-dd'), 14.3, 32, 14.5, 1.2, 'Sud-Est', 'Nuageux', 1031.5, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (20, TO_DATE('2023-07-29', 'yyyy-mm-dd'), 21.4, 31, 19.7, 3.8, 'Sud', 'Ensoleillé', 989.8, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (21, TO_DATE('2023-01-11', 'yyyy-mm-dd'), 24.0, 65, 17.1, 2.6, 'Sud', 'Partiellement nuageux', 1014.8, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (22, TO_DATE('2024-05-27', 'yyyy-mm-dd'), 35.0, 82, 11.2, 4.5, 'Nord-Est', 'Brouillard', 1049.8, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (23, TO_DATE('2023-06-08', 'yyyy-mm-dd'), 39.0, 49, 14.5, 8.2, 'Ouest', 'Partiellement nuageux', 1023.4, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (24, TO_DATE('2023-08-11', 'yyyy-mm-dd'), -6.1, 62, 5.4, 4.0, 'Sud-Est', 'Neigeux', 1043.2, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (25, TO_DATE('2023-01-23', 'yyyy-mm-dd'), 33.7, 73, 12.9, 4.9, 'Est', 'Orageux', 1018.4, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (26, TO_DATE('2024-01-17', 'yyyy-mm-dd'), 12.1, 99, 17.7, 11.3, 'Nord-Est', 'Orageux', 1038.5, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (27, TO_DATE('2024-06-17', 'yyyy-mm-dd'), 32.7, 79, 17.0, 9.6, 'Sud', 'Brouillard', 1041.6, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (28, TO_DATE('2023-01-22', 'yyyy-mm-dd'), 23.4, 50, 9.3, 2.5, 'Ouest', 'Partiellement nuageux', 1049.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (29, TO_DATE('2024-07-17', 'yyyy-mm-dd'), 29.1, 51, 12.7, 3.4, 'Sud-Est', 'Pluvieux', 1031.4, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (30, TO_DATE('2024-09-04', 'yyyy-mm-dd'), 39.4, 84, 3.7, 12.5, 'Est', 'Ensoleillé', 1034.1, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (31, TO_DATE('2022-12-09', 'yyyy-mm-dd'), 14.9, 96, 19.7, 9.8, 'Nord-Est', 'Partiellement nuageux', 996.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (32, TO_DATE('2024-05-26', 'yyyy-mm-dd'), 38.2, 58, 1.2, 3.5, 'Sud-Ouest', 'Neigeux', 1008.8, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (33, TO_DATE('2024-10-26', 'yyyy-mm-dd'), 27.4, 68, 17.8, 11.6, 'Est', 'Nuageux', 988.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (34, TO_DATE('2023-07-09', 'yyyy-mm-dd'), 4.5, 85, 17.5, 14.8, 'Sud', 'Orageux', 998.1, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (35, TO_DATE('2023-06-20', 'yyyy-mm-dd'), 23.7, 94, 9.8, 10.9, 'Nord-Est', 'Neigeux', 1035.9, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (36, TO_DATE('2024-07-10', 'yyyy-mm-dd'), 35.5, 38, 12.1, 1.2, 'Est', 'Pluvieux', 1045.1, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (37, TO_DATE('2023-03-19', 'yyyy-mm-dd'), 20.4, 93, 15.9, 12.4, 'Nord-Est', 'Nuageux', 990.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (38, TO_DATE('2023-05-25', 'yyyy-mm-dd'), -1.7, 66, 4.4, 1.2, 'Nord', 'Partiellement nuageux', 983.0, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (39, TO_DATE('2024-06-22', 'yyyy-mm-dd'), 35.1, 54, 18.1, 11.8, 'Est', 'Pluvieux', 1042.1, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (40, TO_DATE('2024-02-14', 'yyyy-mm-dd'), 34.8, 78, 0.4, 7.9, 'Sud-Est', 'Orageux', 1006.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (41, TO_DATE('2023-06-07', 'yyyy-mm-dd'), 0.6, 82, 3.0, 0.3, 'Ouest', 'Orageux', 1034.7, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (42, TO_DATE('2024-11-08', 'yyyy-mm-dd'), 17.1, 81, 8.8, 3.6, 'Nord-Ouest', 'Brouillard', 1046.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (43, TO_DATE('2024-01-18', 'yyyy-mm-dd'), 14.2, 32, 1.2, 14.3, 'Ouest', 'Pluvieux', 995.7, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (44, TO_DATE('2024-07-08', 'yyyy-mm-dd'), 10.4, 34, 16.2, 5.9, 'Sud-Ouest', 'Pluvieux', 985.0, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (45, TO_DATE('2023-07-06', 'yyyy-mm-dd'), 15.8, 93, 2.9, 8.5, 'Nord', 'Neigeux', 1013.7, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (46, TO_DATE('2024-05-20', 'yyyy-mm-dd'), 6.0, 62, 5.3, 5.6, 'Nord-Ouest', 'Pluvieux', 1014.8, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (47, TO_DATE('2023-07-27', 'yyyy-mm-dd'), 19.6, 50, 10.4, 12.3, 'Sud-Est', 'Brouillard', 1049.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (48, TO_DATE('2024-07-27', 'yyyy-mm-dd'), 23.7, 89, 3.0, 7.6, 'Est', 'Ensoleillé', 1003.7, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (49, TO_DATE('2024-09-01', 'yyyy-mm-dd'), 0.9, 37, 10.4, 2.6, 'Nord-Ouest', 'Partiellement nuageux', 1034.8, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (50, TO_DATE('2024-01-21', 'yyyy-mm-dd'), 13.9, 59, 5.8, 9.9, 'Nord-Ouest', 'Neigeux', 1026.1, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (51, TO_DATE('2023-06-04', 'yyyy-mm-dd'), 39.1, 38, 14.4, 14.6, 'Nord-Est', 'Nuageux', 1006.2, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (52, TO_DATE('2023-06-12', 'yyyy-mm-dd'), 37.5, 39, 14.0, 13.1, 'Sud', 'Ensoleillé', 1004.2, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (53, TO_DATE('2024-02-04', 'yyyy-mm-dd'), 6.7, 48, 17.3, 2.1, 'Nord-Est', 'Pluvieux', 1043.1, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (54, TO_DATE('2023-05-15', 'yyyy-mm-dd'), 13.7, 70, 16.1, 9.8, 'Sud', 'Ensoleillé', 1041.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (55, TO_DATE('2023-01-07', 'yyyy-mm-dd'), 26.9, 71, 15.4, 10.2, 'Sud-Est', 'Partiellement nuageux', 1034.3, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (56, TO_DATE('2023-05-25', 'yyyy-mm-dd'), -9.0, 73, 14.4, 15.0, 'Nord', 'Orageux', 1014.5, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (57, TO_DATE('2024-08-22', 'yyyy-mm-dd'), 36.1, 50, 10.4, 4.7, 'Sud', 'Neigeux', 1047.2, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (58, TO_DATE('2023-08-29', 'yyyy-mm-dd'), 25.9, 38, 11.8, 13.2, 'Nord', 'Partiellement nuageux', 983.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (59, TO_DATE('2024-08-04', 'yyyy-mm-dd'), 8.0, 35, 9.9, 12.5, 'Ouest', 'Nuageux', 1029.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (60, TO_DATE('2024-06-16', 'yyyy-mm-dd'), -5.4, 32, 10.7, 13.7, 'Ouest', 'Ensoleillé', 1045.0, 0);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (61, TO_DATE('2024-07-04', 'yyyy-mm-dd'), 18.5, 82, 0.4, 13.8, 'Nord-Est', 'Orageux', 1014.0, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (62, TO_DATE('2024-06-05', 'yyyy-mm-dd'), 16.0, 56, 18.2, 7.9, 'Sud-Ouest', 'Orageux', 984.9, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (63, TO_DATE('2023-08-13', 'yyyy-mm-dd'), 13.8, 57, 3.0, 2.2, 'Ouest', 'Brouillard', 1014.9, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (64, TO_DATE('2023-05-31', 'yyyy-mm-dd'), 30.7, 54, 14.8, 9.6, 'Nord-Ouest', 'Partiellement nuageux', 1048.7, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (65, TO_DATE('2024-08-10', 'yyyy-mm-dd'), 23.2, 56, 10.4, 12.2, 'Sud-Est', 'Nuageux', 1001.6, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (66, TO_DATE('2023-03-08', 'yyyy-mm-dd'), -9.6, 54, 17.9, 9.3, 'Sud-Ouest', 'Pluvieux', 993.4, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (67, TO_DATE('2024-01-29', 'yyyy-mm-dd'), 29.3, 73, 14.8, 14.3, 'Est', 'Orageux', 1021.4, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (68, TO_DATE('2023-08-04', 'yyyy-mm-dd'), 4.3, 62, 4.3, 8.2, 'Ouest', 'Nuageux', 1045.0, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (69, TO_DATE('2024-01-06', 'yyyy-mm-dd'), 11.2, 30, 18.4, 10.6, 'Sud', 'Brouillard', 997.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (70, TO_DATE('2024-05-18', 'yyyy-mm-dd'), 6.0, 37, 4.0, 4.0, 'Sud-Est', 'Pluvieux', 1004.6, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (71, TO_DATE('2023-10-29', 'yyyy-mm-dd'), 20.4, 44, 8.4, 3.2, 'Sud-Est', 'Neigeux', 992.5, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (72, TO_DATE('2023-01-10', 'yyyy-mm-dd'), 27.2, 34, 20.0, 2.8, 'Sud-Est', 'Ensoleillé', 1027.9, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (73, TO_DATE('2024-06-25', 'yyyy-mm-dd'), -5.4, 52, 17.1, 4.7, 'Sud', 'Orageux', 1038.9, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (74, TO_DATE('2024-03-17', 'yyyy-mm-dd'), 9.7, 73, 16.6, 1.9, 'Ouest', 'Ensoleillé', 1019.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (75, TO_DATE('2023-01-11', 'yyyy-mm-dd'), 36.7, 57, 16.6, 11.5, 'Sud-Ouest', 'Partiellement nuageux', 992.9, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (76, TO_DATE('2023-07-13', 'yyyy-mm-dd'), 12.5, 38, 19.9, 12.5, 'Sud-Est', 'Nuageux', 1044.5, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (77, TO_DATE('2023-06-09', 'yyyy-mm-dd'), -8.7, 57, 13.2, 11.3, 'Nord', 'Partiellement nuageux', 1006.0, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (78, TO_DATE('2023-08-28', 'yyyy-mm-dd'), -6.8, 45, 10.9, 12.8, 'Nord', 'Nuageux', 997.3, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (79, TO_DATE('2023-01-25', 'yyyy-mm-dd'), 15.8, 90, 12.8, 11.7, 'Nord', 'Neigeux', 1012.6, 0);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (80, TO_DATE('2023-06-24', 'yyyy-mm-dd'), -2.2, 54, 18.1, 14.2, 'Ouest', 'Neigeux', 1000.8, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (81, TO_DATE('2023-04-15', 'yyyy-mm-dd'), 3.0, 91, 0.9, 6.6, 'Sud-Ouest', 'Pluvieux', 1008.0, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (82, TO_DATE('2024-05-03', 'yyyy-mm-dd'), -3.8, 67, 16.1, 5.5, 'Est', 'Brouillard', 1017.5, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (83, TO_DATE('2023-01-12', 'yyyy-mm-dd'), 22.0, 90, 18.9, 4.9, 'Nord', 'Ensoleillé', 1044.5, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (84, TO_DATE('2024-03-18', 'yyyy-mm-dd'), 29.9, 36, 0.4, 0.9, 'Sud-Ouest', 'Ensoleillé', 1049.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (85, TO_DATE('2024-02-12', 'yyyy-mm-dd'), 21.0, 94, 13.0, 14.2, 'Nord-Ouest', 'Nuageux', 981.5, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (86, TO_DATE('2024-08-06', 'yyyy-mm-dd'), 13.0, 61, 12.7, 9.2, 'Nord-Ouest', 'Partiellement nuageux', 1021.4, 6);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (87, TO_DATE('2023-06-06', 'yyyy-mm-dd'), 35.1, 83, 18.6, 8.6, 'Sud', 'Orageux', 986.6, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (88, TO_DATE('2023-03-10', 'yyyy-mm-dd'), 13.7, 86, 5.6, 3.8, 'Ouest', 'Pluvieux', 1017.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (89, TO_DATE('2024-02-02', 'yyyy-mm-dd'), 20.3, 100, 9.0, 12.8, 'Nord-Est', 'Pluvieux', 1005.7, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (90, TO_DATE('2024-02-10', 'yyyy-mm-dd'), 4.4, 67, 16.8, 6.3, 'Ouest', 'Neigeux', 1033.5, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (91, TO_DATE('2024-10-18', 'yyyy-mm-dd'), 4.7, 98, 11.2, 1.6, 'Ouest', 'Nuageux', 1031.2, 9);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (92, TO_DATE('2023-03-19', 'yyyy-mm-dd'), 28.2, 64, 7.7, 11.6, 'Ouest', 'Neigeux', 1048.4, 10);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (93, TO_DATE('2024-09-19', 'yyyy-mm-dd'), -1.2, 36, 3.1, 13.9, 'Nord-Ouest', 'Partiellement nuageux', 1037.5, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (94, TO_DATE('2023-02-05', 'yyyy-mm-dd'), 4.9, 72, 13.8, 2.7, 'Nord-Est', 'Brouillard', 1043.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (95, TO_DATE('2023-05-29', 'yyyy-mm-dd'), 30.6, 77, 1.3, 11.0, 'Nord', 'Orageux', 985.2, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (96, TO_DATE('2024-09-26', 'yyyy-mm-dd'), 25.8, 85, 18.6, 8.8, 'Nord', 'Nuageux', 1010.2, 8);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (97, TO_DATE('2023-11-17', 'yyyy-mm-dd'), -4.6, 98, 6.2, 1.3, 'Sud', 'Ensoleillé', 1028.8, 7);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (98, TO_DATE('2024-06-01', 'yyyy-mm-dd'), 1.9, 34, 14.0, 5.2, 'Ouest', 'Ensoleillé', 986.6, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (99, TO_DATE('2023-08-26', 'yyyy-mm-dd'), 22.3, 75, 8.2, 6.6, 'Sud', 'Neigeux', 1007.3, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES (100, TO_DATE('2023-10-12', 'yyyy-mm-dd'), 21.6, 51, 9.0, 2.9, 'Est', 'Brouillard', 1049.9, 8);

INSERT INTO Dates(ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(1, TO_DATE('2024-11-14', 'yyyy-mm-dd'), 14, 11, 2024, 'semaine', 4, 'jeudi', 46, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(2, TO_DATE('2024-11-13', 'yyyy-mm-dd'), 13, 11, 2024, 'semaine', 4, 'mercredi', 46, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(3, TO_DATE('2024-11-12', 'yyyy-mm-dd'), 12, 11, 2024, 'semaine', 4, 'mardi', 46, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(4, TO_DATE('2024-11-11', 'yyyy-mm-dd'), 11, 11, 2024, 'ferie', 4, 'lundi', 46, 0, 1, 'Jour férié - Armistice');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(5, TO_DATE('2024-11-10', 'yyyy-mm-dd'), 10, 11, 2024, 'weekend', 4, 'dimanche', 45, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(6, TO_DATE('2024-11-09', 'yyyy-mm-dd'), 9, 11, 2024, 'weekend', 4, 'samedi', 45, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(7, TO_DATE('2024-11-08', 'yyyy-mm-dd'), 8, 11, 2024, 'semaine', 4, 'vendredi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(8, TO_DATE('2024-11-07', 'yyyy-mm-dd'), 7, 11, 2024, 'semaine', 4, 'jeudi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(9, TO_DATE('2024-11-06', 'yyyy-mm-dd'), 6, 11, 2024, 'semaine', 4, 'mercredi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(10, TO_DATE('2024-11-05', 'yyyy-mm-dd'), 5, 11, 2024, 'semaine', 4, 'mardi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(11, TO_DATE('2024-11-04', 'yyyy-mm-dd'), 4, 11, 2024, 'semaine', 4, 'lundi', 45, 0, 0, 'Aucune particularité');
INSERT INTO Dates(ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(12, TO_DATE('2024-11-03', 'yyyy-mm-dd'), 3, 11, 2024, 'weekend', 4, 'dimanche', 44, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(13, TO_DATE('2024-11-02', 'yyyy-mm-dd'), 2, 11, 2024, 'weekend', 4, 'samedi', 44, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(14, TO_DATE('2024-11-01', 'yyyy-mm-dd'), 1, 11, 2024, 'ferie', 4, 'vendredi', 44, 0, 1, 'Jour férié - Toussaint');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(15, TO_DATE('2024-10-31', 'yyyy-mm-dd'), 31, 10, 2024, 'semaine', 4, 'jeudi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(16, TO_DATE('2024-10-30', 'yyyy-mm-dd'), 30, 10, 2024, 'semaine', 4, 'mercredi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(17, TO_DATE('2024-10-29', 'yyyy-mm-dd'), 29, 10, 2024, 'semaine', 4, 'mardi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(18, TO_DATE('2024-10-28', 'yyyy-mm-dd'), 28, 10, 2024, 'semaine', 4, 'lundi', 44, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(19, TO_DATE('2024-10-27', 'yyyy-mm-dd'), 27, 10, 2024, 'weekend', 4, 'dimanche', 43, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(20, TO_DATE('2024-10-26', 'yyyy-mm-dd'), 26, 10, 2024, 'weekend', 4, 'samedi', 43, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(21, TO_DATE('2024-10-25', 'yyyy-mm-dd'), 25, 10, 2024, 'semaine', 4, 'vendredi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(22, TO_DATE('2024-10-24', 'yyyy-mm-dd'), 24, 10, 2024, 'semaine', 4, 'jeudi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(23, TO_DATE('2024-10-23', 'yyyy-mm-dd'), 23, 10, 2024, 'semaine', 4, 'mercredi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(24, TO_DATE('2024-10-22', 'yyyy-mm-dd'), 22, 10, 2024, 'semaine', 4, 'mardi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(25, TO_DATE('2024-10-21', 'yyyy-mm-dd'), 21, 10, 2024, 'semaine', 4, 'lundi', 43, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(26, TO_DATE('2024-10-20', 'yyyy-mm-dd'), 20, 10, 2024, 'weekend', 4, 'dimanche', 42, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(27, TO_DATE('2024-10-19', 'yyyy-mm-dd'), 19, 10, 2024, 'weekend', 4, 'samedi', 42, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(28, TO_DATE('2024-10-18', 'yyyy-mm-dd'), 18, 10, 2024, 'semaine', 4, 'vendredi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(29, TO_DATE('2024-10-17', 'yyyy-mm-dd'), 17, 10, 2024, 'semaine', 4, 'jeudi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(30, TO_DATE('2024-10-16', 'yyyy-mm-dd'), 16, 10, 2024, 'semaine', 4, 'mercredi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(31, TO_DATE('2024-10-15', 'yyyy-mm-dd'), 15, 10, 2024, 'semaine', 4, 'mardi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(32, TO_DATE('2024-10-14', 'yyyy-mm-dd'), 14, 10, 2024, 'semaine', 4, 'lundi', 42, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(33, TO_DATE('2024-10-13', 'yyyy-mm-dd'), 13, 10, 2024, 'weekend', 4, 'dimanche', 41, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(34, TO_DATE('2024-10-12', 'yyyy-mm-dd'), 12, 10, 2024, 'weekend', 4, 'samedi', 41, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(35, TO_DATE('2024-10-11', 'yyyy-mm-dd'), 11, 10, 2024, 'semaine', 4, 'vendredi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(36, TO_DATE('2024-10-10', 'yyyy-mm-dd'), 10, 10, 2024, 'semaine', 4, 'jeudi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(37, TO_DATE('2024-10-09', 'yyyy-mm-dd'), 9, 10, 2024, 'semaine', 4, 'mercredi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(38, TO_DATE('2024-10-08', 'yyyy-mm-dd'), 8, 10, 2024, 'semaine', 4, 'mardi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(39, TO_DATE('2024-10-07', 'yyyy-mm-dd'), 7, 10, 2024, 'semaine', 4, 'lundi', 41, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(40, TO_DATE('2024-10-06', 'yyyy-mm-dd'), 6, 10, 2024, 'weekend', 4, 'dimanche', 40, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(41, TO_DATE('2024-10-05', 'yyyy-mm-dd'), 5, 10, 2024, 'weekend', 4, 'samedi', 40, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(42, TO_DATE('2024-10-04', 'yyyy-mm-dd'), 4, 10, 2024, 'semaine', 4, 'vendredi', 40, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(43, TO_DATE('2024-10-03', 'yyyy-mm-dd'), 3, 10, 2024, 'semaine', 4, 'jeudi', 40, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(44, TO_DATE('2024-10-02', 'yyyy-mm-dd'), 2, 10, 2024, 'semaine', 4, 'mercredi', 40, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(45, TO_DATE('2024-10-01', 'yyyy-mm-dd'), 1, 10, 2024, 'semaine', 4, 'mardi', 40, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(46, TO_DATE('2024-09-30', 'yyyy-mm-dd'), 30, 9, 2024, 'semaine', 4, 'lundi', 39, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(47, TO_DATE('2024-09-29', 'yyyy-mm-dd'), 29, 9, 2024, 'weekend', 4, 'dimanche', 38, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(48, TO_DATE('2024-09-28', 'yyyy-mm-dd'), 28, 9, 2024, 'weekend', 4, 'samedi', 38, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(49, TO_DATE('2024-09-27', 'yyyy-mm-dd'), 27, 9, 2024, 'semaine', 4, 'vendredi', 38, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(50, TO_DATE('2024-09-26', 'yyyy-mm-dd'), 26, 9, 2024, 'semaine', 4, 'jeudi', 38, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(51, TO_DATE('2024-09-25', 'yyyy-mm-dd'), 25, 9, 2024, 'semaine', 4, 'mercredi', 38, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(52, TO_DATE('2024-09-24', 'yyyy-mm-dd'), 24, 9, 2024, 'semaine', 4, 'mardi', 38, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(53, TO_DATE('2024-09-23', 'yyyy-mm-dd'), 23, 9, 2024, 'semaine', 4, 'lundi', 38, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(54, TO_DATE('2024-09-22', 'yyyy-mm-dd'), 22, 9, 2024, 'weekend', 4, 'dimanche', 37, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(55, TO_DATE('2024-09-21', 'yyyy-mm-dd'), 21, 9, 2024, 'weekend', 4, 'samedi', 37, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(56, TO_DATE('2024-09-20', 'yyyy-mm-dd'), 20, 9, 2024, 'semaine', 4, 'vendredi', 37, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(57, TO_DATE('2024-09-19', 'yyyy-mm-dd'), 19, 9, 2024, 'semaine', 4, 'jeudi', 37, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(58, TO_DATE('2024-09-18', 'yyyy-mm-dd'), 18, 9, 2024, 'semaine', 4, 'mercredi', 37, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(59, TO_DATE('2024-09-17', 'yyyy-mm-dd'), 17, 9, 2024, 'semaine', 4, 'mardi', 37, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(60, TO_DATE('2024-09-16', 'yyyy-mm-dd'), 16, 9, 2024, 'semaine', 4, 'lundi', 37, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(61, TO_DATE('2024-09-15', 'yyyy-mm-dd'), 15, 9, 2024, 'weekend', 4, 'dimanche', 36, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(62, TO_DATE('2024-09-14', 'yyyy-mm-dd'), 14, 9, 2024, 'weekend', 4, 'samedi', 36, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(63, TO_DATE('2024-09-13', 'yyyy-mm-dd'), 13, 9, 2024, 'semaine', 4, 'vendredi', 36, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(64, TO_DATE('2024-09-12', 'yyyy-mm-dd'), 12, 9, 2024, 'semaine', 4, 'jeudi', 36, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(65, TO_DATE('2024-09-11', 'yyyy-mm-dd'), 11, 9, 2024, 'semaine', 4, 'mercredi', 36, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(66, TO_DATE('2024-09-10', 'yyyy-mm-dd'), 10, 9, 2024, 'semaine', 4, 'mardi', 36, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(67, TO_DATE('2024-09-09', 'yyyy-mm-dd'), 9, 9, 2024, 'semaine', 4, 'lundi', 36, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(68, TO_DATE('2024-09-08', 'yyyy-mm-dd'), 8, 9, 2024, 'weekend', 4, 'dimanche', 35, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(69, TO_DATE('2024-09-07', 'yyyy-mm-dd'), 7, 9, 2024, 'weekend', 4, 'samedi', 35, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(70, TO_DATE('2024-09-06', 'yyyy-mm-dd'), 6, 9, 2024, 'semaine', 4, 'vendredi', 35, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(71, TO_DATE('2024-09-05', 'yyyy-mm-dd'), 5, 9, 2024, 'semaine', 4, 'jeudi', 35, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(72, TO_DATE('2024-09-04', 'yyyy-mm-dd'), 4, 9, 2024, 'semaine', 4, 'mercredi', 35, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(73, TO_DATE('2024-09-03', 'yyyy-mm-dd'), 3, 9, 2024, 'semaine', 4, 'mardi', 35, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(74, TO_DATE('2024-09-02', 'yyyy-mm-dd'), 2, 9, 2024, 'ferie', 4, 'lundi', 35, 0, 1, 'Jour férié - Fête du Travail');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(75, TO_DATE('2024-09-01', 'yyyy-mm-dd'), 1, 9, 2024, 'weekend', 4, 'dimanche', 34, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(76, TO_DATE('2024-08-31', 'yyyy-mm-dd'), 31, 8, 2024, 'weekend', 4, 'samedi', 34, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(77, TO_DATE('2024-08-30', 'yyyy-mm-dd'), 30, 8, 2024, 'semaine', 4, 'vendredi', 34, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(78, TO_DATE('2024-08-29', 'yyyy-mm-dd'), 29, 8, 2024, 'semaine', 4, 'jeudi', 34, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(79, TO_DATE('2024-08-28', 'yyyy-mm-dd'), 28, 8, 2024, 'semaine', 4, 'mercredi', 34, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(80, TO_DATE('2024-08-27', 'yyyy-mm-dd'), 27, 8, 2024, 'semaine', 4, 'mardi', 34, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(81, TO_DATE('2024-08-26', 'yyyy-mm-dd'), 26, 8, 2024, 'semaine', 4, 'lundi', 34, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(82, TO_DATE('2024-08-25', 'yyyy-mm-dd'), 25, 8, 2024, 'weekend', 4, 'dimanche', 33, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(83, TO_DATE('2024-08-24', 'yyyy-mm-dd'), 24, 8, 2024, 'weekend', 4, 'samedi', 33, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(84, TO_DATE('2024-08-23', 'yyyy-mm-dd'), 23, 8, 2024, 'semaine', 4, 'vendredi', 33, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(85, TO_DATE('2024-08-22', 'yyyy-mm-dd'), 22, 8, 2024, 'semaine', 4, 'jeudi', 33, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(86, TO_DATE('2024-08-21', 'yyyy-mm-dd'), 21, 8, 2024, 'semaine', 4, 'mercredi', 33, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(87, TO_DATE('2024-08-20', 'yyyy-mm-dd'), 20, 8, 2024, 'semaine', 4, 'mardi', 33, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(88, TO_DATE('2024-08-19', 'yyyy-mm-dd'), 19, 8, 2024, 'semaine', 4, 'lundi', 33, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(89, TO_DATE('2024-08-18', 'yyyy-mm-dd'), 18, 8, 2024, 'weekend', 4, 'dimanche', 32, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(90, TO_DATE('2024-08-17', 'yyyy-mm-dd'), 17, 8, 2024, 'weekend', 4, 'samedi', 32, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(91, TO_DATE('2024-08-16', 'yyyy-mm-dd'), 16, 8, 2024, 'semaine', 4, 'vendredi', 32, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(92, TO_DATE('2024-08-15', 'yyyy-mm-dd'), 15, 8, 2024, 'ferie', 3, 'jeudi', 32, 0, 1, 'Jour férié - Assomption');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(93, TO_DATE('2024-08-14', 'yyyy-mm-dd'), 14, 8, 2024, 'semaine', 3, 'mercredi', 32, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(94, TO_DATE('2024-08-13', 'yyyy-mm-dd'), 13, 8, 2024, 'semaine', 3, 'mardi', 32, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(95, TO_DATE('2024-08-12', 'yyyy-mm-dd'), 12, 8, 2024, 'semaine', 3, 'lundi', 32, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(96, TO_DATE('2024-08-11', 'yyyy-mm-dd'), 11, 8, 2024, 'weekend', 3, 'dimanche', 31, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(97, TO_DATE('2024-08-10', 'yyyy-mm-dd'), 10, 8, 2024, 'weekend', 3, 'samedi', 31, 1, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(98, TO_DATE('2024-08-09', 'yyyy-mm-dd'), 9, 8, 2024, 'semaine', 3, 'vendredi', 31, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(99, TO_DATE('2024-08-08', 'yyyy-mm-dd'), 8, 8, 2024, 'semaine', 3, 'jeudi', 31, 0, 0, 'Aucune particularité');
INSERT INTO Dates (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(100, TO_DATE('2024-08-07', 'yyyy-mm-dd'), 7, 8, 2024, 'semaine', 3, 'mercredi', 31, 0, 0, 'Aucune particularité');

