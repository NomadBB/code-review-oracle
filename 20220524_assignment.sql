1. 영문 가사 출력하기
2. 한글 가사 출력하기

SELECT MOD(6,2) FROM dual --MOD함수 테스트, 6을 2로 나눴을 때 나머지 반환

SELECT * FROM t_letitbe

SELECT seq_vc, words_vc FROM t_letitbe

--홀수(영어 가사)출력
SELECT MOD(seq_vc,2), words_vc FROM t_letitbe 
--seq_vc를 2로 나눌때의 나머지
--홀수, 짝수의 나머지가 모두 출력됨->홀수(나머지=1)만 나오게 하려면?
--조건 함수인  DECODE 함수 써보기

--DECODE(컬럼, 조건, TRUE 결과, FALSE 결과)

SELECT DECODE(1,1,'같다','다르다'), DECODE(1,2,'같다','다르다') FROM dual
--1이 1이면 같다/1이 2면 다르다

SELECT 
DECODE(MOD(seq_vc,2),1,words_vc,null) 
FROM t_letitbe 
--seq_vc를 2로나눈 나머지가 1이면 words_vc(가사 출력)
--아니면 null로 표시

SELECT 
DECODE(MOD(seq_vc,2),1,words_vc) 
FROM t_letitbe  --null이 없어도 결과가 동일함
--의문점)DECODE함수 사용시 FALSE 결과는 따로 적지 않아도 괜찮을까?

SELECT DECODE(1,1,'같다'), DECODE(1,2,'같다') FROM dual
--FALSE 값이 자동으로 null 처리됨

SELECT 
DECODE(MOD(seq_vc,2),1,words_vc,null) 영문 가사
FROM t_letitbe --컬럼별칭 오류->띄어쓰기를 할 땐 ""로 묶어주기+가독성 좋게 as 붙여주기(=표준)

1.영문 가사 출력

SELECT 
seq_vc AS "번호", DECODE(MOD(seq_vc,2),1,words_vc,null) AS "영문 가사"
FROM t_letitbe

1-1.영문 가사 공백 없이 출력

--번호 컬럼도 홀수만 나오게 만들어 주기
SELECT 
seq_vc AS "번호", DECODE(MOD(seq_vc,2),1,words_vc) AS "영문 가사"
FROM t_letitbe
WHERE MOD(seq_vc,2)=1

2.한글 가사 출력

SELECT 
seq_vc, DECODE(MOD(seq_vc,2),0,words_vc) AS "한글 가사"
FROM t_letitbe

2-1.한글 가사 공백 없이 출력

SELECT 
seq_vc AS "번호", DECODE(MOD(seq_vc,2),0,words_vc) AS "한글 가사"
FROM t_letitbe
WHERE MOD(seq_vc,2)=0