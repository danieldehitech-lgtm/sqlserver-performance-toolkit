-- Top statements by average elapsed time
SELECT TOP (20)
  (qs.total_elapsed_time / NULLIF(qs.execution_count,0)) / 1000.0 AS avg_elapsed_ms,
  qs.execution_count,
  DB_NAME(st.dbid) AS database_name,
  SUBSTRING(st.text, (qs.statement_start_offset/2)+1,
    ((CASE qs.statement_end_offset WHEN -1 THEN DATALENGTH(st.text)
      ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)+1) AS statement_text
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY avg_elapsed_ms DESC;
