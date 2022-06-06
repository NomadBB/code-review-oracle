SELECT ceil(no/4) rno                
          ,mod(no,4) cno                
          ,decode(mod(no,4),1,gubun) c1                
          ,decode(mod(no,4),2,gubun) c2                
          ,decode(mod(no,4),3,gubun) c3                
          ,decode(mod(no,4),0,gubun) c4                
  FROM (                
              SELECT rownum no,gubun FROM sam_tab02                
           )                
--다음 스텝에서 GROUP BY를 사용해야 한다.
--rno는 FROM절에 있는 컬럼이 아니므로 GROUP BY에 사용 불가

SELECT CEIL(no/4) rno                
          ,mod(no,4) cno                
          ,decode(mod(no,4),1,gubun) c1                
          ,decode(mod(no,4),2,gubun) c2                
          ,decode(mod(no,4),3,gubun) c3                
          ,decode(mod(no,4),0,gubun) c4                
  FROM (                
              SELECT rownum no,gubun FROM sam_tab02                
           )
GROUP BY CEIL(no/4)
ORDER BY CEIL(no/4)

SELECT CEIL(no/4) rno                
          ,mod(no,4) cno                
          ,decode(mod(no,4),1,gubun) c1                
          ,decode(mod(no,4),2,gubun) c2                
          ,decode(mod(no,4),3,gubun) c3                
          ,decode(mod(no,4),0,gubun) c4                
  FROM (                
              SELECT rownum no,gubun FROM sam_tab02                
           )
GROUP BY CEIL(no/4)
--rno를 쓰려면, 인라인뷰 이용
--인라인뷰 이용하하면 테이블에 포함된 컬럼이 아니더라도 접근 가능

SELECT 
    rno
    FROM(
        SELECT CEIL(no/4) rno
        FROM(
            SELECT rownum no, gubun FROM sam_tab02
            )
        )
GROUP BY rno


SELECT CEIL(no/5) rno   
      ,MAX(decode(mod(no,5),1,emp_id))c1                
      ,MAX(decode(mod(no,5),2,emp_id))c2                
      ,MAX(decode(mod(no,5),3,emp_id))c3 
      ,MAX(decode(mod(no,5),4,emp_id))c4                
      ,MAX(decode(mod(no,5),0,emp_id))c5                                 
  FROM (                
              SELECT rownum no,emp_id FROM temp               
           )
GROUP BY CEIL(no/5)
ORDER BY CEIL(no/5)
--MAX는 계산을 하기 위한 것이 아닌 문법문제 해결 위한 것. 아무런 의미가 없음

SELECT CEIL(no/5) rno   
      ,MAX(decode(mod(no,5),1,emp_id))c1
      ,MAX(decode(mod(no,5),1,emp_name))name1                 
      ,MAX(decode(mod(no,5),2,emp_id))c2   
      ,MAX(decode(mod(no,5),2,emp_name))name2             
      ,MAX(decode(mod(no,5),3,emp_id))c3 
      ,MAX(decode(mod(no,5),3,emp_name))name3 
      ,MAX(decode(mod(no,5),4,emp_id))c4
      ,MAX(decode(mod(no,5),4,emp_name))name4                  
      ,MAX(decode(mod(no,5),0,emp_id))c5
      ,MAX(decode(mod(no,5),0,emp_name))name5                                  
  FROM (                
              SELECT rownum no,emp_id, emp_name FROM temp               
           )
GROUP BY CEIL(no/5)
ORDER BY CEIL(no/5)