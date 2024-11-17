DROP TABLE Date_debut_evenement CASCADE CONSTRAINTS;
DROP TABLE Date_fin_evenement CASCADE CONSTRAINTS;
DROP TABLE Dimension_Region CASCADE CONSTRAINTS;
DROP TABLE Dimension_Evenement CASCADE CONSTRAINTS;
DROP TABLE Dimension_Employe CASCADE CONSTRAINTS;
DROP TABLE Dimension_Equipe CASCADE CONSTRAINTS;
DROP TABLE Fait_Suivi_Employe;

-- Création de la table Date_debut_evenement
CREATE TABLE Date_debut_evenement (
    ID_Date_Debut_Evenement INT PRIMARY KEY,
    Date_Debut_Evenement DATE NOT NULL,
    Jour VARCHAR2(20),
    Mois VARCHAR2(20),
    Trimestre VARCHAR2(2),
    Annee NUMBER(4),
    Saison VARCHAR2(20),
    Ferie CHAR(1) CHECK (Ferie IN ('Y', 'N')),
    Semaine NUMBER(2),
    Jour_ou_Nuit CHAR(1) CHECK (Jour_ou_Nuit IN ('J', 'N')),
    Mois_Annee VARCHAR2(20)
);

-- Création de la table Date_fin_evenement
CREATE TABLE Date_fin_evenement (
    ID_Date_Fin_Evenement INT PRIMARY KEY,
    Date_Fin_Evenement DATE NOT NULL,
    Jour VARCHAR2(20),
    Mois VARCHAR2(20),
    Trimestre VARCHAR2(2),
    Annee NUMBER(4),
    Saison VARCHAR2(20),
    Ferie CHAR(1) CHECK (Ferie IN ('Y', 'N')),
    Semaine NUMBER(2),
    Jour_ou_Nuit CHAR(1) CHECK (Jour_ou_Nuit IN ('J', 'N')),
    Mois_Annee VARCHAR2(20)
);

-- Création de la table Dimension_Region
CREATE TABLE Dimension_Region (
    ID_Region NUMBER PRIMARY KEY,
    Nom_Region VARCHAR2(100),
    Pays VARCHAR2(50),
    Zone_Geographique VARCHAR2(20),
    Code_Postal VARCHAR2(10),
    Capital CHAR(1) CHECK (Capital IN ('Y', 'N')),
    Superficie NUMBER(10, 2),
    Population NUMBER(10),
    Statut_Regional VARCHAR2(20),
    Indice_de_Developpement NUMBER(5, 2)
);

-- Création de la table Dimension_Evenement
CREATE TABLE Dimension_Evenement (
    ID_Evenement NUMBER PRIMARY KEY,
    Type_Evenement VARCHAR2(50),
    Description_Evenement VARCHAR2(255),
    Cout_Evenement NUMBER(10, 2),
    Priorite VARCHAR2(20),
    Support CHAR(1) CHECK (Support IN ('Y', 'N')),
    Type_Impact VARCHAR2(20),
    Impact_Evenement_Societe VARCHAR2(20)
);

-- Création de la table Dimension_Equipe
CREATE TABLE Dimension_Equipe (
    ID_Equipe NUMBER PRIMARY KEY,
    Nom_Equipe VARCHAR2(100),
    Chef_d_Equipe VARCHAR2(100),
    Taille_Equipe NUMBER(5),
    Type_Equipe VARCHAR2(50),
    Budget_Equipe NUMBER(15, 2),
    Lieu_Equipe VARCHAR2(100),
    Mission_Principale VARCHAR2(255),
    Moyenne_Performance NUMBER(5, 2)
);

-- Création de la table Dimension_Employe
CREATE TABLE Dimension_Employe (
    ID_Employe NUMBER PRIMARY KEY,
    Nom_Employe VARCHAR2(100),
    Prenom_Employe VARCHAR2(100),
    Date_Naissance DATE,
    Poste_Occupe VARCHAR2(50),
    Date_Embauche DATE,
    Salaire NUMBER(15, 2),
    Email_Employe VARCHAR2(100),
    Telephone_Employe VARCHAR2(15),
    Adresse_Employe VARCHAR2(255)
);


-- Création de la table de faits Fait_Suivi_Employe
CREATE TABLE Fait_Suivi_Employe (
    -- Clés étrangères vers les dimensions
    ID_Date_Debut_Evenement INT NOT NULL,
    ID_Date_Fin_Evenement INT NOT NULL,
    ID_Employe NUMBER NOT NULL,
    ID_Region NUMBER NOT NULL,
    ID_Evenement NUMBER NOT NULL,
    ID_Equipe NUMBER NOT NULL,
    Cout_Evenement NUMBER(15, 2) NOT NULL,
    Satisfaction_Employe NUMBER(2, 1) CHECK (Satisfaction_Employe BETWEEN 1 AND 10), 
    Duree NUMBER(5, 2) NOT NULL,
    PRIMARY KEY (ID_Date_Debut_Evenement, ID_Date_Fin_Evenement, ID_Employe, ID_Region, ID_Evenement, ID_Equipe), 
    FOREIGN KEY (ID_Date_Debut_Evenement) REFERENCES Date_debut_evenement (ID_Date_Debut_Evenement),
    FOREIGN KEY (ID_Date_Fin_Evenement)
        REFERENCES Date_fin_evenement (ID_Date_Fin_Evenement),
    FOREIGN KEY (ID_Employe)
        REFERENCES Dimension_Employe (ID_Employe),
    FOREIGN KEY (ID_Region)
        REFERENCES Dimension_Region (ID_Region),
    FOREIGN KEY (ID_Evenement)
        REFERENCES Dimension_Evenement (ID_Evenement),
    FOREIGN KEY (ID_Equipe)
        REFERENCES Dimension_Equipe (ID_Equipe)
);