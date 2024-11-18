-- Durée moyenne des affectations par type d'événement
SELECT 
    E.Type_Evenement AS Type_Ev,
    AVG(F.Duree) AS Duree_Moy,
    MIN(F.Duree) AS Duree_Min,
    MAX(F.Duree) AS Duree_Max,
    COUNT(F.ID_Employe) AS Nbre_Emp
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Evenement E ON F.ID_Evenement = E.ID_Evenement
GROUP BY 
    E.Type_Evenement
ORDER BY 
    Duree_Moy DESC;
