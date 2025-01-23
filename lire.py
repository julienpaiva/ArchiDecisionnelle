import pandas as pd

# Remplacer par le chemin de ton fichier Parquet
parquet_file = 'pull_requests.parquet'

# Lire le fichier Parquet avec pandas
df = pd.read_parquet(parquet_file)

# Afficher les premières lignes du DataFrame
print(df.head())

# Si tu veux voir toutes les colonnes, tu peux aussi afficher un résumé complet
print(df.info())