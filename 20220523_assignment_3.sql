�������� �۾��ð��� ª�� �ɸ��� �ð� ������� 1���� 15������ ������ �Űܼ� ����Ͻÿ�.        
--�׷캰�� ���� �Űܺ���

--RANK() OVER(PARTITION BY ���� �÷�1 ORDER BY ���� �÷�2) as ""

SELECT * FROM t_worktime

SELECT workcd_vc, time_nu,
    RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu) as "RANK"
    FROM t_worktime 
    --workcd_vc �÷��� �׷캰�� ������ ������ + time_nu(�۾��ð�) ��������
    
SELECT workcd_vc, time_nu,
    RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "RANK"
    FROM t_worktime     
    --workcd_vc �÷��� �׷캰�� ������ ������ + time_nu(�۾��ð�) ��������
    
������ ���ϴ� ������ �Լ� ��� ����غ���(RANK, DENSE_RANK, ROW_NUMBER)

SELECT workcd_vc, time_nu,
    RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "RANK",
    DENSE_RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "D_RANK",
    ROW_NUMBER() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "ROW_NUM"
    FROM t_worktime
    