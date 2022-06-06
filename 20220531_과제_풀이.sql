SELECT ceil(no/4) rno                
          ,mod(no,4) cno                
          ,decode(mod(no,4),1,gubun) c1                
          ,decode(mod(no,4),2,gubun) c2                
          ,decode(mod(no,4),3,gubun) c3                
          ,decode(mod(no,4),0,gubun) c4                
  FROM (                
              SELECT rownum no,gubun FROM sam_tab02                
           )                
--���� ���ܿ��� GROUP BY�� ����ؾ� �Ѵ�.
--rno�� FROM���� �ִ� �÷��� �ƴϹǷ� GROUP BY�� ��� �Ұ�

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
--rno�� ������, �ζ��κ� �̿�
--�ζ��κ� �̿����ϸ� ���̺� ���Ե� �÷��� �ƴϴ��� ���� ����

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
--MAX�� ����� �ϱ� ���� ���� �ƴ� �������� �ذ� ���� ��. �ƹ��� �ǹ̰� ����

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