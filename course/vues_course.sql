CREATE MATERIALIZED VIEW Vue_Analyse_Traite1_2_3 AS
SELECT 
    d.Date_Complète AS Date, -- Date complète
    hd.Heure_Format24h AS Heure, -- Heure de départ
    r.Region AS Region, -- Région de départ
    COUNT(c.ID_COURSE) AS Nombre_Courses, -- Nombre de courses
    SUM(c.Prix) AS Chiffre_Affaires, -- Revenus générés
    AVG(c.Indice_Satisfaction_Client) AS Satisfaction_Moyenne, -- Satisfaction moyenne
    m.Condition_Meteo AS Condition_Meteo -- Conditions météorologiques
FROM 
    Course c
JOIN 
    Dates d ON c.ID_DATE = d.ID_DATE
JOIN 
    Heure_Depart hd ON c.ID_HEURE_DEPART = hd.ID_HEURE_DEPART
JOIN 
    Region r ON c.ID_REGION = r.ID_REGION
JOIN 
    Meteo m ON c.ID_METEO = m.ID_METEO
GROUP BY 
    d.Date_Complète, hd.Heure_Format24h, r.Region, m.Condition_Meteo
ORDER BY 
    d.Date_Complète DESC, hd.Heure_Format24h, r.Region;

-- Vue Performance Clients
CREATE MATERIALIZED VIEW Vue_Performance_Clients AS
SELECT 
   cl.ID_Client,
   cl.Nom,
   cl.Prenom,
   COUNT(c.ID_COURSE) AS Nombre_Courses,
   SUM(c.Prix) AS Total_Depense,
   AVG(c.Prix) AS Depense_Moyenne
FROM Course c
JOIN Client cl ON c.ID_CLIENT = cl.ID_CLIENT
GROUP BY cl.ID_Client, cl.Nom, cl.Prenom;

-- Vue Performance Chauffeurs
CREATE MATERIALIZED VIEW Vue_Performance_Chauffeurs AS
SELECT 
   ch.ID_Chauffeur,
   ch.Nom,
   ch.Prenom,
   COUNT(c.ID_COURSE) AS Nombre_Courses,
   SUM(c.Prix) AS Chiffre_Affaires,
   SUM(c.Distance_Parcourue) AS Distance_Totale,
   ROUND(AVG(c.Indice_Satisfaction_Client), 2) AS Satisfaction_Moyenne
FROM Course c
JOIN Chauffeur ch ON c.ID_CHAUFFEUR = ch.ID_CHAUFFEUR
GROUP BY ch.ID_Chauffeur, ch.Nom, ch.Prenom;


    --Traitement 1 : Analyse des périodes de forte demande et impact sur le chiffre d'affaires
SELECT 
    Heure, 
    SUM(Nombre_Courses) AS Nombre_Courses, 
    SUM(Chiffre_Affaires) AS Chiffre_Affaires
FROM 
    Vue_Analyse_Traite1_2_3
GROUP BY 
    Heure
ORDER BY 
    Nombre_Courses DESC;
--2. Analyser les mois les plus rentables :
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Mois_Annee, 
    SUM(Nombre_Courses) AS Nombre_Courses, 
    SUM(Chiffre_Affaires) AS Chiffre_Affaires
FROM 
    Vue_Analyse_Traite1_2_3
GROUP BY 
    DATE_FORMAT(Date, '%Y-%m')
ORDER BY 
    Nombre_Courses DESC;
--Traitement 2 : Facteurs externes influençant les pics de demande
SELECT 
    Condition_Meteo, 
    SUM(Nombre_Courses) AS Nombre_Courses, 
    ROUND(AVG(Chiffre_Affaires), 2) AS Revenue_Moyen
FROM 
    Vue_Analyse_Traite1_2_3
GROUP BY 
    Condition_Meteo
ORDER BY 
    Nombre_Courses DESC;

--Traitement 3 : Satisfaction des clients par région et type de course
SELECT 
    Region AS Ville_Depart, 
    CASE 
        WHEN Chiffre_Affaires > 100 THEN 'Longues distances' 
        ELSE 'Courtes distances' 
    END AS Type_Course,
    SUM(Nombre_Courses) AS Nombre_Courses, 
    ROUND(AVG(Satisfaction_Moyenne), 2) AS Satisfaction_Moyenne
FROM 
    Vue_Analyse_Traite1_2_3
GROUP BY 
    Region, 
    CASE 
        WHEN Chiffre_Affaires > 100 THEN 'Longues distances' 
        ELSE 'Courtes distances' 
    END
ORDER BY 
    Ville_Depart, Type_Course;

--Traitement 4:  Clients à faible fréquence
SELECT ID_Client, Nom, Prenom, Nombre_Courses, Total_Depense 
FROM Vue_Performance_Clients 
ORDER BY Nombre_Courses ASC 
FETCH FIRST 10 ROWS ONLY;

-- Traitement 5: Performance des chauffeurs
SELECT ID_Chauffeur, Nom, Prenom, Nombre_Courses, Chiffre_Affaires, 
      Distance_Totale, Satisfaction_Moyenne 
FROM Vue_Performance_Chauffeurs 
ORDER BY Nombre_Courses DESC 
FETCH FIRST 10 ROWS ONLY;