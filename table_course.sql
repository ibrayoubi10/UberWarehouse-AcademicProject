DROP TABLE Course;

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