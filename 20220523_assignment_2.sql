�̵� �������� �۾��ð��� ª�� �ɸ��� �ð� ������� 1���� 15������ ������ �Űܼ� ����Ͻÿ�.        
--������ ���ϴ� RANK, DENSE_RANK, RWO_NUMBER 3���� �Լ� ��� ����غ���

--1. RANK() ������ ���ϴ�  �Լ�
--�ߺ� ���� ������ŭ ���� ���� ���� ������Ŵ 
--ex)time_nu�� 0.11, 0.11, 0.11, 0.49���̶��
--1��, 1��, 1��, 4���� �ȴ�.
 
--2. DENSE_RANK() ������ ���ϴ� �Լ�
--�ߺ� ������ �����ص� ���������� ���� ���� ���� ��Ÿ��
--ex)time_nu�� 0.11, 0.11, 0.11, 0.49���̶��
--1��, 1��, 1��, 2���� �ȴ�.

--3. ROW_NUMBER()������ ���ϴ� �Լ�
--�ߺ��� ��� ���� ������ ������
--ex)time_nu�� 0.11, 0.11, 0.11, 0.49���̶��
--1��, 2��, 3���� �ȴ�.

--�� �Լ� ��� ORDER BY�� ����Ͽ� Ư�� �׸� ���� ������ ���� �� ����.

SELECT * FROM t_worktime

SELECT workcd_vc, time_nu 
    FROM t_worktime

SELECT workcd_vc, time_nu 
    FROM t_worktime
    ORDER BY time_nu asc
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK", 
    DENSE_RANK() OVER(ORDER BY time_nu) as "D_RANK",
    ROW_NUMBER() OVER(ORDER BY time_nu) as "R_NUM"
    FROM t_worktime
    
