이들 데이터의 작업시간이 짧게 걸리는 시간 순서대로 1부터 15까지의 순위를 매겨서 출력하시오.        
--순위를 구하는 RANK, DENSE_RANK, RWO_NUMBER 3가지 함수 모두 사용해보기

--1. RANK() 순위를 정하는  함수
--중복 순위 개수만큼 다음 순위 값을 증가시킴 
--ex)time_nu가 0.11, 0.11, 0.11, 0.49순이라면
--1위, 1위, 1위, 4위가 된다.
 
--2. DENSE_RANK() 순위를 정하는 함수
--중복 순위가 존재해도 순차적으로 다음 순위 값을 나타냄
--ex)time_nu가 0.11, 0.11, 0.11, 0.49순이라면
--1위, 1위, 1위, 2위가 된다.

--3. ROW_NUMBER()순위를 정하는 함수
--중복과 상관 없이 순위가 정해짐
--ex)time_nu가 0.11, 0.11, 0.11, 0.49순이라면
--1위, 2위, 3위가 된다.

--세 함수 모두 ORDER BY를 사용하여 특정 항목에 대한 순위를 정할 수 있음.

SELECT * FROM t_worktime

SELECT workcd_vc, time_nu 
    FROM t_worktime

SELECT workcd_vc, time_nu 
    FROM t_worktime
    ORDER BY time_nu asc
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK", 
    DENSE_RANK() OVER(ORDER BY time_nu) as "D_RANK",
    ROW_NUMBER() OVER(ORDER BY time_nu) as "R_NUM"
    FROM t_worktime
    
