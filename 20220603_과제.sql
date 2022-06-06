2022년 6월 3일 과제 입니다.
컬럼레벨을 로우레벨로 내려서 출력하기
각 행에 1학년 부터 4학년 까지를 분리해서 한 행에 하나의 학년만 나오도록 하고자 한다. 
현재 12행이 있으니 총 48행의 결과가 대학별/학과별로 인원수가 나와야 한다. 

1. 한 행에 하나의 학년만 나오도록 분리
2. 총 48행의 결과 --데이터 4번 읽기, 카타시안의 곱
3. 대학별/학과별로 인원수가 나와야 함


SELECT * FROM test11

먼저 위 테이블에서 coll(공과대학), dept(항공우주공학과)가 학년별로 출력이 돼야 함

--coll(공과대학), dept(항공우주공학과) 1학년
--coll(공과대학), dept(항공우주공학과) 2학년
--coll(공과대학), dept(항공우주공학과) 3학년
--coll(공과대학), dept(항공우주공학과) 4학년
--이런식으로 쭉 출력 되게 만들어주기

먼저 데이터를 4배수로 복제(카타시안의 곱)
현재 12행이 있지만 48행이 나와야 함(12*4)

--UNION ALL + 더미테이블 사용해보기
SELECT 1 FROM dual
UNION ALL 
SELECT 2 FROM dual 

카타시안의 곱은 FROM절에 두개 이상의 테이블을 명시하지만
WHERE절에서는 조인 조건을 주지 않는다.

SELECT * 
 FROM test11,
      (SELECT 1 FROM dual
       UNION ALL
       SELECT 2 FROM dual
       UNION ALL
       SELECT 3 FROM dual
       UNION ALL
       SELECT 4 FROM dual)
--총 48행.
--UNION ALL로도 결과가 나오지만 일일이 작성하기 번거롭다  

--ROWNUM 사용해보기
SELECT ROWNUM rno
 FROM test11
--그냥 ROWNUM만 사용하면 원하는 결과가 안나옴
--조건절에서 조건 붙여주기

SELECT ROWNUM rno
 FROM test11 
 WHERE ROWNUM < 5
--5보다 작은 조건을 걸어주면 4배수(총 48행)로 복제 가능

SELECT * 
 FROM test11, (SELECT ROWNUM rno
               FROM test11
               WHERE ROWNUM < 5)
--한 행에 한 학년만 나오게 출력 가능해짐
--fre, sup, jun, sen의 값들도 한 행에 하나만 나오도록 출력

DECODE 사용해서 조건 특정 시키기
*DECODE는 컬럼명, GROUP BY, ORDER BY에 사용 가능

SELECT * 
 FROM test11, (SELECT ROWNUM rno
               FROM test11
               WHERE ROWNUM < 5)
--여기서 rno가 key3(한 행에 한 학년)값이 돼야 함

rno가 
1이면 1학년, 
2면 2학년, 
3이면 3학년, 
4면 4학년이 출력되도록

DECODE(rno,1,'1학년',2,'2학년',3'3학년',4,'4학년') key3


--SELECT문에 컬럼명 대신 써주기
SELECT coll, dept
      ,DECODE(rno,1,'1학년',2,'2학년',3,'3학년',4,'4학년') key3
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
--출력 됨
--key4값도 만들어 주기(여기서도 rno가 key4값으로 나오도록 해줘야 될듯?)

SELECT coll, dept
      ,DECODE(rno,1,'1학년',2,'2학년',3,'3학년',4,'4학년') key3
      ,ROWNUM rno
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)

rno가 1이면 fre값, 
2면 sup값, 
3이면 jun값, 
4면 sen값 나오도록

DECODE(rno,1,fre,2,sup,3,jun,4,sen) key4


--SELECT문에 컬럼명 대신 써주기
SELECT coll, dept
      ,DECODE(rno,1,'1학년',2,'2학년',3,'3학년',4,'4학년') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
--출력 됨
--값이 맞는지 확인해보기

SELECT * FROM test11
--공과대학 항공우주공학과 fre=120
--공과대학 항공우주공학과 sup=140
--공과대학 항공우주공학과 jun=140
--공과대학 항공우주공학과 sen=120

SELECT coll, dept
      ,DECODE(rno,1,'1학년',2,'2학년',3,'3학년',4,'4학년') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
WHERE dept = '항공우주공학과'
--디폴트 테이블의 값과 일치함

--구했던 식으로 다시 돌아가서
SELECT coll, dept
      ,DECODE(rno,1,'1학년',2,'2학년',3,'3학년',4,'4학년') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
--정렬이 안돼있다->첨부 이미지 조건대로 정렬해주기
--ORDER BY

SELECT coll, dept
      ,DECODE(rno,1,'1학년',2,'2학년',3,'3학년',4,'4학년') key3
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) key4
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
ORDER BY dept, key3 asc


--최종
SELECT coll, dept
      ,DECODE(rno,1,'1학년',2,'2학년',3,'3학년',4,'4학년') as "KEY3"
      ,DECODE(rno,1,FRE,2,SUP,3,JUN,4,SEN) as "KEY4"
FROM test11, (SELECT ROWNUM rno
              FROM test11
              WHERE ROWNUM < 5)
ORDER BY dept, KEY3 asc
