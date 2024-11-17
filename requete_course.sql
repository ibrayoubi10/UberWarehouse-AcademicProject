--requetes pour le traitment 1 des courses 
SELECT d.Jour_Semaine AS Jour, d.Mois, d.Annee, hd.Heure_Format24h AS Heure, COUNT(c.ID_COURSE) AS Nombre_Courses,
    SUM(c.Prix) AS Chiffre_Affaires
FROM  Course c JOIN  Dates d ON c.ID_DATE = d.ID_DATE JOIN Heure_Depart hd ON c.ID_HEURE_DEPART = hd.ID_HEURE_DEPART
GROUP BY d.Jour_Semaine, d.Mois, d.Annee, hd.Heure_Format24h
ORDER BY d.Annee, d.Mois, d.Jour_Semaine, hd.Heure_Format24h;

--requetes pour le traitment 2 des courses
SELECT 
    m.Condition_Meteo,
    m.Temperature,
    d.Jour_Semaine,
    COUNT(c.ID_COURSE) AS Nombre_Courses
FROM 
    Course c
JOIN 
    Meteo m ON c.ID_METEO = m.ID_METEO
JOIN 
    Dates d ON c.ID_DATE = d.ID_DATE
WHERE 
    m.Condition_Meteo IS NOT NULL
GROUP BY 
    m.Condition_Meteo, m.Temperature, d.Jour_Semaine
ORDER BY 
    Nombre_Courses DESC;

--requetes pour le traitment 3 des courses
SELECT 
    d.Jour_Semaine,
    hd.Heure_Format24h,
    COUNT(c.ID_COURSE) AS Nombre_Courses
FROM 
    Course c
JOIN 
    Dates d ON c.ID_DATE = d.ID_DATE
JOIN 
    Heure_Depart hd ON c.ID_HEURE_DEPART = hd.ID_HEURE_DEPART
GROUP BY 
    d.Jour_Semaine, hd.Heure_Format24h
HAVING 
    COUNT(c.ID_COURSE) < (SELECT AVG(TotalCourses)FROM (SELECT COUNT(c1.ID_COURSE) AS TotalCourses FROM Course c1 GROUP BY c1.ID_DATE)) ORDER BY 
    Nombre_Courses ASC;

--requete pour le traitement 4 
SELECT 
    cl.ID_Client,
    cl.Nom,
    cl.Prenom,
    COUNT(c.ID_COURSE) AS Nombre_Courses
FROM 
    Client cl
LEFT JOIN 
    Course c ON cl.ID_Client = c.ID_CLIENT
GROUP BY 
    cl.ID_Client, cl.Nom, cl.Prenom
HAVING 
    COUNT(c.ID_COURSE) <= 5
ORDER BY 
    Nombre_Courses ASC;
