CREATE MATERIALIZED VIEW Vue_Satisfaction_Equipe_Region AS
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
    R.Nom_Region, E.Nom_Equipe;

-- transformation requete 1

SELECT *
FROM Vue_Satisfaction_Equipe_Region
WHERE Sat_Moy < 8
ORDER BY Sat_Moy ASC;


--


CREATE MATERIALIZED VIEW Vue_Evenement_Equipe AS
SELECT 
    Ev.Type_Evenement AS Type_Ev, 
    Ev.Description_Evenement AS Descr, 
    Ev.Impact_Evenement_Societe AS Impact,
    Eq.Nom_Equipe AS Equipe, 
    AVG(F.Duree) AS Duree_Moy, 
    MIN(F.Duree) AS Duree_Min, 
    MAX(F.Duree) AS Duree_Max, 
    AVG(F.Satisfaction_Employe) AS Satisfaction_Moy, 
    SUM(F.Cout_Evenement) AS Cout_Total,
    COUNT(F.ID_Employe) AS Nbre_Part, 
    COUNT(DISTINCT F.ID_Equipe) AS Nombre_Equipes,
    STDDEV(F.Duree) AS Duree_Ecart_Type
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Evenement Ev ON F.ID_Evenement = Ev.ID_Evenement
LEFT JOIN 
    Dimension_Equipe Eq ON F.ID_Equipe = Eq.ID_Equipe
GROUP BY 
    Ev.Type_Evenement, Ev.Description_Evenement, Ev.Impact_Evenement_Societe, Eq.Nom_Equipe;


-- transformation requete 2

SELECT 
    Type_Ev, 
    Descr, 
    Impact, 
    Equipe, 
    Cout_Total, 
    Nbre_Part, 
    Nombre_Equipes
FROM Vue_Evenement_Equipe
ORDER BY Cout_Total DESC
FETCH FIRST 10 ROWS ONLY;


-- transformation requete 3

SELECT 
    Type_Ev, 
    Duree_Moy, 
    Duree_Min, 
    Duree_Max, 
    Nbre_Part AS Nbre_Emp, 
    Duree_Ecart_Type, 
    Impact
FROM Vue_Evenement_Equipe
ORDER BY Duree_Moy DESC;


-- transformation requete 4


SELECT 
    Type_Ev, 
    Duree_Moy AS Duree_Moyenne, 
    Satisfaction_Moy AS Satisfaction_Moyenne, 
    Nbre_Part AS Nombre_Employes, 
    Duree_Max, 
    Duree_Min
FROM Vue_Evenement_Equipe
ORDER BY Duree_Moy DESC;