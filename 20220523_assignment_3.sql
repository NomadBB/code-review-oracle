데이터의 작업시간이 짧게 걸리는 시간 순서대로 1부터 15까지의 순위를 매겨서 출력하시오.        
--그룹별로 순위 매겨보기

--RANK() OVER(PARTITION BY 기준 컬럼1 ORDER BY 기준 컬럼2) as ""

SELECT * FROM t_worktime

SELECT workcd_vc, time_nu,
    RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu) as "RANK"
    FROM t_worktime 
    --workcd_vc 컬럼이 그룹별로 순위가 정해짐 + time_nu(작업시간) 오름차순
    
SELECT workcd_vc, time_nu,
    RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "RANK"
    FROM t_worktime     
    --workcd_vc 컬럼이 그룹별로 순위가 정해짐 + time_nu(작업시간) 내림차순
    
순위를 구하는 세가지 함수 모두 사용해보기(RANK, DENSE_RANK, ROW_NUMBER)

SELECT workcd_vc, time_nu,
    RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "RANK",
    DENSE_RANK() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "D_RANK",
    ROW_NUMBER() OVER(PARTITION BY workcd_vc ORDER BY time_nu DESC) as "ROW_NUM"
    FROM t_worktime
    