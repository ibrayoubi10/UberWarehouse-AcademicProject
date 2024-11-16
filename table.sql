DROP TABLE Client;
DROP TABLE Chauffeur;
DROP TABLE  Depart;
DROP TABLE  Vehicule;
DROP TABLE  Arrivee;
DROP TABLE  Heure;
DROP TABLE  Dates;
DROP TABLE Meteo;
DROP TABLE Course;

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
    Heure_Depart TIMESTAMP,
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
    Heure_Arrivee TIMESTAMP,
    Distance_Centre INT, -- Distance en mètres
    Zone_Urbaine Number(1,0),
    Description_Arrivee  VARCHAR2(255)
);

--Done
CREATE TABLE Heure (
    ID_HEURE INT PRIMARY KEY,
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


-- Création de la table fait_COURSE
CREATE TABLE Course (
    ID_COURSE INT PRIMARY KEY,
    ID_DATE INT, 
    ID_ARRIVEE INT, 
    ID_DEPART INT, 
    ID_CLIENT INT, 
    ID_HEURE INT, 
    ID_CHAUFFEUR INT, 
    ID_VEHICULE INT, 
    ID_METEO INT,
    Prix NUMBER(10,2),
    Distance_Parcourue NUMBER(10,2),
    Duree_Du_Trajet INT,
    Nombre_Passagers INT,
    Statut_Course VARCHAR2(20) CHECK(Statut_Course IN('Demande', 'Confirmation', 'Prise_en_Charge', 'Termine')),
    Temps_dattente_client INT,
    Code_Promo VARCHAR2(10),
    Motif_Annulation VARCHAR2(255),
    Revenue_moyen_par_course NUMBER(10,2),
    Indice_Satisfaction_Client NUMBER(10,2), 
    
    FOREIGN KEY (ID_DATE) REFERENCES Dates(ID_DATE),
    FOREIGN KEY (ID_ARRIVEE) REFERENCES Arrivee(ID_ARRIVEE),
    FOREIGN KEY (ID_DEPART) REFERENCES Depart(ID_DEPART),
    FOREIGN KEY (ID_CLIENT) REFERENCES Client(ID_CLIENT),
    FOREIGN KEY (ID_HEURE) REFERENCES Heure(ID_HEURE),
    FOREIGN KEY (ID_CHAUFFEUR) REFERENCES Chauffeur(ID_CHAUFFEUR),
    FOREIGN KEY (ID_VEHICULE) REFERENCES Vehicule(ID_VEHICULE),
    FOREIGN KEY (ID_METEO) REFERENCES Meteo(ID_METEO)
    );

    

    /*
  
    */



