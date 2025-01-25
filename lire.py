import pandas as pd

# Ouverture du fichier et lecture
parquet_file = 'pull_requests.parquet'
df = pd.read_parquet(parquet_file)
print(df.head())
print(df.info())