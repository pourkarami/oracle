SELECT inst_id, con_id, name, value, unit
FROM   gv$pgastat
WHERE  name IN ('aggregate PGA target parameter', 'aggregate PGA auto target',
                'total PGA allocated', 'maximum PGA allocated',
                'total PGA inuse', 'over allocation count', 'cache hit percentage')
ORDER BY inst_id, con_id, name;
