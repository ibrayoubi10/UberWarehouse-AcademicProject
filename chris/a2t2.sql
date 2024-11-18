-- Identifier les événements les plus coûteux par équipe
SELECT 
    Ev.Type_Evenement AS Type_Ev,
    Ev.Description_Evenement AS Descr,
    Eq.Nom_Equipe AS Equipe,
    SUM(F.Cout_Evenement) AS Cout_Tot,
    COUNT(F.ID_Employe) AS Nbre_Part
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Evenement Ev ON F.ID_Evenement = Ev.ID_Evenement
JOIN 
    Dimension_Equipe Eq ON F.ID_Equipe = Eq.ID_Equipe
GROUP BY 
    Ev.Type_Evenement, Ev.Description_Evenement, Eq.Nom_Equipe
ORDER BY 
    Cout_Tot DESC
FETCH FIRST 10 ROWS ONLY;


-- Évaluer l’impact des événements coûteux
SELECT 
    Ev.Description_Evenement AS Description,
    Ev.Type_Evenement AS Type_Evenement,
    Ev.Impact_Evenement_Societe AS Impact,
    SUM(F.Cout_Evenement) AS Cout_Total,
    COUNT(F.ID_Equipe) AS Nombre_Equipes
FROM 
    Fait_Suivi_Employe F
JOIN 
    Dimension_Evenement Ev ON F.ID_Evenement = Ev.ID_Evenement
GROUP BY 
    Ev.Description_Evenement, Ev.Type_Evenement, Ev.Impact_Evenement_Societe
ORDER BY 
    Cout_Total DESC;
-- FETCH FIRST 10 ROWS ONLY;