import requests
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import json

REPO_OWNER = 'pytorch'
REPO_NAME = 'pytorch'
BASE_URL = f'https://api.github.com/repos/{REPO_OWNER}/{REPO_NAME}'


# Fonction pour récupérer des données via l'API GitHub sans authentification
def get_data_from_github(endpoint):
    url = f'{BASE_URL}/{endpoint}'
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Erreur lors de la récupération des données : {response.status_code}")
        return []


# get commit
commits_data = get_data_from_github('commits')

# get issues
issues_data = get_data_from_github('issues')

# get pr
pr_data = get_data_from_github('pulls')

# get contributor
contributors_data = get_data_from_github('contributors')


# Fonction pour convertir les données JSON en Parquet
def json_to_parquet(data, filename):
    # Normaliser les données JSON pour les convertir en DataFrame
    df = pd.json_normalize(data)

    # Convertir en table PyArrow et écrire en fichier Parquet
    table = pa.Table.from_pandas(df)
    pq.write_table(table, filename)
    print(f'Données sauvegardées dans {filename}')


# Sauvegarder les données en format JSON et Parquet
json_data = {
    'commits': commits_data,
    'issues': issues_data,
    'pull_requests': pr_data,
    'contributors': contributors_data,
}

# Sauvegarde en format JSON
with open('pytorch_data.json', 'w') as f:
    json.dump(json_data, f, indent=4)

# Sauvegarde en format Parquet pour chaque type de donnée
json_to_parquet(commits_data, 'commits.parquet')
json_to_parquet(issues_data, 'issues.parquet')
json_to_parquet(pr_data, 'pull_requests.parquet')
json_to_parquet(contributors_data, 'contributors.parquet')

print("Toutes les données ont été récupérées et sauvegardées.")
