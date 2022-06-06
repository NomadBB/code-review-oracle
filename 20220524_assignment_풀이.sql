1. 영문가사

SELECT * FROM t_letitbe

SELECT seq_vc 
    ,TO_NUMBER(seq_vc) --VARCHAR2 일땐 문자가 왼쪽 정렬, 숫자 타입은  오른쪽 정렬
    FROM t_letitbe

SELECT empno FROM emp

MOD(2,2),1,0 --2를 2로 나눈 나머지가 1이면 홀수, 0이면 짝수

DECODE(MOD(2,2),1,'홀수') --조건문, 2를 2로 나눈 나머지가 1이니? 그럼 홀수를 보여줘

SELECT DECODE(MOD(2,2),0,'홀수')
    FROM dual
    
SELECT 
MOD(seq_vc,2) n
FROM t_letitbe

SELECT 
MOD(seq_vc,2) n
FROM t_letitbe
WHERE n = 1
--불가능
--where절에는 t_letitbe테이블에 존재하지 않는 컬럼명이나 별칭을 쓰는 것은 컨벤션에 맞지 않음
--인라인뷰는 별칭 사용가능
--인라인뷰는 FROM절 밑에 SELECT문이 오는 것. 테이블이 아니라 집합임(짝수의 집합, 사원들의 집합...)

SELECT n
FROM
(
SELECT
MOD(seq_vc,2) n
FROM t_letitbe
)
WHERE n = 1 
--인라인뷰를 사용하면 where절에서 별칭을 사용할 수 있음(n)

SELECT 
rownum rno, eng_words 
FROM(
SELECT
MOD(seq_vc,2) no
,DECODE(MOD(seq_vc,2),1,words_vc) eng_words --컬럼(seq_vc)은 변하므로 앞쪽에 써줌
FROM t_letitbe
)
WHERE no  = 1
--영문 가사

IF 2%2=0 THEN --자바
    return '짝수'
ELSEIF 2%2=1 THEN
    return '홀수'
END;


3.영문 한글 번갈아 출력


SELECT
seq_vc
,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
FROM t_letitbe
UNION ALL
SELECT
seq_vc
,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
FROM t_letitbe
--영문 먼저 -> 한글
--번갈아 나오게 하려면 group by

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
GROUP BY seq_vc --여기까지 한 후 가사를 붙여야 함


SELECT 
    seq_vc, max(eng_words) --max는 아무 의미 없다. 그룹바이에 대한 문법적 문제 해결위해. 가사 나타냄
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
GROUP BY seq_vc --여기까지 한 후 가사를 붙여야 함
ORDER BY TO_NUMBER(seq_vc) asc


SELECT 
    deptno, max(sal) --group by와 select의 컬럼이 일치해야 함
    --일치하지 않으면 앞에 함수 붙여서(max(sal))
    FROM emp
    GROUP BY deptno