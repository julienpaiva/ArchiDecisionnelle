
  
  create view "pytorch_data"."main"."view__dbt_tmp" as (
    SELECT * FROM raw_commits
  );
