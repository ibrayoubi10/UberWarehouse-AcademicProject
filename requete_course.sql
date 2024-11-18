
-- 1. **Analyse du nombre de courses par heure et chiffre d’affaires généré**
-- Cette requête identifie les heures de forte demande et mesure leur impact sur le chiffre d’affaires.
SELECT 
    hd.Heure_Format24h AS Heure,
    COUNT(c.ID_COURSE) AS Nombre_Courses,
    SUM(c.Prix) AS Chiffre_Affaires
FROM 
    Course c
JOIN 
    Heure_Depart hd ON c.ID_HEURE_DEPART = hd.ID_HEURE_DEPART
GROUP BY 
    hd.Heure_Format24h
ORDER BY 
    Nombre_Courses DESC;

-- 2. **Nombre de courses par mois et chiffre d’affaires généré**
-- Cette requête met en évidence les mois les plus rentables, permettant une analyse saisonnière.
SELECT 
    d.Mois,
    d.Annee,
    COUNT(c.ID_COURSE) AS Nombre_Courses,
    SUM(c.Prix) AS Chiffre_Affaires
FROM 
    Course c
JOIN 
    Dates d ON c.ID_DATE = d.ID_DATE
GROUP BY 
    d.Mois, d.Annee
ORDER BY 
    Nombre_Courses DESC;

-- 3. **Analyse des courses en fonction des conditions météo**
-- Permet de comprendre l'impact des conditions météorologiques sur le nombre de courses et les revenus moyens.
SELECT 
    m.Condition_Meteo,
    COUNT(c.ID_COURSE) AS Nombre_Courses,
    AVG(c.Prix) AS Revenue_Moyen
FROM 
    Course c
JOIN 
    Meteo m ON c.ID_METEO = m.ID_METEO
GROUP BY 
    m.Condition_Meteo
ORDER BY 
    Nombre_Courses DESC;

-- 4. **Analyse des périodes de faible demande par jour de la semaine**
-- Identifie les jours les moins fréquentés afin de créer des offres ciblées pour stimuler la demande.
SELECT 
    d.Jour_Semaine,
    COUNT(c.ID_COURSE) AS Nombre_Courses,
    AVG(c.Prix) AS Revenue_Moyen
FROM 
    Course c
JOIN 
    Dates d ON c.ID_DATE = d.ID_DATE
GROUP BY 
    d.Jour_Semaine
ORDER BY 
    Nombre_Courses ASC;

-- 5. **Liste des clients avec le moins de courses**
-- Permet d'identifier les clients à faible fréquence pour améliorer leur fidélisation.
SELECT 
    cl.ID_Client,
    cl.Nom,
    cl.Prenom,
    COUNT(c.ID_COURSE) AS Nombre_Courses,
    SUM(c.Prix) AS Total_Depense
FROM 
    Course c
JOIN 
    Client cl ON c.ID_CLIENT = cl.ID_CLIENT
GROUP BY 
    cl.ID_Client, cl.Nom, cl.Prenom
ORDER BY 
    Nombre_Courses ASC
FETCH FIRST 10 ROWS ONLY;

-- 6. **Identification des clients avec un faible indice de satisfaction**
-- Aide à comprendre les problèmes des clients insatisfaits et à améliorer leur expérience.
SELECT 
    cl.ID_Client,
    cl.Nom,
    cl.Prenom,
    AVG(c.Indice_Satisfaction_Client) AS Satisfaction_Moyenne,
    COUNT(c.ID_COURSE) AS Nombre_Courses
FROM 
    Course c
JOIN 
    Client cl ON c.ID_CLIENT = cl.ID_CLIENT
GROUP BY 
    cl.ID_Client, cl.Nom, cl.Prenom
HAVING 
    AVG(c.Indice_Satisfaction_Client) < 3
ORDER BY 
    Satisfaction_Moyenne ASC;


