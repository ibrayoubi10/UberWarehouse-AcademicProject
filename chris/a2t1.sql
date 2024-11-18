-- Requete montrant les regions ayant une satisfaction moyenne des employes inferieure a 8
SELECT 
    R.Nom_Region AS Region,
    AVG(F.Satisfaction_Employe) AS Sat_Moy,
    MIN(F.Satisfaction_Employe) AS Sat_Min,
    MAX(F.Satisfaction_Employe) AS Sat_Max,
    COUNT(F.ID_Employe) AS Nbre_Emp
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Region R ON F.ID_Region = R.ID_Region
GROUP BY 
    R.Nom_Region
HAVING 
    AVG(F.Satisfaction_Employe) < 8
ORDER BY 
    Sat_Moy ASC;

-- Requete montrant les equipes ayant une satisfaction moyenne des employes inferieure a 8
SELECT 
    E.Nom_Equipe AS Equipe,
    AVG(F.Satisfaction_Employe) AS Sat_Moy,
    MIN(F.Satisfaction_Employe) AS Sat_Min,
    MAX(F.Satisfaction_Employe) AS Sat_Max,
    COUNT(F.ID_Employe) AS Nbre_Emp
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Equipe E ON F.ID_Equipe = E.ID_Equipe
GROUP BY 
    E.Nom_Equipe
HAVING 
    AVG(F.Satisfaction_Employe) < 8
ORDER BY 
    Sat_Moy ASC;
