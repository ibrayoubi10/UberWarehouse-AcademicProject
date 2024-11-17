DROP TABLE Course CASCADE CONSTRAINTS;

-- Création de la table fait_COURSE
CREATE TABLE Course (
    ID_COURSE INT, -- attribut degenere pour identifier la course
    ID_DATE INT, 
    ID_ARRIVEE INT, 
    ID_DEPART INT, 
    ID_CLIENT INT, 
    ID_HEURE_ARRIVEE INT,
    ID_HEURE_DEPART INT, 
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
    PRIMARY KEY (ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO),
    FOREIGN KEY (ID_DATE) REFERENCES Dates(ID_DATE),
    FOREIGN KEY (ID_ARRIVEE) REFERENCES Arrivee(ID_ARRIVEE),
    FOREIGN KEY (ID_DEPART) REFERENCES Depart(ID_DEPART),
    FOREIGN KEY (ID_CLIENT) REFERENCES Client(ID_CLIENT),
    FOREIGN KEY (ID_HEURE_ARRIVEE) REFERENCES Heure_Arrivee(ID_HEURE_ARRIVEE),
    FOREIGN KEY (ID_HEURE_DEPART) REFERENCES Heure_Depart(ID_HEURE_DEPART),
    FOREIGN KEY (ID_CHAUFFEUR) REFERENCES Chauffeur(ID_CHAUFFEUR),
    FOREIGN KEY (ID_VEHICULE) REFERENCES Vehicule(ID_VEHICULE),
    FOREIGN KEY (ID_METEO) REFERENCES Meteo(ID_METEO)
    );

INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Statut_Course, Temps_dattente_client, Code_Promo, Motif_Annulation, 
                    Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 25.50, 12.3, 30, 2, 'Termine', 5, 'PROMO10', NULL, 20.50, 4.5);

INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Statut_Course, Temps_dattente_client, Code_Promo, Motif_Annulation, 
                    Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (2, 2, 2, 3, 2, 4, 5, 2, 2, 2, 18.75, 9.4, 25, 3, 'Confirmation', 10, NULL, NULL, 15.75, 3.8);

INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Statut_Course, Temps_dattente_client, Code_Promo, Motif_Annulation, 
                    Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (3, 3, 4, 5, 3, 6, 7, 3, 3, 3, 45.00, 20.0, 60, 4, 'Prise_en_Charge', 8, 'PROMO15', NULL, 40.00, 5.0);

INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Statut_Course, Temps_dattente_client, Code_Promo, Motif_Annulation, 
                    Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (4, 4, 1, 2, 4, 8, 9, 4, 4, 4, 10.20, 5.1, 15, 1, 'Demande', 12, NULL, 'Client indisponible', 8.20, 3.0);

INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Statut_Course, Temps_dattente_client, Code_Promo, Motif_Annulation, 
                    Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (5, 5, 3, 4, 5, 10, 11, 5, 5, 5, 33.30, 15.8, 45, 3, 'Termine', 6, 'PROMO5', NULL, 28.30, 4.2);
