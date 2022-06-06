컬럼명이  같으면 별칭 사용하기

FROM 사람, 포인트 --FROM 뒤는 집합, 집합이 두개 필요함
--여기서 한개만 쓰면 부적합한 식별자라고 뜸

사람이 5명 상품이 6개 -> 30개의 경우의 수
5명 * 6개 중에서 1개 상품 = 5

SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint

SELECT *
    FROM t_giftmem, t_giftpoint --경우의 수 30가지

SELECT t_giftmem.point_nu as "보유포인트"
      ,t_giftpoint.point_nu as "적용포인트"
    FROM t_giftmem, t_giftpoint --이 둘을 빼면 잔여포인트가 남는다.

SELECT t_giftmem.point_nu as "보유포인트"
      ,t_giftpoint.point_nu as "적용포인트"
      ,t_giftmem.point_nu - t_giftpoint.point_nu as "잔여포인트"
    FROM t_giftmem, t_giftpoint 

내가 보유한 포인트 >= 상품의 포인트
    
음수는 내가 가질 수 없는 상품->제외시켜야 함. 경우의 수에서 30가지(5*6)
문제를 천천히 꼼꼼하게 읽어서 최대한의 정보를 얻어낼 것

영화티켓 중에서(AND)->6개의 상품 중엣 하나만 따짐 
mem.point_nu>= point.point_nu --둘 다를 만족하는 원소들 중

이름 보유포인트 적용포인트 보유포인트-적용포인트

6개 중에서 하나만 비교한다.

--FROM절 밑에는 집합 올 수 있다
--집합의 자리에는 OR, SELECT문이 올 수도 있다.
--인라인뷰 선택-경우의 수 줄이기 위해(옵티마이저의 일 양을 줄이기 위해)

SELECT point_nu
 FROM t_giftpoint
 WHERE name_vc = '영화티켓'
 
SELECT t_giftmem.point_nu as "보유포인트"
      ,t_giftpoint.point_nu as "적용포인트"
      ,t_giftmem.point_nu - t_giftpoint.point_nu as "잔여포인트"
    FROM t_giftmem, t_giftpoint --t_giftpoint 여기다가 SELECT문 사용해주기 
    
SELECT mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트" --잔여포인트에 마이너스가 남아있다.
    FROM t_giftmem mem
   ,(
   SELECT point_nu
     FROM t_giftpoint --여기서 point 안쓰는 이유
     WHERE name_vc = '영화티켓'
    )point
    WHERE mem.point_nu>=point.point_nu --음수 날아감
    
--원소의 갯수가 줄어든다(=AND)

--영화티켓을 받을 수 있는 사람의 이름은 mem의 name_vc에 있다

SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트" 
    FROM t_giftmem mem
   ,(
   SELECT point_nu
     FROM t_giftpoint 
     WHERE name_vc = '영화티켓'
    )point
    WHERE mem.point_nu>=point.point_nu 
    
SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트" 
    FROM t_giftmem mem, t_giftpoint point
    WHERE mem.point_nu>=point.point_nu 
    AND point.name_vc = '영화티켓' --이 식보다는 위의 식이 경우의 수를 줄여준다
    
=:x
변수 x는 UI에서 가져온다.
변수 대신 이거 쓰면 변수명 변경 가능
