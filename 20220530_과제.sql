2001�� 9�� 3�� �����ݾ����� ��ȭ �󸶸� �غ��ؾ� �ұ�?

SELECT * FROM test02

SELECT cdate, amt, crate 
 FROM test02 
 --crate�� �Ϸ� ������ ���̹Ƿ� 
--9�� 1���� crate ���� null, ������ ������ row�� �ϳ��� ���� ���� ������?
 
SELECT cdate, amt, crate,
LAG(crate) OVER(ORDER BY crate)
FROM test02

SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "���� ȯ��"
FROM test02

SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "���� ȯ��",
AMT*(LAG(crate) OVER(ORDER BY crate)) as "ȯ�� �ݾ�"
FROM test02


SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "���� ȯ��",
TO_CHAR(AMT*((LAG(crate) OVER(ORDER BY crate))), '999,999,999')||'��' as "ȯ�� �ݾ�"
FROM test02

SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "���� ȯ��",
TO_CHAR(AMT*(LAG(crate) OVER(ORDER BY crate)), '999,999,999') ||'��' as "ȯ�� �ݾ�"
FROM test02
WHERE CDATE = '20010905'
