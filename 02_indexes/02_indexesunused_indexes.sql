-- Potentially unused indexes (starter - validate before dropping)
SELECT TOP (50)
  OBJECT_NAME(i.object_id) AS table_name,
  i.name AS index_name,
  us.user_seeks,
  us.user_scans,
  us.user_lookups,
  us.user_updates
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats us
  ON us.object_id = i.object_id
 AND us.index_id = i.index_id
 AND us.database_id = DB_ID()
WHERE i.is_primary_key = 0
  AND i.is_unique = 0
  AND i.type_desc = 'NONCLUSTERED'
ORDER BY (ISNULL(us.user_seeks,0) + ISNULL(us.user_scans,0) + ISNULL(us.user_lookups,0)) ASC,
         ISNULL(us.user_updates,0) DESC;
