-- Frequently used cached plans (starting point)
SELECT TOP (20)
  cp.usecounts,
  cp.size_in_bytes / 1024 AS plan_size_kb,
  DB_NAME(st.dbid) AS database_name,
  st.text
FROM sys.dm_exec_cached_plans cp
CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) st
ORDER BY cp.usecounts DESC;
