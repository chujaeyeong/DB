CREATE TABLE "HR"."MEMBER" 
   (	
   	"ID" VARCHAR2(10), 
	"PW" VARCHAR2(10), 
	"NAME" VARCHAR2(10), 
	"TEL" VARCHAR2(10)
   ) 
   
CREATE TABLE "HR"."BBS"
(	
	"no" VARCHAR2(100),
	"TITLE" VARCHAR2(100),
	"CONTENT" VARCHAR2(100),
	"WRITER" VARCHAR2(100)
) 
  
CREATE TABLE PRODUCT 
(
	ID VARCHAR2(200),
	NAME VARCHAR2(200),
	CONTENT VARCHAR2(200),
	PRICE VARCHAR2(200),
	COMPANY VARCHAR2(200),
	IMG VARCHAR2(200)
) 
  
-- 한줄복사 : 커멘드 옵션 화살표아래 
-- 한줄삭제 : 커멘드 d 
-- 저장할 대상 : 엔티티 (회원정보, 게시판, 상품), 엔티티간의 관계 : 회원이 상품을 주문하다 (주문정보)
--				 엔티티 + 관계 ==> 테이블로 만들자! 

CREATE TABLE ORDERLIST (
	"no" VARCHAR2(100),
	"member_id" VARCHAR2(100),
	"product_id" VARCHAR2(100),
	"total_price" VARCHAR2(100)	
)

CREATE TABLE depart (
	"id" VARCHAR2(100),
	"name" VARCHAR2(100),
	"instructor" VARCHAR2(100),
	"row" VARCHAR2(100)	
) 

CREATE TABLE student (
	"id" VARCHAR2(100),
	"name" VARCHAR2(100),
	"tel" VARCHAR2(100),
	"depart_id" VARCHAR2(100)	
) 

CREATE TABLE subject (
	"id" VARCHAR2(100),
	"title" VARCHAR2(100),
	"depart_id" VARCHAR2(100)	
) 

CREATE TABLE "HR"."BBS2" 
(	"no" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	 CONSTRAINT "BBS_PK22" PRIMARY KEY ("no"),
	 CONSTRAINT "FK_MEMBER22" FOREIGN KEY ("WRITER")
	  REFERENCES "HR"."MEMBER" ("ID")
) 

CREATE TABLE "HR"."BBS3" 
(	"no" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"WRITER" VARCHAR2(100)
) 

-- pk 제약조건 추가 
ALTER TABLE HR.BBS3
ADD CONSTRAINT BBS3_PK PRIMARY KEY ("no")
ENABLE; 

-- fk 제약조건 추가 
ALTER TABLE HR.BBS3 
ADD CONSTRAINT FK_MEMBER33 
FOREIGN KEY (WRITER) REFERENCES HR."MEMBER"(ID);

CREATE TABLE "HR"."DEPART2" 
(	"id" VARCHAR2(100), 
	"name" VARCHAR2(100), 
	"instructor" VARCHAR2(100), 
	 CONSTRAINT "DEPART2_PK" PRIMARY KEY ("id")
)

CREATE TABLE "HR"."STUDENT2" 
(	"id" VARCHAR2(100), 
	"name" VARCHAR2(100), 
	"tel" VARCHAR2(100), 
	"depart_id" VARCHAR2(100) 
)

ALTER TABLE HR.STUDENT2
ADD CONSTRAINT STUDENT2_PK PRIMARY KEY ("id")
ENABLE; 

ALTER TABLE HR.STUDENT2 
ADD CONSTRAINT FK_ST2
FOREIGN KEY ("depart_id") REFERENCES HR.DEPART2("id");


-- 테이블복사 

CREATE TABLE member22 
AS SELECT * FROM MEMBER 

INSERT INTO MEMBER22 
VALUES ('banana3','banana3','banana3','banana3', sysdate)

SELECT * FROM MEMBER22 


INSERT INTO bbs 
VALUES (bbs_id_seq.nextval, 'happy', 'happy day', 'ice')

INSERT INTO bbs 
VALUES (bbs_id_seq.nextval, 'happy2', 'happy day2', 'ice')

SELECT * FROM bbs 

CREATE SEQUENCE pd_id_seq 
INCREMENT BY 1 
START WITH 1

CREATE TABLE product3 (
	id NUMBER (38, 0), 
	name varchar2 (100)
)

INSERT INTO product3
VALUES (pd_id_seq.nextval, 'shoes2')

SELECT * FROM product3 



-- 확인문제 

CREATE TABLE orderlist3 (
	id NUMBER (38, 0), 
	title varchar2 (100), 
	price NUMBER (38, 0)
)

CREATE SEQUENCE or_seq 
INCREMENT BY 1 
START WITH 1 

INSERT INTO orderlist3 
VALUES (or_seq.nextval, 'cherry', 9000)

SELECT * FROM orderlist3 


-- 정렬방법 

SELECT * FROM orderlist3 
ORDER BY id -- 오름차순 

SELECT * FROM orderlist3 
ORDER BY id DESC -- 내림차순 

SELECT * FROM orderlist3 
WHERE id >= 3 
ORDER BY id DESC  -- id가 3 이상인 것만 내림차순


-- 많이쓰는 SELECT 연습 

CREATE TABLE DEPT (
	DEPTNO NUMBER(2),
	DNAME VARCHAR2(14 BYTE),
	LOC VARCHAR2(13 BYTE)
)

CREATE TABLE EMP (
	EMPNO NUMBER(4),
	ENAME VARCHAR2(10 BYTE),
	JOB VARCHAR2(9 BYTE),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2)
)

CREATE TABLE SALGRADE (
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
)

ALTER TABLE DEPT ADD (
CONSTRAINT PK_DEPT
PRIMARY KEY
(DEPTNO));

ALTER TABLE EMP ADD (
CONSTRAINT PK_EMP
PRIMARY KEY
(EMPNO));

ALTER TABLE EMP ADD (
CONSTRAINT FK_DEPTNO
FOREIGN KEY (DEPTNO)
REFERENCES DEPT (DEPTNO));

SELECT * FROM emp 

SELECT deptno FROM emp 

SELECT DISTINCT deptno FROM emp 

SELECT ename, sal * 12 FROM emp 

SELECT ename, sal * 12 AS yearsal FROM emp 

SELECT * FROM emp 
ORDER BY sal DESC 

SELECT * FROM emp 
WHERE deptno = 30 
ORDER BY empno DESC 

SELECT * FROM emp 
WHERE NOT deptno = 30 
ORDER BY empno DESC 

SELECT * FROM emp 
WHERE deptno = 30 AND job = 'SALESMAN'

SELECT * FROM emp 
WHERE deptno = 30 or job = 'SALESMAN'

SELECT * FROM EMP
WHERE sal >= 3000

SELECT * FROM EMP
WHERE sal != 3000

SELECT * FROM EMP
WHERE job NOT IN ('SALESMAN', 'MANAGER')
ORDER BY job

SELECT * FROM EMP
WHERE sal BETWEEN 2000 AND 3000 
ORDER BY empno 

SELECT * FROM EMP
WHERE sal NOT BETWEEN 2000 AND 3000 
ORDER BY empno 

SELECT * FROM EMP
WHERE ENAME LIKE '_L%'

SELECT * FROM EMP
WHERE ENAME NOT LIKE '_L%'

SELECT * FROM EMP
WHERE COMM IS NULL 

SELECT * FROM EMP
WHERE COMM IS NOT NULL 


CREATE TABLE dept_temp2 
AS SELECT * FROM DEPT 

SELECT * FROM dept_temp2

UPDATE DEPT_TEMP2 
SET LOC = 'SEOUL'

UPDATE DEPT_TEMP2 
SET DNAME = 'DATABASE', loc = 'BUSAN'
WHERE deptno = 40

DELETE FROM dept_temp2 
WHERE DNAME = 'SALES'

SELECT * FROM DEPT_TEMP2 



CREATE TABLE PRODUCT3 (	
	"ID" VARCHAR2(200),
	"NAME" VARCHAR2(200),
	"CONTENT" VARCHAR2(200),
	"PRICE" NUMBER(38,0),
	"COMPANY" VARCHAR2(200),
	"IMG" VARCHAR2(200)
)


