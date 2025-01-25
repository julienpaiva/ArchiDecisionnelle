with raw as (
    select
        id,
        state,
        title,
        created_at,
    from {{ ('raw_pull_requests') }}
    where id is not null
)

select
    id,
    title,
    state,
    created_at
from raw