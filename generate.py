from faker import Faker
import random

faker = Faker('fr_FR')  # Générer des données adaptées à la France

# Statuts possibles pour les chauffeurs
statuts = ['Actif', 'Inactif', 'Suspendu']

# Zones principales possibles
zones_principales = ['Paris', 'Lyon', 'Marseille', 'Toulouse', 'Nice', 'Lille', 'Bordeaux', 'Nantes']

# Générer 40 chauffeurs
with open("insert_chauffeur.sql", "w") as file:
    for i in range(1, 41):
        nom = faker.last_name()  # Nom du chauffeur
        prenom = faker.first_name()  # Prénom du chauffeur
        date_embauche = faker.date_between(start_date='-10y', end_date='-1y')  # Date d'embauche
        numero_permis = faker.unique.numerify('###########')  # Numéro de permis (12 chiffres)
        type_permis = random.choice(['B', 'C', 'D'])  # Type de permis
        telephone = faker.phone_number()[:10]  # Numéro de téléphone
        email = faker.unique.email()  # Email unique
        statut = random.choice(statuts)  # Statut aléatoire
        zone_principale = random.choice(zones_principales)  # Zone principale aléatoire

        # Générer une instruction SQL
        sql = (f"INSERT INTO Chauffeur (ID_Chauffeur, Nom, Prenom, Date_Embauche, Numero_Permis, Type_Permis, Telephone, Email, Statut, Zone_Principale) "
               f"VALUES ({i}, '{nom}', '{prenom}', '{date_embauche}', '{numero_permis}', '{type_permis}', '{telephone}', '{email}', '{statut}', '{zone_principale}');")
        
        # Écrire dans le fichier
        file.write(sql + "\n")

print("40 INSERT statements pour la table Chauffeur ont été générés dans 'insert_chauffeur.sql'.")
