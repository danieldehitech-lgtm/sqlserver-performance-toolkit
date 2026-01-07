SELECT TOP (20)
  s.session_id,
  (u.user_objects_alloc_page_count * 8) AS user_kb,
  (u.internal_objects_alloc_page_count * 8) AS internal_kb
FROM sys.dm_db_session_space_usage u
JOIN sys.dm_exec_sessions s ON s.session_id = u.session_id
ORDER BY (u.user_objects_alloc_page_count + u.internal_objects_alloc_page_count) DESC;
