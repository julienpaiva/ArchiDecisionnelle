with clean_commits as (
    select
        "commit.author.name",
        "commit.author.date",
        "commit.url",
        "author.id"
    from "pytorch_data"."main_cleansed"."cleancommit"  -- Utilisation de ref() pour se référer au modèle cleancommit.sql
),

clean_contributors as (
    select
        id,
        login
    from "pytorch_data"."main_cleansed"."cleancontributor"  -- Utilisation de ref() pour se référer au modèle cleancontributor.sql
)

select
    clean_commits."author.id",
    clean_commits."commit.url",
    clean_commits."commit.author.name",
    clean_commits."commit.author.date",
    clean_contributors.id as contributor_id,
    clean_contributors.login as contributor_login
from clean_commits
left join clean_contributors
    on clean_contributors.id = clean_commits."author.id"