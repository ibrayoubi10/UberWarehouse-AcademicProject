
-- Traitement 1 : Analyser le nombre de courses effectuées par heure, jour et mois pour identifier les périodes de forte demande et en 
-- mesurer l'impact sur le chiffre d'affaires.

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

-- Traitement 2 : Identifier les facteurs externes (événements, météo) influençant les pics de demande 
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


--Traitement 3 : Évaluer la satisfaction des clients par région, en distinguant les courses longues et courtes, 
-- pour mieux orienter les offres et optimiser les investissements.

/*
NB : 
L'instruction CASE en SQL permet d'effectuer des évaluations conditionnelles dans une requête. 
Elle teste des conditions avec WHEN et retourne des valeurs spécifiques en fonction de la condition rencontrée. 
Si aucune condition n'est remplie, la clause ELSE définit la valeur par défaut, et l'expression se termine par END.
*/

SELECT 
    d.Ville AS Ville_Depart,
    CASE 
        WHEN c.Distance_Parcourue > 15 THEN 'Longues distances'
        ELSE 'Courtes distances'
    END AS Type_Course,
    COUNT(*) AS Nombre_Courses,
    ROUND(AVG(c.Indice_Satisfaction_Client), 2) AS Satisfaction_Moyenne
FROM Course c
JOIN Depart d ON c.ID_DEPART = d.ID_DEPART
GROUP BY d.Ville, 
         CASE 
             WHEN c.Distance_Parcourue > 15 THEN 'Longues distances'
             ELSE 'Courtes distances'
         END
ORDER BY d.Ville, Type_Course;



-- Traitement 4 : Identifier les clients qui utilisent le moins fréquemment les services UberX afin d'améliorer leur fidélité.
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


-- Traitement 5 :  Analyser les performances des chauffeurs afin d'attribuer des primes et des incitations aux chauffeurs 
-- les plus performants, en se basant sur des critères tels que le nombre de courses effectuées, le chiffre d'affaires généré, 
-- la distance parcourue et la satisfaction des clients afin d'attribuer des primes aux plus engagés.


SELECT 
    ch.ID_Chauffeur,
    ch.Nom,
    ch.Prenom,
    COUNT(c.ID_COURSE) AS Nombre_Courses,
    SUM(c.Prix) AS Chiffre_Affaires,
    SUM(c.Distance_Parcourue) AS Distance_Totale,
    ROUND(AVG(c.Indice_Satisfaction_Client), 2) AS Satisfaction_Moyenne
FROM 
    Course c
JOIN 
    Chauffeur ch ON c.ID_CHAUFFEUR = ch.ID_CHAUFFEUR
GROUP BY 
    ch.ID_Chauffeur, ch.Nom, ch.Prenom
ORDER BY 
    Nombre_Courses DESC
FETCH FIRST 10 ROWS ONLY;




