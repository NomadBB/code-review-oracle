이들 데이터의 작업시간이 짧게 걸리는 시간 순서대로 1부터 15까지의 순위를 매겨서 출력하시오.        

SELECT * FROM t_worktime --t_worktime 테이블의 모든 컬럼  나타냄

SELECT workcd_vc, time_nu --엑셀의 문제와 일치하는 컬럼만 표시
    FROM t_worktime

SELECT workcd_vc, time_nu 
    FROM t_worktime
    ORDER BY time_nu ASC --짧게 걸리는 시간 순이므로 오름차순 정렬-ORDER BY time_mu ASC 사용
    
SELECT workcd_vc, time_nu 
    RANK() OVER(ORDER BY time_nu) as "RANK" --순위 구하기 위해 RANK함수 사용
    --기준 컬럼이 짧게  걸리는 시간 순이므로 time_nu
    FROM t_worktime
    ORDER BY time_nu ASC    
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK" 
    FROM t_worktime  
    ORDER BY time_nu ASC
    --의문점)RANK 함수 내에서 ORDER BY를 사용하면 자동으로 오름차순 정렬이 되는지? 
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK"
    FROM t_worktime 
    --RANk 함수 내에 이미 ORDER BY가 있음->
    --FROM 다음에 ORDER BY 절을  따로  사용하지 않아도 오름차순으로 정렬되는 듯
    
--*emp 테이블에서도 테스트 해보기
SELECT ename, sal,
    RANK() OVER(ORDER BY sal)as "RANK"
    FROM emp --오름차순으로 정렬 된다.
    
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu DESC) as "RANK" 
    --RANK함수 내에서 ORDER BY ~ DESC를 사용하면 컬럼 값이 내림차순으로 정렬됨
    FROM t_worktime 
    
--최종
SELECT workcd_vc, time_nu, 
    RANK() OVER(ORDER BY time_nu) as "RANK" 
    FROM t_worktime 
