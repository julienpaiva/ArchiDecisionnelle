
  
  create view "pytorch_data"."main_application"."fissues__dbt_tmp" as (
    with clean_issue as (
    select
        id,
        title,
        "user.id",
        created_at,
        closed_at,
        state,
        "pull_request.html_url"
    from "pytorch_data"."main_cleansed"."cleanissue"
),

clean_contributors as (
    select
        id,
        login
    from "pytorch_data"."main_cleansed"."cleancontributor"
)

select
    clean_issue.id,
    clean_issue."user.id",
    clean_issue."state",
    clean_issue.created_at,
    clean_issue.closed_at,
    clean_contributors.id as contributor_id,
    clean_contributors.login as contributor_login
from clean_issue
left join clean_contributors on clean_contributors.id = clean_issue."user.id"
  );
