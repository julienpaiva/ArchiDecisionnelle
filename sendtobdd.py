import duckdb
import pyarrow.parquet as pq
import os

# Chemin de la base de données DuckDB
duckdb_db = 'pytorch_data.duckdb'

# On rajoute les fichiers dans une liste pour pouvoir les importer
parquet_files = [
    'commits.parquet',
    'issues.parquet',
    'pull_requests.parquet',
    'contributors.parquet',
]

# Connexion à DuckDB (la base de données sera créée si elle n'existe pas)
conn = duckdb.connect(duckdb_db)

# Charger chaque fichier Parquet dans DuckDB avec le préfixe 'raw_'
for parquet_file in parquet_files:
    # Extraire le nom de la table (en enlevant l'extension .parquet et en ajoutant 'raw_')
    table_name = 'raw_' + os.path.splitext(parquet_file)[0]

    # Charger le fichier Parquet directement dans DuckDB
    print(f"Chargement de {parquet_file} dans la table {table_name}...")
    conn.execute(f"""
        CREATE TABLE IF NOT EXISTS {table_name} AS 
        SELECT * FROM read_parquet('{parquet_file}')
    """)

# Fermer la connexion à DuckDB
conn.close()

print("Toutes les données ont été chargées dans DuckDB.")