with raw as (
    select
        "commit.author.name",
        "commit.author.date",
        "commit.url",
        "author.id",
        -- Ajoutez d'autres colonnes nécessaires
    from raw_commits
    where "author.id" is not null  -- Filtrer les commits sans message
)

select
    "commit.author.name",
    "commit.author.date",
    "commit.url",
    "author.id"
from raw