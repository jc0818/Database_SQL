CREATE TABLE DEPT (
    DEPTNO DECIMAL(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR DECIMAL(4),
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE INT,
    LOSAL INT,
    HISAL INT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,TO_DATE('17-12-1980','DD-MM-YYYY'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('20-2-1981','DD-MM-YYYY'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('22-2-1981','DD-MM-YYYY'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,TO_DATE('2-4-1981','DD-MM-YYYY'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('28-9-1981','DD-MM-YYYY'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1-5-1981','DD-MM-YYYY'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('9-6-1981','DD-MM-YYYY'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,TO_DATE('13-7-1987','DD-MM-YYYY')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('17-11-1981','DD-MM-YYYY'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('8-9-1981','DD-MM-YYYY'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,TO_DATE('13-7-1987', 'DD-MM-YYYY'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,TO_DATE('3-12-1981','DD-MM-YYYY'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,TO_DATE('3-12-1981','DD-MM-YYYY'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,TO_DATE('23-1-1982','DD-MM-YYYY'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;


1. ��� ���̺��� ��� ���ڵ带 ��ȸ�Ͻÿ�.
    select * 
    from emp
2. ������ �Ի����� ��ȸ�Ͻÿ�
    select ename, HIREDATE
    from emp
3. �����ȣ�� �̸��� ��ȸ�Ͻÿ�.
    select empno, ename
    from emp
4. ������̺� �ִ� ��å�� ����� ��ȸ�Ͻÿ�.
    select job
    from emp
5. �� ������� ���Ͻÿ�.
    select count(ename)
    from emp
6. �μ���ȣ�� 10�� ����� ��ȸ�Ͻÿ�.
    select ename
    from emp
    where deptno = 10
7. ���޿��� 2500�̻� �Ǵ� ����� ��ȸ�Ͻÿ�.
    select ename
    from emp 
    where SAL >= 2500

8. �̸��� 'KING'�� ����� ��ȸ�Ͻÿ�.
    select ename
    from emp
    where ename ='KING'

9. ����� �� �̸��� S�� �����ϴ� ����� �����ȣ�� �̸��� ��ȸ�Ͻÿ�./*Like��*/
    select empno, ename
    from emp 
    where ename Like 'S%'
10. ��� �̸��� T�� ���Ե� ����� �����ȣ�� �̸��� ��ȸ�Ͻÿ�.
    select empno, ename
    from emp 
    where ename Like '%T%'
11. Ŀ�̼��� 300, 500, 1400 �� ����� ���,�̸�,Ŀ�̼��� ��ȸ�Ͻÿ�.
    select empno, ename,COMM
    from emp
    where COMM=300 or comm = 500 or comm = 1400
12. ���޿��� 1200 ���� 3500 ������ ����� ���,�̸�,���޿��� ��ȸ�Ͻÿ�.
    select empno, ename, sal
    from emp
    where sal >= 1200 and sal <= 3500 
13. ������ �Ŵ����̰� �μ���ȣ�� 30���� ����� �̸�,���,����,�μ���ȣ�� ��ȸ�Ͻÿ�.
    select ename, empno,job,deptno
    from emp
    where job = 'MANAGER' and deptno = 30 /*AND = �̰� �� �̰�///OR = �̰� �ƴ� �̰� */ 
14. �μ���ȣ�� 30�� �ƴ� ����� ���,�̸�,�μ���ȣ�� ��ȸ�Ͻÿ�.
    select ename,empno,deptno
    from emp
    where deptno != 30 
15. Ŀ�̼��� 300, 500, 1400 �� ��� �ƴ� ����� ���,�̸�,Ŀ�̼��� ��ȸ�Ͻÿ�.
    select empno,ename,comm
    from emp
    where comm != 300 and comm!=500 and comm!= 1400 or comm IS NULL

16. �̸��� S�� ���Ե��� �ʴ� ����� ���,�̸��� ��ȸ�Ͻÿ�.
    select empno, ename
    from emp 
    where ename not LIKE '%S%'

17. �޿��� 1200���� �̸��̰ų� 3700 �ʰ��ϴ� ����� ���,�̸�,���޿��� ��ȸ�Ͻÿ�.
    select empno, ename , sal
    from emp
    where sal < 1200 or sal > 3700

18. ���ӻ�簡 NULL �� ����� �̸��� ������ ��ȸ�Ͻÿ�.
    select ename, job
    from emp
    where MGR IS NULL
    
19. �μ��� ��տ��޿��� ���ϴ� ����
    select deptno,avg(sal)
    from emp
    GROUP BY DEPTNO
    

20. �μ��� ��ü ������� Ŀ�̼��� �޴� ������� ���� ���ϴ� ����
    select deptno, count(ename),count(comm)
    from emp
    Group by deptno
     
21. �μ��� �ִ� �޿��� �ּ� �޿��� ���ϴ� ����
    select deptno, max(sal),min(sal)
    from emp 
    Group by deptno

22. �μ����� �޿� ��� (��, �μ��� �޿� ����� 2000 �̻�)
    select deptno, avg(sal)
    from emp
    Group by deptno
    having avg(sal) >= 2000

23. ���޿��� 1000 �̻��� ������� ������� �μ����� ���޿� ����� ���϶�. ��, ��հ��� 2000 �̻��� ���ڵ常 ���϶�.
    select deptno, avg(sal)
    from emp
    where sal >= 2000
    GROUP BY DEPTNO
24. �޿��� ���� ������ ��ȸ�ϵ� �޿��� ���� ��� �̸��� ö�ڰ� ���� ��������� ���,�̸�,���޿��� ��ȸ�Ͻÿ�.
    select empno, ename, sal
    from emp
    order by sal desc, ename

/////////////// ����(�����̺��̻�)
25. ������ �μ����� ��ȸ�Ͻÿ�.
    select ename, dname
    from emp, dept
    where emp.deptno = dept.deptno;


26. �̸�, ���޿�, ���޿� ����� ��ȸ�Ͻÿ�.
    select a.ename, a.sal, b.grade
    from emp a, salgrade b
    where a.sal>=b.LOSAL and a.sal<=b.HISAL;

27. �̸�, �μ���, ���޿������ ��ȸ�Ͻÿ�
    select a.ename, c.dname, b.grade
    from emp a, salgrade b, dept c
    Where a.deptno = c.deptno and a.sal>=b.LOSAL and a.sal<=b.HISAL;
      
28. �̸�, ���ӻ�� �̸��� ��ȸ�Ͻÿ�.
    select a.ename, b.ename
    from emp a, emp b
    Where a.MGR = b.empno

29. �̸�, �μ���ȣ, �μ��̸��� ��ȸ�Ͻÿ�.
     select a.ename, b.deptno, b.dname
    from emp a, dept b
    Where a.deptno = b.deptno;

30. �μ���ȣ�� 30���� ������� �̸�, ����, �μ���ȣ, �μ���ġ�� ��ȸ�Ͻÿ�.
    select a.ename, a.job, a.deptno,b.loc
    from emp a, dept b
    where a.deptno = 30 and a.deptno = b.deptno;

31. Ŀ�̼��� NULL�� �ƴ� ����� �̸�, Ŀ�̼�, �μ��̸�, �μ���ġ�� ��ȸ�Ͻÿ�.
    select a.ename, a.comm, b.dname, b.loc
    from emp a, dept b
    where a.comm is not null and a.deptno = b.deptno;

32. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
    select a.ename, a.job, a.deptno, b.dname
    from emp a, dept b
    where b.loc Like 'DALLAS';
33. �̸��� A�� ���� ����� �̸�, �μ����� ��ȸ�Ͻÿ�.
    select a.ename, b.dname
    from emp a, dept b
    where a.ename Like '%A%';

34. �̸�, ����, ���޿�, ���޿������ ��ȸ�Ͻÿ�.
    select a.ename, a.job, a.sal, b.grade
    from emp a,SALGRADE b
    
35. ALLEN�� ���� �μ��� �ٹ��ϴ� ����� �̸�, �μ���ȣ�� ��ȸ�Ͻÿ�.
    select ename, deptno
    from emp
    where DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='ALLEN');