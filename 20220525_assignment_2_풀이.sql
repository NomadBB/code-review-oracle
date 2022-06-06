2.김유신이 보유한 포인트로 얻을 수 있는 상품 중, 가장 포인트가 높은 것

김유신의 포인트 t_giftpoint
조건은 김유신 - WHERE절 아래

가장 포인트가 높은 것 - MAX(그룹함수)
그룹함수는 무조건 GROUP BY 사용

SELECT * FROM t_giftmem

SELECT 포인트 FROM t_giftmem
WHERE 이름 = '김유신'

SELECT point_nu FROM t_giftmem
WHERE name_vc = '김유신' --김유신 포인트 찾기

김유신의 포인트는 간접 조건임->따라서 WHERE절에 서브쿼리를 써주면 됨

SELECT m.point_nu 
 FROM t_giftmem m, t_giftpoint p
 WHERE m.name_vc = '김유신'
    AND m.point_nu >= p.point_nu
    
SELECT m.point_nu 
 FROM t_giftmem m, t_giftpoint p
 WHERE 
    (
    m.name_vc = '김유신'
    AND m.point_nu >= p.point_nu
    )

=:name -> 문자 조회 가능

SELECT
    point_nu
    FROM t_giftmem
    WHERE name_vc =:name
    
    
김유신의 보유 포인트

SELECT
    point_nu
    FROM t_giftmem
    WHERE name_vc = '김유신'
    
SELECT
    point_nu
 FROM t_giftpoint
 WHERE point_nu <= 50012 --상수 싫어요--50012 포인트보다 작아야 함

SELECT
    point_nu
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='김유신'
                    )
                    --50012 대신 서브쿼리를 통해  김유신 사용
                    
SELECT
    mac(point_nu)
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='김유신'
                    )--point_nu에 MAX를 씌운다.

그룹함수와 일반컬럼은 같이 사용할 수 없다.
         
SELECT
    max(point_nu) ,name_vc --상품의 최대포인트와 이름 출력 ->불가능
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='김유신'
                    ) 

SELECT
    max(point_nu) ,max(name_vc) --한과세트 출력을 위해 이름에 멕스를 씌워줌
                                --옆에 멕스가 있는데 미니멈을 쓰면 안됨
                                --멕스가 있으므로 오른쪽도 멕스 써준다
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='김유신'
                    ) 
                    
SELECT name_vc, point_nu
FROM t_giftpoint
WHERE point_nu = 50000 -- 한과세트 50000 --50000을 내가 찾으면 안된다->서브쿼리 써주기


최종

SELECT name_vc, point_nu
FROM t_giftpoint
WHERE point_nu = (
                  SELECT max(point_nu)
                  FROM t_giftpoint
                  WHERE point_nu <= (
                                     SELECT point_nu
                                     FROM t_giftmem
                                     WHERE name_vc ='김유신'
                                     ) 
                 )                                    