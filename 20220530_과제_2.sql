9�� 3�� ��ȭ �����ݾ����� �󸶸� �غ��ؾ� �ұ�? (��, ȯ���� �Ϸ� ���� ȯ���� �����Ѵ�.)

1. crate�� ���� row�� ��������(9�� 1���� ��� �Ұ�)

2. �����ݾ� ���ϱ�(AMT*CRATE)

3. 9�� 3�� �����ݾ� ���ϱ�


1.crate�� ���� row�� ��������
--9�� 1���� cdate�� AMT �� ���� �� �� ���ڵ� ��ĭ�� �ø���
--9�� 1���� crate�� ��ĭ�� ������

SELECT * FROM test02

SELECT cdate, amt, crate
 FROM test02 --test02 ���̺� ����

SELECT ROWNUM cdate, amt, crate 
FROM test02

SELECT cdate, amt, rn
 FROM (SELECT ROWNUM rn, amt, cdate
  FROM test02
  WHERE ROWNUM = rn-1

SELECT ROWNUM+1 rn, crate
 FROM test02

SELECT cdate as "��¥"
      ,amt as "�ݾ�"
      ,crate as "���� ȯ��"
      ,amt*crate as "���� �ݾ�"
      FROM test02
      WHERE(SELECT 