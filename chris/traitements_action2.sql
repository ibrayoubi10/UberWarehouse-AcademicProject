-- Action 2 - Traitement des données

-- Traitement 1 : Analyser les scores de satisfaction des employés par équipe et par région :

-- Requete SQL :
SELECT 
    R.Nom_Region AS Region, 
    E.Nom_Equipe AS Equipe, 
    AVG(F.Satisfaction_Employe) AS Sat_Moy, 
    MIN(F.Satisfaction_Employe) AS Sat_Min, 
    MAX(F.Satisfaction_Employe) AS Sat_Max, 
    COUNT(F.ID_Employe) AS Nbre_Emp 
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Region R ON F.ID_Region = R.ID_Region
JOIN 
    Dimension_Equipe E ON F.ID_Equipe = E.ID_Equipe
GROUP BY 
    R.Nom_Region, E.Nom_Equipe
HAVING 
    AVG(F.Satisfaction_Employe) < 8 
ORDER BY 
    Sat_Moy ASC; 

--

-- Traitement 2 : Identifier les événements les plus coûteux et évaluer leur impact :

-- Avant d'exécuter la requête suivante, nous avons optimisé l'affichage des résultats en ajustant le format des colonnes pour mieux rendre compte des informations. 
-- Ces ajustements permettent d’afficher des résultats plus lisibles et structurés pour l'utilisateur.

-- Déclaration des formats de colonnes
COLUMN TYPE_EV FORMAT A25
COLUMN DESCR FORMAT A50
COLUMN IMPACT FORMAT A15
COLUMN EQUIPE FORMAT A30
COLUMN COUT_TOTAL FORMAT 999,999
COLUMN NBRE_PART FORMAT 999
COLUMN NOMBRE_EQUIPES FORMAT 999

-- Requete SQL :
SELECT 
    Ev.Type_Evenement AS Type_Ev, 
    Ev.Description_Evenement AS Descr, 
    Ev.Impact_Evenement_Societe AS Impact,
    Eq.Nom_Equipe AS Equipe, 
    SUM(F.Cout_Evenement) AS Cout_Total,
    COUNT(F.ID_Employe) AS Nbre_Part, 
    COUNT(DISTINCT F.ID_Equipe) AS Nombre_Equipes 
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Evenement Ev ON F.ID_Evenement = Ev.ID_Evenement
LEFT JOIN 
    Dimension_Equipe Eq ON F.ID_Equipe = Eq.ID_Equipe
GROUP BY 
    Ev.Type_Evenement, Ev.Description_Evenement, Ev.Impact_Evenement_Societe, Eq.Nom_Equipe
ORDER BY 
    Cout_Total DESC 
FETCH FIRST 10 ROWS ONLY; 

--

-- Traitement 3 : Suivre la durée moyenne des affectations des employés par type d’événement :

-- Requete SQL :
SELECT 
    E.Type_Evenement AS Type_Ev,
    AVG(F.Duree) AS Duree_Moy, 
    MIN(F.Duree) AS Duree_Min, 
    MAX(F.Duree) AS Duree_Max, 
    COUNT(F.ID_Employe) AS Nbre_Emp, 
    STDDEV(F.Duree) AS Duree_Ecart_Type,
    E.Impact_Evenement_Societe AS Impact 
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Evenement E ON F.ID_Evenement = E.ID_Evenement
GROUP BY 
    E.Type_Evenement, E.Impact_Evenement_Societe 
ORDER BY 
    Duree_Moy DESC; 

--

-- Traitement 4 : Analyser la relation entre la durée des affectations et les niveaux de satisfaction des employés :

-- Requete SQL :
SELECT 
    E.Type_Evenement AS Type_Ev,
    AVG(F.Duree) AS Duree_Moyenne, 
    AVG(F.Satisfaction_Employe) AS Satisfaction_Moyenne,
    COUNT(F.ID_Employe) AS Nombre_Employes,
    MAX(F.Duree) AS Duree_Max,
    MIN(F.Duree) AS Duree_Min 
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Evenement E ON F.ID_Evenement = E.ID_Evenement
GROUP BY 
    E.Type_Evenement
ORDER BY 
    Duree_Moyenne DESC; 
