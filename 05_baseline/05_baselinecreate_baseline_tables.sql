IF DB_ID('DBA_Utility') IS NULL
  CREATE DATABASE DBA_Utility;
GO

USE DBA_Utility;
GO

IF OBJECT_ID('dbo.baseline_io', 'U') IS NULL
BEGIN
  CREATE TABLE dbo.baseline_io (
    captured_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    database_id INT NOT NULL,
    file_id INT NOT NULL,
    num_of_reads BIGINT NOT NULL,
    num_of_writes BIGINT NOT NULL,
    io_stall_read_ms BIGINT NOT NULL,
    io_stall_write_ms BIGINT NOT NULL
  );
END;

IF OBJECT_ID('dbo.baseline_waits', 'U') IS NULL
BEGIN
  CREATE TABLE dbo.baseline_waits (
    captured_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    wait_type SYSNAME NOT NULL,
    wait_time_ms BIGINT NOT NULL,
    signal_wait_time_ms BIGINT NOT NULL,
    waiting_tasks_count BIGINT NOT NULL
  );
END;
