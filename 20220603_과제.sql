2022�� 6�� 3�� ���� �Դϴ�.
�÷������� �ο췹���� ������ ����ϱ�
�� �࿡ 1�г� ���� 4�г� ������ �и��ؼ� �� �࿡ �ϳ��� �г⸸ �������� �ϰ��� �Ѵ�. 
���� 12���� ������ �� 48���� ����� ���к�/�а����� �ο����� ���;� �Ѵ�. 

1. �� �࿡ �ϳ��� �г⸸ �������� �и�
2. �� 48���� ��� --������ 4�� �б�, īŸ�þ��� ��
3. ���к�/�а����� �ο����� ���;� ��


SELECT * FROM test11

���� �� ���̺��� coll(��������), dept(�װ����ְ��а�)�� �г⺰�� ����� �ž� ��

--coll(��������), dept(�װ����ְ��а�) 1�г�
--coll(��������), dept(�װ����ְ��а�) 2�г�
--coll(��������), dept(�װ����ְ��а�) 3�г�
--coll(��������), dept(�װ����ְ��а�) 4�г�
--�̷������� �� ��� �ǰ� ������ֱ�

���� �����͸� 4����� ����(īŸ�þ��� ��)
���� 12���� ������ 48���� ���;� ��(12*4)

--UNION ALL + �������̺� ����غ���
SELECT 1 FROM dual
UNION ALL 
SELECT 2 FROM dual 

īŸ�þ��� ���� FROM���� �ΰ� �̻��� ���̺��� ���������
WHERE�������� ���� ������ ���� �ʴ´�.

SELECT * 
 FROM test11,
      (SELECT 1 FROM dual
       UNION ALL
       SELECT 2 FROM dual
       UNION ALL
       SELECT 3 FROM dual
       UNION ALL
       SELECT 4 FROM dual)
--�� 48��.
--UNION ALL�ε� ����� �������� ������ �ۼ��ϱ� ���ŷӴ�  

--ROWNUM ����غ���
SELECT ROWNUM rno
 FROM test11
--�׳� ROWNUM�� ����ϸ� ���ϴ� ����� �ȳ���
--���������� ���� �ٿ��ֱ�

SELECT ROWNUM rno
 FROM test11 
 WHERE ROWNUM < 5
--5���� ���� ������ �ɾ��ָ� 4���(�� 48��)�� ���� ����

SELECT * 
 FROM test11, (SELECT ROWNUM rno
               FROM test11
               WHERE ROWNUM < 5)
--�� �࿡ �� �г⸸ ������ ��� ��������
--fre, sup, jun, sen�� ���鵵 �� �࿡ �ϳ��� �������� ���

DECODE ����ؼ� ���� Ư�� ��Ű��
*DECODE�� �÷���, GROUP BY, ORDER BY�� ��� ����

SELECT * 
 FROM test11, (SELECT ROWNUM rno
               FROM test11
               WHERE ROWNUM < 5)
--���⼭ rno�� key3(�� �࿡ �� �г�)���� �ž� ��

rno�� 
1�̸� 1�г�, 
2�� 2�г�, 
3�̸� 3�г�, 
4�� 4�г��� ��µǵ���

DECODE(rno,1,'1�г�',2,'2�г�',3'3�г�',4,'4�г�') key3


--SELECT���� �÷��� ��� ���ֱ�
SELECT coll, dept
      ,DECODE(rno,1,'1�г�',2,'2�г�',3,'3�г�',4,'4�г�') key3
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
--��� ��
--key4���� ����� �ֱ�(���⼭�� rno�� key4������ �������� ����� �ɵ�?)

SELECT coll, dept
      ,DECODE(rno,1,'1�г�',2,'2�г�',3,'3�г�',4,'4�г�') key3
      ,ROWNUM rno
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)

rno�� 1�̸� fre��, 
2�� sup��, 
3�̸� jun��, 
4�� sen�� ��������

DECODE(rno,1,fre,2,sup,3,jun,4,sen) key4


--SELECT���� �÷��� ��� ���ֱ�
SELECT coll, dept
      ,DECODE(rno,1,'1�г�',2,'2�г�',3,'3�г�',4,'4�г�') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
--��� ��
--���� �´��� Ȯ���غ���

SELECT * FROM test11
--�������� �װ����ְ��а� fre=120
--�������� �װ����ְ��а� sup=140
--�������� �װ����ְ��а� jun=140
--�������� �װ����ְ��а� sen=120

SELECT coll, dept
      ,DECODE(rno,1,'1�г�',2,'2�г�',3,'3�г�',4,'4�г�') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
WHERE dept = '�װ����ְ��а�'
--����Ʈ ���̺��� ���� ��ġ��

--���ߴ� ������ �ٽ� ���ư���
SELECT coll, dept
      ,DECODE(rno,1,'1�г�',2,'2�г�',3,'3�г�',4,'4�г�') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
--������ �ȵ��ִ�->÷�� �̹��� ���Ǵ�� �������ֱ�
--ORDER BY

SELECT coll, dept
      ,DECODE(rno,1,'1�г�',2,'2�г�',3,'3�г�',4,'4�г�') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
ORDER BY dept, key3 asc


--����
SELECT coll, dept
      ,DECODE(rno,1,'1�г�',2,'2�г�',3,'3�г�',4,'4�г�') as "KEY3"
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) as "KEY4"
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
ORDER BY dept, KEY3 asc
