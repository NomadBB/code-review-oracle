3. 영문 가사와 한글 가사가 번갈아 나오게 하기

SELECT * FROM t_letitbe

SELECT
       seq_vc, DECODE(MOD(seq_vc,2),1, words_vc)
  FROM t_letitbe
UNION ALL
SELECT
       seq_vc, DECODE(MOD(seq_vc,2),0, words_vc)
  FROM t_letitbe

--union all은 두 SELECT문의 결과를 합친다+ 결과에서 중복죄는 행은 하나만 표시
--①홀수+영문 가사(나머지는 null 표시) ②짝수+한글 가사(나머지는 null 표시) 순으로 출력됨

SELECT seq_vc FROM t_letitbe
ORDER BY TO_NUMBER(seq_vc) asc 
--데이터 타입이 VARCHAR2로 되어있는 경우에 숫자 타입으로 바꿔주는 TO_NUMBER 사용
  
SELECT seq_vc "번호"
  FROM (
          SELECT
               seq_vc, decode(mod(seq_vc,2),1, words_vc) "영문 가사"
          FROM t_letitbe     
        UNION ALL
        SELECT
               seq_vc, decode(mod(seq_vc,2),0, words_vc) "한글 가사"
          FROM t_letitbe      
       )
GROUP BY seq_vc
ORDER BY TO_NUMBER(seq_vc) asc

SELECT seq_vc as "번호"
FROM t_letitbe
WHERE MOD(seq_vc,2)=1
OR MOD(seq_vc,2)=0


--group by는 특정 컬럼을 기준으로 집계를 내는데 사용됨 
-- 중복 됐을 때 하나의 행으로 처리
SELECT
DEPTNO, MAX(sal), MIN(sal), AVG(sal)
FROM emp
GROUP BY deptno


