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
    Temps_dattente_client INT,
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
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 25.50, 12.3, 30, 2, 5, 20.50, 4.5);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (2, 2, 2, 3, 2, 4, 5, 2, 2, 2, 18.75, 9.4, 25, 3, 10, 15.75, 3.8);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (3, 3, 4, 5, 3, 6, 7, 3, 3, 3, 45.00, 20.0, 60, 4, 8, 40.00, 5.0);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (4, 4, 1, 2, 4, 8, 9, 4, 4, 4, 10.20, 5.1, 15, 1, 12, 8.20, 3.0);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (5, 5, 3, 4, 5, 10, 11, 5, 5, 5, 33.30, 15.8, 45, 3, 6, 28.30, 4.2);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (6, 1, 5, 1, 6, 12, 13, 1, 1, 2, 22.75, 11.2, 35, 2, 4, 18.75, 4.0);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (7, 2, 4, 2, 7, 14, 15, 2, 2, 3, 29.90, 13.7, 40, 4, 3, 25.90, 4.8);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (8, 3, 2, 5, 8, 16, 17, 3, 3, 4, 50.00, 22.5, 75, 3, 5, 45.00, 5.0);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (9, 4, 3, 4, 9, 18, 19, 4, 4, 5, 15.00, 7.0, 20, 2, 9, 10.00, 3.5);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (10, 5, 5, 1, 10, 20, 21, 5, 5, 1, 40.50, 19.0, 60, 4, 7, 35.50, 4.7);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (11, 1, 2, 3, 11, 22, 23, 6, 1, 2, 18.00, 9.0, 25, 2, 8, 14.00, 3.5);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (12, 3, 4, 6, 12, 24, 25, 3, 2, 3, 32.50, 15.6, 50, 3, 5, 27.50, 4.0);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (13, 2, 3, 5, 13, 26, 27, 2, 4, 4, 21.75, 10.8, 40, 4, 6, 18.00, 3.2);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (14, 4, 1, 2, 14, 28, 29, 4, 5, 5, 24.00, 12.5, 30, 3, 7, 20.00, 3.8);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (15, 5, 2, 4, 15, 30, 31, 5, 3, 1, 38.25, 18.7, 55, 4, 9, 33.25, 4.5);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (16, 6, 3, 5, 16, 32, 33, 6, 1, 2, 45.00, 22.5, 70, 4, 6, 40.00, 4.9);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (17, 7, 4, 2, 17, 34, 35, 1, 2, 3, 20.50, 10.0, 35, 2, 5, 16.50, 3.8);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (18, 8, 1, 4, 18, 36, 37, 2, 3, 4, 55.75, 25.3, 90, 4, 8, 48.75, 4.7);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (19, 9, 2, 3, 19, 38, 39, 3, 4, 5, 30.00, 15.0, 50, 3, 4, 25.00, 4.2);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (20, 2, 1, 4, 20, 36, 37, 9, 2, 1, 31.50, 16.2, 70, 2, 4, 28.50, 4.2);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (21, 1, 3, 4, 21, 32, 33, 1, 1, 2, 26.50, 13.2, 35, 3, 6, 23.50, 4.5);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (22, 2, 4, 5, 22, 34, 35, 2, 2, 3, 45.00, 20.1, 65, 2, 4, 38.50, 4.8);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (23, 3, 1, 3, 23, 36, 37, 3, 3, 4, 28.75, 11.5, 40, 4, 7, 24.75, 4.3);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (24, 4, 5, 2, 24, 38, 39, 4, 4, 5, 35.00, 18.0, 50, 1, 8, 30.00, 3.2);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (25, 5, 3, 1, 25, 40, 41, 5, 5, 1, 18.50, 8.9, 30, 2, 5, 15.50, 4.0);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (26, 1, 2, 4, 26, 42, 43, 6, 1, 2, 32.00, 15.0, 45, 3, 6, 28.00, 4.2);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (27, 3, 4, 1, 27, 44, 45, 3, 2, 3, 40.75, 19.3, 55, 4, 3, 35.75, 4.6);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (28, 4, 2, 3, 28, 46, 47, 4, 5, 4, 25.25, 12.8, 35, 3, 5, 20.25, 3.5);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (29, 5, 1, 4, 29, 48, 49, 5, 3, 5, 37.00, 16.5, 50, 2, 4, 32.00, 4.5);
INSERT INTO Course (ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_ARRIVEE, ID_HEURE_DEPART, 
                    ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, Prix, Distance_Parcourue, Duree_Du_Trajet, 
                    Nombre_Passagers, Temps_dattente_client, Revenue_moyen_par_course, Indice_Satisfaction_Client)
VALUES (30, 2, 3, 5, 30, 50, 51, 2, 1, 1, 44.50, 21.7, 70, 4, 6, 39.50, 4.8);

