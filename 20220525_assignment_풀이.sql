�÷�����  ������ ��Ī ����ϱ�

FROM ���, ����Ʈ --FROM �ڴ� ����, ������ �ΰ� �ʿ���
--���⼭ �Ѱ��� ���� �������� �ĺ��ڶ�� ��

����� 5�� ��ǰ�� 6�� -> 30���� ����� ��
5�� * 6�� �߿��� 1�� ��ǰ = 5

SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint

SELECT *
    FROM t_giftmem, t_giftpoint --����� �� 30����

SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
    FROM t_giftmem, t_giftpoint --�� ���� ���� �ܿ�����Ʈ�� ���´�.

SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
      ,t_giftmem.point_nu - t_giftpoint.point_nu as "�ܿ�����Ʈ"
    FROM t_giftmem, t_giftpoint 

���� ������ ����Ʈ >= ��ǰ�� ����Ʈ
    
������ ���� ���� �� ���� ��ǰ->���ܽ��Ѿ� ��. ����� ������ 30����(5*6)
������ õõ�� �Ĳ��ϰ� �о �ִ����� ������ �� ��

��ȭƼ�� �߿���(AND)->6���� ��ǰ �߿� �ϳ��� ���� 
mem.point_nu>= point.point_nu --�� �ٸ� �����ϴ� ���ҵ� ��

�̸� ��������Ʈ ��������Ʈ ��������Ʈ-��������Ʈ

6�� �߿��� �ϳ��� ���Ѵ�.

--FROM�� �ؿ��� ���� �� �� �ִ�
--������ �ڸ����� OR, SELECT���� �� ���� �ִ�.
--�ζ��κ� ����-����� �� ���̱� ����(��Ƽ�������� �� ���� ���̱� ����)

SELECT point_nu
 FROM t_giftpoint
 WHERE name_vc = '��ȭƼ��'
 
SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
      ,t_giftmem.point_nu - t_giftpoint.point_nu as "�ܿ�����Ʈ"
    FROM t_giftmem, t_giftpoint --t_giftpoint ����ٰ� SELECT�� ������ֱ� 
    
SELECT mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ" --�ܿ�����Ʈ�� ���̳ʽ��� �����ִ�.
    FROM t_giftmem mem
   ,(
   SELECT point_nu
     FROM t_giftpoint --���⼭ point �Ⱦ��� ����
     WHERE name_vc = '��ȭƼ��'
    )point
    WHERE mem.point_nu>=point.point_nu --���� ���ư�
    
--������ ������ �پ���(=AND)

--��ȭƼ���� ���� �� �ִ� ����� �̸��� mem�� name_vc�� �ִ�

SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ" 
    FROM t_giftmem mem
   ,(
   SELECT point_nu
     FROM t_giftpoint 
     WHERE name_vc = '��ȭƼ��'
    )point
    WHERE mem.point_nu>=point.point_nu 
    
SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ" 
    FROM t_giftmem mem, t_giftpoint point
    WHERE mem.point_nu>=point.point_nu 
    AND point.name_vc = '��ȭƼ��' --�� �ĺ��ٴ� ���� ���� ����� ���� �ٿ��ش�
    
=:x
���� x�� UI���� �����´�.
���� ��� �̰� ���� ������ ���� ����
