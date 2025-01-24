import pandas as pd
import dask.dataframe as dd

# Ouverture du fichier et lecture
parquet_file = 'issues.parquet'
df = pd.read_parquet(parquet_file)
print(df.head())
print(df.info())