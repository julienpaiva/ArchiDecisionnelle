with raw as (
    select
        id,
        title,
        created_at,
        -- Ajoutez d'autres colonnes nécessaires
    from raw_issues
)

select
    id,
    title,
    created_at
from raw