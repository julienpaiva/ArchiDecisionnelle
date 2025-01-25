with raw as (
    select
        id,
        title,
        raw_pull_requests.node_id,
        created_at,
        -- Ajoutez d'autres colonnes nécessaires
    from raw_pull_requests
)

select
    id,
    title,
    raw_pull_requests.node_id,
    created_at
from raw