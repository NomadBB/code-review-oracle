SELECT * FROM t_worktime

SELECT workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc

SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc --오도바이 있을 때

SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime --오도바이 없을 때

SELECT rownum rnk, time_nu
FROM(SELECT workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc
) --FROM 절 안에 SELECT

SELECT rownum as "순위", time_nu FROM t_worktime

SELECT rownum as "순위", a.time_nu, b.time_nu 
FROM t_worktime a, t_worktime b
WHERE rownum<4