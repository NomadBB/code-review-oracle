�̵� �������� �۾��ð��� ª�� �ɸ��� �ð� ������� 1���� 15������ ������ �Űܼ� ����Ͻÿ�.        

SELECT * FROM t_worktime --t_worktime ���̺��� ��� �÷�  ��Ÿ��

SELECT workcd_vc, time_nu --������ ������ ��ġ�ϴ� �÷��� ǥ��
    FROM t_worktime

SELECT workcd_vc, time_nu 
    FROM t_worktime
    ORDER BY time_nu ASC --ª�� �ɸ��� �ð� ���̹Ƿ� �������� ����-ORDER BY time_mu ASC ���
    
SELECT workcd_vc, time_nu 
    RANK() OVER(ORDER BY time_nu) as "RANK" --���� ���ϱ� ���� RANK�Լ� ���
    --���� �÷��� ª��  �ɸ��� �ð� ���̹Ƿ� time_nu
    FROM t_worktime
    ORDER BY time_nu ASC    
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK" 
    FROM t_worktime  
    ORDER BY time_nu ASC
    --�ǹ���)RANK �Լ� ������ ORDER BY�� ����ϸ� �ڵ����� �������� ������ �Ǵ���? 
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK"
    FROM t_worktime 
    --RANk �Լ� ���� �̹� ORDER BY�� ����->
    --FROM ������ ORDER BY ����  ����  ������� �ʾƵ� ������������ ���ĵǴ� ��
    
--*emp ���̺����� �׽�Ʈ �غ���
SELECT ename, sal,
    RANK() OVER(ORDER BY sal)as "RANK"
    FROM emp --������������ ���� �ȴ�.
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu DESC) as "RANK" 
    --RANK�Լ� ������ ORDER BY ~ DESC�� ����ϸ� �÷� ���� ������������ ���ĵ�
    FROM t_worktime 
    
--����
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK" 
    FROM t_worktime 
