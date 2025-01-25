
  
  create view "pytorch_data"."main_application"."lecture__dbt_tmp" as (
    SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name = 'raw_commits'
  );
