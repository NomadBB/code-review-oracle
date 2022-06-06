SELECT * FROM t_orderbasket

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual --임의의 테이블을 만들어 카타시안의 곱을 적용 시킴
--54*2=108개로

더미테이블 이용하여 데이터를 2배수로 복제하기 -카타시안의 곱

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
GROUP BY indate_vc --날짜를 이용한 그루핑
     
SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc
UNION ALL
SELECT '총계' FROM dual 

DECODE(ROWNUM,1,indate_vc,2,'총계')

SELECT DECODE(ROWNUM,1,indate_vc,2,'총계') 
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )
--총계 나타내기
--108개에 대한 값
--인라인뷰

SELECT DECODE(b.rno,1,indate_vc,2,'총계') 
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
--인라인뷰기 때문에 b.rno로 나타내는 것이 가능

SELECT DECODE(b.rno,1,indate_vc,2,'총계') 
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'총계')
ORDER BY DECODE(b.rno,1,indate_vc,2,'총계')
--DECODE 오더바이, 그룹바이, 컬럼명에 사용 가능
--그룹바이는 정렬이 안되므로 오더바이를 밑에 써주기
--날짜에 존재하지 않는 총계라는 컬럼을 따로 붙임

매출액 = 수량*단가
매출액은 SUM
로우를 세는게 COUNT

SUM(qty_nu*price_nu) as "매출액"


SELECT DECODE(b.rno,1,indate_vc,2,'총계') as "판매날짜"
      ,SUM(qty_nu*price_nu) as "매출액"
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'총계')
ORDER BY DECODE(b.rno,1,indate_vc,2,'총계')


SELECT DECODE(b.rno,1,indate_vc,2,'총계') as "판매날짜"
      ,SUM(qty_nu)||'개' as "판매개수"
      ,SUM(qty_nu*price_nu)||'원' as "매출액"
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'총계')
ORDER BY DECODE(b.rno,1,indate_vc,2,'총계')--정렬은 2차가공이므로 알리아스명 사용 가능

--최종 답안
SELECT DECODE(b.rno,1,indate_vc,2,'총계') as "판매날짜"
      ,SUM(qty_nu)||'개' as "판매개수"
      ,SUM(qty_nu*price_nu)||'원' as "매출액"
FROM t_orderbasket,
     (
      SELECT rownum rno FROM dept
      WHERE rownum < 3
     )b
GROUP BY DECODE(b.rno,1,indate_vc,2,'총계')
ORDER BY "판매날짜"

