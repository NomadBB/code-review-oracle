SELECT * FROM temp

SELECT * FROM tcom

어떤 기준으로 데이터가 만들어 졌는지 알아보기

SELECT count(emp_id)
FROM temp 
--20명, 첨부 이미지에도 4(로우)*5(컬럼)=20이므로 전체 사원에 대한 값 구해야됨

SELECT * FROM temp
ORDER BY lev asc 
--직급 순이라면 첨부 이미지처럼 같은 컬럼에(과장)지문덕,박문수...가 있어야 되는데 일치하지 않는다

SELECT * FROM temp
WHERE emp_name = '김길동' 
OR emp_name = '지문덕'    
OR emp_name = '이태백'
OR emp_name = '유도봉' --dept_code 컬럼에서 알파벳이 일치하는 것끼리 묶어놓은듯?(AA, BC)
--문제점1.코드가 중복돼서 지저분해보임
--문제점2.조건절에 작성한 이름순으로 정렬이 안된다


--문제점1 해결하기-중복 코드 쓰지 말것
--조건이 모두 동일한 컬럼이므로 in으로 묶어주기
SELECT * FROM temp
WHERE emp_name in('김길동', '지문덕', '이태백', '유도봉')
--(AA, BC)

SELECT * FROM temp
WHERE emp_name in('홍길동', '강감찬', '김설악', '윤주왕') 
--(AB, CA)

SELECT * FROM temp
WHERE emp_name in('박문수', '설까치', '최오대', '강월악')
--(AC, CB)

SELECT * FROM temp
WHERE emp_name in('정도령', '연흥부', '박지리', '장금강')
--(BA, CC)

SELECT * FROM temp
WHERE emp_name in('이순신', '배뱅이', '정북악', '나한라')
--(BB,CD)

AA AB AC BA BB
BC CA CB CC CD
AA AB AC BA BB
BC CA CB CC CD 순

이름이 정렬된 기준은
--emp_type이 정규->인턴 순

정규->AA AB AC BA BB
    BC CA CB CC CD
인턴->AA AB AC BA BB
    BC CA CB CC CD 
    
SELECT emp_id, emp_name FROM temp
WHERE dept_code LIKE 'AA%'
OR dept_code LIKE 'BC%'

SELECT emp_id, emp_name FROM temp
WHERE dept_code LIKE 'AB%'
OR dept_code LIKE 'CA%'

SELECT emp_id, emp_name FROM temp
WHERE dept_code LIKE 'AC%'
OR dept_code LIKE 'CB%'

SELECT emp_id, emp_name FROM temp
WHERE dept_code LIKE 'BA%'
OR dept_code LIKE 'CC%'

SELECT emp_id, emp_name FROM temp
WHERE dept_code LIKE 'BB%'
OR dept_code LIKE 'CD%'
--이건 아닌듯... 변수로 작성해볼것
--다시

SELECT * FROM temp

SELECT emp_id, emp_name FROM temp

--전체 값에 ROWNUM 사용하여 번호 붙여주기
SELECT ROWNUM rn, emp_id, emp_name FROM temp

--구글 참고
--번호를 이용해 앞에서부터 5개씩 동일한 번호를 순차적으로 부여
--앞에서부터 5개가 같은 row에 들어간다
SELECT CEIL(rn/5) no
      ,rn, emp_id, emp_name
 FROM 
 (SELECT ROWNUM rn, emp_id, emp_name
 FROM temp)

CEIL 함수-입력받은 값보다 크거나 같은 정수를 반환

ex)
CELI(6.0) --6
CELI(6.1) --7

근데 어떻게 rn/5가 들어갈까?

--5개씩 묶인 값들에 순서주기 -> 몇번째 컬럼으로 쓰일 지 구분 할 수 있음
SELECT CEIL(rn/5) no
      ,MOD(rn,5) no2 
      ,rn, emp_id, emp_name
 FROM 
 (SELECT ROWNUM rn, emp_id, emp_name
 FROM temp)
