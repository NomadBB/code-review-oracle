1. ���� ���� ����ϱ�
2. �ѱ� ���� ����ϱ�

SELECT MOD(6,2) FROM dual --MOD�Լ� �׽�Ʈ, 6�� 2�� ������ �� ������ ��ȯ

SELECT * FROM t_letitbe

SELECT seq_vc, words_vc FROM t_letitbe

--Ȧ��(���� ����)���
SELECT MOD(seq_vc,2), words_vc FROM t_letitbe 
--seq_vc�� 2�� �������� ������
--Ȧ��, ¦���� �������� ��� ��µ�->Ȧ��(������=1)�� ������ �Ϸ���?
--���� �Լ���  DECODE �Լ� �Ẹ��

--DECODE(�÷�, ����, TRUE ���, FALSE ���)

SELECT DECODE(1,1,'����','�ٸ���'), DECODE(1,2,'����','�ٸ���') FROM dual
--1�� 1�̸� ����/1�� 2�� �ٸ���

SELECT 
DECODE(MOD(seq_vc,2),1,words_vc,null) 
FROM t_letitbe 
--seq_vc�� 2�γ��� �������� 1�̸� words_vc(���� ���)
--�ƴϸ� null�� ǥ��

SELECT 
DECODE(MOD(seq_vc,2),1,words_vc) 
FROM t_letitbe  --null�� ��� ����� ������
--�ǹ���)DECODE�Լ� ���� FALSE ����� ���� ���� �ʾƵ� ��������?

SELECT DECODE(1,1,'����'), DECODE(1,2,'����') FROM dual
--FALSE ���� �ڵ����� null ó����

SELECT 
DECODE(MOD(seq_vc,2),1,words_vc,null) ���� ����
FROM t_letitbe --�÷���Ī ����->���⸦ �� �� ""�� �����ֱ�+������ ���� as �ٿ��ֱ�(=ǥ��)

1.���� ���� ���

SELECT 
seq_vc AS "��ȣ", DECODE(MOD(seq_vc,2),1,words_vc,null) AS "���� ����"
FROM t_letitbe

1-1.���� ���� ���� ���� ���

--��ȣ �÷��� Ȧ���� ������ ����� �ֱ�
SELECT 
seq_vc AS "��ȣ", DECODE(MOD(seq_vc,2),1,words_vc) AS "���� ����"
FROM t_letitbe
WHERE MOD(seq_vc,2)=1

2.�ѱ� ���� ���

SELECT 
seq_vc, DECODE(MOD(seq_vc,2),0,words_vc) AS "�ѱ� ����"
FROM t_letitbe

2-1.�ѱ� ���� ���� ���� ���

SELECT 
seq_vc AS "��ȣ", DECODE(MOD(seq_vc,2),0,words_vc) AS "�ѱ� ����"
FROM t_letitbe
WHERE MOD(seq_vc,2)=0