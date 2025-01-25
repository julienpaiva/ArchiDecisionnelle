with raw as (
    select
        "commit.author.name",
        "commit.author.date",
        "commit.url",
        "author.id",
    from {{ ('raw_commits') }}
    where "author.id" is not null
)

select
    "commit.author.name",
    "commit.author.date",
    "commit.url",
    "author.id"
from raw