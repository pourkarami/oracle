SELECT sid, cursor_type, COUNT(*) AS cursor_entries
FROM   v$open_cursor
WHERE  sid = :p_sid
GROUP BY sid, cursor_type
ORDER BY cursor_entries DESC, cursor_type;
