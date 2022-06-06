9월 3일 원화 결제금액으로 얼마를 준비해야 할까? (단, 환율은 하루 전의 환율을 적용한다.)

1. crate의 이전 row값 가져오기(9월 1일은 계산 불가)

2. 결제금액 구하기(AMT*CRATE)

3. 9월 3일 결제금액 구하기


1.crate의 이전 row값 가져오기
--9월 1일의 cdate와 AMT 값 삭제 후 각 레코드 한칸씩 올리기
--9월 1일의 crate만 한칸씩 내리기

SELECT * FROM test02

SELECT cdate, amt, crate
 FROM test02 --test02 테이블 생성

SELECT ROWNUM cdate, amt, crate 
FROM test02

SELECT cdate, amt, rn
 FROM (SELECT ROWNUM rn, amt, cdate
  FROM test02
  WHERE ROWNUM = rn-1

SELECT ROWNUM+1 rn, crate
 FROM test02

SELECT cdate as "날짜"
      ,amt as "금액"
      ,crate as "적용 환율"
      ,amt*crate as "결제 금액"
      FROM test02
      WHERE(SELECT 