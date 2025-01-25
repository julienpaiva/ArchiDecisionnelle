
  
  create view "pytorch_data"."main_cleansed"."cleancommits__dbt_tmp" as (
    with raw as (
    select
        id,
        author_id,
        created_at,
        -- Ajoutez d'autres colonnes nécessaires
    from raw_commits
)

select
    id,
    author_id,
    created_at
from raw
  );
