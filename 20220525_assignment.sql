1. ��ȭ Ƽ���� ���� �� �ִ� ����� ��ܰ� ���� ������ �ִ� ����Ʈ, ��ȭ Ƽ���� ����Ʈ            
�׸��� �� Ƽ���� ����� �� ���� ���� ����Ʈ�� ����Ͻÿ�.            

���غ� ��
1)��ȭ Ƽ���� ���� �� �ִ� ����� ��ܰ� ���� ����Ʈ
2)��ȭ Ƽ�� ����Ʈ
3)��ȭ Ƽ�� ��� �� ���� ����Ʈ

SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint

1)��ȭ Ƽ���� ���� �� �ִ� ����� ��ܰ� ���� ����Ʈ

SELECT name_vc, point_nu
 FROM t_giftmem

SELECT name_vc, point_nu 
 FROM t_giftmem
 WHERE point_nu>=15000 --��ȭ Ƽ���� ���� �� �ִ� ����� ���(���� �߰�)

2)��ȭ Ƽ�� ����Ʈ 

SELECT name_vc, point_nu  
 FROM t_giftpoint
 WHERE name_vc = '��ȭƼ��' 

--���� �ٸ� ���̺��� ���� ���ؾ� �ϹǷ� �ζ��κ� ���
--FROM�������� �� ������ ���� ���谡 �־�� ��

--�ζ��κ� ����غ���
--1)�� 2) ��

SELECT A.name_vc, A.point_nu
 FROM t_giftmem A,
  (
  SELECT name_vc, point_nu  
  FROM t_giftpoint B
  WHERE name_vc = '��ȭƼ��'
  )--A ���̺�� B ���̺��� A�� �̸��� ��������Ʈ ��������
--���ϴ� �÷��� ��� ��� �ȵ�
  
SELECT name_vc, point_nu
 FROM t_giftmem,
    (
    SELECT name_vc, point_nu  
    FROM t_giftpoint
    WHERE name_vc = '��ȭƼ��'
    )--����(���� ���ǰ� �ָ���)
 
SELECT *
 FROM t_giftmem,
    (
    SELECT name_vc, point_nu  
    FROM t_giftpoint
    WHERE name_vc = '��ȭƼ��'
    )--�ϴ� ��� �÷� ǥ���غ���

--�˸��ƽ��� ����ؼ� ���̺� �÷��� �������ֱ�
SELECT *
 FROM t_giftmem A,
    (
    SELECT name_vc, point_nu  
    FROM t_giftpoint
    WHERE name_vc = '��ȭƼ��'
    )B--t_giftpoint ���̺��� �˸��ƽ���->B (B ���̺��� ��ȣ ��)
 WHERE A.point_nu>=B.point_nu
    --t_giftmem, t_giftpoint ���̺�(��ȣ ���� �����ϴ�)�� ���(*) �÷� ���
    --��, A����Ʈ(��������Ʈ)�� B����Ʈ(��ȭƼ�� ����Ʈ)���� ũ�ų� ���ƾ� ��ȭƼ���� ���� �� ����
    
--���� �������� * ����� ������� �����Ƿ� �ʿ��� �÷��� �����ش�.
SELECT A.name_vc
      ,A.point_nu
      --,B.name_vc(�ʿ�����Ƿ� ����)
      ,B.point_nu
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '��ȭƼ��'
      )B
 WHERE A.point_nu>=B.point_nu
      
--A.point_nu, B.point_nu ������ ���� ǥ���ϱ�
--TO_CHAR �Լ� ���, ���ڿ��̹Ƿ� �̱� �����̼�
SELECT A.name_vc
      ,TO_CHAR(A.point_nu, '999,999')||'��'
      ,B.name_vc
      ,TO_CHAR(B.point_nu, '999,999')||'��'
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '��ȭƼ��'
      )B
 WHERE A.point_nu>=B.point_nu

--�÷��� ������ ���� ��Ī ����ϱ�     
SELECT A.name_vc as "�̸�"
      ,TO_CHAR(A.point_nu, '999,999')||'��' "��������Ʈ"
      ,TO_CHAR(B.point_nu, '999,999')||'��' "��������Ʈ(��ȭƼ��)"
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '��ȭƼ��'
      )B
 WHERE A.point_nu>=B.point_nu
      
3)��ȭƼ�� ��� �� ���� ����Ʈ
 
--��������Ʈ���� ��������Ʈ ���ֱ�
--�÷��ڸ��� ���� ��� �����ϹǷ� �������� ó���ϸ� �ɵ�
SELECT A.name_vc as "�̸�"
      ,TO_CHAR(A.point_nu, '999,999')||'��' as "��������Ʈ"
      ,TO_CHAR(B.point_nu, '999,999')||'��' as "��������Ʈ(��ȭƼ��)"
      ,TO_CHAR(A.point_nu-B.point_nu,'999,999')||'��' as "�ܿ�����Ʈ" --�÷� �ڸ���  ����
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '��ȭƼ��'
      )B
 WHERE A.point_nu>=B.point_nu
 
 
����

SELECT A.name_vc as "�̸�"
      ,TO_CHAR(A.point_nu, '999,999')||'��' as "��������Ʈ"
      ,TO_CHAR(B.point_nu, '999,999')||'��' as "��������Ʈ(��ȭƼ��)"
      ,TO_CHAR(A.point_nu-B.point_nu,'999,999')||'��' as "�ܿ�����Ʈ" --�÷� �ڸ���  ����
 FROM t_giftmem A,
      (
      SELECT name_vc, point_nu  
      FROM t_giftpoint
      WHERE name_vc = '��ȭƼ��'
      )B
 WHERE A.point_nu>=B.point_nu