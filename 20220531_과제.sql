SELECT * FROM temp

SELECT * FROM tcom

� �������� �����Ͱ� ����� ������ �˾ƺ���

SELECT count(emp_id)
FROM temp 
--20��, ÷�� �̹������� 4(�ο�)*5(�÷�)=20�̹Ƿ� ��ü ����� ���� �� ���ؾߵ�

SELECT * FROM temp
ORDER BY lev asc 
--���� ���̶�� ÷�� �̹���ó�� ���� �÷���(����)������,�ڹ���...�� �־�� �Ǵµ� ��ġ���� �ʴ´�

SELECT * FROM temp
WHERE emp_name = '��浿' 
OR emp_name = '������'    
OR emp_name = '���¹�'
OR emp_name = '������' --dept_code �÷����� ���ĺ��� ��ġ�ϴ� �ͳ��� ���������?(AA, BC)
--������1.�ڵ尡 �ߺ��ż� �������غ���
--������2.�������� �ۼ��� �̸������� ������ �ȵȴ�


--������1 �ذ��ϱ�-�ߺ� �ڵ� ���� ����
--������ ��� ������ �÷��̹Ƿ� in���� �����ֱ�
SELECT * FROM temp
WHERE emp_name in('��浿', '������', '���¹�', '������')
--(AA, BC)

SELECT * FROM temp
WHERE emp_name in('ȫ�浿', '������', '�輳��', '���ֿ�') 
--(AB, CA)

SELECT * FROM temp
WHERE emp_name in('�ڹ���', '����ġ', '�ֿ���', '������')
--(AC, CB)

SELECT * FROM temp
WHERE emp_name in('������', '�����', '������', '��ݰ�')
--(BA, CC)

SELECT * FROM temp
WHERE emp_name in('�̼���', '�����', '���Ͼ�', '���Ѷ�')
--(BB,CD)

AA AB AC BA BB
BC CA CB CC CD
AA AB AC BA BB
BC CA CB CC CD ��

�̸��� ���ĵ� ������
--emp_type�� ����->���� ��

����->AA AB AC BA BB
    BC CA CB CC CD
����->AA AB AC BA BB
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
--�̰� �ƴѵ�... ������ �ۼ��غ���
--�ٽ�

SELECT * FROM temp

SELECT emp_id, emp_name FROM temp

--��ü ���� ROWNUM ����Ͽ� ��ȣ �ٿ��ֱ�
SELECT ROWNUM rn, emp_id, emp_name FROM temp

--���� ����
--��ȣ�� �̿��� �տ������� 5���� ������ ��ȣ�� ���������� �ο�
--�տ������� 5���� ���� row�� ����
SELECT CEIL(rn/5) no
      ,rn, emp_id, emp_name
 FROM 
 (SELECT ROWNUM rn, emp_id, emp_name
 FROM temp)

CEIL �Լ�-�Է¹��� ������ ũ�ų� ���� ������ ��ȯ

ex)
CELI(6.0) --6
CELI(6.1) --7

�ٵ� ��� rn/5�� ����?

--5���� ���� ���鿡 �����ֱ� -> ���° �÷����� ���� �� ���� �� �� ����
SELECT CEIL(rn/5) no
      ,MOD(rn,5) no2 
      ,rn, emp_id, emp_name
 FROM 
 (SELECT ROWNUM rn, emp_id, emp_name
 FROM temp)
