
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

INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(1, 'Bernard', 'Luc', TO_DATE('2023-01-01', 'yyyy-mm-dd'), '1234567890', 'B', '0123456792', 'luc.bernard@example.com', 'actif', 'Paris');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(2, 'Legrand', 'Sophie', TO_DATE('2018-07-10', 'yyyy-mm-dd'), '0987654321', 'B', '0123456793', 'sophie.legrand@example.com', 'actif', 'Marseille');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(3, 'Lambert', 'Paul', TO_DATE('2019-03-22', 'yyyy-mm-dd'), '1122334455', 'B', '0123456794', 'paul.lambert@example.com', 'inactif', 'Lyon');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(4, 'Nguyen', 'Van', TO_DATE('2022-02-18', 'yyyy-mm-dd'), '2233445566', 'B', '0123456795', 'van.nguyen@example.com', 'actif', 'Paris');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(5, 'Rossi', 'Giulia', TO_DATE('2021-09-10', 'yyyy-mm-dd'), '3344556677', 'B', '0123456796', 'giulia.rossi@example.com', 'actif', 'Milan');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(6, 'Wilson', 'Mark', TO_DATE('2019-11-15', 'yyyy-mm-dd'), '4455667788', 'B', '0123456797', 'mark.wilson@example.com', 'inactif', 'Londres');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(7, 'Müller', 'Laura', TO_DATE('2021-03-28', 'yyyy-mm-dd'), '5566778899', 'B', '0123456798', 'laura.muller@example.com', 'actif', 'Berlin');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(8, 'Hernandez', 'Miguel', TO_DATE('2020-06-30', 'yyyy-mm-dd'), '6677889900', 'B', '0123456799', 'miguel.hernandez@example.com', 'inactif', 'Madrid');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(9, 'Chen', 'Li', TO_DATE('2020-05-12', 'yyyy-mm-dd'), '7788990011', 'B', '0123456800', 'li.chen@example.com', 'actif', 'Shanghai');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(10, 'Garcia', 'Luis', TO_DATE('2017-12-05', 'yyyy-mm-dd'), '8899001122', 'B', '0123456801', 'luis.garcia@example.com', 'actif', 'Barcelona');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(11, 'Johnson', 'Sara', TO_DATE('2018-04-18', 'yyyy-mm-dd'), '9900112233', 'B', '0123456802', 'sara.johnson@example.com', 'actif', 'New York');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(12, 'Patel', 'Amit', TO_DATE('2021-08-01', 'yyyy-mm-dd'), '1011121314', 'B', '0123456803', 'amit.patel@example.com', 'actif', 'Mumbai');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(13, 'Brown', 'Emily', TO_DATE('2019-05-05', 'yyyy-mm-dd'), '1112131415', 'B', '0123456804', 'emily.brown@example.com', 'inactif', 'Sydney');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(14, 'Davis', 'Jake', TO_DATE('2018-10-24', 'yyyy-mm-dd'), '1213141516', 'B', '0123456805', 'jake.davis@example.com', 'actif', 'Chicago');
INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) VALUES
(15, 'Ali', 'Aisha', TO_DATE('2022-07-15', 'yyyy-mm-dd'), '1314151617', 'B', '0123456806', 'aisha.ali@example.com', 'actif', 'Dubai');



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

/*
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Couleur, Immatriculation, Statut) VALUES
(1, 'Toyota', 'Corolla', 2020, 'Berline', 'Blanc', 'AB-123-CD', 'Disponible'),
(2, 'Peugeot', '308', 2018, 'Hatchback', 'Rouge', 'EF-456-GH', 'En_Cours'),
(3, 'BMW', 'X5', 2021, 'SUV', 'Noir', 'IJ-789-KL', 'Disponible'),
(4, 'Renault', 'Clio', 2019, 'Citadine', 'Bleu', 'MN-012-OP', 'En_Cours'),
(5, 'Mercedes', 'Classe A', 2022, 'Berline', 'Gris', 'QR-345-ST', 'Disponible'),
(6, 'Audi', 'A4', 2021, 'Berline', 'Blanc', 'UV-678-WX', 'En_Cours'),
(7, 'Ford', 'Fiesta', 2017, 'Citadine', 'Jaune', 'YZ-901-AB', 'Disponible'),
(8, 'Volvo', 'XC90', 2020, 'SUV', 'Vert', 'CD-234-EF', 'En_Cours'),
(9, 'Opel', 'Corsa', 2016, 'Citadine', 'Orange', 'GH-567-IJ', 'Disponible'),
(10, 'Hyundai', 'Tucson', 2019, 'SUV', 'Violet', 'KL-890-MN', 'En_Cours'),
(11, 'Peugeot', '3008', 2020, 'SUV', 'Gris', 'OP-123-QR', 'Disponible'),
(12, 'Kia', 'Rio', 2018, 'Hatchback', 'Bleu', 'ST-456-UV', 'En_Cours'),
(13, 'Citroën', 'C3', 2022, 'Citadine', 'Blanc', 'WX-789-YZ', 'Disponible'),
(14, 'Mazda', 'CX-5', 2021, 'SUV', 'Rouge', 'AB-012-CD', 'En_Cours'),
(15, 'Nissan', 'Juke', 2020, 'SUV', 'Vert', 'EF-345-GH', 'Disponible');

INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, ID_Vehicule) VALUES
(1, '15 Rue de Rivoli', 'Paris', '75001', '2024-11-14 08:15:00', 1),
(2, '22 Avenue des Champs-Élysées', 'Paris', '75008', '2024-11-14 08:45:00', 2),
(3, '30 Boulevard de la République', 'Lyon', '69001', '2024-11-14 09:00:00', 3),
(4, '12 Rue Montmartre', 'Paris', '75002', '2024-11-14 09:30:00', 4),
(5, '18 Rue de la Paix', 'Paris', '75002', '2024-11-14 10:00:00', 5),
(6, '25 Avenue de la Liberté', 'Marseille', '13001', '2024-11-14 10:15:00', 6),
(7, '20 Rue de la Garonne', 'Toulouse', '31000', '2024-11-14 10:45:00', 7),
(8, '10 Rue du Faubourg', 'Lille', '59000', '2024-11-14 11:00:00', 8),
(9, '8 Rue des Tuileries', 'Paris', '75001', '2024-11-14 11:30:00', 9),
(10, '14 Boulevard Saint-Germain', 'Paris', '75005', '2024-11-14 12:00:00', 10),
(11, '7 Rue de la Plage', 'Nice', '06000', '2024-11-14 12:15:00', 11),
(12, '28 Rue de la Gare', 'Lyon', '69007', '2024-11-14 12:45:00', 12),
(13, '9 Avenue des Alpes', 'Grenoble', '38000', '2024-11-14 13:00:00', 13),
(14, '6 Boulevard de la Côte', 'Marseille', '13006', '2024-11-14 13:30:00', 14),
(15, '17 Rue du Général Leclerc', 'Bordeaux', '33000', '2024-11-14 14:00:00', 15);

INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(1, '08:00:00', 'matin', 'AM', 0, '08:00:00', 'CET', '06:00:00'),
(2, '09:30:00', 'matin', 'AM', 1, '09:30:00', 'CET', '07:30:00'),
(3, '12:00:00', 'apres-midi', 'PM', 1, '12:00:00', 'CET', '10:00:00'),
(4, '13:15:00', 'apres-midi', 'PM', 0, '13:15:00', 'CET', '11:15:00'),
(5, '16:00:00', 'apres-midi', 'PM', 1, '16:00:00', 'CET', '14:00:00'),
(6, '17:30:00', 'soir', 'PM', 0, '17:30:00', 'CET', '15:30:00'),
(7, '19:00:00', 'soir', 'PM', 1, '19:00:00', 'CET', '17:00:00'),
(8, '21:00:00', 'soir', 'PM', 1, '21:00:00', 'CET', '19:00:00'),
(9, '22:45:00', 'nuit', 'PM', 0, '22:45:00', 'CET', '20:45:00'),
(10, '00:15:00', 'nuit', 'AM', 0, '00:15:00', 'CET', '22:15:00'),
(11, '02:00:00', 'nuit', 'AM', 1, '02:00:00', 'CET', '00:00:00'),
(12, '03:30:00', 'nuit', 'AM', 0, '03:30:00', 'CET', '01:30:00'),
(13, '05:00:00', 'matin', 'AM', 1, '05:00:00', 'CET', '03:00:00'),
(14, '06:30:00', 'matin', 'AM', 0, '06:30:00', 'CET', '04:30:00'),
(15, '07:45:00', 'matin', 'AM', 1, '07:45:00', 'CET', '05:45:00');

INSERT INTO Meteo (ID_METEO, Date, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(1, '2024-11-14', 15.3, 65, 0.0, 5.2, 'Nord', 'Ensoleillé', 1013.5, 3),
(2, '2024-11-14', 12.8, 70, 1.2, 4.5, 'Est', 'Nuageux', 1012.0, 2),
(3, '2024-11-14', 18.2, 60, 0.0, 6.1, 'Ouest', 'Partiellement nuageux', 1015.3, 4),
(4, '2024-11-14', 10.0, 80, 2.0, 3.4, 'Sud', 'Pluvieux', 1011.2, 1),
(5, '2024-11-14', 22.5, 55, 0.0, 7.0, 'Nord-Ouest', 'Ensoleillé', 1014.0, 5),
(6, '2024-11-14', 14.0, 75, 0.5, 4.8, 'Sud-Ouest', 'Brumeux', 1012.5, 3),
(7, '2024-11-14', 16.3, 62, 0.0, 3.2, 'Nord-Est', 'Ciel clair', 1013.0, 4),
(8, '2024-11-14', 13.7, 68, 1.0, 5.4, 'Sud', 'Pluie légère', 1010.8, 2),
(9, '2024-11-14', 19.1, 59, 0.0, 4.2, 'Est', 'Soleil intermittent', 1015.8, 4),
(10, '2024-11-14', 9.5, 82, 3.0, 6.7, 'Ouest', 'Orageux', 1011.9, 1),
(11, '2024-11-14', 20.8, 66, 0.0, 2.9, 'Nord', 'Ensoleillé', 1014.3, 5),
(12, '2024-11-14', 11.4, 74, 1.3, 5.1, 'Sud-Est', 'Nuageux', 1012.3, 3),
(13, '2024-11-14', 17.0, 60, 0.0, 3.8, 'Nord-Ouest', 'Partiellement nuageux', 1016.0, 4),
(14, '2024-11-14', 14.9, 72, 0.0, 4.6, 'Est', 'Ciel clair', 1012.7, 4),
(15, '2024-11-14', 18.7, 64, 0.0, 6.3, 'Ouest', 'Ensoleillé', 1014.5, 5);

INSERT INTO Date (ID_DATE, Date_Complete, Jour, Mois, Annee, Type_Jour, Trimestre, Jour_Semaine, Semaine_Annee, Est_Weekend, Est_Ferie, Commentaire) VALUES
(1, '2024-11-14', 14, 11, 2024, 'semaine', 4, 'jeudi', 46, 0, 0, 'Aucune particularité'),
(2, '2024-11-13', 13, 11, 2024, 'semaine', 4, 'mercredi', 46, 0, 0, 'Aucune particularité'),
(3, '2024-11-12', 12, 11, 2024, 'semaine', 4, 'mardi', 46, 0, 0, 'Aucune particularité'),
(4, '2024-11-11', 11, 11, 2024, 'ferie', 4, 'lundi', 46, 0, 1, 'Jour férié - Armistice'),
(5, '2024-11-10', 10, 11, 2024, 'weekend', 4, 'dimanche', 45, 1, 0, 'Aucune particularité'),
(6, '2024-11-09', 9, 11, 2024, 'weekend', 4, 'samedi', 45, 1, 0, 'Aucune particularité'),
(7, '2024-11-08', 8, 11, 2024, 'semaine', 4, 'vendredi', 45, 0, 0, 'Aucune particularité'),
(8, '2024-11-07', 7, 11, 2024, 'semaine', 4, 'jeudi', 45, 0, 0, 'Aucune particularité'),
(9, '2024-11-06', 6, 11, 2024, 'semaine', 4, 'mercredi', 45, 0, 0, 'Aucune particularité'),
(10, '2024-11-05', 5, 11, 2024, 'semaine', 4, 'mardi', 45, 0, 0, 'Aucune particularité'),
(11, '2024-11-04', 4, 11, 2024, 'semaine', 4, 'lundi', 45, 0, 0, 'Aucune particularité'),
(12, '2024-11-03', 3, 11, 2024, 'weekend', 4, 'dimanche', 44, 1, 0, 'Aucune particularité'),
(13, '2024-11-02', 2, 11, 2024, 'weekend', 4, 'samedi', 44, 1, 0, 'Aucune particularité'),
(14, '2024-11-01', 1, 11, 2024, 'ferie', 4, 'vendredi', 44, 0, 1, 'Jour férié - Toussaint'),
(15, '2024-10-31', 31, 10, 2024, 'semaine', 4, 'jeudi', 44, 0, 0, 'Aucune particularité');

INSERT INTO fait_COURSE (
    ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
    Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
    Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client
) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 25.50, 5000, 15, 2, 'Termine', 5, 'PROMO10', NULL, 12.75, 4.5),
(2, 2, 2, 2, 3, 2, 2, 2, 30.00, 7000, 20, 1, 'Confirmation', 8, 'PROMO20', NULL, 15.00, 3.8),
(3, 3, 3, 3, 5, 3, 3, 3, 18.75, 3000, 10, 3, 'Prise_en_Charge', 12, NULL, 'Annulation client', 10.50, 4.0),
(4, 4, 4, 4, 7, 4, 4, 4, 40.00, 10000, 30, 4, 'Termine', 4, 'PROMO15', NULL, 20.00, 4.8),
(5, 5, 5, 5, 9, 5, 5, 5, 22.50, 4500, 12, 1, 'Demande', 2, NULL, 'Motif inconnu', 11.00, 3.5),
(6, 6, 6, 6, 11, 6, 6, 6, 28.00, 6000, 18, 2, 'Termine', 6, NULL, NULL, 14.00, 4.3),
(7, 7, 7, 7, 13, 7, 7, 7, 35.00, 8000, 25, 3, 'Confirmation', 10, 'PROMO30', NULL, 18.25, 4.6),
(8, 8, 8, 8, 15, 8, 8, 8, 50.00, 12000, 35, 4, 'Prise_en_Charge', 15, NULL, 'Problème véhicule', 22.50, 4.7),
(9, 9, 9, 9, 10, 9, 9, 9, 45.00, 11000, 30, 3, 'Demande', 4, 'PROMO25', NULL, 21.00, 3.9),
(10, 10, 10, 10, 12, 10, 10, 10, 38.00, 9500, 22, 2, 'Termine', 7, 'PROMO5', NULL, 19.75, 4.2);

*/ 
