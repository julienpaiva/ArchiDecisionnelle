with raw as (
    select
        id,
        state,
        title,
        created_at,
        -- Ajoutez d'autres colonnes nécessaires
    from raw_pull_requests
    where id is not null  -- Filtrer les PR sans titre
)

select
    id,
    title,
    state,
    created_at
from raw