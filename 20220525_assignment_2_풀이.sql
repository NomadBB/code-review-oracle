2.�������� ������ ����Ʈ�� ���� �� �ִ� ��ǰ ��, ���� ����Ʈ�� ���� ��

�������� ����Ʈ t_giftpoint
������ ������ - WHERE�� �Ʒ�

���� ����Ʈ�� ���� �� - MAX(�׷��Լ�)
�׷��Լ��� ������ GROUP BY ���

SELECT * FROM t_giftmem

SELECT ����Ʈ FROM t_giftmem
WHERE �̸� = '������'

SELECT point_nu FROM t_giftmem
WHERE name_vc = '������' --������ ����Ʈ ã��

�������� ����Ʈ�� ���� ������->���� WHERE���� ���������� ���ָ� ��

SELECT m.point_nu 
 FROM t_giftmem m, t_giftpoint p
 WHERE m.name_vc = '������'
    AND m.point_nu >= p.point_nu
    
SELECT m.point_nu 
 FROM t_giftmem m, t_giftpoint p
 WHERE 
    (
    m.name_vc = '������'
    AND m.point_nu >= p.point_nu
    )

=:name -> ���� ��ȸ ����

SELECT
    point_nu
    FROM t_giftmem
    WHERE name_vc =:name
    
    
�������� ���� ����Ʈ

SELECT
    point_nu
    FROM t_giftmem
    WHERE name_vc = '������'
    
SELECT
    point_nu
 FROM t_giftpoint
 WHERE point_nu <= 50012 --��� �Ⱦ��--50012 ����Ʈ���� �۾ƾ� ��

SELECT
    point_nu
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='������'
                    )
                    --50012 ��� ���������� ����  ������ ���
                    
SELECT
    mac(point_nu)
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='������'
                    )--point_nu�� MAX�� �����.

�׷��Լ��� �Ϲ��÷��� ���� ����� �� ����.
         
SELECT
    max(point_nu) ,name_vc --��ǰ�� �ִ�����Ʈ�� �̸� ��� ->�Ұ���
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='������'
                    ) 

SELECT
    max(point_nu) ,max(name_vc) --�Ѱ���Ʈ ����� ���� �̸��� �߽��� ������
                                --���� �߽��� �ִµ� �̴ϸ��� ���� �ȵ�
                                --�߽��� �����Ƿ� �����ʵ� �߽� ���ش�
 FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT point_nu
                    FROM t_giftmem
                    WHERE name_vc ='������'
                    ) 
                    
SELECT name_vc, point_nu
FROM t_giftpoint
WHERE point_nu = 50000 -- �Ѱ���Ʈ 50000 --50000�� ���� ã���� �ȵȴ�->�������� ���ֱ�


����

SELECT name_vc, point_nu
FROM t_giftpoint
WHERE point_nu = (
                  SELECT max(point_nu)
                  FROM t_giftpoint
                  WHERE point_nu <= (
                                     SELECT point_nu
                                     FROM t_giftmem
                                     WHERE name_vc ='������'
                                     ) 
                 )                                    