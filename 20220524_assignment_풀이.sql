1. ��������

SELECT * FROM t_letitbe

SELECT seq_vc 
    ,TO_NUMBER(seq_vc) --VARCHAR2 �϶� ���ڰ� ���� ����, ���� Ÿ����  ������ ����
    FROM t_letitbe

SELECT empno FROM emp

MOD(2,2),1,0 --2�� 2�� ���� �������� 1�̸� Ȧ��, 0�̸� ¦��

DECODE(MOD(2,2),1,'Ȧ��') --���ǹ�, 2�� 2�� ���� �������� 1�̴�? �׷� Ȧ���� ������

SELECT DECODE(MOD(2,2),0,'Ȧ��')
    FROM dual
    
SELECT 
MOD(seq_vc,2) n
FROM t_letitbe

SELECT 
MOD(seq_vc,2) n
FROM t_letitbe
WHERE n = 1
--�Ұ���
--where������ t_letitbe���̺� �������� �ʴ� �÷����̳� ��Ī�� ���� ���� �����ǿ� ���� ����
--�ζ��κ�� ��Ī ��밡��
--�ζ��κ�� FROM�� �ؿ� SELECT���� ���� ��. ���̺��� �ƴ϶� ������(¦���� ����, ������� ����...)

SELECT n
FROM
(
SELECT
MOD(seq_vc,2) n
FROM t_letitbe
)
WHERE n = 1 
--�ζ��κ並 ����ϸ� where������ ��Ī�� ����� �� ����(n)

SELECT 
rownum rno, eng_words 
FROM(
SELECT
MOD(seq_vc,2) no
,DECODE(MOD(seq_vc,2),1,words_vc) eng_words --�÷�(seq_vc)�� ���ϹǷ� ���ʿ� ����
FROM t_letitbe
)
WHERE no  = 1
--���� ����

IF 2%2=0 THEN --�ڹ�
    return '¦��'
ELSEIF 2%2=1 THEN
    return 'Ȧ��'
END;


3.���� �ѱ� ������ ���


SELECT
seq_vc
,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
FROM t_letitbe
UNION ALL
SELECT
seq_vc
,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
FROM t_letitbe
--���� ���� -> �ѱ�
--������ ������ �Ϸ��� group by

SELECT 
    seq_vc
FROM(
SELECT
seq_vc
,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
FROM t_letitbe
UNION ALL
SELECT
seq_vc
,DECODE(MOD(seq_vc,2),0,words_vc) kor_words 
FROM t_letitbe
)
GROUP BY seq_vc --������� �� �� ���縦 �ٿ��� ��


SELECT 
    seq_vc, max(eng_words) --max�� �ƹ� �ǹ� ����. �׷���̿� ���� ������ ���� �ذ�����. ���� ��Ÿ��
FROM(
SELECT
seq_vc
,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
FROM t_letitbe
UNION ALL
SELECT
seq_vc
,DECODE(MOD(seq_vc,2),0,words_vc) kor_words 
FROM t_letitbe
)
GROUP BY seq_vc --������� �� �� ���縦 �ٿ��� ��
ORDER BY TO_NUMBER(seq_vc) asc


SELECT 
    deptno, max(sal) --group by�� select�� �÷��� ��ġ�ؾ� ��
    --��ġ���� ������ �տ� �Լ� �ٿ���(max(sal))
    FROM emp
    GROUP BY deptno