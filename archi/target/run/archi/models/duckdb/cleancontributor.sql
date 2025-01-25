
  
  create view "pytorch_data"."main_cleansed"."cleancontributor__dbt_tmp" as (
    with raw as (
    select
        id,
        login,
        -- Ajoutez d'autres colonnes nécessaires
    from raw_contributors
    where id is not null  -- Filtrer les contributeurs sans email
)

select
    id,
    login
from raw
  );
