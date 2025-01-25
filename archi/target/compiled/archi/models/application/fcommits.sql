with raw_contributors as (
    select
        id,
        login
    from main.raw_contributors
),

raw_commits as (
    select
        "commit.author.name",
        "commit.author.date",
        "commit.url",
        "author.id"
    from main.raw_commits
)

select
    raw_commits."author.id",
    raw_commits."commit.url",
    raw_contributors.id,
from raw_commits
left join raw_contributors
    on raw_contributors.id = raw_commits."author.id"