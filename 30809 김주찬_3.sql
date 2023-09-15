set SERVEROUTPUT on;

CREATE TABLE TBL_row1(
    no number,
    name varchar2(20),
    hdate date
);

CREATE TABLE TBL_row2 AS
    SELECT * 
    FROM TBL_row1;
    
    INSERT INTO TBL_row1 VALUES(1, '아무개', sysdate);
    INSERT INTO TBL_row1 VALUES(2, '홍길동 ', sysdate);
    INSERT INTO TBL_row1 VALUES(3, '고길동', sysdate);
    
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
    dbms_output.put_line('첫번째 수:'
                     || no1
                     || ', 두번째 수:'
                     || no2
                     || ', 합:'
                     || vsum
                     || '입니다');
END;
/

SET SERVEROUTPUT ON;


/* 복합 변수
   RECODRE TYPE 변수
   1. TYPE 타입명 IS RECORD();
   2. 식별자 타입명;
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

    dbms_output.put_line('사번     이름     업무아이디');
    dbms_output.put_line(rec1.emp_id   || '  ' || 
                         rec1.emp_name || '  ' || 
                         rec1.emp_job);
END;
/


-- [문제2]
-- 사원번호(emp_id)를 입력 받아 입력 받은 사원번호에 해당하는 정보를 출력하시오.

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
    SELECT employee_id, last_name, nvl(email, '없음'), salary
    INTO   rec2
    FROM   employees
    WHERE  employee_id = vemp_id;

    dbms_output.put_line('사번:'   || rec2.emp_id);
    dbms_output.put_line('이름:'   || rec2.emp_name);
    dbms_output.put_line('이메일:' || rec2.emp_email);
    dbms_output.put_line('급여:'   || rec2.emp_salary);
END;
/