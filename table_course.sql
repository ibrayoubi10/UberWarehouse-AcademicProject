DROP TABLE Course CASCADE CONSTRAINTS;

-- Création de la table fait_COURSE
CREATE TABLE Course (
    ID_COURSE INT,
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

    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 25.50, 5000, 1, 2, 'Termine', 5, 'PROMO10', NULL, 12.75, 4.5);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (2, 2, 2, 2, 2, 3, 5, 2, 2, 2, 30.00, 7000, 2, 1, 'Confirmation', 8, 'PROMO20', NULL, 15.00, 3.8);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (3, 3, 3, 3, 3, 5, 6, 3, 3, 3, 18.75, 3000, 1, 3, 'Prise_en_Charge', 12, NULL, 'Annulation client', 10.50, 4.0);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (4, 4, 4, 4, 4, 7, 9, 4, 4, 4, 40.00, 10000, 2, 4, 'Termine', 4, 'PROMO15', NULL, 20.00, 4.8);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (5, 5, 5, 5, 5, 9, 10, 5, 5, 5, 22.50, 4500, 1, 1, 'Demande', 2, NULL, 'Motif inconnu', 11.00, 3.5);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (6, 6, 6, 6, 6, 11, 13, 6, 6, 6, 28.00, 6000, 2, 2, 'Termine', 6, NULL, NULL, 14.00, 4.3);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (7, 7, 7, 7, 7, 13, 15, 7, 7, 7, 35.00, 8000, 2, 3, 'Confirmation', 10, 'PROMO30', NULL, 18.25, 4.6);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (8, 8, 8, 8, 8, 15, 18, 8, 8, 8, 50.00, 12000, 3, 4, 'Prise_en_Charge', 15, NULL, 'Problème véhicule', 22.50, 4.7);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (9, 9, 9, 9, 9, 10, 12, 9, 9, 9, 45.00, 11000, 2, 3, 'Demande', 4, 'PROMO25', NULL, 21.00, 3.9);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (10, 10, 10, 10, 10, 12, 14, 10, 10, 10, 38.00, 9500, 2, 2, 'Termine', 7, 'PROMO5', NULL, 19.75, 4.2);