import duckdb

# Connexion à la base de données DuckDB (le fichier sera créé s'il n'existe pas)
conn = duckdb.connect('pytorch_data.duckdb')

# Exécuter une requête simple sur la table pour vérifier le contenu
result = conn.execute("SELECT * FROM raw_contributors LIMIT 10").fetchall()

# Afficher les résultats
print(result)

# Fermer la connexion
conn.close()