3. ���� ����� �ѱ� ���簡 ������ ������ �ϱ�

SELECT * FROM t_letitbe

SELECT
       seq_vc, DECODE(MOD(seq_vc,2),1, words_vc)
  FROM t_letitbe
UNION ALL
SELECT
       seq_vc, DECODE(MOD(seq_vc,2),0, words_vc)
  FROM t_letitbe

--union all�� �� SELECT���� ����� ��ģ��+ ������� �ߺ��˴� ���� �ϳ��� ǥ��
--��Ȧ��+���� ����(�������� null ǥ��) ��¦��+�ѱ� ����(�������� null ǥ��) ������ ��µ�

SELECT seq_vc FROM t_letitbe
ORDER BY TO_NUMBER(seq_vc) asc 
--������ Ÿ���� VARCHAR2�� �Ǿ��ִ� ��쿡 ���� Ÿ������ �ٲ��ִ� TO_NUMBER ���
  
SELECT seq_vc "��ȣ"
  FROM (
          SELECT
               seq_vc, decode(mod(seq_vc,2),1, words_vc) "���� ����"
          FROM t_letitbe     
        UNION ALL
        SELECT
               seq_vc, decode(mod(seq_vc,2),0, words_vc) "�ѱ� ����"
          FROM t_letitbe      
       )
GROUP BY seq_vc
ORDER BY TO_NUMBER(seq_vc) asc

SELECT seq_vc as "��ȣ"
FROM t_letitbe
WHERE MOD(seq_vc,2)=1
OR MOD(seq_vc,2)=0


--group by�� Ư�� �÷��� �������� ���踦 ���µ� ���� 
-- �ߺ� ���� �� �ϳ��� ������ ó��
SELECT
DEPTNO, MAX(sal), MIN(sal), AVG(sal)
FROM emp
GROUP BY deptno


