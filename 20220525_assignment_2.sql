2. �����ž��� �����ϰ� �ִ� ���ϸ��� ����Ʈ�� ���� �� �ִ� ��ǰ �� ���� ����Ʈ�� ���� ����    
�����ΰ�?    

���غ� ��
1)�������� �����ϰ� �ִ� ����Ʈ
2)�������� ���� ����Ʈ�� ��ǰ�� ����Ʈ ��(���� ����Ʈ >= ��ǰ ����Ʈ)
3)���� ����Ʈ�� ���� ��ǰ(MAX ����ؾ� �ҵ�)
  
SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint
--t_giftmem�� t_giftpoint ���̺��� name_vc, point_nu��� �÷����� ��ģ��
--�� ���� �� �򰥸�->��Ī ���ֱ�
  
�÷��� �˸��ƽ� ���� as�� ������ �ʾƵ� ��� ����(�˸��ƽ���.�÷��� ������ �Է�)
���̺�� �˸��ƽ� ����(���̺�� �˸��ƽ��� ������ �Է�)

SELECT point_nu as A, point_nu as B 
 FROM t_giftmem A, t_giftpoint B --����)���� ���ǰ� �ָ��մϴ�.

SELECT A.point_nu, B.point_nu 
 FROM t_giftmem AA, t_giftpoint BB --����)�������� �ĺ���

SELECT A.point_nu, B.point_nu 
 FROM t_giftmem A, t_giftpoint B --�����


1)�������� ��������Ʈ ���ϱ�

SELECT name_vc, point_nu 
 FROM t_giftmem 

SELECT name_vc, point_nu 
 FROM t_giftmem 
 WHERE name_vc = '������' --���������� �̸� Ư�����ֱ�

SELECT A.name_vc, A.point_nu 
 FROM t_giftmem A
 WHERE A.name_vc = '������'
--���ڿ��̹Ƿ� �����ſ� �̱� �����̼�


2)�������� ���� ����Ʈ�� ��ǰ�� ����Ʈ ��
  ���� ����Ʈ >= ��ǰ ����Ʈ --�ζ��κ� ����غ���
  
SELECT * FROM t_giftmem, t_giftpoint --�� ���̺� ��� ���

SELECT A.point_nu, B.point_nu 
 FROM t_giftmem A, t_giftpoint B --���� ���� A�� B�� ����Ʈ�̹Ƿ� �˸��ƽ������� ���� ��������
 WHERE A.point_nu >= B.point_nu 
 --A����Ʈ(�������� ����Ʈ)�� B����Ʈ(�ʿ��� ���ϸ��� ����Ʈ)���� ũ�ų� ���ƾ� ��ǰ�� ���� �� �ִ�.

SELECT A.name_vc, A.point_nu, B.point_nu
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu
 AND A.name_vc = '������' --���������� �̸� Ư�����ֱ� 


3)���� ����Ʈ�� ���� ��ǰ
->�ʿ��� ����Ʈ�� �ִ밪 ���ϱ�. ��, �������� ����Ʈ�� �� ũ�ų� ���ƾ� ��
������ ����Ʈ(50012)>=�ʿ��� ����Ʈ

SELECT 
    MAX(B.point_nu) --B ����Ʈ(�ʿ��� ����Ʈ)�� �ִ밪
 FROM t_giftmem A, t_giftpoint B --A ����Ʈ(������)�� B ����Ʈ�� ������� �ϹǷ� �� ���̺� ��� ����
 WHERE A.point_nu >= B.point_nu --A ����Ʈ >= B ����Ʈ
    AND A.name_vc ='������'
--������� 50000�� ���´�.->������ ���� �ٲ��ֱ�

SELECT 
    TO_CHAR(MAX(B.point_nu),'999,999')||'��' as "MAX ����Ʈ" 
 --TO_CHAR���ڸ� ���ڷ� ��ȯ�ϴ� �Լ�. ���ڿ��̹Ƿ� �̱� �����̼�
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu 
    AND A.name_vc ='������' 
 --����Ʈ�� ��� ��->��ǰ�� ���� ������ֱ�
    
SELECT name_vc,
    TO_CHAR(MAX(B.point_nu),'999,999')||'��' as "MAX ����Ʈ" 
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu 
    AND A.name_vc = '������'
 --������
 --�ǹ���)��ǰ�� ����ϴ� ���?
    
 
1), 2), 3)�� ���� �̿��� ���� ��� ���ϱ� 

SELECT A.name_vc, A.point_nu 
 FROM t_giftmem A
 WHERE A.name_vc = '������'
    
SELECT A.name_vc, A.point_nu, B.point_nu
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu
    AND A.name_vc = '������'

SELECT 
 TO_CHAR(MAX(B.point_nu),'999,999')||'��' as "MAX ����Ʈ" 
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu 
    AND A.name_vc ='������'
--���⼭���� ��� �ؾߵ���...

SELECT name_vc, point_nu
 FROM t_giftpoint
    WHERE point_nu =
    (
    SELECT MAX(B.point_nu)
    FROM t_giftmem A, t_giftpoint B
    WHERE A.point_nu >= B.point_nu
    AND A.name_vc = '������'
    )
--���۸� �غ�
--�ǹ���)�� �ζ��κ䰡 �ƴ϶� WHERE�� ���������� ���������?


--WHERE�� �������� �����ϱ�
ALLEN���� �޿��� ���� �޴� ����� �̸�

SELECT ename, sal
 FROM emp

SELECT sal
 FROM emp
 WHERE ename='ALLEN'

SELECT ename, sal
 FROM emp
 WHERE sal>
    (
    SELECT sal
    FROM emp
    WHERE ename='ALLEN'
    )--emp���̺��� �޿��� ��ȣ �� ���� ���� ����� �̸��� �޿� 
--��ȣ �� : ALLEN�� �޿�