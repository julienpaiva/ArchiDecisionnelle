
  
  create view "pytorch_data"."main"."test__dbt_tmp" as (
    SELECT * FROM raw_commits
  );
