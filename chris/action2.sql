SELECT 
    R.Nom_Region AS Region,
    --E.Nom_Equipe AS Equipe,
    AVG(F.Satisfaction_Employe) AS Satisfaction_Moyenne,
    MIN(F.Satisfaction_Employe) AS Satisfaction_Minimum,
    MAX(F.Satisfaction_Employe) AS Satisfaction_Maximum,
    COUNT(F.ID_Employe) AS Nombre_Employes
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Region R ON F.ID_Region = R.ID_Region
-- JOIN 
--     Dimension_Equipe E ON F.ID_Equipe = E.ID_Equipe
GROUP BY 
    R.Nom_Region
    --E.Nom_Equipe
ORDER BY 
    Satisfaction_Moyenne ASC;
