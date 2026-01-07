

SELECT TOP (50)
  w.wait_type,
  MIN(w.captured_at) AS first_seen,
  MAX(w.captured_at) AS last_seen,
  SUM(w.wait_time_ms) AS total_wait_ms
FROM dbo.baseline_waits w
GROUP BY w.wait_type
ORDER BY total_wait_ms DESC;
