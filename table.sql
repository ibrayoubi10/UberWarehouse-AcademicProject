DROP TABLE fait_COURSE;
DROP TABLE  Date;
DROP TABLE  Depart;
DROP TABLE  Arrive;
DROP TABLE  Vehicule;
DROP TABLE Chauffeur;
DROP TABLE  Heure;
DROP TABLE Client;
DROP TABLE Meteo;


-- Création des tables de dimensions

-- Done
CREATE TABLE Client (
    ID_Client INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Age INT,
    Sexe CHAR(1) CHECK (Sexe IN ('H', 'F')),
    Type_Client VARCHAR(20),
    Langue_Preferee VARCHAR(20),
    Email VARCHAR(50),
    Telephone VARCHAR(15),
    Point_gagnee INT
);

-- Done
CREATE TABLE Chauffeur (
    ID_Chauffeur INT PRIMARY KEY,
    Nom VARCHAR(26),
    Prenom VARCHAR(26),
    Date_Embauche DATE,
    Numero_Permis VARCHAR(20),
    Type_Permis VARCHAR(10),
    Telephone VARCHAR(15),
    Email VARCHAR(50),
    Statut VARCHAR(10) CHECK (Statut IN ('actif', 'inactif')),
    Zone_Principale VARCHAR(50)
);

-- Done
CREATE TABLE Depart (
    ID_DEPART INT PRIMARY KEY,
    Adresse VARCHAR(100) NOT NULL,
    Ville VARCHAR(50),
    Code_Postal VARCHAR(10),
    Distance_Centre INT, -- Distance en mètres
    Zone_Urbaine BOOLEAN,
    Prise_En_Charge VARCHAR(50) CHECK(Prise_En_Charge in ('Prise en charge', 'Annule', 'En_Attente')),
    Description_Depart VARCHAR(255)
);

--Done
CREATE TABLE Vehicule (
    ID_Vehicule INT PRIMARY KEY,
    Marque VARCHAR(30),
    Modele VARCHAR(30),
    Annee INT,
    Type_Vehicule VARCHAR(20) CHECK (Type_Vehicule IN ('Essence', 'Diesel', 'Electrique', 'Hybride')),
    Etat_Vehicule VARCHAR(20) CHECK (Etat_Vehicule IN ('Excellent', 'Bon', 'Mauvais')),
    Km_Parcourus INT,
    Derniere_Revision DATE,
    Consommation FLOAT,
    Assurance_Valide BOOLEAN
);

-- Done
CREATE TABLE Arrivee(
    ID_ARRIVEE INT PRIMARY KEY,
    Adresse VARCHAR(100) NOT NULL,
    Ville VARCHAR(50),
    Code_Postal VARCHAR(10),
    Distance_Centre INT, -- Distance en mètres
    Zone_Urbaine BOOLEAN,
    Description_Arrivee VARCHAR(255)
);

--Done
CREATE TABLE Heure (
    ID_HEURE INT PRIMARY KEY,
    Heure_Complete TIME NOT NULL,
    Periode_Journee VARCHAR(15) CHECK (Periode_Journee IN ('matin', 'apres-midi', 'soir', 'nuit')),
    AM_PM VARCHAR(10) CHECK (AM_PM IN ('AM', 'PM')),
    Heure_Pointe BOOLEAN, 
    Heure_Format24h TIME, 
    Fuseau_Horaire VARCHAR(10),
    Heure_UTC TIME
);

-- Done
CREATE TABLE Date (
    ID_DATE INT PRIMARY KEY,
    Date_Complete DATE NOT NULL,
    Jour INT NOT NULL,
    Mois INT,
    Annee INT,
    Type_Jour VARCHAR(15) CHECK (Type_Jour IN ('semaine', 'weekend', 'ferie')),
    Trimestre INT,
    Jour_Semaine VARCHAR(15) CHECK (Jour_Semaine IN ('lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche')),
    Semaine_Annee INT,
    Est_Weekend BOolEAN, 
    Est_Ferie BOOLEAN,
    Commentaire VARCHAR(255)
);

--Done 
CREATE TABLE Meteo (
    ID_METEO INT PRIMARY KEY,
    Date_Meteo DATE NOT NULL,
    Temperature FLOAT,
    Humidite INT CHECK (Humidite BETWEEN 0 AND 100),
    Precipitations FLOAT CHECK (Precipitations >= 0),
    Vent_Vitesse FLOAT CHECK (Vent_Vitesse >= 0),
    Vent_Direction VARCHAR(10),
    Condition_Meteo VARCHAR(50),
    Pression_Atmospherique FLOAT,
    Indice_UV INT CHECK (Indice_UV BETWEEN 0 AND 11)
);

-- Création de la table fait_COURSE
CREATE TABLE fait_COURSE (
    ID_DATE INT, -- Référence vers la dimension Trajet
    ID_ARRIVEE INT, -- Référence vers la dimension Arrivee
    ID_DEPART INT, -- Référence vers la dimension Depart
    ID_CLIENT INT, -- Référence vers la dimension Client
    ID_HEURE INT, -- Référence vers la dimension Heure
    ID_CHAUFFEUR INT, -- Référence vers la dimension Chauffeur
    ID_VEHICULE INT, -- Référence vers la dimension Vehicule
    ID_METEO INT, -- Référence vers la dimension Meteo

    Prix FLOAT, -- Prix total de la course
    Distance_Parcourue FLOAT, -- Distance parcourue en m
    Duree_Du_Trajet INT, -- Durée du trajet en minutes
    Nombre_Passagers INT, -- Nombre de passagers
    Statut_Course VARCHAR(20) CHECK(Statut_Course IN('Demande', 'Confirmation', 'Prise_en_Charge', 'Termine')), -- Statut de la course
    Temps_dattente_client INT, -- Temps d'attente du client en minutes
    Code_Promo VARCHAR(10), -- Code promotionnel utilisé
    Motif_Annulation VARCHAR(255), -- Motif d'annulation de la course
    Revenue_moyen_par_course FLOAT, -- Revenu moyen par course
    Indice_Satisfaction_Client FLOAT, -- Indice de satisfaction du client

    -- Définition de la clé primaire composite
    PRIMARY KEY (ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO),

    FOREIGN KEY (ID_DATE) REFERENCES Date(ID_DATE),
    FOREIGN KEY (ID_ARRIVEE) REFERENCES Arrivee(ID_ARRIVEE),
    FOREIGN KEY (ID_DEPART) REFERENCES Depart(ID_DEPART),
    FOREIGN KEY (ID_CLIENT) REFERENCES Client(ID_Client),
    FOREIGN KEY (ID_HEURE) REFERENCES Heure(ID_HEURE),
    FOREIGN KEY (ID_CHAUFFEUR) REFERENCES Chauffeur(ID_Chauffeur),
    FOREIGN KEY (ID_VEHICULE) REFERENCES Vehicule(ID_Vehicule),
    FOREIGN KEY (ID_METEO) REFERENCES Meteo(ID_METEO)
);
