USE DBA_Utility;
GO

INSERT INTO dbo.baseline_io (database_id, file_id, num_of_reads, num_of_writes, io_stall_read_ms, io_stall_write_ms)
SELECT
  vfs.database_id,
  vfs.file_id,
  vfs.num_of_reads,
  vfs.num_of_writes,
  vfs.io_stall_read_ms,
  vfs.io_stall_write_ms
FROM sys.dm_io_virtual_file_stats(NULL, NULL) vfs;

INSERT INTO dbo.baseline_waits (wait_type, wait_time_ms, signal_wait_time_ms, waiting_tasks_count)
SELECT
  wait_type, wait_time_ms, signal_wait_time_ms, waiting_tasks_count
FROM sys.dm_os_wait_stats
WHERE wait_type NOT LIKE 'SLEEP%';
