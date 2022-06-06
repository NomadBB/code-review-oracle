SELECT ROWNUM empno, ename FROM emp
--1번부터 차례대로 증가하는 숫자가 출력됨

SELECT ROWNUM empno, ename FROM emp
WHERE ROWNUM>2 --불가능(크다라는 비교는X)

SELECT ROWNUM rno, empno, ename FROM emp
WHERE ROWNUM <=5--작은건 비교 가능

    
한 테이블에서 이전 레코드, 다음 레코드에 접근 할 수 없다.
같은 row에 있는 것 끼리만 접근 가능
해결책=집합을 복제해서 두개를 비교
    
--A집합
SELECT 
         rownum rno, cdate, amt
    FROM test02 --이렇게 하면 순번이 붙는다.

--B집합
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
    )b --81개의 경우의 수
    
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
 WHERE a.rno-1 = b.cno --a에서 a.날짜, a.달러금액, b에서 a.날짜*b.환율

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

--깔끔하게 정리
SELECT 
    a.cdate as "날짜", a.amt as "달러 금액", TO_CHAR(a.amt*b.crate, '999,999,999,999')||'원' as "한화금액"
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
