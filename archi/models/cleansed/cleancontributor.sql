with raw as (
    select
        id,
        login,
    from {{ ('raw_contributors') }}
    where id is not null
)

select
    id,
    login
from raw