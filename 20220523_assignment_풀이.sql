SELECT * FROM t_worktime

SELECT workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc

SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc --�������� ���� ��

SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime --�������� ���� ��

SELECT rownum rnk, time_nu
FROM(SELECT workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc
) --FROM �� �ȿ� SELECT

SELECT rownum as "����", time_nu FROM t_worktime

SELECT rownum as "����", a.time_nu, b.time_nu 
FROM t_worktime a, t_worktime b
WHERE rownum<4