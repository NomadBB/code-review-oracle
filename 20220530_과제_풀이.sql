SELECT ROWNUM empno, ename FROM emp
--1������ ���ʴ�� �����ϴ� ���ڰ� ��µ�

SELECT ROWNUM empno, ename FROM emp
WHERE ROWNUM>2 --�Ұ���(ũ�ٶ�� �񱳴�X)

SELECT ROWNUM rno, empno, ename FROM emp
WHERE ROWNUM <=5--������ �� ����

    
�� ���̺��� ���� ���ڵ�, ���� ���ڵ忡 ���� �� �� ����.
���� row�� �ִ� �� ������ ���� ����
�ذ�å=������ �����ؼ� �ΰ��� ��
    
--A����
SELECT 
         rownum rno, cdate, amt
    FROM test02 --�̷��� �ϸ� ������ �ٴ´�.

--B����
SELECT 
         rownum cno, cdate, crate
    FROM test02
    
SELECT *
    FROM(
         SELECT 
         rownum rno, cdate, amt
    FROM test02
    )a,
    (SELECT 
         rownum cno, cdate, crate
    FROM test02
    )b --81���� ����� ��
    
SELECT *
    FROM(
         SELECT 
         rownum rno, cdate, amt
    FROM test02
    )a,
    (
    SELECT 
         rownum cno, cdate, crate
    FROM test02
    )b
 WHERE a.rno-1 = b.cno --a���� a.��¥, a.�޷��ݾ�, b���� a.��¥*b.ȯ��

SELECT 
    a.cdate, a.amt, a.amt*b.crate
    FROM(
         SELECT 
         rownum rno, cdate, amt
    FROM test02
    )a,
    (
    SELECT 
         rownum cno, cdate, crate
    FROM test02
    )b
 WHERE a.rno-1 = b.cno 

--����ϰ� ����
SELECT 
    a.cdate as "��¥", a.amt as "�޷� �ݾ�", TO_CHAR(a.amt*b.crate, '999,999,999,999')||'��' as "��ȭ�ݾ�"
    FROM(
         SELECT 
         rownum rno, cdate, amt
    FROM test02
    )a,
    (
    SELECT 
         rownum cno, cdate, crate
    FROM test02
    )b
 WHERE a.rno-1 = b.cno 
