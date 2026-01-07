SELECT TOP (20)
  wait_type,
  wait_time_ms,
  signal_wait_time_ms,
  waiting_tasks_count
FROM sys.dm_os_wait_stats
WHERE wait_type NOT LIKE 'SLEEP%'
ORDER BY wait_time_ms DESC;
