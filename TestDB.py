import duckdb

# Script pour checker la bdd duckdb directement

# Connexion à la base de données DuckDB (le fichier sera créé s'il n'existe pas)
conn = duckdb.connect('pytorch_data.duckdb')

# On lance une requete de test pour savoir si les données sont présentes
result = conn.execute("SELECT * FROM raw_contributors LIMIT 10").fetchall()

# Afficher les résultats
print(result)

# Fermer la connexion
conn.close()