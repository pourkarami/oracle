SELECT username, account_status, lock_date, expiry_date, profile,
       authentication_type
FROM   dba_users
WHERE  (:p_user IS NULL OR username = :p_user)
AND    oracle_maintained = 'N'
ORDER BY expiry_date NULLS LAST, username
FETCH FIRST 100 ROWS ONLY;
