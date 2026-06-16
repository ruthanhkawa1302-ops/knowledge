# Check session giữ lock
```
SELECT
    a.pid,
    a.usename,
    a.application_name,
    a.client_addr,
    a.state,
    a.wait_event_type,
    a.wait_event,
    now() - a.query_start AS duration,
    l.objid AS advisory_lock_id,
    l.granted,
    a.query
FROM pg_locks l
JOIN pg_stat_activity a
    ON l.pid = a.pid
WHERE l.locktype = 'advisory'
ORDER BY l.granted DESC, duration DESC;
```