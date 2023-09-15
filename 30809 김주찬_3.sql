set SERVEROUTPUT on;

CREATE TABLE TBL_row1(
    no number,
    name varchar2(20),
    hdate date
);

CREATE TABLE TBL_row2 AS
    SELECT * 
    FROM TBL_row1;
    
    INSERT INTO TBL_row1 VALUES(1, '�ƹ���', sysdate);
    INSERT INTO TBL_row1 VALUES(2, 'ȫ�浿 ', sysdate);
    INSERT INTO TBL_row1 VALUES(3, '��浿', sysdate);
    
DECLARE 
    c_rec TBL_row1%rowtype;
BEGIN
    SELECT * 
    INTO c_rec
    FROM tbl_row1
    WHERE no = 3;
    INSERT INTO TBL_row2 VALUES c_rec;
END;
/
            
            select * from TBL_row2;
            
commit;

DECLARE
    no1   NUMBER := &no1;
    no2   NUMBER := &no2;
    vsum  NUMBER;
BEGIN
    vsum := no1 + no2;
    dbms_output.put_line('ù��° ��:'
                     || no1
                     || ', �ι�° ��:'
                     || no2
                     || ', ��:'
                     || vsum
                     || '�Դϴ�');
END;
/

SET SERVEROUTPUT ON;


/* ���� ����
   RECODRE TYPE ����
   1. TYPE Ÿ�Ը� IS RECORD();
   2. �ĺ��� Ÿ�Ը�;
*/

DECLARE
    TYPE emp_rec IS RECORD (
         emp_id    employees.employee_id%TYPE,
         emp_name  employees.first_name%TYPE,
         emp_job   employees.job_id%TYPE
    );
    rec1 emp_rec;
BEGIN
    SELECT employee_id, first_name, job_id
    INTO   rec1
    FROM   employees
    WHERE  department_id = 10;

    dbms_output.put_line('���     �̸�     �������̵�');
    dbms_output.put_line(rec1.emp_id   || '  ' || 
                         rec1.emp_name || '  ' || 
                         rec1.emp_job);
END;
/


-- [����2]
-- �����ȣ(emp_id)�� �Է� �޾� �Է� ���� �����ȣ�� �ش��ϴ� ������ ����Ͻÿ�.

DECLARE
    TYPE emp_rec2 IS RECORD (
         emp_id      employees.employee_id%TYPE,
         emp_name    employees.last_name%TYPE,
         emp_email   employees.email%TYPE,
         emp_salary  employees.salary%TYPE
    );
    rec2     emp_rec2;
    vemp_id  employees.employee_id%TYPE := &empid;
BEGIN
    SELECT employee_id, last_name, nvl(email, '����'), salary
    INTO   rec2
    FROM   employees
    WHERE  employee_id = vemp_id;

    dbms_output.put_line('���:'   || rec2.emp_id);
    dbms_output.put_line('�̸�:'   || rec2.emp_name);
    dbms_output.put_line('�̸���:' || rec2.emp_email);
    dbms_output.put_line('�޿�:'   || rec2.emp_salary);
END;
/