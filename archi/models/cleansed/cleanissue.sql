with raw as (
    select
        id,
        title,
        "user.id",
        created_at,
        closed_at,
        "pull_request.html_url",
        state
    from {{ ('raw_issues') }}
    where id is not null
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