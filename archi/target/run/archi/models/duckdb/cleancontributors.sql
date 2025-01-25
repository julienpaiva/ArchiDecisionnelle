
  
  create view "pytorch_data"."main_cleansed"."cleancontributors__dbt_tmp" as (
    with raw as (
    select
        id,
        name,
        raw_contributors.html_url,
        -- Ajoutez d'autres colonnes nécessaires
    from raw_contributors
)

select
    id,
    name,
    raw_contributors.html_url
from raw
  );
