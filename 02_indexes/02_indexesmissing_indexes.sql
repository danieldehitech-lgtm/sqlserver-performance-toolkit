-- Missing indexes (review manually before creating anything)
SELECT TOP (25)
  DB_NAME(mid.database_id) AS database_name,
  OBJECT_NAME(mid.object_id, mid.database_id) AS table_name,
  migs.user_seeks,
  migs.user_scans,
  CAST(migs.avg_user_impact AS DECIMAL(5,2)) AS avg_user_impact,
  mid.equality_columns,
  mid.inequality_columns,
  mid.included_columns
FROM sys.dm_db_missing_index_group_stats migs
JOIN sys.dm_db_missing_index_groups mig
  ON migs.group_handle = mig.index_group_handle
JOIN sys.dm_db_missing_index_details mid
  ON mig.index_handle = mid.index_handle
ORDER BY migs.user_seeks DESC, avg_user_impact DESC;
