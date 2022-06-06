2001년 9월 3일 결제금액으로 한화 얼마를 준비해야 할까?

SELECT * FROM test02

SELECT cdate, amt, crate 
 FROM test02 
 --crate은 하루 전날의 값이므로 
--9월 1일의 crate 값은 null, 나머지 값들은 row를 하나씩 당기면 되지 않을까?
 
SELECT cdate, amt, crate,
LAG(crate) OVER(ORDER BY crate)
FROM test02

SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "적용 환율"
FROM test02

SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "적용 환율",
AMT*(LAG(crate) OVER(ORDER BY crate)) as "환산 금액"
FROM test02


SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "적용 환율",
TO_CHAR(AMT*((LAG(crate) OVER(ORDER BY crate))), '999,999,999')||'원' as "환산 금액"
FROM test02

SELECT cdate, amt,
LAG(crate) OVER(ORDER BY crate) as "적용 환율",
TO_CHAR(AMT*(LAG(crate) OVER(ORDER BY crate)), '999,999,999') ||'원' as "환산 금액"
FROM test02
WHERE CDATE = '20010905'
