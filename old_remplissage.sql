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

INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(1, '10 Rue de la Paix', 'Paris', '75002', TO_TIMESTAMP('2024-11-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000, 1, 'Prise en charge', 'Proche de la place Vendôme');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(2, '25 Avenue du Prado', 'Marseille', '13006', TO_TIMESTAMP('2024-11-15 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2000, 1, 'En_Attente', 'Centre ville');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(3, '5 Boulevard des Belges', 'Lyon', '69006', TO_TIMESTAMP('2024-11-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3000, 0, 'Annule', 'Quartier résidentiel');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(4, '12 Rue du Bac', 'Paris', '75007', TO_TIMESTAMP('2024-11-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1500, 1, 'Prise en charge', 'Près de la Tour Eiffel');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(5, '50 Rue Nationale', 'Lille', '59800', TO_TIMESTAMP('2024-11-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 500, 1, 'Prise en charge', 'Proche de la gare Lille Flandres');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(6, '8 Rue de Rivoli', 'Paris', '75004', TO_TIMESTAMP('2024-11-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1800, 1, 'En_Attente', 'Près de l’Hôtel de Ville');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(7, '3 Place Bellecour', 'Lyon', '69002', TO_TIMESTAMP('2024-11-15 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2700, 1, 'Annule', 'Centre de Lyon');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(8, '14 Cours Mirabeau', 'Aix-en-Provence', '13100', TO_TIMESTAMP('2024-11-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3200, 1, 'Prise en charge', 'Près de la Fontaine de la Rotonde');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(9, '22 Rue Espariat', 'Marseille', '13001', TO_TIMESTAMP('2024-11-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1900, 1, 'En_Attente', 'Centre historique');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(10, '7 Avenue Montaigne', 'Paris', '75008', TO_TIMESTAMP('2024-11-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1400, 1, 'Prise en charge', 'Proche des Champs-Élysées');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(11, '9 Rue du Louvre', 'Paris', '75001', TO_TIMESTAMP('2024-11-15 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 900, 1, 'Annule', 'Près du musée du Louvre');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(12, '30 Rue de la Liberté', 'Dijon', '21000', TO_TIMESTAMP('2024-11-15 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 400, 0, 'Prise en charge', 'Centre de Dijon');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(13, '6 Rue Saint-Dominique', 'Paris', '75007', TO_TIMESTAMP('2024-11-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1300, 1, 'En_Attente', 'Près des Invalides');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(14, '3 Rue Sainte-Catherine', 'Bordeaux', '33000', TO_TIMESTAMP('2024-11-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1200, 1, 'Prise en charge', 'Centre de Bordeaux');
INSERT INTO Depart (ID_DEPART, Adresse, Ville, Code_Postal, Heure_Depart, Distance_Centre, Zone_Urbaine, Prise_En_Charge, Description_Depart) VALUES
(15, '24 Place Stanislas', 'Nancy', '54000', TO_TIMESTAMP('2024-11-15 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), 800, 0, 'Prise en charge', 'Centre historique de Nancy');

INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(1, 'Toyota', 'Corolla', 2019, 'Essence', 'Excellent', 30000, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 6.5, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(2, 'Ford', 'Focus', 2020, 'Diesel', 'Bon', 45000, TO_DATE('2022-11-22', 'YYYY-MM-DD'), 5.2, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(3, 'Tesla', 'Model 3', 2021, 'Electrique', 'Excellent', 12000, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(4, 'BMW', '320i', 2018, 'Essence', 'Mauvais', 75000, TO_DATE('2022-06-30', 'YYYY-MM-DD'), 8.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(5, 'Audi', 'A3', 2017, 'Diesel', 'Bon', 60000, TO_DATE('2023-07-18', 'YYYY-MM-DD'), 7.2, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(6, 'Volkswagen', 'Golf', 2019, 'Essence', 'Excellent', 25000, TO_DATE('2023-04-10', 'YYYY-MM-DD'), 6.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(7, 'Honda', 'Civic', 2020, 'Essence', 'Bon', 35000, TO_DATE('2023-03-25', 'YYYY-MM-DD'), 7.5, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(8, 'Nissan', 'Altima', 2021, 'Diesel', 'Excellent', 15000, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 5.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(9, 'Chevrolet', 'Malibu', 2022, 'Hybride', 'Bon', 5000, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 4.5, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(10, 'Hyundai', 'Elantra', 2020, 'Essence', 'Mauvais', 80000, TO_DATE('2022-09-11', 'YYYY-MM-DD'), 8.3, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(11, 'Mercedes', 'A-Class', 2021, 'Essence', 'Excellent', 10000, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 6.2, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(12, 'Kia', 'Soul', 2021, 'Electrique', 'Bon', 20000, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 0.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(13, 'Renault', 'Clio', 2018, 'Diesel', 'Mauvais', 95000, TO_DATE('2022-05-18', 'YYYY-MM-DD'), 7.0, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(14, 'Peugeot', '208', 2019, 'Essence', 'Bon', 40000, TO_DATE('2023-08-12', 'YYYY-MM-DD'), 6.8, 1);
INSERT INTO Vehicule (ID_Vehicule, Marque, Modele, Annee, Type_Vehicule, Etat_Vehicule, Km_Parcourus, Derniere_Revision, Consommation, Assurance_Valide) VALUES
(15, 'Mazda', 'CX-5', 2020, 'Essence', 'Excellent', 28000, TO_DATE('2023-06-09', 'YYYY-MM-DD'), 7.1, 1);

INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (1, '22 Rue de la République', 'Paris', '75003', to_timestamp('2024-11-15 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1500, 1, 'Arrivée près du Marais');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (2, '14 Rue de la Canebière', 'Marseille', '13001', to_timestamp('2024-11-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000, 1, 'Arrivée à proximité du Vieux-Port');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (3, '8 Place des Terreaux', 'Lyon', '69001', to_timestamp('2024-11-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2000, 0, 'Arrivée dans le quartier historique');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (4, '16 Avenue des Champs-Élysées', 'Paris', '75008', to_timestamp('2024-11-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000, 1, 'Arrivée au cœur de Paris');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (5, '30 Boulevard de la Liberté', 'Lille', '59000', to_timestamp('2024-11-15 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), 500, 1, 'Arrivée à proximité de la gare Lille Flandres');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (6, '5 Rue de la Concorde', 'Paris', '75008', to_timestamp('2024-11-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1800, 1, 'Arrivée près de l’Hôtel de Ville');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (7, '10 Rue de la République', 'Lyon', '69002', to_timestamp('2024-11-15 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2200, 1, 'Arrivée dans le quartier des Brotteaux');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (8, '25 Rue d\Italie', 'Aix-en-Provence', '13100', to_timestamp('2024-11-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3000, 1, 'Arrivée proche du Cours Mirabeau');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (9, '17 Rue de la Palud', 'Marseille', '13006', to_timestamp('2024-11-15 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1600, 1, 'Arrivée dans le centre historique');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (10, '6 Rue de Rivoli', 'Paris', '75001', to_timestamp('2024-11-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1200, 1, 'Arrivée au bord de la Seine');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (11, '4 Rue de la Montagne Sainte-Geneviève', 'Paris', '75005', to_timestamp('2024-11-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 800, 1, 'Arrivée près du Panthéon');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (12, '20 Place François Rude', 'Dijon', '21000', to_timestamp('2024-11-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 500, 0, 'Arrivée au cœur du centre-ville');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (13, '12 Rue de Grenelle', 'Paris', '75007', to_timestamp('2024-11-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1500, 1, 'Arrivée à proximité du musée d\Orsay');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (14, '9 Place de la Bourse', 'Bordeaux', '33000', to_timestamp('2024-11-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1200, 1, 'Arrivée au centre de Bordeaux');
INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, Heure_Arrivee, distance_centre, Zone_Urbaine, Description_Arrivee) 
VALUES (15, '7 Rue de la Vieille-Draperie', 'Nancy', '54000', to_timestamp('2024-11-15 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 800, 0, 'Arrivée près de la Place Stanislas');


INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(1, '08:00:00', 'matin', 'AM', 0, '08:00:00', 'CET', '06:00:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(2, '09:30:00', 'matin', 'AM', 1, '09:30:00', 'CET', '07:30:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(3, '12:00:00', 'apres-midi', 'PM', 1, '12:00:00', 'CET', '10:00:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(4, '13:15:00', 'apres-midi', 'PM', 0, '13:15:00', 'CET', '11:15:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(5, '16:00:00', 'apres-midi', 'PM', 1, '16:00:00', 'CET', '14:00:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(6, '17:30:00', 'soir', 'PM', 0, '17:30:00', 'CET', '15:30:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(7, '19:00:00', 'soir', 'PM', 1, '19:00:00', 'CET', '17:00:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(8, '21:00:00', 'soir', 'PM', 1, '21:00:00', 'CET', '19:00:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(9, '22:45:00', 'nuit', 'PM', 0, '22:45:00', 'CET', '20:45:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(10, '00:15:00', 'nuit', 'AM', 0, '00:15:00', 'CET', '22:15:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(11, '02:00:00', 'nuit', 'AM', 1, '02:00:00', 'CET', '00:00:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(12, '03:30:00', 'nuit', 'AM', 0, '03:30:00', 'CET', '01:30:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(13, '05:00:00', 'matin', 'AM', 1, '05:00:00', 'CET', '03:00:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(14, '06:30:00', 'matin', 'AM', 0, '06:30:00', 'CET', '04:30:00');
INSERT INTO Heure (ID_HEURE, Heure_Complete, Periode_Journee, AM_PM, Heure_Pointe, Heure_Format24h, Fuseau_Horaire, Heure_UTC) VALUES
(15, '07:45:00', 'matin', 'AM', 1, '07:45:00', 'CET', '05:45:00');


INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(1, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 15.3, 65, 0.0, 5.2, 'Nord', 'Ensoleillé', 1013.5, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(2, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 12.8, 70, 1.2, 4.5, 'Est', 'Nuageux', 1012.0, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(3, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 18.2, 60, 0.0, 6.1, 'Ouest', 'Partiellement nuageux', 1015.3, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(4, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 10.0, 80, 2.0, 3.4, 'Sud', 'Pluvieux', 1011.2, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(5, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 22.5, 55, 0.0, 7.0, 'Nord-Ouest', 'Ensoleillé', 1014.0, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(6, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 14.0, 75, 0.5, 4.8, 'Sud-Ouest', 'Brumeux', 1012.5, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(7, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 16.3, 62, 0.0, 3.2, 'Nord-Est', 'Ciel clair', 1013.0, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(8, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 13.7, 68, 1.0, 5.4, 'Sud', 'Pluie légère', 1010.8, 2);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(9, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 19.1, 59, 0.0, 4.2, 'Est', 'Soleil intermittent', 1015.8, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(10, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 9.5, 82, 3.0, 6.7, 'Ouest', 'Orageux', 1011.9, 1);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(11, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 20.8, 66, 0.0, 2.9, 'Nord', 'Ensoleillé', 1014.3, 5);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(12, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 11.4, 74, 1.3, 5.1, 'Sud-Est', 'Nuageux', 1012.3, 3);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(13, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 17.0, 60, 0.0, 3.8, 'Nord-Ouest', 'Partiellement nuageux', 1016.0, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(14, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 14.9, 72, 0.0, 4.6, 'Est', 'Ciel clair', 1012.7, 4);
INSERT INTO Meteo (ID_METEO, Date_Meteo, Temperature, Humidite, Precipitations, Vent_Vitesse, Vent_Direction, Condition_Meteo, Pression_Atmospherique, Indice_UV) VALUES
(15, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 18.7, 64, 0.0, 6.3, 'Ouest', 'Ensoleillé', 1014.5, 5);



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
    (9, 9, 9, 9, 9, 10, 12, 9, 9, 9, 45.00, 11000, 2, 3, 'Demande', 4, 'PROMO25', NULL, 21.00, 3.9);
    INSERT INTO Course (
        ID_COURSE, ID_DATE, ID_ARRIVEE, ID_DEPART, ID_CLIENT, ID_HEURE_DEPART, ID_HEURE_ARRIVEE, ID_CHAUFFEUR, ID_VEHICULE, ID_METEO, 
        Prix, Distance_Parcourue, Duree_Du_Trajet, nombre_passagers, Statut_Course, Temps_dattente_client, 
        Code_Promo, Motif_Annulation, Revenue_moyen_par_course, Indice_Satisfaction_Client) VALUES
    (10, 10, 10, 10, 10, 12, 14, 10, 10, 10, 38.00, 9500, 2, 2, 'Termine', 7, 'PROMO5', NULL, 19.75, 4.2);


