1. 영화 티켓을 받을 수 있는 사람의 명단과 현재 가지고 있는 포인트, 영화 티켓의 포인트            
그리고 그 티켓을 사용한 후 남은 예상 포인트를 출력하시오.            

구해볼 것
1)영화 티켓을 받을 수 있는 사람의 명단과 현재 포인트
2)영화 티켓 포인트
3)영화 티켓 사용 후 예상 포인트

SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint

1)영화 티켓을 받을 수 있는 사람의 명단과 현재 포인트

SELECT name_vc, point_nu
 FROM t_giftmem

SELECT name_vc, point_nu 
 FROM t_giftmem
 WHERE point_nu>=15000 --영화 티켓을 받을 수 있는 사람의 명단(조건 추가)

2)영화 티켓 포인트 

SELECT name_vc, point_nu  
 FROM t_giftpoint
 WHERE name_vc = '영화티켓' 

--서로 다른 테이블에서 값을 비교해야 하므로 인라인뷰 사용
--FROM절에서의 두 집합은 서로 관계가 있어야 함

--인라인뷰 사용해보기
--1)과 2) 비교

SELECT A.name_vc, A.point_nu
 FROM t_giftmem A,
  (
  SELECT name_vc, point_nu  
  FROM t_giftpoint B
  WHERE name_vc = '영화티켓'
  )--A 테이블과 B 테이블에서 A의 이름과 보유포인트 가져오기
--원하는 컬럼이 모두 출력 안됨
  
SELECT name_vc, point_nu
 FROM t_giftmem,
    (
    SELECT name_vc, point_nu  
    FROM t_giftpoint
    WHERE name_vc = '영화티켓'
    )--오류(열의 정의가 애매함)
 
SELECT *
 FROM t_giftmem,
    (
    SELECT name_vc, point_nu  
    FROM t_giftpoint
    WHERE name_vc = '영화티켓'
    )--일단 모든 컬럼 표시해보기

--알리아스명 사용해서 테이블별 컬럼명 구분해주기
SELECT *
 FROM t_giftmem A,
    (
    SELECT name_vc, point_nu  
    FROM t_giftpoint
    WHERE name_vc = '영화티켓'
    )B--t_giftpoint 테이블의 알리아스명->B (B 테이블은 괄호 안)
 WHERE A.point_nu>=B.point_nu
    --t_giftmem, t_giftpoint 테이블(괄호 안을 만족하는)의 모든(*) 컬럼 출력
    --단, A포인트(보유포인트)가 B포인트(영화티켓 포인트)보다 크거나 같아야 영화티켓을 받을 수 있음
    
--실제 업무에서 * 사용은 권장되지 않으므로 필요한 컬럼명만 적어준다.
SELECT A.name_vc
      ,A.point_nu
      --,B.name_vc(필요없으므로 삭제)
      ,B.point_nu
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '영화티켓'
      )B
 WHERE A.point_nu>=B.point_nu
      
--A.point_nu, B.point_nu 가독성 좋게 표시하기
--TO_CHAR 함수 사용, 문자열이므로 싱글 쿼테이션
SELECT A.name_vc
      ,TO_CHAR(A.point_nu, '999,999')||'점'
      ,B.name_vc
      ,TO_CHAR(B.point_nu, '999,999')||'점'
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '영화티켓'
      )B
 WHERE A.point_nu>=B.point_nu

--컬럼명도 가독성 좋게 별칭 사용하기     
SELECT A.name_vc as "이름"
      ,TO_CHAR(A.point_nu, '999,999')||'점' "보유포인트"
      ,TO_CHAR(B.point_nu, '999,999')||'점' "차감포인트(영화티켓)"
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '영화티켓'
      )B
 WHERE A.point_nu>=B.point_nu
      
3)영화티켓 사용 후 예상 포인트
 
--보유포인트에서 차감포인트 빼주기
--컬럼자리에 연산 사용 가능하므로 연산으로 처리하면 될듯
SELECT A.name_vc as "이름"
      ,TO_CHAR(A.point_nu, '999,999')||'점' as "보유포인트"
      ,TO_CHAR(B.point_nu, '999,999')||'점' as "차감포인트(영화티켓)"
      ,TO_CHAR(A.point_nu-B.point_nu,'999,999')||'점' as "잔여포인트" --컬럼 자리에  연산
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '영화티켓'
      )B
 WHERE A.point_nu>=B.point_nu
 
 
최종

SELECT A.name_vc as "이름"
      ,TO_CHAR(A.point_nu, '999,999')||'점' as "보유포인트"
      ,TO_CHAR(B.point_nu, '999,999')||'점' as "차감포인트(영화티켓)"
      ,TO_CHAR(A.point_nu-B.point_nu,'999,999')||'점' as "잔여포인트" --컬럼 자리에  연산
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '영화티켓'
      )B
 WHERE A.point_nu>=B.point_nu