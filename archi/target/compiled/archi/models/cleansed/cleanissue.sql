with raw as (
    select
        id,
        title,
        "user.id",
        created_at,
        closed_at,
        "pull_request.html_url",
        state
        -- Ajoutez d'autres colonnes nécessaires
    from raw_issues
    where id is not null  -- Filtrer les issues sans titre
)

select
    id,
    title,
    "user.id",
    created_at,
    closed_at,
    "pull_request.html_url",
    state
from raw