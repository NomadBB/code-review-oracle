SELECT * FROM t_orderbasket

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual --������ ���̺��� ����� īŸ�þ��� ���� ���� ��Ŵ
--54*2=108����

�������̺� �̿��Ͽ� �����͸� 2����� �����ϱ� -īŸ�þ��� ��

SELECT * 
FROM t_orderbasket,
     (
      SELECT 1 rno FROM dual
      UNION ALL
      SELECT 2 rno FROM dual
     )
     
SELECT * 
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )
     
SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc --��¥�� �̿��� �׷���
     
SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc
UNION ALL
SELECT '�Ѱ�' FROM dual 

DECODE(ROWNUM,1,indate_vc,2,'�Ѱ�')

SELECT DECODE(ROWNUM,1,indate_vc,2,'�Ѱ�') 
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )
--�Ѱ� ��Ÿ����
--108���� ���� ��
--�ζ��κ�

SELECT DECODE(b.rno,1,indate_vc,2,'�Ѱ�') 
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
--�ζ��κ�� ������ b.rno�� ��Ÿ���� ���� ����

SELECT DECODE(b.rno,1,indate_vc,2,'�Ѱ�') 
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'�Ѱ�')
ORDER BY DECODE(b.rno,1,indate_vc,2,'�Ѱ�')
--DECODE ��������, �׷����, �÷��� ��� ����
--�׷���̴� ������ �ȵǹǷ� �������̸� �ؿ� ���ֱ�
--��¥�� �������� �ʴ� �Ѱ��� �÷��� ���� ����

����� = ����*�ܰ�
������� SUM
�ο츦 ���°� COUNT

SUM(qty_nu*price_nu) as "�����"


SELECT DECODE(b.rno,1,indate_vc,2,'�Ѱ�') as "�Ǹų�¥"
      ,SUM(qty_nu*price_nu) as "�����"
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'�Ѱ�')
ORDER BY DECODE(b.rno,1,indate_vc,2,'�Ѱ�')


SELECT DECODE(b.rno,1,indate_vc,2,'�Ѱ�') as "�Ǹų�¥"
      ,SUM(qty_nu)||'��' as "�ǸŰ���"
      ,SUM(qty_nu*price_nu)||'��' as "�����"
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'�Ѱ�')
ORDER BY DECODE(b.rno,1,indate_vc,2,'�Ѱ�')--������ 2�������̹Ƿ� �˸��ƽ��� ��� ����

--���� ���
SELECT DECODE(b.rno,1,indate_vc,2,'�Ѱ�') as "�Ǹų�¥"
      ,SUM(qty_nu)||'��' as "�ǸŰ���"
      ,SUM(qty_nu*price_nu)||'��' as "�����"
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'�Ѱ�')
ORDER BY "�Ǹų�¥"

