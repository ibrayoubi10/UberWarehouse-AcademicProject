from faker import Faker
import random

faker = Faker("fr_FR")  # Générer des données françaises

# List of sample cities with their postal codes
cities = [
    ("Paris", "75000"), ("Marseille", "13000"), ("Lyon", "69000"), 
    ("Lille", "59000"), ("Bordeaux", "33000"), ("Toulouse", "31000"),
    ("Nantes", "44000"), ("Nice", "06000"), ("Strasbourg", "67000"), 
    ("Montpellier", "34000")
]

descriptions = [
    "Arrivée au centre-ville", "Arrivée dans un quartier résidentiel", 
    "Arrivée à proximité d'une gare", "Arrivée dans une zone industrielle",
    "Arrivée proche d'un monument historique", "Arrivée près d'un centre commercial"
]

# Generate 100 insert statements
with open("insert_arrivee.sql", "w") as file:
    for i in range(1, 101):
        # Randomly select city and postal code
        city, postal_code = random.choice(cities)
        address = faker.street_address()
        distance_centre = random.randint(100, 5000)  # Distance in meters
        zone_urbaine = random.choice([0, 1])  # Urban zone or not
        description = random.choice(descriptions)

        # SQL insert statement
        sql = (f"INSERT INTO Arrivee (ID_Arrivee, Adresse, Ville, Code_Postal, distance_centre, Zone_Urbaine, Description_Arrivee) "
               f"VALUES ({i}, '{address}', '{city}', '{postal_code}', {distance_centre}, {zone_urbaine}, '{description}');")
        
        # Write to file
        file.write(sql + "\n")

print("100 INSERT statements have been written to 'insert_arrivee.sql'.")
