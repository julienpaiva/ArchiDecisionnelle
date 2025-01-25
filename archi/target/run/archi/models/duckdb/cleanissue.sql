
  
  create view "pytorch_data"."main_cleansed"."cleanissue__dbt_tmp" as (
    with raw as (
    select
        id,
        title,
        "user.id",
        created_at
        -- Ajoutez d'autres colonnes nécessaires
    from raw_issues
    where id is not null  -- Filtrer les issues sans titre
)

select
    id,
    title,
    "user.id",
    created_at
from raw
  );
