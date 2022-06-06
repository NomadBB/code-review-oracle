2. 김유신씨가 보유하고 있는 마일리지 포인트로 얻을 수 있는 상품 중 가장 포인트가 높은 것은    
무엇인가?    

구해볼 것
1)김유신이 보유하고 있는 포인트
2)김유신의 보유 포인트와 상품별 포인트 비교(보유 포인트 >= 상품 포인트)
3)가장 포인트가 높은 상품(MAX 사용해야 할듯)
  
SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint
--t_giftmem과 t_giftpoint 테이블에서 name_vc, point_nu라는 컬럼명이 겹친다
--값 구할 때 헷갈림->별칭 써주기
  
컬럼명에 알리아스 사용시 as를 붙이지 않아도 사용 가능(알리아스명.컬럼명 순으로 입력)
테이블명에 알리아스 사용시(테이블명 알리아스명 순으로 입력)

SELECT point_nu as A, point_nu as B 
 FROM t_giftmem A, t_giftpoint B --오류)열의 정의가 애매합니다.

SELECT A.point_nu, B.point_nu 
 FROM t_giftmem AA, t_giftpoint BB --오류)부적합한 식별자

SELECT A.point_nu, B.point_nu 
 FROM t_giftmem A, t_giftpoint B --실행됨


1)김유신의 보유포인트 구하기

SELECT name_vc, point_nu 
 FROM t_giftmem 

SELECT name_vc, point_nu 
 FROM t_giftmem 
 WHERE name_vc = '김유신' --김유신으로 이름 특정해주기

SELECT A.name_vc, A.point_nu 
 FROM t_giftmem A
 WHERE A.name_vc = '김유신'
--문자열이므로 김유신에 싱글 쿼테이션


2)김유신의 보유 포인트와 상품별 포인트 비교
  보유 포인트 >= 상품 포인트 --인라인뷰 사용해보기
  
SELECT * FROM t_giftmem, t_giftpoint --두 테이블 모두 출력

SELECT A.point_nu, B.point_nu 
 FROM t_giftmem A, t_giftpoint B --비교할 것이 A와 B의 포인트이므로 알리아스명으로 각각 구분해줌
 WHERE A.point_nu >= B.point_nu 
 --A포인트(김유신의 포인트)가 B포인트(필요한 마일리지 포인트)보다 크거나 같아야 상품을 가질 수 있다.

SELECT A.name_vc, A.point_nu, B.point_nu
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu
 AND A.name_vc = '김유신' --김유신으로 이름 특정해주기 


3)가장 포인트가 높은 상품
->필요한 포인트의 최대값 구하기. 단, 김유신의 포인트가 더 크거나 같아야 함
김유신 포인트(50012)>=필요한 포인트

SELECT 
    MAX(B.point_nu) --B 포인트(필요한 포인트)의 최대값
 FROM t_giftmem A, t_giftpoint B --A 포인트(김유신)와 B 포인트를 비교해줘야 하므로 두 테이블 모두 써줌
 WHERE A.point_nu >= B.point_nu --A 포인트 >= B 포인트
    AND A.name_vc ='김유신'
--결과값이 50000이 나온다.->가독성 좋게 바꿔주기

SELECT 
    TO_CHAR(MAX(B.point_nu),'999,999')||'점' as "MAX 포인트" 
 --TO_CHAR숫자를 문자로 변환하는 함수. 문자열이므로 싱글 쿼테이션
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu 
    AND A.name_vc ='김유신' 
 --포인트만 출력 됨->상품명도 같이 출력해주기
    
SELECT name_vc,
    TO_CHAR(MAX(B.point_nu),'999,999')||'점' as "MAX 포인트" 
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu 
    AND A.name_vc = '김유신'
 --오류남
 --의문점)상품명 출력하는 방법?
    
 
1), 2), 3)의 값을 이용해 최종 결과 구하기 

SELECT A.name_vc, A.point_nu 
 FROM t_giftmem A
 WHERE A.name_vc = '김유신'
    
SELECT A.name_vc, A.point_nu, B.point_nu
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu
    AND A.name_vc = '김유신'

SELECT 
 TO_CHAR(MAX(B.point_nu),'999,999')||'점' as "MAX 포인트" 
 FROM t_giftmem A, t_giftpoint B
 WHERE A.point_nu >= B.point_nu 
    AND A.name_vc ='김유신'
--여기서부터 어떻게 해야될지...

SELECT name_vc, point_nu
 FROM t_giftpoint
    WHERE point_nu =
    (
    SELECT MAX(B.point_nu)
    FROM t_giftmem A, t_giftpoint B
    WHERE A.point_nu >= B.point_nu
    AND A.name_vc = '김유신'
    )
--구글링 해봄
--의문점)왜 인라인뷰가 아니라 WHERE절 서브쿼리를 사용했을까?


--WHERE절 서브쿼리 이해하기
ALLEN보다 급여를 많이 받는 사원의 이름

SELECT ename, sal
 FROM emp

SELECT sal
 FROM emp
 WHERE ename='ALLEN'

SELECT ename, sal
 FROM emp
 WHERE sal>
    (
    SELECT sal
    FROM emp
    WHERE ename='ALLEN'
    )--emp테이블에서 급여가 괄호 안 보다 높은 사람의 이름과 급여 
--괄호 안 : ALLEN의 급여