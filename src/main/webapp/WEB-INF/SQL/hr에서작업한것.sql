set hidden param parseThreshold = 150000;

show user;
-- USER이(가) "HR"입니다.

select * from dba_users;
-- 현재 오라클 서버에서 생성되어진 모든 사용자 계정을 조회해주는 것이다.
/*
ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
00942. 00000 -  "table or view does not exist"
*/
-- dba_users 은 관리자만 조회할 수 있는 것이지 일반 사용자인 hr 은 조회가 불가하다는 말이다.

/*
    == 관계형 데이터베이스(Relation DataBase)란? ==
    --> 관계형 데이터베이스(RDB)는 데이터(정보)를 열(Column, Field) 과 행(Row, Record, Tuple) 으로 이루어진 테이블(Table, Entity, 개체) 형태로 저장하는 데이터베이스를 말한다.  
    
    == 관계형 데이터베이스 관리 시스템(Relation DataBase Management System)란? == 
    --> 관계형 데이터베이스 관리 시스템(RDBMS)이란?
        - 관계형 데이터베이스(RDB)를 관리, 운영, 개발을 해주는 소프트웨어를 말한다.
          이러한 관계형 데이터베이스 관리 시스템(RDBMS)의 종류로는 ORACLE, Mysql, MSSQL Server, DB2, 등등이 있다. 
*/

--- === *** SQL(Structured Query Language) ==> 정형화된 질의어 *** === ---
--  1. SELECT                         ==> DQL(Data Query Language)문       = 데이터질의어
--  2. INSERT, UPDATE, DELETE, MERGE  ==> DML(Data Manuplation Language)문 = 데이터조작어
--  3. COMMIT, ROLLBACK               ==> TCL(Transaction Control Language)문
--  4. CREATE, ALTER, DROP, TRUNCATE  ==> DDL(Data Defination Language)문  = 데이터정의어
--  5. GRANT, REVOKE                  ==> DCL(Data Control Language)문


-- ** 현재 오라클 서버에 접속되어진 사용자(지금은 hr)가 만든(소유의) 테이블(Table) 목록을 조회해주는 것 ** - 
select * from tab;
/*
    ---------------------------
    TNAME               TABTYPE
    ---------------------------
    COUNTRIES	        TABLE
    DEPARTMENTS	        TABLE
    EMPLOYEES	        TABLE
    EMP_DETAILS_VIEW	VIEW   (VIEW 는 테이블은 아니지만 select 되어진 결과물을 마치 테이블 처럼 보는 것)
    JOBS	            TABLE
    JOB_HISTORY	        TABLE
    LOCATIONS	        TABLE
    REGIONS	            TABLE
*/

select jubun
from employees

select *
from DEPARTMENTS;  -- sql 명령어는 대,소문자를 구분하지 않습니다. 

SELECT *
FROM DEPARTMENTS;  -- sql 명령어는 대,소문자를 구분하지 않습니다. 

sELeCT *
FrOm DEPARTMENTS;  -- sql 명령어는 대,소문자를 구분하지 않습니다. 

select *
from departments;  -- 테이블명도 대,소문자를 구분하지 않습니다.

select *
from dePARTments;  -- 테이블명도 대,소문자를 구분하지 않습니다.

select department_id, department_name  -- 컬럼명도 대,소문자를 구분하지 않습니다.
from departments;

select DEPARTMENT_ID, DEPARTMENT_NAME  -- 컬럼명도 대,소문자를 구분하지 않습니다.
from departments;

select DEpartmENT_ID, Department_NAME  -- 컬럼명도 대,소문자를 구분하지 않습니다.
from departments;

select *    -- * 은 모든 컬럼을 뜻한다.
from departments
where department_name = 'Sales';  -- 저장되어진 데이터값 만큼은 반드시 대,소문자를 구분합니다.!!!
-- 80	Sales	145	2500

select *    -- * 은 모든 컬럼을 뜻한다.
from departments
where department_name = 'sales';  -- 저장되어진 데이터값 만큼은 반드시 대,소문자를 구분합니다.!!!

select *    -- * 은 모든 컬럼을 뜻한다.
from departments
where department_name = 'SALES';  -- 저장되어진 데이터값 만큼은 반드시 대,소문자를 구분합니다.!!!

select *    -- * 은 모든 컬럼을 뜻한다.
from departments
where department_name = 'SaleS';  -- 저장되어진 데이터값 만큼은 반드시 대,소문자를 구분합니다.!!!

------------------------------------------------------------------------------------------
select *
from DEPARTMENTS;  -- "부서" 테이블

describe DEPARTMENTS;  -- DEPARTMENTS 테이블의 컬럼(column, field)의 정보를 알려주는 것이다.
-- 또는
desc DEPARTMENTS; 

/*
이름              널?       유형           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)

이름(컬럼명)
DEPARTMENT_ID   (부서번호)
DEPARTMENT_NAME (부서명)
MANAGER_ID      (부서장의 사원번호)
LOCATION_ID     (부서위치ID)

널?
NOT NULL     ==> NOT NULL 은 반드시 데이터를 입력해야 한다는 뜻이다. "필수입력사항  예: 아이디, 비밀번호, 성명"
아무것도 없음  ==> NULL을 허용한다는 뜻으로 데이터값이 들어와도 괜찮고 데이터값이 안들어와도 괜찮다는 뜻이다. "선택사항 예: 집전화번호, 결혼기념일" 

유형(데이터타입)
NUMBER(4)    ==> 숫자타입  -9999 ~ 9999
NUMBER(6)    ==> 숫자타입  -999999 ~ 999999
NUMBER(6,2)  ==> 숫자타입  -9999.99 ~ 9999.99
NUMBER(3,1)  ==> 숫자타입  -99.9 ~ 99.9
NUMBER       ==> 숫자타입  자리수에 제한이 없다.

VARCHAR2(30) ==> 문자열타입  최대 30byte 까지 입력가능함.

VARCHAR2(6)  ==> 문자열타입  최대 6byte 까지 입력가능함.  
                           'superman' 8byte 이므로 입력불가!!
                           'hong'     4byte 이므로 입력가능!!
                           'hongkd'   6byte 이므로 입력가능!!
                           
                 인코딩이 MS949 일때 한글 1글자는 2byte 이므로 '이순신' 은 6byte 이다.
                 인코딩이 UTF-8 일때 한글 1글자는 3byte 이므로 '이순신' 은 9byte 이다.
                 
NVARCHAR2(6)  ==> 문자열타입  최대 6글자 까지 입력가능함.  
                           'superman'    8글자 이므로 입력불가!!
                           'hong'        4글자 이므로 입력가능!!
                           'hongkd'      6글자 이므로 입력가능!!
                           '이순신'       3글자 이므로 입력가능!!
                           '강채영만세'    5글자 이므로 입력가능!!

DATE  ==> 날짜타입

*/

select *
from EMPLOYEES;   -- "사원" 테이블

desc EMPLOYEES;

/*
이름                                      널?         유형           
--------------                           --------    ------------ 
EMPLOYEE_ID     (사원번호)                NOT NULL    NUMBER(6)    
FIRST_NAME      (이름)                               VARCHAR2(20) 
LAST_NAME       (성)                     NOT NULL    VARCHAR2(25) 
EMAIL           (이메일)                  NOT NULL    VARCHAR2(25) 
PHONE_NUMBER    (연락처)                              VARCHAR2(20) 
HIRE_DATE       (입사일자)                 NOT NULL    DATE         
JOB_ID          (직종ID)                  NOT NULL    VARCHAR2(10) 
SALARY          (기본급여)                             NUMBER(8,2)  
COMMISSION_PCT  (커미션[수당]퍼센티지)                  NUMBER(2,2)  
MANAGER_ID      (직속상관[사수]의 사원번호)              NUMBER(6)    
DEPARTMENT_ID   (해당사원이 근무하는 부서번호)            NUMBER(4)
*/

select *
from LOCATIONS;   -- 부서의 위치정보를 알려주는 테이블 

select * 
from COUNTRIES;   -- 국가정보를 알려주는 테이블 

select * 
from REGIONS;     -- 대륙정보를 알려주는 테이블

------------------------------------------------------------------------------------------




/*
   === 아주아주아주아주아주아주아주아주아주아주아주아주 중요 !!!!!!!!!!! ===
   === !!!!!! 필수암기 !!!!!! ===
   
   === 어떠한 테이블(또는 뷰)에서 데이터 정보를 꺼내와 보는 명령어인 select 의 처리순서 ===
   
   select 컬럼명, 컬럼명     --- 5  컬럼명 대신에 *(아스테리크)을 쓰면 모든 컬럼을 뜻하는 것이다.
   from 테이블명(또는 뷰명)   --- 1 
   where 조건절             --- 2  where 조건절이 뜻하는 것은 해당 테이블명(또는 뷰명)에서 조건에 만족하는 행(row)을 메모리(RAM)에 로딩(퍼올리는것) 해주는 것이다.
   group by 절              --- 3
   having 그룹함수조건절      --- 4 
   order by 절              --- 6
*/





----------------------------------------------------------------------------------------------

 --- *** NULL 을 처리해주는 함수 *** ---
 
 --- NULL 은 존재하지 않는 것이므로 4칙연산(+ - * /)에 NULL 이 포함되어지면 그 결과 무조건 NULL 이 된다.
 
 1. NVL 
 
    select '안녕하세요'
    from dual;  -- dual 은 select 다음에 나오는 값들을 화면에 보여주기 위한 용도로 쓰이는 가상테이블이다.
    
    select 1+2, 1+null, 3*0, null*0, 2-1, 2-null, 5/2, 5/null 
    from dual;
    
    select nvl(7,3), nvl(null,3),
           nvl('이순신','거북선'), nvl(null,'거북선') 
    from dual;
    
    
 2. NVL2 
    
    select nvl2(7,3,2), nvl2(null,3,2),
           nvl2('이순신','거북선','구국영웅'), nvl2(null,'거북선','구국영웅') 
    from dual;
    
    
    -- employees 테이블에 저장되어진 모든 행들에 대해 모든 컬럼의 정보를 출력하세요
    select *
    from EMPLOYEES;
    
    
    -- employees 테이블에 저장되어진 데이터중 부서번호(department_id) 60번에 근무하는 직원들에 대해
    -- 사원번호(employee_id), 이름(first_name), 성(last_name), 직종ID(job_id), 기본급여(salary), 수당퍼센티지(commission_pct), 부서번호(department_id) 를 출력하세요.
    select employee_id, first_name, last_name, job_id, salary, commission_pct, department_id 
    from employees 
    where department_id = 60;
    
    
    -- employees 테이블에 저장되어진 데이터중 부서번호(department_id) 60번에 근무하는 직원들에 대해
    -- 사원번호(employee_id), 이름(first_name), 성(last_name), 직종ID(job_id), 기본급여(salary), 수당퍼센티지(commission_pct), 
    -- 월급, 부서번호(department_id) 를 출력하세요.
    -- 월급은 기본급여(salary) + 수당(salary * commission_pct) 이다.
    select employee_id, first_name, last_name, job_id, salary, commission_pct, salary * commission_pct, 
           NVL(salary + (salary * commission_pct), salary),
           NVL2(commission_pct, salary + (salary * commission_pct), salary),
           department_id
    from employees;
    
    
    select employee_id AS "사원번호"  -- 별칭(별명) alias 
         , first_name "이름"         -- 별칭(별명) alias 에서 AS 는 생략가능함.
         , last_name 성              -- 별칭(별명) alias 에서 "" 는 생략가능함.
         , salary "기본     급여"     -- 별칭(별명) alias 에서 공백을 주고자 한다라면 반드시 "" 로 해주어야 한다.
         , commission_pct "수당퍼센티지"
         , NVL(salary + (salary * commission_pct), salary) 월급
         , NVL2(commission_pct, salary + (salary * commission_pct), salary) month_salary
         , department_id 부서번호
    from employees;
    
    
    
    
    
    ---------------- **** 비교연산자 **** ----------------
    
   1. 같다                    = 
   2. 같지않다                !=  <>  ^= 
   3. 크다. 작다              >   <
   4. 같거나크다. 같거나작다    >=       <= 
   5. NULL 은 존재하지 않는 것이므로 비교대상이 될 수가 없다.
      그러므로 비교연산( =  != <> ^= >  <  >=  <= )을 할수가 없다.
      그래서 비교연산을 하려면 nvl()함수, nvl2()함수를 사용하여 처리한다. 
      
      
   -- 오라클에서 컬럼들을 붙일때(연결할때)는 문자타입 이든, 숫자타입 이든, 날짜타입 이든 관계없이 || 를 쓰면 된다. 
   select '대한민국', '서울시', 1234, sysdate,
          '대한민국' || '서울시' || 1234 || sysdate
   from dual;
   
   
   -- employees 테이블에서 모든 직원들에 사원번호, 사원명, 월급, 부서번호를 추출하세요.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl( salary + (salary * commission_pct), salary ) AS 월급
        , department_id AS 부서번호
   from employees;
   
   
   -- employees 테이블에서 부서번호가 null 인 직원들만 사원번호, 사원명, 월급, 부서번호를 추출하세요.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl( salary + (salary * commission_pct), salary ) AS 월급
        , department_id AS 부서번호
   from employees
   where department_id = null;
   -- 데이터가 출력되지 않는다.
   -- 왜냐하면 NULL 은 존재하지 않는 것이므로 비교대상이 될 수가 없기 때문이다.
   
   select employee_id, first_name, last_name, department_id, nvl(department_id, -9999)
   from employees;
    
    
   -- employees 테이블에서 부서번호가 null 인 직원들만 사원번호, 사원명, 월급, 부서번호를 추출하세요. 
   desc employees;
   
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where nvl(department_id, -9999) = -9999;
   
   -- 또는 
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where department_id is null;
   -- NULL 은 is 연산자를 사용하여 구한다.
   -- department_id 컬럼의 값이 null 인 행들만 RAM(메모리)에 퍼올리는 것이다.
   
   
   -- employees 테이블에서 부서번호가 30번이 아닌 직원들만 사원번호, 사원명, 월급, 부서번호를 추출하세요.  
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
-- where department_id != 30; 
-- where department_id <> 30;
   where department_id ^= 30;
   
   desc employees;
   
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where nvl(department_id, -9999) != 30;
   
   
   -- employees 테이블에서 부서번호가 NULL 아닌 직원들만 사원번호, 사원명, 월급, 부서번호를 추출하세요. 
   
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where nvl(department_id, -9999) != -9999;
   
   -- 또는
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where department_id is not null;
   
   -- 또는
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where not (department_id is null);

   -- 또는
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where not department_id is null;
   
   
   
   
   ------ *** select 되어져 나온 데이터를 정렬(오름차순정렬, 내림차순정렬) 하여 보여주기 *** ------
   
   --- salary 컬럼의 값을 오름차순 정렬하여 보이세요.
   select employee_id, first_name, last_name, salary, department_id
   from employees
   order by salary asc; 
   
   -- 또는 
   select employee_id, first_name, last_name, salary, department_id
   from employees
   order by salary; -- asc 은 생략가능하다.
   
   
   --- salary 컬럼의 값을 내림차순 정렬하여 보이세요.
   select employee_id, first_name, last_name, salary, department_id
   from employees
   order by salary desc;  -- desc 은 내림차순인데 생략하면 안된다.
   
   
   --- 월급의 오름차순 정렬하여 보이세요.
   select employee_id, first_name, last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by nvl( salary + (salary * commission_pct), salary ) asc;
   
   -- 또는 
   select employee_id, first_name, last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by month_salary asc;
   
   -- 또는 
   select employee_id, first_name, last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by 4 asc;
   
   
   --- 월급의 내림차순 정렬하여 보이세요.
   select employee_id, first_name, last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by nvl( salary + (salary * commission_pct), salary ) desc;
   
   -- 또는 
   select employee_id, first_name, last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by month_salary desc;
   
   -- 또는 
   select employee_id, first_name, last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by 4 desc;
   
   
   -- 정렬(오름차순정렬, 내림차순정렬)을 할 때 NULL 은 존재하지 않는 것이므로
   -- 오라클 에서는 NULL 을 가장 큰것으로 간주를 하고, 마이크로소프트사의 MS-SQL 에서는 NULL 을 가장 작은것으로 간주한다.
   
   -- department_id 컬럼의 값을 오름차순 정렬하여 보이세요.
   select employee_id, first_name, last_name, salary, department_id
   from employees
   order by department_id asc;
   
   -- department_id 컬럼의 값을 내림차순 정렬하여 보이세요.
   select employee_id, first_name, last_name, salary, department_id
   from employees
   order by department_id desc;
   
   
   --------- *** 1차 정렬, 2차 정렬에 대해서 알아봅니다. *** ---------
   
   -- employees 테이블에서 부서번호별 오름차순 정렬을 한 후에 동일한 부서번호내에서는
   -- 월급의 내림차순으로 정렬하여 사원번호, 사원명, 월급, 부서번호를 나타내세요.
   
   select employee_id
        , first_name
        , last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by 5 asc, 4 desc;
   --      1차 정렬, 2차 정렬
   
   select employee_id
        , first_name
        , last_name 
        , nvl( salary + (salary * commission_pct), salary ) AS month_salary 
        , department_id
   from employees
   order by 5, 4 desc;  -- asc 은 생략가능함.
   --      1차 정렬, 2차 정렬
   
   
   -- employees 테이블에서 수당퍼센티지가 null 인 사원들만 
   -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
   -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where commission_pct is null
   order by 4 asc, 3 desc;
   
   
   -- employees 테이블에서 수당퍼센티지가 null 이 아닌 사원들만 
   -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
   -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where not (commission_pct is null)
   order by 4 asc, 3 desc;
   
   -- 또는
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where not commission_pct is null
   order by 4 asc, 3 desc;
   
   -- 또는
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where commission_pct is not null
   order by 4 asc, 3 desc;
   
   
   -- employees 테이블에서 월급(기본급여+수당금액)이 10000 보다 큰 사원들만 
   -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
   -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where nvl( salary + (salary * commission_pct), salary ) > 10000
   order by 4 asc, 3 desc;
   
   
   -- employees 테이블에서 부서번호가 50번 부서가 아닌 사원들만 
   -- 사원번호, 사원명, 월급(기본급여+수당금액), 부서번호를 나타내되 
   -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 월급의 내림차순으로 나타내세요.
   select employee_id 사원번호
        , first_name || ' ' || last_name 사원명
        , nvl( salary + (salary * commission_pct), salary ) 월급
        , department_id 부서번호
   from employees
   where nvl(department_id, -9999) != 50
   order by 4 asc, 3 desc;
   
   
   
   
   ---------- *****   AND    OR    IN()     NOT   연산자   ***** ----------

   --- employees 테이블에서 80번 부서에 근무하는 사원들중에 기본급여가 10000 이상인 사원들만
   --- 사원번호, 사원명, 기본급여, 부서번호를 나타내세요.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
        , department_id AS 부서번호
   from employees
   where department_id = 80 AND salary >= 10000;
   
   --- employees 테이블에서 30번, 60번, 80번 부서에 근무하는 사원들만
   --- 사원번호, 사원명, 기본급여, 부서번호를 나타내세요.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
        , department_id AS 부서번호
   from employees
   where department_id = 30 OR department_id = 60 OR department_id = 80
   order by 4;
   
   -- 또는 
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
        , department_id AS 부서번호
   from employees
   where department_id IN(30,60,80)
   order by 4;
   
   
   --- employees 테이블에서 30번, 60번, 80번 부서에 근무하지 않는 사원들만
   --- 사원번호, 사원명, 기본급여, 부서번호를 나타내세요.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
        , department_id AS 부서번호
   from employees
   where NVL(department_id, -9999) != 30 AND NVL(department_id, -9999) != 60 AND NVL(department_id, -9999) != 80
   order by 4;
   
   -- 또는
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
        , department_id AS 부서번호
   from employees
   where NVL(department_id, -9999) NOT IN(30,60,80)
   order by 4;
   
   -- 또는
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
        , department_id AS 부서번호
   from employees
   where NOT ( NVL(department_id, -9999) IN(30,60,80) )
   order by 4;
   
   -- 또는
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
        , department_id AS 부서번호
   from employees
   where NOT NVL(department_id, -9999) IN(30,60,80) 
   order by 4;
   
   
   -- employees 테이블에서 부서번호가 30, 50, 60번 부서에 근무하는 사원들중에 
   -- 연봉(월급*12)이 20000 이상 60000 이하인 사원들만 
   -- 사원번호, 사원명, 연봉(월급*12), 부서번호를 나타내되 
   -- 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서는 연봉의 내림차순으로 나타내세요.
   
   -- 아래는 틀린 풀이 이다.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl( salary + (salary * commission_pct), salary ) * 12 AS 연봉
        , department_id AS 부서번호
   from employees
   where department_id = 30 OR department_id = 50 OR department_id = 60 AND nvl( salary + (salary * commission_pct), salary ) * 12 >= 20000 AND nvl( salary + (salary * commission_pct), salary ) * 12 <= 60000  
   order by 4 asc, 3 desc;
   
   -- 아래가 올바른 풀이 이다.
   --- **** AND 와 OR 가 혼용되어지면 우선순위는 AND 가 먼저 실행한다. !!!!! **** ---
   --- !!!! 연산자에 있어서 가장 최우선은 괄호( )가 제일 우선한다. !!!! ---
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl( salary + (salary * commission_pct), salary ) * 12 AS 연봉
        , department_id AS 부서번호
   from employees
   where (department_id = 30 OR department_id = 50 OR department_id = 60) AND nvl( salary + (salary * commission_pct), salary ) * 12 >= 20000 AND nvl( salary + (salary * commission_pct), salary ) * 12 <= 60000  
   order by 4 asc, 3 desc;
   
   -- 또는
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl( salary + (salary * commission_pct), salary ) * 12 AS 연봉
        , department_id AS 부서번호
   from employees
   where department_id IN(30,50,60) AND nvl( salary + (salary * commission_pct), salary ) * 12 >= 20000 AND nvl( salary + (salary * commission_pct), salary ) * 12 <= 60000  
   order by 4 asc, 3 desc;  -- IN( ) 은 괄호가 있는 OR 이다.


   ------ ****  범위 연산자 **** ------
   --     >   <   >=   <=   between A and B
   
   -- 범위 연산자에 사용되는 데이터는 숫자 뿐만 아니라 문자, 날짜 까지 모두 사용된다.

   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl( salary + (salary * commission_pct), salary ) * 12 AS 연봉
        , department_id AS 부서번호
   from employees
   where department_id IN(30,50,60) AND nvl( salary + (salary * commission_pct), salary ) * 12 BETWEEN 20000 AND 60000 
   order by 4 asc, 3 desc;
   
   
   --- *** 현재 시각을 알려주는 것 *** ---
   select sysdate, current_date, localtimestamp, current_timestamp, systimestamp
   from dual;
   -- 22/06/30	22/06/30	22/06/30 15:27:46.537000000	22/06/30 15:27:46.537000000 ASIA/SEOUL	22/06/30 15:27:46.537000000 +09:00 
   
   select sysdate 
   from dual;
   /*
      날짜 타입은 date 이다.
      date 타입의 기본적인 표현방식은 'RR/MM/DD' 으로 나타내어진다.
      RR 은 년도의 2자리만 나타내어주는데 50 ~ 99 는 1950 ~ 1999 을 말하는 것이다.
      RR 은 년도의 2자리만 나타내어주는데 00 ~ 49 는 2000 ~ 2049 을 말하는 것이다.
      
      MM 은 월이고, DD 는 일이다.
   */
   desc employees; 
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , hire_date AS 입사일자
   from employees;
   
   select sysdate
        , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
        , to_char(sysdate, 'yyyy-mm-dd hh:mi:ss')
        , to_char(sysdate, 'yyyy-mm-dd am hh:mi:ss')
        , to_char(sysdate, 'yyyy-mm-dd pm hh:mi:ss')
   from dual;

   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , to_char(hire_date, 'yyyy-mm-dd') AS 입사일자
        , to_char(hire_date, 'yyyy')||'년 '||to_char(hire_date, 'mm')||'월 '||to_char(hire_date, 'dd')||'일' AS 입사일자
   from employees;
   
   select hire_date
   from employees
   where employee_id = 154;
   -- 06/12/09
   
   update employees set hire_date = to_date('2006-12-31 09:00:00', 'yyyy-mm-dd hh24:mi:ss')
   where employee_id = 154;
   -- 1 행 이(가) 업데이트되었습니다.
   
   commit;
   -- 커밋 완료.
   
   -- employees 테이블에서 입사일자가 2005년 1월 1일 부터 2006년 12월 31일 까지 입사한 사원들만
   -- 사원번호, 사원명, 입사입자를 나타내세요.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , hire_date AS 입사입자
        , to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') AS 입사일자2
   from employees
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , hire_date AS 입사입자
   from employees
   where '05/01/01' <= hire_date AND hire_date <= '06/12/31';
   -- 틀린풀이이다. 이것은 아래의 풀이와 같은 것이다.
   -- !!!! 중요 !!!! 날짜를 나타낼때 시,분,초 가 없는 년,월,일만 나타내어주면 자동적으로 0시 0분 0초 가 된다.
   --               즉, 날짜를 나타낼때 시,분,초 가 없는 년,월,일은 그 날짜의 자정을 뜻하는 것이다.
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , hire_date AS 입사입자
   from employees
   where '2005-01-01 00:00:00' <= to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss')  AND to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') <= '2006-12-31 00:00:00';
   
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , hire_date AS 입사입자
   from employees
   where '05/01/01' <= hire_date AND hire_date < '07/01/01';
   -- 올바른 풀이이다.
   
   
   'A' --> 65
   'a' --> 97
   '0' --> 48
   ' ' --> 32
   
   select ascii('A'), ascii('a'), ascii('0'), ascii(' ') 
   from dual;
   --        65	         97	          48	     32
   
   select chr(65), chr(97), chr(48), chr(32)
   from dual;
   --        A	      a	       0	  ' '
   
   
   -- employees 테이블에서 first_name 컬럼의 값이 'Elj' 부터 'I' 까지인 데이터를 가지는 사원들만
   -- first_name 컬럼의 값을 출력하세요.
      
   --  'Elj'  'Elja'  'EljaST'  'EljaSTsfdsf'  ~~~~~~~~~ 'HwkswkeF'  'Hzsdfdsf'  'I'  /  'IA' 'IAbsfd'
   select first_name
   from employees 
   where 'Elj' <= first_name AND first_name <= 'I'
   order by 1 asc;
   
   -- 또는
   select first_name
   from employees 
   where first_name between 'Elj' and 'I'
   order by 1 asc;
   
   
   ----------------------------------------------------------------------------------------

   -- 1. 테이블 생성하기
   create table tbl_test01
   (no             number(5)      --   -99999 ~ 99999  
   ,name           Nvarchar2(20)  --   글자수가 최대 20글자까지 들어옴.
   ,input_day      date default sysdate
   );
   -- Table TBL_TEST01이(가) 생성되었습니다.
   
   desc tbl_test01;
   
   select * from tab;
   
   -- ※ DML(Data Manuplation Language  데이터 조작어) 
   --    ==> insert(입력), update(수정), delete(삭제), merge(병합)
   --    DML 은 기본이 수동 커밋(commit)이다.
   --    수동 커밋이므로 디스크에 저장되어진 파일에 저장시키려면 반드시 commit 을 해주어야 한다.
   
   -- 2. 테이블에 데이터 입력하기(행(row) 추가하기)
   insert into tbl_test01(no, name, input_day) values(1, '일지매', sysdate);
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_test01(name, no, input_day) values('이미자', 2, sysdate);
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_test01 values('삼순신', 3, sysdate);
   /*
    오류 보고 -
    ORA-01722: 수치가 부적합합니다
    */
   
   insert into tbl_test01 values(3, '삼순신', sysdate);
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_test01(no, name) values(4, '사미자');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_test01(no, name, input_day) values(5, '오징어', default);
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   -- 커밋 완료.
   -- commit 은 DML문(insert, update, delete, merge)으로 변경된 테이블의 데이터를 실제 디스크 파일에 저장(적용)시켜주는 명령어 이다.
   
   rollback;
   -- 롤백 완료.
   -- rollback 은 commit 한 이후로 실행된 DML문(insert, update, delete, merge)으로 변경된 테이블의 데이터를 실제 디스크 파일에 저장(적용)시켜주지 않고 취소시켜 버리는 명령어 이다.
   -- 이미 commit 되어진 DML문은 rollback 이 불가하다.
   
   select *
   from tbl_test01;
   
   select no, name, input_day, to_char(input_day, 'yyyy-mm-dd hh24:mi:ss')
   from tbl_test01;
   
   
   -- 3. 데이터 수정하기( 특정 컬럼의 값을 변경하기 )
   update tbl_test01 set name = 'Three순신'
   where no = 3;
   -- 1 행 이(가) 업데이트되었습니다.
   
   commit;
   
   select no AS 번호
        , name AS 성명
        , to_char(input_day, 'yyyy-mm-dd hh24:mi:ss') AS 입력날짜
   from tbl_test01;
   
   update tbl_test01 set name = '몰라'
   where no in(2,4);
   -- 2개 행 이(가) 업데이트되었습니다.
   
   commit;
   
   select no AS 번호
        , name AS 성명
        , to_char(input_day, 'yyyy-mm-dd hh24:mi:ss') AS 입력날짜
   from tbl_test01;
   
   update tbl_test01 set name = '누구니';
   -- 5개 행 이(가) 업데이트되었습니다.
   
   commit;
   
   select no AS 번호
        , name AS 성명
        , to_char(input_day, 'yyyy-mm-dd hh24:mi:ss') AS 입력날짜
   from tbl_test01;
   
   
   -- 4. 행 삭제하기
   delete from tbl_test01
   where no = 3;
   -- 1 행 이(가) 삭제되었습니다.
   
   commit;
   
   select no AS 번호
        , name AS 성명
        , to_char(input_day, 'yyyy-mm-dd hh24:mi:ss') AS 입력날짜
   from tbl_test01;
   
   delete from tbl_test01
   where no in(2,5);
   -- 2개 행 이(가) 삭제되었습니다.
   
   commit;
   
   select no AS 번호
        , name AS 성명
        , to_char(input_day, 'yyyy-mm-dd hh24:mi:ss') AS 입력날짜
   from tbl_test01;
   
   
   delete from tbl_test01;
   -- 2개 행 이(가) 삭제되었습니다.
   
   commit;
   
   select no AS 번호
        , name AS 성명
        , to_char(input_day, 'yyyy-mm-dd hh24:mi:ss') AS 입력날짜
   from tbl_test01;
   
   
   -- 5. 테이블 삭제하기
   
   select * from tab;
   
   select * 
   from tbl_test01;
   
   drop table tbl_test01 purge;
   -- Table TBL_TEST01이(가) 삭제되었습니다.
 
  ----------------------------------------------------------------------------------------
   
   
   
   ------ *** employees 테이블에 jubun(주민번호) 이라는 컬럼을 추가해봅니다. *** --------
   /*
       jubun(주민번호) 컬럼의 값을 입력할때는 '-' 는 빼고 숫자로만 입력할 것입니다.
       jubun(주민번호) 컬럼의 값을 입력할 때 맨 처음 첫자리에 0 이 들어올 수 있다라면 
       number 타입이 아니라 varchar2 타입으로 해야 한다.
       왜냐하면 number 타입으로 해주면 맨 앞에 입력한 값이 0 일때는 0이 생략 되어지기 때문이다.
       맨 앞의 0 도 나오게 하려면 컬럼의 데이터 타입은 varchar2 가 되어야 한다.
   */
   select 0007013234567, '0007013234567'
   from dual;
   
   alter table employees
   add jubun varchar2(13);  -- employees 테이블에 jubun(주민번호) 이라는 컬럼을 추가하는 것이다.
   -- Table EMPLOYEES이(가) 변경되었습니다.
   
   desc employees;
   
   select * 
   from employees;
   
    update employees set jubun = '6010151234567'  
    where employee_id = 100;

    update employees set jubun = '8510151234567'
    where employee_id = 101;
    
    update employees set jubun = '6510152234567'
    where employee_id = 102;
    
    update employees set jubun = '7510151234567'
    where employee_id = 103;
    
    update employees set jubun = '6110152234567'
    where employee_id = 104;
    
    update employees set jubun = '6510151234567'
    where employee_id = 105;
    
    update employees set jubun = '6009201234567'
    where employee_id = 106;
    
    update employees set jubun = '0803153234567'
    where employee_id = 107;
    
    update employees set jubun = '0712154234567'
    where employee_id = 108;
    
    update employees set jubun = '8810151234567'
    where employee_id = 109;
    
    update employees set jubun = '8908152234567'
    where employee_id = 110;
    
    update employees set jubun = '9005052234567'
    where employee_id = 111;
    
    update employees set jubun = '6610151234567'
    where employee_id = 112;
    
    update employees set jubun = '6710151234567'
    where employee_id = 113;
    
    update employees set jubun = '6709152234567'
    where employee_id = 114;
    
    update employees set jubun = '6110151234567'
    where employee_id = 115;
    
    update employees set jubun = '6009301234567'
    where employee_id = 116;
    
    update employees set jubun = '6110152234567'
    where employee_id = 117;
    
    update employees set jubun = '7810151234567'
    where employee_id = 118;
    
    update employees set jubun = '7909151234567'
    where employee_id = 119;
    
    update employees set jubun = '7702152234567'
    where employee_id = 120;
    
    update employees set jubun = '7009151234567'
    where employee_id = 121;
    
    update employees set jubun = '7111011234567'
    where employee_id = 122;
    
    update employees set jubun = '8010131234567'
    where employee_id = 123;
    
    update employees set jubun = '8110191234567'
    where employee_id = 124;
    
    update employees set jubun = '9012132234567'
    where employee_id = 125;
    
    update employees set jubun = '9406251234567'
    where employee_id = 126;
    
    update employees set jubun = '9408252234567'
    where employee_id = 127;
    
    update employees set jubun = '9204152234567'
    where employee_id = 128;
    
    update employees set jubun = '8507251234567'
    where employee_id = 129;
    
    update employees set jubun = '6511111234567'
    where employee_id = 130;
    
    update employees set jubun = '0010153234567'
    where employee_id = 131;
    
    update employees set jubun = '0005254234567'
    where employee_id = 132;
    
    update employees set jubun = '0110194234567'
    where employee_id = 133;
    
    update employees set jubun = '0412154234567'
    where employee_id = 134;
    
    update employees set jubun = '0503253234567'
    where employee_id = 135;
    
    update employees set jubun = '9510012234567'
    where employee_id = 136;
    
    update employees set jubun = '9510021234567'
    where employee_id = 137;
    
    update employees set jubun = '9610041234567'
    where employee_id = 138;
    
    update employees set jubun = '9610052234567'
    where employee_id = 139;
    
    update employees set jubun = '7310011234567'
    where employee_id = 140;
    
    update employees set jubun = '7310092234567'
    where employee_id = 141;
    
    update employees set jubun = '7510121234567'
    where employee_id = 142;
    
    update employees set jubun = '7612012234567'
    where employee_id = 143;
    
    update employees set jubun = '7710061234567'
    where employee_id = 144;
    
    update employees set jubun = '7810052234567'
    where employee_id = 145;
    
    update employees set jubun = '6810251234567'
    where employee_id = 146;
    
    update employees set jubun = '6811062234567'
    where employee_id = 147;
    
    update employees set jubun = '6712052234567'
    where employee_id = 148;
    
    update employees set jubun = '6011251234567'
    where employee_id = 149;
    
    update employees set jubun = '6210062234567'
    where employee_id = 150;
    
    update employees set jubun = '6110191234567'
    where employee_id = 151;
    
    update employees set jubun = '5712062234567'
    where employee_id = 152;
    
    update employees set jubun = '5810231234567'
    where employee_id = 153;
    
    update employees set jubun = '6311051234567'
    where employee_id = 154;
    
    update employees set jubun = '6010182234567'
    where employee_id = 155;
    
    update employees set jubun = '6110191234567'
    where employee_id = 156;
    
    update employees set jubun = '6210112234567'
    where employee_id = 157;
    
    update employees set jubun = '6311132234567'
    where employee_id = 158;
    
    update employees set jubun = '8511112234567'
    where employee_id = 159;
    
    update employees set jubun = '8710131234567'
    where employee_id = 160;
    
    update employees set jubun = '8710072234567'
    where employee_id = 161;
    
    update employees set jubun = '9010171234567'
    where employee_id = 162;
    
    update employees set jubun = '9112072234567'
    where employee_id = 163;
    
    update employees set jubun = '9110241234567'
    where employee_id = 164;
    
    update employees set jubun = '9212251234567'
    where employee_id = 165;
    
    update employees set jubun = '9310232234567'
    where employee_id = 166;
    
    update employees set jubun = '9811151234567'
    where employee_id = 167;
    
    update employees set jubun = '9810252234567'
    where employee_id = 168;
    
    update employees set jubun = '9910301234567'
    where employee_id = 169;
    
    update employees set jubun = '0910153234567'
    where employee_id = 170;
    
    update employees set jubun = '1011153234567'
    where employee_id = 171;
    
    update employees set jubun = '1006153234567'
    where employee_id = 172;
    
    update employees set jubun = '1111154234567'
    where employee_id = 173;
    
    update employees set jubun = '1209103234567'
    where employee_id = 174;
    
    update employees set jubun = '1207154234567'
    where employee_id = 175;
    
    update employees set jubun = '0906153234567'
    where employee_id = 176;
    
    update employees set jubun = '0812113234567'
    where employee_id = 177;
    
    update employees set jubun = '9810132234567'
    where employee_id = 178;
    
    update employees set jubun = '8712111234567'
    where employee_id = 179;
    
    update employees set jubun = '8310012234567'
    where employee_id = 180;
    
    update employees set jubun = '6510191234567'
    where employee_id = 181;
    
    update employees set jubun = '6510221234567'
    where employee_id = 182;
    
    update employees set jubun = '6510232234567'
    where employee_id = 183;
    
    update employees set jubun = '8512131234567'
    where employee_id = 184;
    
    update employees set jubun = '8510182234567'
    where employee_id = 185;
    
    update employees set jubun = '7510192234567'
    where employee_id = 186;
    
    update employees set jubun = '8512192234567'
    where employee_id = 187;
    
    update employees set jubun = '9511151234567'
    where employee_id = 188;
    
    update employees set jubun = '7509302234567'
    where employee_id = 189;
    
    update employees set jubun = '8510161234567'
    where employee_id = 190;
    
    update employees set jubun = '9510192234567'
    where employee_id = 191;
    
    update employees set jubun = '0510133234567'
    where employee_id = 192;
    
    update employees set jubun = '0810194234567'
    where employee_id = 193;
    
    update employees set jubun = '0910183234567'
    where employee_id = 194;
    
    update employees set jubun = '1010134234567'
    where employee_id = 195;
    
    update employees set jubun = '9510032234567'
    where employee_id = 196;
    
    update employees set jubun = '9710181234567'
    where employee_id = 197;
    
    update employees set jubun = '9810162234567'
    where employee_id = 198;
    
    update employees set jubun = '7511171234567'
    where employee_id = 199;
    
    update employees set jubun = '7810172234567'
    where employee_id = 200;
    
    update employees set jubun = '7912172234567'
    where employee_id = 201;
    
    update employees set jubun = '8611192234567'
    where employee_id = 202;
    
    update employees set jubun = '7810252234567'
    where employee_id = 203;
    
    update employees set jubun = '7803251234567'
    where employee_id = 204;
    
    update employees set jubun = '7910232234567'
    where employee_id = 205;
    
    update employees set jubun = '8010172234567'
    where employee_id = 206;
    
    commit;
   
   select * 
   from employees;
      
   
   
   
     
   ------ ====== like 연산자 ====== ------
   select *
   from employees
   where department_id = 30;
   
   select *
   from employees
   where department_id like 30;
   
   /*
       like 연산자와 함께 사용되어지는 % 와 _ 를 wild character 라고 부른다.
       like 연산자와 함께 사용되어지는 % 의 뜻은 글자수와는 관계없이 글자가 있든지 글자가 없든지 관계없다라는 말이다.
       like 연산자와 함께 사용되어지는 _ 의 뜻은 반드시 아무글자 1개만을 뜻하는 것이다. 
   */
   
   -- employees 테이블에서 여자 1990년생과 남자 1991년생의 사원들만 사원번호, 사원명, 주민번호를 나타내세요.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , jubun AS 주민번호
   from employees
   where jubun like '90____2%' OR jubun like '91____1%';
   
   
   -- employees 테이블에서 first_name 컬럼의 값이 'J'로 시작하는 사원들만 
   -- 사원번호, 이름, 성, 기본급여를 나타내세요.
   select employee_id, first_name, last_name, salary
   from employees
   where first_name like 'J%';
      
   -- employees 테이블에서 first_name 컬럼의 값이 's'로 끝나는 사원들만 
   -- 사원번호, 이름, 성, 기본급여를 나타내세요.
   select employee_id, first_name, last_name, salary
   from employees
   where first_name like '%s';
   
   -- employees 테이블에서 first_name 컬럼의 값중에 'ee' 라는 글자가 들어있는 사원들만 
   -- 사원번호, 이름, 성, 기본급여를 나타내세요.
   select employee_id, first_name, last_name, salary
   from employees
   where first_name like '%ee%';
   
   -- employees 테이블에서 first_name 컬럼의 값중에 'e' 가 2개 이상 들어있는 사원들만 
   -- 사원번호, 이름, 성, 기본급여를 나타내세요.
   select employee_id, first_name, last_name, salary
   from employees
   where first_name like '%e%e%';
   
   
   -- employees 테이블에서 last_name 컬럼의 값이 첫글자는 'F' 이고 두번째 글자는 아무거나 이고
   -- 세번째 글자는 소문자 'e' 이며 4번째 부터는 글자가 있든지 없든지 상관없는 사원들만 
   -- 사원번호, 이름, 성, 기본급여를 나타내세요.
   select employee_id, first_name, last_name, salary
   from employees
   where last_name like 'F_e%';
   
   
   
   ----- *** like 연산자와 함께 사용되어지는 % 와 _ 인 wild character 의 기능을 escape(탈출) 시키기 *** -----
   create table tbl_watch
   (watchname   Nvarchar2(10) 
   ,bigo        Nvarchar2(100)
   );
   -- Table TBL_WATCH이(가) 생성되었습니다.
   
   insert into tbl_watch(watchname, bigo) values('금시계', '순금 99.99% 함유 고급시계');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_watch(watchname, bigo) values('은시계', '고객만족도 99.99점 획득한 고급시계');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   -- 커밋 완료.
   
   select *
   from tbl_watch;
   
   -- tbl_watch 테이블에서 bigo 컬럼에 99.99% 라는 글자가 들어있는 행만 나타내세요.
   select * 
   from tbl_watch
   where bigo like '%99.99%%';
   
   select * 
   from tbl_watch
   where bigo like '%99.99\%%' escape '\';
   --  escape 문자로 '\' 을 주었으므로 '\' 다음에 나오는 wild character(% 또는 _) 문자 1개만 wild character 기능에서 탈출시켜버린다.
   
   select * 
   from tbl_watch
   where bigo like '%99.992%%' escape '2';
   --  escape 문자로 '2' 을 주었으므로 '2' 다음에 나오는 wild character(% 또는 _) 문자 1개만 wild character 기능에서 탈출시켜버린다.
   
   select * 
   from tbl_watch
   where bigo like '%99.99a%%' escape 'a';
   --  escape 문자로 'a' 을 주었으므로 'a' 다음에 나오는 wild character(% 또는 _) 문자 1개만 wild character 기능에서 탈출시켜버린다.
   
   
   
   
   
   
   ---------------------------------------------------------------------------------------------
                         ------ >> 단일행 함수 << ------ 
                         
    /*
        ※ 단일행 함수의 종류
    
        1. 문자 함수
        2. 숫자 함수
        3. 날짜 함수
        4. 변환 함수
        5. 기타 함수
    */
        
                         
    ------- >> 1. 문자 함수 << -------
    
    -- 1.1  upper('문자열')  ==> '문자열' 을 모두 대문자로 변환시켜주는 것.
    select 'kOreA SEoul', upper('kOreA SEoul')
    from dual;
    
    -- 1.2  lower('문자열')  ==> '문자열' 을 모두 소문자로 변환시켜주는 것.
    select 'kOreA SEoul', lower('kOreA SEoul')
    from dual;
    
    -- 1.3  initcap('문자열')  ==> '문자열' 을 단어별(구분자 공백) 첫글자만 대문자, 나머지는 소문자로 변환시켜주는 것.
    select 'kOreA SEoul', initcap('kOreA SEoul')
    from dual;
    
    select last_name, upper(last_name), lower(last_name), initcap(last_name)
    from employees;
    
    select * 
    from employees
    where last_name = 'King';
    
    select * 
    from employees
    where lower(last_name) = lower('KING');
        
    select * 
    from employees
    where lower(last_name) = lower('king');
    
    select * 
    from employees
    where lower(last_name) = lower('kIng');
    
    select * 
    from employees
    where upper(last_name) = upper('KING');
        
    select * 
    from employees
    where upper(last_name) = upper('king');
    
    select * 
    from employees
    where upper(last_name) = upper('kIng');
    
    
    -- 1.4  substr('문자열', 시작글자번호, 뽑아야할글자길이)
    --      ==> '문자열' 중에 문자열의 특정 일부분을 선택해올 때 사용한다.
    select '쌍용교육센터'
         , substr('쌍용교육센터', 2, 3)  -- '쌍용교육센터' 에서 2번째 글자인 '용' 부터 3글자만 뽑아온다.
         , substr('쌍용교육센터', 2)     -- '쌍용교육센터' 에서 2번째 글자인 '용' 부터 끝까지 뽑아온다.
    from dual;
    -- 쌍용교육센터	용교육	용교육센터
    
    
    -- *** substr() 함수를 사용하여 employees 테이블에서 성별이 '여자'인 사원들만
    --     사원번호, 사원명, 주민번호를 나타내세요. ***
    
    select jubun, substr(jubun, 7, 1)
    from employees;
    
    select employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , jubun AS 주민번호
    from employees
    where substr(jubun, 7, 1) in('2','4');
        
    
    -- *** substr() 함수를 사용하여 employees 테이블에서 1990년 ~ 1995년에 태어난 사원들 중 
    ---    성별이 '남자'인 사원들만 사원번호, 사원명, 주민번호를 나타내세요. ***
    
    select jubun, substr(jubun,1,2), substr(jubun, 7, 1)
    from employees;
      
    select employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , jubun AS 주민번호    
    from employees
    where substr(jubun,1,2) between '90' and '95' AND
          substr(jubun, 7, 1) = '1'; 
          
          
    -- 1.5   instr : 어떤 문자열에서 명명된 문자열의 위치를 알려주는 것 --
    select '쌍용교육센터 서울교육대학교 교육문화원'
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1, 1)  -- 3
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 1 번째 부터 검색하여 1 번째 나오는 '교육'의 위치를 알려달라는 말이다.
         
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1, 2)  -- 10
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 1 번째 부터 검색하여 2 번째 나오는 '교육'의 위치를 알려달라는 말이다.
         
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1, 3)  -- 16
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 1 번째 부터 검색하여 3 번째 나오는 '교육'의 위치를 알려달라는 말이다.
         
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1, 4)  -- 0
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 1 번째 부터 검색하여 4 번째 나오는 '교육'의 위치를 알려달라는 말이다.
         -- 찾는 값이 없을 시에는 0 이 나온다.
         
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 4, 1)  -- 10
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 4 번째 부터 검색하여 1 번째 나오는 '교육'의 위치를 알려달라는 말이다.
         
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 1)  -- 3
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 1 번째 부터 검색하는데 몇번째인지 값이 없으면 무조건 1 번째 나오는 '교육'의 위치를 알려달라는 말이다.
         
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', 4)  -- 10 
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 4 번째 부터 검색하는데 몇번째인지 값이 없으면 무조건 1 번째 나오는 '교육'의 위치를 알려달라는 말이다.
    from dual;
    
    
    -- 1.6  reverse : 어떤 문자열을 거꾸로 보여주는 것이다. --
    select 'ORACLE', reverse('ORACLE')
         , '대한민국', reverse('대한민국'), reverse(reverse('대한민국'))
    from dual;
    
    
    ------ [퀴즈] -------
    create table tbl_files
    (fileno      number(3)
    ,filepath    varchar2(200)
    );
    
    insert into tbl_files(fileno, filepath) values(1, 'c:\myDocuments\resume.hwp');
    insert into tbl_files(fileno, filepath) values(2, 'd:\mymusic.mp3');
    insert into tbl_files(fileno, filepath) values(3, 'c:\myphoto\2021\07\face.jpg');
    
    commit;
    
    select fileno, filepath
    from tbl_files;
    
    -- 아래와 같이 나오도록 하세요 --
    /*
       ---------------------------
        파일번호      파일명
       --------------------------- 
          1	         resume.hwp
          2	         mymusic.mp3
          3	         face.jpg
    */
    select fileno, filepath, reverse(filepath),
      --   substr(reverse(filepath),1, 글자길이)
      --   substr(reverse(filepath),1, reverse(filepath)에서 최초로 '\'가 나오는 위치 - 1 )
      --   substr(reverse(filepath),1, instr(reverse(filepath),'\',1)-1)
           reverse( substr(reverse(filepath),1, instr(reverse(filepath),'\',1)-1)  )   
    from tbl_files;
    
    select fileno AS 파일번호 
         , reverse( substr(reverse(filepath),1, instr(reverse(filepath),'\',1)-1)  ) AS 파일명  
    from tbl_files;
    
    
    select '쌍용교육센터 서울교육대학교 교육문화원'
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', -1, 1)  -- 16
         -- '쌍용교육센터 서울교육대학교 교육문화원' 에서 '교육' 이 나오는 위치를 찾는데
         -- 출발점이 역순으로 1 번째 부터 검색하여 1 번째 나오는 '교육'의 위치를 알려달라는 말이다.
         
         , instr('쌍용교육센터 서울교육대학교 교육문화원', '교육', -6, 2)  -- 3
    from dual;   
    
    select fileno, filepath,
       --  substr(filepath, filepath에서 마지막으로 나오는 '\' 위치값 그 다음 부터 끝까지 뽑는다)
       --  substr(filepath, filepath에서 마지막으로 나오는 '\' 위치값+1 )
           substr(filepath, instr(filepath, '\', -1)+1 )
    from tbl_files;
    
    select fileno AS 파일번호
         , substr(filepath, instr(filepath, '\', -1)+1 ) AS 파일명
    from tbl_files;
    
    
    -- 1.7  lpad : 왼쪽부터 문자를 자리채움  --
    -- 1.8  rpad : 오른쪽부터 문자를 자리채움  --
    select lpad('여름여행', 20, '*')    -- 20 byte 를 확보해서 '여름여행'를 넣습니다. 넣은 후 빈공간(12byte)이 있으면 왼쪽부터 '*' 로 채워라.
         , rpad('여름여행', 20, '*')    -- 20 byte 를 확보해서 '여름여행'를 넣습니다. 넣은 후 빈공간(12byte)이 있으면 오른쪽부터 '*' 로 채워라.
    from dual;
    
    select lpad('*',10,'*'), rpad('*',10,'*')
    from dual;
    
    
    -- 1.9   ltrim : 왼쪽부터 문자를 제거한다. --
    -- 1.10  rtrim : 오른쪽부터 문자를 제거한다. --
    -- 1.11  trim :  왼쪽, 오른쪽부터 공백문자를 제거한다. --
    select ltrim('aabcdabcdaaaccdddabcdTabdddcccaaaSSS','abcd'), 
           rtrim('aabcdabcdaaaccdddabcdTabdddcccaaa','abcd'),
           rtrim(ltrim('aabcdabcdaaaccdddabcdTabdddcccaaa', 'abcd'), 'abcd')
    from dual;
    
    select '쌍용' || '                     교육                 센터'
         , '쌍용' || ltrim('                     교육                 센터') 
    from dual;
    
    select '쌍용                    ' || '교육                 센터' 
         , rtrim('쌍용                    ') || '교육                 센터'
    from dual;
    
    
    select '쌍용' || '          교육              ' || '센터' 
         , '쌍용' || trim('          교육              ') || '센터'  
    from dual;
    
    
    -- 1.12  translate ---
    select translate('010-3456-6943'
                    ,'0123456789'
                    ,'영일이삼사오육칠팔구')
    from dual;
    -- 영일영-삼사오육-육구사삼
    
    
    -- 1.13  replace ---
    select replace('쌍용교육센터 서울교육대학교 교육문화원'
                  ,'교육'
                  ,'education')
    from dual;
    -- 쌍용education센터 서울education대학교 education문화원
    
    
    -- 1.14  length  : 문자열의 길이를 알려주는 것 --
    select length('쌍용center')  -- 8
    from dual;
    
    
    -- employees 테이블에서 last_name 의 길이가 8 이상인 행만 추출하세요.
    select *
    from employees
    where length(last_name) >= 8;
    
    -- employees 테이블에서 last_name 의 길이가 8 이상 10 이하인 행만 추출하세요.
    select *
    from employees
    where length(last_name) between 8 and 10;
    
    
    
    
    
    ------- >> 2. 숫자 함수 << -------
    
    -- 2.1  mod : 나머지를 구해주는 것
    select 5/2, mod(5,2), trunc(5/2)
    from dual;
    --   2.5       1         2
    
    
    -- 2.2   round : 반올림을 해주는 것.
    select 94.547
         , round(94.547)         -- 95
         , round(94.547, 0)      -- 95       0 은 정수 1자리까지만 나타내어준다.
         , round(94.547, 1)      -- 94.5     1 은 소수 첫째자리까지만 나타내어준다.
         , round(94.547, 2)      -- 94.55    2 은 소수 둘째자리까지만 나타내어준다.
         , round(94.547, -1)     -- 90       -1 은 정수 10자리까지만 나타내어준다.
         , round(94.547, -2)     -- 100      -2 은 정수 100자리까지만 나타내어준다.
    from dual;
    
    
    -- 2.3  trunc : 절삭을 해주는 것.
    select 94.547
         , trunc(94.547)         -- 94
         , trunc(94.547, 0)      -- 94       0 은 정수 1자리까지만 나타내어준다.
         , trunc(94.547, 1)      -- 94.5     1 은 소수 첫째자리까지만 나타내어준다.
         , trunc(94.547, 2)      -- 94.54    2 은 소수 둘째자리까지만 나타내어준다.
         , trunc(94.547, -1)     -- 90       -1 은 정수 10자리까지만 나타내어준다.
         , trunc(94.547, -2)     -- 0        -2 은 정수 100자리까지만 나타내어준다.
    from dual;
    
    
    -- *** [성적처리] *** --
    create table tbl_sungjuk
    (hakbun      varchar2(20)
    ,name        varchar2(20)
    ,kor         number(3)
    ,eng         number(3)
    ,math        number(3)
    );
    -- Table TBL_SUNGJUK이(가) 생성되었습니다.
    
    select *
    from tbl_sungjuk;
    
    --- *** 데이터 입력하기 *** ---
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist001','한석규',90,92,93);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist002','두석규',100,100,100);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist003','세석규',71,72,73);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist004','네석규',89,87,81);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist005','오석규',60,50,40);
    insert into tbl_sungjuk(hakbun, name, kor, eng, math) values('sist006','육석규',80,81,87);
    
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_sungjuk;
    
    --------------------------------------------------------------------------------------------------------------------------------------------------------
      학번    성명   국어   영어   수학   총점   평균(소수부 첫째자리까지 나타내되 반올림)    학점(평균이 90 이상이면 'A'  90미만 80이상이면 'B'...... 60 미만이면 'F') 
    --------------------------------------------------------------------------------------------------------------------------------------------------------
    select hakbun AS 학번
         , name AS 성명
         , kor AS 국어
         , eng AS 영어
         , math AS 수학
         , (kor+eng+math) AS 총점 
         , round( (kor+eng+math)/3, 1) AS 평균
         
         , case 
           when round( (kor+eng+math)/3, 1) >= 90 then 'A'
           when round( (kor+eng+math)/3, 1) >= 80 then 'B'
           when round( (kor+eng+math)/3, 1) >= 70 then 'C'
           when round( (kor+eng+math)/3, 1) >= 60 then 'D'
           else 'F' 
           end AS 학점1
         
         , case trunc( round( (kor+eng+math)/3, 1), -1)
           when 100 then 'A'
           when  90 then 'A'
           when  80 then 'B'
           when  70 then 'C'
           when  60 then 'D'
           else 'F'
           end AS 학점2
           
         , decode( trunc( round( (kor+eng+math)/3, 1), -1), 100, 'A'
                                                          ,  90, 'A'
                                                          ,  80, 'B'
                                                          ,  70, 'C'
                                                          ,  60, 'D'
                                                               , 'F') AS 학점3 
           
    from tbl_sungjuk;
    
    
    -- 2.4  power : 거듭제곱
    select 2*2*2*2*2, power(2,5)  -- 2의 5승
    from dual;
    
    
    -- 2.5  sqrt : 제곱근
    select sqrt(16), sqrt(2), sqrt(3)
    from dual;
    
    
    -- 2.6  sin, cos, tan, asin, acos, atan
    select sin(90), cos(90), tan(90), asin(0.3), acos(0.3), atan(0.3)
    from dual;
    
    
    -- 2.7  log
    select log(10, 100)
    from dual;
    
    
    -- 2.8  sign   ==>  결과값이 양수이라면 1, 결과값이 0 이라면 0, 결과값이 음수이라면 -1
    select sign(5-2), sign(5-5), sign(2-5)
    from dual;
    
    
    -- 2.9  ceil(실수)  ==> 입력되어진 실수 보다 큰 최소의 정수를 나타내어준다.
    --      ceil(정수)  ==> 입력되어진 정수를 그대로 나타내어준다.
    select ceil(10.1), ceil(10), ceil(-10.1), ceil(-10)
    from dual;
    
    
    -- 2.10  floor(실수)  ==> 입력되어진 실수 보다 작은 최대의 정수를 나타내어준다.
    --       floor(정수)  ==> 입력되어진 정수를 그대로 나타내어준다.
    select floor(10.1), floor(10), floor(-10.1), floor(-10)
    from dual;
    
    
    -- 2.11  ascii , chr
    select ascii('A'), ascii('a'), ascii('0'), ascii(' ') 
    from dual;
    --        65	         97	          48	     32
   
    select chr(65), chr(97), chr(48), chr(32)
    from dual;
    --        A	      a	       0	  ' '
    
    
    
    
    
    
    
    ------- >> 3. 날짜 함수 << -------
    
    /*
        날짜1 + 숫자 = 날짜2  ==> 날짜1 에서 숫자(일수)만큼 더한 값이 날짜2 가 된다.
        날짜1 - 숫자 = 날짜2  ==> 날짜1 에서 숫자(일수)만큼 뺀   값이 날짜2 가 된다.
        
        !!!!!!!! 여기서 중요한 것은 숫자의 단위가 일수 이다. !!!!!!!!!!
    */
    
    select sysdate - 1 , to_char(sysdate - 1, 'yyyy-mm-dd hh24:mi:ss') AS 어제시각
         , sysdate     , to_char(sysdate    , 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
         , sysdate + 1 , to_char(sysdate + 1, 'yyyy-mm-dd hh24:mi:ss') AS 내일시각 
    from dual;
    
    --- 단위환산 ---
    /*
       1 kg = 1000 g
       1 g = 1/1000 kg
       
       1 일 = 24 시간
       1 시간 = 1/24 일
       1 시간 = 60 분
       1 분 = 1/60 시간
       1 분 = 60 초
       1 초 = 1/60 분
    */
    
    --- *** [퀴즈] 현재시각으로 부터 1일 2시간 3분 4초 뒤를 나타내세요 *** ----
    select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
         , to_char(sysdate + 1 + 2/24 + 3/(24*60) + 4/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') AS "1일 2시간 3분 4초 뒤"
    from dual;
    -- 2022-07-01 16:42:52	2022-07-02 18:45:56
    
    
    --- 3.1  to_yminterval  ,  to_dsinterval 
    /*
             to_yminterval 은 년 과 월을 나타내어 연산자가 + 이면 날짜에서 더해주는 것이고,
             to_dsinterval 은 일 시간 분 초를 나타내어 연산자가 + 이면 날짜에서 더해주는 것이다.
             연산자가 - 를 쓰면 날짜를 빼주는 것이다.
     */
     --      현재일로 부터 1년 2개월 3일 4시간 5분 6초 뒤(미래)를 나타내세요...
     select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
          , to_char( sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'), 'yyyy-mm-dd hh24:mi:ss') AS "1년 2개월 3일 4시간 5분 6초 뒤"
     from dual;
    
     --      현재일로 부터 1년 2개월 3일 4시간 5분 6초 전(과거)를 나타내세요...
     select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
          , to_char( sysdate - to_yminterval('01-02') - to_dsinterval('003 04:05:06'), 'yyyy-mm-dd hh24:mi:ss') AS "1년 2개월 3일 4시간 5분 6초 전"
     from dual;
    
    
    --- *** [퀴즈] 현재시각으로 부터 1일 2시간 3분 4초 뒤를 나타내세요 *** ----
    select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
         , to_char( sysdate + to_dsinterval('001 02:03:04') , 'yyyy-mm-dd hh24:mi:ss') AS "1일 2시간 3분 4초 뒤"
    from dual;
    
    
    
    -- 3.2  add_months(날짜,숫자)
    /*
       ==> 숫자가 양수이면 날짜에서 숫자 개월수 만큼 더해준 날짜를 나타내는 것이고,
           숫자가 음수이면 날짜에서 숫자 개월수 만큼 뺀    날짜를 나타내는 것이다.
           
           여기서 숫자의 단위는 개월수 이다.
    */
    
    select to_char(add_months(sysdate, -2), 'yyyy-mm-dd hh24:mi:ss') AS "2개월전시각"
          ,to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS 현재시각
          ,to_char(add_months(sysdate, 2), 'yyyy-mm-dd hh24:mi:ss') AS "2개월후시각"
    from dual;
    
    
    -- *** 내일 홍길동이 군대에 입대를 한다. 복무기간이 18개월 이라면 제대일자(년-월-일)를 구하세요. *** --
    select to_char( add_months(sysdate+1,18), 'yyyy-mm-dd') AS 제대일자
    from dual;
    -- 2024-01-05
    
    
    -- 3.3  months_between(날짜1, 날짜2)
    /*
       날짜1 에서 날짜2 를 뺀 값으로 그 결과는 숫자가 나오는데 결과물 숫자의 단위는 개월수 이다. 
       즉, 두 날짜의 개월차이를 구할 때 사용한다.
    */
    select months_between(add_months(sysdate,3), sysdate)
    from dual;
    
    -- *** 날짜1 - 날짜2 = 숫자
    -- ==> 날짜1 에서 날짜2 를 뺀 값으로 숫자가 나오는데 결과물 숫자의 단위는 일수 이다.
    --     즉, 두 날짜의 일수차이를 구할 때 사용한다.
    
    select (sysdate + 3) - sysdate
    from dual;
        
    select add_months(sysdate, 1) - sysdate
    from dual;
    
    
    -- 3.4  last_day(특정날짜)
    --      ==> 특정날짜가 포함된 달력에서 맨 마지막날짜를 알려주는 것이다.
    select sysdate, last_day(sysdate)
    from dual;
    -- 22/07/04	  22/07/31
    
    select add_months(sysdate, -1), last_day( add_months(sysdate, -1) )
    from dual;
    -- 22/06/04	  22/06/30
    
    
    select to_date('2022-07-04', 'yyyy-mm-dd') + 1
    from dual;
    -- 22/07/05
    
    select to_date('2020-02-01', 'yyyy-mm-dd'), last_day(to_date('2020-02-01', 'yyyy-mm-dd'))
         , to_date('2022-02-01', 'yyyy-mm-dd'), last_day(to_date('2022-02-01', 'yyyy-mm-dd'))
    from dual;
    --   20/02/01	20/02/29	22/02/01	22/02/28
    
    
    -- 3.5  next_day(특정날짜, '일')  '일' '월' '화' '수' '목' '금' '토'
    --      ==> 특정날짜로 부터 다음번에 돌아오는 가장 빠른 '일'~'토'의 날짜를 알려주는 것이다. 
    select sysdate
         , next_day(sysdate, '금')
         , next_day(sysdate, '월')
    from dual;
    --   22/07/04	22/07/08	22/07/11
    
    
    
    -- 3.6  extract  ==> 날짜에서 년, 월, 일을 숫자형태로 추출해주는 것이다.
    
    select sysdate
         , to_char(sysdate, 'yyyy'), extract(year from sysdate)
         , to_char(sysdate, 'mm')  , extract(month from sysdate)
         , to_char(sysdate, 'dd')  , extract(day from sysdate)
    from dual;
    --   22/07/04	2022	2022	07	7	04	4
    
    
    
    
    
    
    
    ------- >> 4. 변환 함수 << -------
    
    -- 4.1  to_char(날짜, '형태') ==> 날짜를 '형태' 모양으로 문자형태로 변환시켜주는 것이다.
    --      to_char(숫자, '형태') ==> 숫자를 '형태' 모양으로 문자형태로 변환시켜주는 것이다.
    
    
    --- 날짜를 문자형태로 변환하기 ---
     select to_char(sysdate, 'yyyy')  AS 년도
          , to_char(sysdate, 'mm')    AS 월
          , to_char(sysdate, 'dd')    AS 일
          , to_char(sysdate, 'hh24')  AS "24시간"
          , to_char(sysdate, 'am hh') AS "12시간"
          , to_char(sysdate, 'pm hh') AS "12시간"
          , to_char(sysdate, 'mi')    AS 분
          , to_char(sysdate, 'ss')    AS 초
          , to_char(sysdate, 'q')     AS 분기       -- 1월~3월 => 1,   4월~6월 => 2,   7월~9월 => 3,    10월~12월 => 4 
          , to_char(sysdate, 'day')   AS 요일명     -- 월요일(Windows) , Monday(Linux) 
          , to_char(sysdate, 'dy')    AS 줄인요일명  -- 월(Windows) , Mon(Linux)
     from dual;
     
     
     select to_char(sysdate, 'd')  -- 1(일요일) 2(월요일) 3(화요일) 4(수요일) 5(목요일) 6(금요일) 7(토요일)
     from dual;
     
     
     select case to_char(sysdate, 'd')
            when '1' then '일'
            when '2' then '월'
            when '3' then '화'
            when '4' then '수'
            when '5' then '목'
            when '6' then '금'
            when '7' then '토'
            end AS 오늘의요일명1
            
         , decode(to_char(sysdate, 'd'), '1', '일'
                                       , '2', '월'
                                       , '3', '화'
                                       , '4', '수'
                                       , '5', '목'
                                       , '6', '금'
                                       , '7', '토')  
           AS 오늘의요일명2
     from dual;
     
     
     select to_char(sysdate, 'ddd')
         -- sysdate(지금은 2022년 7월 4일) 의 년도 1월 1일 부터 sysdate(지금은 2022년 7월 4일) 까지 며칠째 인지를 알려주는 것이다.
     from dual;
     
     
     select to_char(sysdate, 'sssss')
         -- sysdate 의 0시 0분 0초 부터 sysdate(현재가 2022년 7월 4일 오전 10시 33분 20초 이라면)
         -- 0시 0분 0초 부터 오전 10시 33분 20초 까지 흘러간 초를 말한다.
     from dual;
     
     
     
     -- 숫자를 문자형태로 변환하기 --
     select 1234567890
          , to_char(1234567890, '9,999,999,999')
          , to_char(1234567890, '$9,999,999,999')
          , to_char(1234567890, 'L9,999,999,999')  -- L 은 그 나라의 화폐기호 이다.
     from dual;
     -- 1234567890	 1,234,567,890	 $1,234,567,890	        ￦1,234,567,890
     
     
     select 100
          , to_char(100, '999.0')
          , to_char(100, '999.00')
          , 96.7
          , to_char(96.7, '999.0')
          , to_char(96.7, '999.00')
     from dual;
     
     
     
     -- 4.2  to_date(문자, '형태') ==> 문자를 '형태' 모양으로 날짜형태로 변환시켜주는 것이다.
     
     select '2022-07-04' + 1
     from dual;
     -- ORA-01722: 수치가 부적합합니다
     
     
     select to_date('2022-07-04', 'yyyy-mm-dd') + 1
          , to_date('2022/07/04', 'yyyy/mm/dd') + 1
          , to_date('20220704', 'yyyymmdd') + 1
     from dual;
     --  22/07/05	22/07/05	22/07/05
     
     
     select to_date('2020-02-29', 'yyyy-mm-dd') + 1
     from dual;
     -- 20/03/01
     
     select to_date('2022-02-29', 'yyyy-mm-dd') + 1
         -- '2022-02-29' 은 달력에 없는 날짜 이므로 오류임!! 
     from dual;
     -- ORA-01839: 지정된 월에 대한 날짜가 부적합합니다
     
     
     
     -- 4.3  to_number(문자) ==> 숫자모양을 가지는 문자를 숫자형태로 변환시켜주는 것이다.
     select '12345', to_number('12345')
     from dual;
          
     select to_number('50')+10
          , '50'+10  -- 자동형변환이 되어짐.
     from dual;
     
     select to_number('똘똘이')
     from dual;
     -- ORA-01722: 수치가 부적합합니다
     
     
     
     
     
     
     
    ------- >> 5. 기타 함수 << -------
    
    -- 5.1  case when then else end  !! 필수암기 !!
    -- 5.2  decode                   !! 필수암기 !!
    select case 5-2
           when 4 then '5-2=4 입니다.'
           when 1 then '5-2=1 입니다.'
           when 3 then '5-2=3 입니다.'
           else '나는 수학을 몰라요ㅜㅜ'
           end AS 결과1
       ,  
           decode(5-2, 4, '5-2=4 입니다.'
                     , 1, '5-2=1 입니다.'
                     , 3, '5-2=3 입니다.'
                        , '나는 수학을 몰라요ㅜㅜ') AS 결과2
    from dual;
    
    select case 
           when 4 > 5 then '4는 5보다 큽니다.'
           when 5 > 7 then '5는 7보다 큽니다.'
           when 3 > 2 then '3은 2보다 큽니다.'
           else '나는 수학을 몰라요ㅜㅜ'
           end AS 결과 
    from dual;
     
     
    -- 5.3  greatest , least 
    select greatest(10, 90, 100, 80)  -- 나열되어진것들 중에 가장 큰값을 알려주는 것
         , least(10, 90, 100, 80)  -- 나열되어진것들 중에 가장 작은값을 알려주는 것
    from dual;
    -- 100	10
    
    
    select greatest('김유신','허준','고수','엄정화')  -- 나열되어진것들 중에 가장 큰값을 알려주는 것
         , least('김유신','허준','고수','엄정화')  -- 나열되어진것들 중에 가장 작은값을 알려주는 것
    from dual;
    --    허준	고수
    
    
    
    -- 5.4  rank ==> 등수(석차)구하기 ,  dense_rank ==> 서열구하기
    select employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , nvl(salary + (salary * commission_pct), salary) AS 월급
         , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수
         , dense_rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급서열
    from employees;
    
    
    select employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , to_char( nvl(salary + (salary * commission_pct), salary), '999,999' ) AS 월급
         , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급등수
         , dense_rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 월급서열
    from employees;
    
    
    select department_id AS 부서번호 
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , to_char( nvl(salary + (salary * commission_pct), salary), '999,999' ) AS 월급
         , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 전체월급등수
         , rank() over(partition by department_id 
                       order by nvl(salary + (salary * commission_pct), salary) desc) AS 부서내월급등수 
    from employees
    order by 부서번호 asc;
    
    
    
    select department_id AS 부서번호 
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , to_char( nvl(salary + (salary * commission_pct), salary), '999,999' ) AS 월급
         , dense_rank() over(order by nvl(salary + (salary * commission_pct), salary) desc) AS 전체월급서열
         , dense_rank() over(partition by department_id 
                             order by nvl(salary + (salary * commission_pct), salary) desc) AS 부서내월급서열 
    from employees
    order by 부서번호 asc;
    
    
    
    -- 5.5  lag , lead 함수 ==> 게시판에서 특정글을 조회할때 많이 사용합니다. !!!!! -- 
    
    drop table tbl_board purge;
    -- Table TBL_BOARD이(가) 생성되었습니다.
    
    create table tbl_board
    (boardno      number                -- 글번호
    ,subject      varchar2(4000)        -- 글제목   varchar2 의 최대크기는 4000 이다. 4000 보다 크면 오류!!
 -- ,content      Nvarchar2(2000)       -- 글내용  Nvarchar2 의 최대크기는 2000 이다. 2000 보다 크면 오류!!
    ,content      clob                  -- 글내용  clob 는 글자를 4GB 까지 저장가능하다.
    ,userid       varchar2(40)          -- 글쓴이의 ID
    ,registerday  date default sysdate  -- 작성일자  default sysdate 은 데이터 입력시 registerday 컬럼의 값을 생략하면 기본적으로 sysdate 가 입력된다는 말이다. 
    ,readcount    number(10)            -- 조회수 
    );
    -- Table TBL_BOARD이(가) 생성되었습니다.
    
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(1, '안녕하세요', '글쓰기 연습입니다', 'leess',  sysdate, 0);  
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board
    values(2, '반갑습니다', '모두 취업대박 나십시오', 'eomjh',  sysdate, 0);  
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(subject, boardno, content, userid, registerday, readcount)
    values('건강하세요', 3, '로또 1등을 기원합니다', 'youks',  sysdate, 0); 
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(boardno, subject, content, userid, registerday, readcount)
    values(4, '기쁘고 감사함이 넘치는 좋은 하루되세요', '늘 행복하세요', 'leess',  default, 0);
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_board(boardno, subject, content, userid, readcount)
    values(5, '오늘도 좋은 하루되세요', '늘 감사합니다', 'hongkd', 0);
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    select *
    from tbl_board;
    
    
    select boardno, subject, content 
    from tbl_board;
    
    /*
      ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
        이전글번호      이전글제목                           글번호    글제목                                글내용                 다음글번호    다음글제목
      ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
         NULL          NULL                                 5	   오늘도 좋은 하루되세요	                늘 감사합니다              4        기쁘고 감사함이 넘치는 좋은 하루되세요 
         5	           오늘도 좋은 하루되세요                  4	   기쁘고 감사함이 넘치는 좋은 하루되세요	    늘 행복하세요              3        건강하세요
         4	           기쁘고 감사함이 넘치는 좋은 하루되세요    3	   건강하세요	                            로또 1등을 기원합니다       2        반갑습니다
         3	           건강하세요                            2	   반갑습니다	                            모두 취업대박 나십시오      1        안녕하세요
         2	           반갑습니다                            1	   안녕하세요	                            글쓰기 연습입니다          NULL      NULL 
      ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
                    1 2 3 4 5 6 7 8 9 10 다음
         이전(최근)  11 12 13 14 15 16 17 18 19 20 다음(과거)
    */
    
    select  lag(boardno, 1) over(order by boardno desc) 이전글번호
          -- boardno(글번호)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다. 
          
          , lag(subject, 1) over(order by boardno desc) 이전글제목
          -- boardno(글번호)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다. 
          
          , boardno AS 글번호
          , subject AS 글제목
          , content AS 글내용
          
          , lead(boardno, 1) over(order by boardno desc) 다음글번호
          -- boardno(글번호)의 내림차순으로 정렬했을때 아래쪽으로 1칸 내려간 행에서 boardno 컬럼의 값을 가져온다. 
          
          , lead(subject, 1) over(order by boardno desc) 다음글제목
          -- boardno(글번호)의 내림차순으로 정렬했을때 아래쪽으로 1칸 내려간 행에서 subject 컬럼의 값을 가져온다. 
    from tbl_board;
    
    
    select  lag(boardno) over(order by boardno desc) 이전글번호
          -- 숫자가 없으면 1 이 생략된 것이다.
          -- boardno(글번호)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 boardno 컬럼의 값을 가져온다. 
          
          , lag(subject) over(order by boardno desc) 이전글제목
          -- 숫자가 없으면 1 이 생략된 것이다.
          -- boardno(글번호)의 내림차순으로 정렬했을때 위쪽으로 1칸 올라간 행에서 subject 컬럼의 값을 가져온다. 
          
          , boardno AS 글번호
          , subject AS 글제목
          , content AS 글내용
          
          , lead(boardno) over(order by boardno desc) 다음글번호
          -- 숫자가 없으면 1 이 생략된 것이다.
          -- boardno(글번호)의 내림차순으로 정렬했을때 아래쪽으로 1칸 내려간 행에서 boardno 컬럼의 값을 가져온다. 
          
          , lead(subject) over(order by boardno desc) 다음글제목
          -- 숫자가 없으면 1 이 생략된 것이다.
          -- boardno(글번호)의 내림차순으로 정렬했을때 아래쪽으로 1칸 내려간 행에서 subject 컬럼의 값을 가져온다. 
    from tbl_board;
    
    
    -- [퀴즈] tbl_board 테이블의 subject 컬럼의 값이 길이가 16 보다 크면 
    --       subject 컬럼의 값 중 16글자만 보여주고 뒤에 ... 을 붙여서 나타내세요.
    
    select boardno AS 글번호
     --    , subject 
     --    , length(subject)
         , case 
           when length(subject) > 16 then substr(subject, 1, 16) || '...'
           else subject
           end AS 글제목 
    from tbl_board;
    
  /*
    -------------------------------------
     글번호    글제목
    ------------------------------------- 
      1	      안녕하세요
      2	      반갑습니다
      3	      건강하세요
      4	      기쁘고 감사함이 넘치는 좋은 ...
      5	      오늘도 좋은 하루되세요
  */
  
  
create table tbl_members
(userid    varchar2(20)
,passwd    varchar2(20)
,name      varchar2(20)
,addr      varchar2(100)
);

insert into tbl_members(userid, passwd, name, addr)
values('kimys','abcd','김유신','서울');

insert into tbl_members(userid, passwd, name, addr)
values('young2','abcd','이영이','서울');

insert into tbl_members(userid, passwd, name, addr)
values('leesa','abcd','이에리사','인천');

insert into tbl_members(userid, passwd, name, addr)
values('park','abcd','박이남','서울');

insert into tbl_members(userid, passwd, name, addr)
values('leebon','abcd','이본','인천');

commit;  

select *
from tbl_members;

select count(*)   -- select 되어져 나온 결과물의 행의 개수.
from tbl_members;
-- 5


select count(*)   -- select 되어져 나온 결과물의 행의 개수.
from tbl_members
where addr = '서울';
-- 3


select count(*)   -- select 되어져 나온 결과물의 행의 개수.
from tbl_members
where addr = '수원';
-- 0 


select * 
from tbl_members
where userid = 'kimys' and passwd = 'abcd';


select count(*)  -- select 되어져 나온 결과물의 행의 개수.
from tbl_members
where userid = 'kimys' and passwd = 'abcd';
--  1 

select count(*)  -- select 되어져 나온 결과물의 행의 개수.
from tbl_members
where userid = 'kimys' and passwd = 'sdfdsfdsf';
--  0

select count(*)  -- select 되어져 나온 결과물의 행의 개수.
from tbl_members
where userid = 'gefssdf' and passwd = 'abcd';
--  0


/*
   -- [퀴즈] --
   tbl_members 테이블에서
   userid 및 passwd 가 모두 올바르면 '로그인성공' 을 보여주고,
   userid 는 올바르지만 passwd 가 틀리면 '암호가 틀립니다' 을 보여주고,
   userid 가 존재하지 않으면 '아이디가 존재하지 않습니다' 을 보여주려고 한다.
*/

select case ( select count(*)  
              from tbl_members
              where userid = 'kimys' and passwd = 'abcd' ) 
       when 1 then '로그인성공'
       else ( case ( select count(*)  
                     from tbl_members
                     where userid = 'kimys' ) 
              when 1 then '암호가 틀립니다'
              else '아이디가 존재하지 않습니다'
              end 
            )
       end AS 로그인결과 
from dual;
-- 로그인성공


select case ( select count(*)  
              from tbl_members
              where userid = 'kimys' and passwd = 'dfsdfsfsfsws' ) 
       when 1 then '로그인성공'
       else ( case ( select count(*)  
                     from tbl_members
                     where userid = 'kimys' ) 
              when 1 then '암호가 틀립니다'
              else '아이디가 존재하지 않습니다'
              end 
            )
       end AS 로그인결과 
from dual;
-- 암호가 틀립니다


select case ( select count(*)  
              from tbl_members
              where userid = 'fgwefsdfsd' and passwd = 'abcd' ) 
       when 1 then '로그인성공'
       else ( case ( select count(*)  
                     from tbl_members
                     where userid = 'fgwefsdfsd' ) 
              when 1 then '암호가 틀립니다'
              else '아이디가 존재하지 않습니다'
              end 
            )
       end AS 로그인결과 
from dual;
-- 아이디가 존재하지 않습니다




-------------------------------------------------------------------------------------
---- **** !!!! 아주 중요중요중요중요중요중요중요 아주 !!!! **** ----
-- VIEW(뷰)란? 테이블은 아니지만 select 되어진 결과물을 마치 테이블 처럼 보는것(간주하는 것)이다.

-- VIEW(뷰) 는 2가지 종류가 있다.
-- 첫번째로 inline view 가 있고, 두번째로 stored view 가 있다. 
-- inline view 는 바로 위의 예제에 보이는 V 인 것이다. 즉, select 구문을 괄호( )를 쳐서 별칭(예 : V)을 부여한 것을 말한다.
-- stored view 는 복잡한 SQL(Structured Query Language == 정형화된 질의어)을 저장하여 select 문을 간단하게 사용하고자 할 때 쓰인다.
-- 그래서 inline view 는 1회성이고, stored view는 언제든지 불러내서 재사용이 가능하다.


--- *** Stored View (저장된 뷰) 생성하기 *** --
/*
    create or replace view 뷰명   --> 뷰명 으로 되어진 view 가 없으면 create(생성) 하고, 만약에 뷰명 으로 되어진 view 가 이미 존재한다라면 이전에 정의해둔 view를 없애버리고 select 문장 으로 replace(수정)해라는 말이다.  
    as
    select 문장;
*/


--- [퀴즈] employees 테이블에서 월급등수가 1등 부터 10등까지 사원들만 
---       사원번호 , 사원명 , 월급 , 월급등수 을 나타내세요.

select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , nvl(salary + (salary * commission_pct), salary) AS 월급
     , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc ) AS 월급등수
from employees
where rank() over(order by nvl(salary + (salary * commission_pct), salary) desc ) <= 10; 
-- !!! 오류 !!!
-- rank() 함수는 where 절에 바로 쓸수가 없다.!!!!

select V.*
from 
(
 select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , nvl(salary + (salary * commission_pct), salary) AS 월급
     , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc ) AS 월급등수
 from employees
) V  -- V 는 괄호()속의 select 되어져 나온 결과물을 V 라는 이름을 가지는 테이블로 간주해 버린다.
where V.월급등수 <= 10;



create or replace view view_employeerank
as
select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , nvl(salary + (salary * commission_pct), salary) AS 월급
     , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc ) AS 월급등수
from employees;
-- View VIEW_EMPLOYEERANK이(가) 생성되었습니다.


select *
from view_employeerank;

select * from tab;

desc VIEW_EMPLOYEERANK;

select *
from view_employeerank
where 월급등수 <= 10;


create or replace view view_employeerank
as
select department_id
     , employee_id
     , first_name || ' ' || last_name AS ENAME 
     , nvl(salary + (salary * commission_pct), salary) AS MONTH_SAL
     , rank() over(order by nvl(salary + (salary * commission_pct), salary) desc ) AS MONTH_SAL_RANKING
from employees;
-- View VIEW_EMPLOYEERANK이(가) 생성되었습니다.
         
select *
from view_employeerank;

select * from tab;

desc VIEW_EMPLOYEERANK;

select *
from view_employeerank
where month_sal_ranking <= 10;   


/*
   --- [퀴즈] ---
   employees 테이블에서 모든 사원들에 대해
   사원번호, 사원명, 주민번호, 성별, 현재나이, 월급, 입사일자, 정년퇴직일, 정년까지근무할개월수, 퇴직금 을 나타내세요.

   여기서 정년퇴직일이라 함은 
   해당 사원의 생월이 3월에서 8월에 태어난 사람은 
   해당사원의 나이(한국나이)가 63세가 되는 년도의 8월말일(8월 31일)로 하고,
   해당사원의 생월이 9월에서 2월에 태어난 사람은 
   해당사원의 나이(한국나이)가 63세가 되는 년도의 2월말일(2월 28일 또는 2월 29일)로 한다.

*/
select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , jubun AS 주민번호
     
     , case 
       when substr(jubun, 7, 1) in('1','3') then '남'
       else '여'
       end AS 성별1
     
     , case substr(jubun, 7, 1)
       when '1' then '남'
       when '3' then '남'
       else '여'
       end AS 성별2  
       
  -- , 현재년도 - 태어난년도 + 1  AS 현재나이
    
  -- , to_number( to_char(sysdate,'yyyy') )
     , extract(year from sysdate) - ( to_number( substr(jubun, 1, 2) ) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1 AS 현재나이
    
     , nvl(salary + (salary * commission_pct), salary) AS 월급
     , hire_date AS 입사일자
     
  /*
     현재나이     정년퇴직년도
     ------      ----------
       60        현재로 부터 3년뒤  2025년    add_months(sysdate, 3*12)  2025-07-05 09:10:30
       55        현재로 부터 8년뒤  2030년    add_months(sysdate, 8*12)  2030-07-05 09:10:30
       
                                           add_months(sysdate, (63-현재나이)*12)
                                           
                                           to_char(날짜, 'yyyy')
                                           
                                           to_char(add_months(sysdate, (63-60)*12), 'yyyy') ==> '2025'
                                           to_char(add_months(sysdate, (63-55)*12), 'yyyy') ==> '2030'
                                           
                                           '2025' || '-08-31'
                                           '2025' || '-02-28'  '2025' || '-02-29'
                                           
                                          last_day( to_date('2025' || '-08-01', 'yyyy-mm-dd') )
                                          last_day( to_date('2025' || '-02-01', 'yyyy-mm-dd') )
                                          
                                          case 3월에서 8월에 태어난 사람은 => '-08-01'
                                          else => '-02-01'
  */
  -- , AS 정년퇴직일 
     
from employees;


-- select V.AGE, 63 - V.AGE
select employee_id, ename, jubun, gender, age, month_sal, hire_date,    -- V는 생략가능하다.
       last_day(
                 to_date( to_char( add_months(sysdate, (63-age)*12), 'yyyy') || 
                          case when substr(jubun, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end 
                         ,'yyyy-mm-dd')
               )
       AS RETIREMENT_DAY
from 
(
    select employee_id
         , first_name || ' ' || last_name AS ENAME
         , jubun 
         , case 
           when substr(jubun, 7, 1) in('1','3') then '남'
           else '여'
           end AS GENDER
         , extract(year from sysdate) - ( to_number( substr(jubun, 1, 2) ) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1 AS AGE
         , nvl(salary + (salary * commission_pct), salary) AS MONTH_SAL
         , hire_date 
    from employees
) V;


-- 정년까지근무할개월수 ==> months_between(정년퇴직일, 입사일자)
-- 퇴직금 ==> 26개월 근무 ==> 2년 2개월 ==> 2년*월급
--           정년까지근무할개월수/12 의 몫 ==>  trunc(정년까지근무할개월수/12)
--       ==> trunc(정년까지근무할개월수/12)*월급
select T.*,
    -- months_between(T.retirement_day, T.hire_date) AS 정년까지근무할개월수,
    -- trunc(months_between(T.retirement_day, T.hire_date)/12) AS 정년까지근무할년수
       to_char( trunc(months_between(T.retirement_day, T.hire_date)/12) * T.month_sal, '9,999,999') AS 퇴직금
from 
(
    select employee_id, ename, jubun, gender, age, month_sal, hire_date,   
           last_day(
                     to_date( to_char( add_months(sysdate, (63-age)*12), 'yyyy') || 
                              case when substr(jubun, 3, 2) between '03' and '08' then '-08-01' else '-02-01' end 
                             ,'yyyy-mm-dd')
                   )
           AS RETIREMENT_DAY
    from 
    (
        select employee_id
             , first_name || ' ' || last_name AS ENAME
             , jubun 
             , case 
               when substr(jubun, 7, 1) in('1','3') then '남'
               else '여'
               end AS GENDER
             , extract(year from sysdate) - ( to_number( substr(jubun, 1, 2) ) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end ) + 1 AS AGE
             , nvl(salary + (salary * commission_pct), salary) AS MONTH_SAL
             , hire_date 
        from employees
    ) V
) T; 



--------- [퀴즈] ---------
create table tbl_loan
(gejanum        varchar2(10)    -- 통장번호
,loanmoney      number          -- 대출금
,interestrate   number(2,2)     -- 이자율    number(2,2) ==>  -0.99 ~ 0.99 
,paymentdate    varchar2(2)     -- 이자를 내는 날짜   '01' , '10' , '20', '25', 매월말일은 '00' 
);

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-01', 5000, 0.03, '01');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-02', 5000, 0.03, '10');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-03', 5000, 0.03, '20');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-04', 5000, 0.03, '25');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-05', 5000, 0.03, '00');

commit;

select * 
from tbl_loan;

/*
   이자납부일이 만약에 '토요일' 이라면 2일후 '월요일'에 납부하도록 한다.
   이자납부일이 만약에 '일요일' 이라면 1일후 '월요일'에 납부하도록 한다.
*/

select gejanum AS 통장번호
     , loanmoney AS 대출금
     , interestrate AS 이자율
     , to_char(sysdate, 'yyyy-mm-') || 
       decode(paymentdate, '00', to_char( last_day(sysdate), 'dd'), paymentdate ) AS 이번달이자납부일
from tbl_loan;


select case to_char(sysdate, 'd')
            when '1' then '일'
            when '2' then '월'
            when '3' then '화'
            when '4' then '수'
            when '5' then '목'
            when '6' then '금'
            when '7' then '토'
            end AS 오늘의요일명1
            
         , decode(to_char(sysdate, 'd'), '1', '일'
                                       , '2', '월'
                                       , '3', '화'
                                       , '4', '수'
                                       , '5', '목'
                                       , '6', '금'
                                       , '7', '토')  
           AS 오늘의요일명2
from dual;


-- !!! [참고] !!!
-- 별칭(alias)을 줄 때 ORACLE 버전이 11g 이라면 최대글자가 30글자이다. 
-- 우리는 18C 이므로 글자수에 제한이 없다.

select V.*, 
       
       to_char(V.prev_month_interestrate_payment_date, 'd') AS 저번달요일명에대한숫자,
       
       decode(to_char(V.prev_month_interestrate_payment_date, 'd') , '1', V.prev_month_interestrate_payment_date + 1
                                                                   , '7', V.prev_month_interestrate_payment_date + 2
                                                                        , V.prev_month_interestrate_payment_date) AS 실제저번달이자납부일,
                                                                        
       to_char(V.this_month_interestrate_payment_date, 'd') AS 이번달요일명에대한숫자,
       
       decode(to_char(V.this_month_interestrate_payment_date, 'd') , '1', V.this_month_interestrate_payment_date + 1
                                                                   , '7', V.this_month_interestrate_payment_date + 2
                                                                        , V.this_month_interestrate_payment_date) AS 실제이번달이자납부일                                                                        
from 
(
    select gejanum
         , loanmoney
         , interestrate
         
         , to_date( to_char( add_months(sysdate, -1) , 'yyyy-mm-') || 
                    decode(paymentdate, '00', to_char( last_day( add_months(sysdate, -1) ), 'dd'), paymentdate )
                   ,'yyyy-mm-dd')
           AS prev_month_interestrate_payment_date
         
         , to_date( to_char( sysdate , 'yyyy-mm-') || 
                    decode(paymentdate, '00', to_char( last_day( sysdate ), 'dd'), paymentdate )
                   ,'yyyy-mm-dd')
           AS this_month_interestrate_payment_date
           
    from tbl_loan
) V;

/*
    -------------------------------------------------------------------------------------
     통장번호   대출금    이자율   저번달이자지급일자    이번이자지급일자    대출일수   이자금액
    -------------------------------------------------------------------------------------- 

*/

select T.gejanum, T.loanmoney, T.interestrate, 
       T.real_prev_payment_date, T.real_this_payment_date,
      (T.real_this_payment_date - T.real_prev_payment_date) * ( T.loanmoney * T.interestrate ) AS INTEREST_FEE
from 
(
    select gejanum, loanmoney, interestrate, 
           decode( to_char( prev_payment_date, 'd'), '1', prev_payment_date+1
                                                   , '7', prev_payment_date+2
                                                        , prev_payment_date ) 
           AS REAL_PREV_PAYMENT_DATE                                             
           , 
           decode( to_char( this_payment_date, 'd'), '1', this_payment_date+1
                                                   , '7', this_payment_date+2
                                                        , this_payment_date ) 
           AS REAL_THIS_PAYMENT_DATE
    from 
    (
        select gejanum
             , loanmoney
             , interestrate
             
             , to_date( to_char( add_months(sysdate, -1) , 'yyyy-mm-') || 
                        decode(paymentdate, '00', to_char( last_day(add_months(sysdate, -1)), 'dd'), paymentdate)   
                      , 'yyyy-mm-dd') AS PREV_PAYMENT_DATE
                      
             , to_date( to_char( sysdate , 'yyyy-mm-') || 
                        decode(paymentdate, '00', to_char( last_day(sysdate), 'dd'), paymentdate)   
                      , 'yyyy-mm-dd') AS THIS_PAYMENT_DATE        
             
        from tbl_loan
    ) V
) T;


--- *** 복잡한 SQL문을  Stored View (저장된 뷰) 로 만들기 *** --
create or replace view view_loan   
as
select T.gejanum, T.loanmoney, T.interestrate, T.paymentdate,
       T.real_prev_payment_date, T.real_this_payment_date,
      (T.real_this_payment_date - T.real_prev_payment_date) * ( T.loanmoney * T.interestrate ) AS INTEREST_FEE
from 
(
    select gejanum, loanmoney, interestrate, paymentdate,
           decode( to_char( prev_payment_date, 'd'), '1', prev_payment_date+1
                                                   , '7', prev_payment_date+2
                                                        , prev_payment_date ) 
           AS REAL_PREV_PAYMENT_DATE                                             
           , 
           decode( to_char( this_payment_date, 'd'), '1', this_payment_date+1
                                                   , '7', this_payment_date+2
                                                        , this_payment_date ) 
           AS REAL_THIS_PAYMENT_DATE
    from 
    (
        select gejanum
             , loanmoney
             , interestrate
             
             , paymentdate
             
             , to_date( to_char( add_months(sysdate, -1) , 'yyyy-mm-') || 
                        decode(paymentdate, '00', to_char( last_day(add_months(sysdate, -1)), 'dd'), paymentdate)   
                      , 'yyyy-mm-dd') AS PREV_PAYMENT_DATE
                      
             , to_date( to_char( sysdate , 'yyyy-mm-') || 
                        decode(paymentdate, '00', to_char( last_day(sysdate), 'dd'), paymentdate)   
                      , 'yyyy-mm-dd') AS THIS_PAYMENT_DATE        
             
        from tbl_loan
    ) V
) T;
-- View VIEW_LOAN이(가) 생성되었습니다.

select *
from tbl_loan;

select *
from view_loan;

select * 
from view_loan
where gejanum = '10-1234-04';

select interest_fee 
from view_loan
where gejanum = '10-1234-04';

select * from tab;


--- *** 생성된 Stored View(저장된 뷰) 조회하기 *** ---
select *
from user_views;


--- *** 생성된 Stored View(저장된 뷰) 중 뷰이름이 VIEW_LOAN 인 뷰소스 보기 *** ---
select text 
from user_views
where view_name = 'VIEW_LOAN';
/*
"select T.gejanum, T.loanmoney, T.interestrate, T.paymentdate,
       T.real_prev_payment_date, T.real_this_payment_date,
      (T.real_this_payment_date - T.real_prev_payment_date) * ( T.loanmoney * T.interestrate ) AS INTEREST_FEE
from 
(
    select gejanum, loanmoney, interestrate, paymentdate,
           decode( to_char( prev_payment_date, 'd'), '1', prev_payment_date+1
                                                   , '7', prev_payment_date+2
                                                        , prev_payment_date ) 
           AS REAL_PREV_PAYMENT_DATE                                             
           , 
           decode( to_char( this_payment_date, 'd'), '1', this_payment_date+1
                                                   , '7', this_payment_date+2
                                                        , this_payment_date ) 
           AS REAL_THIS_PAYMENT_DATE
    from 
    (
        select gejanum
             , loanmoney
             , interestrate
             
             , paymentdate
             
             , to_date( to_char( add_months(sysdate, -1) , 'yyyy-mm-') || 
                        decode(paymentdate, '00', to_char( last_day(add_months(sysdate, -1)), 'dd'), paymentdate)   
                      , 'yyyy-mm-dd') AS PREV_PAYMENT_DATE
                      
             , to_date( to_char( sysdate , 'yyyy-mm-') || 
                        decode(paymentdate, '00', to_char( last_day(sysdate), 'dd'), paymentdate)   
                      , 'yyyy-mm-dd') AS THIS_PAYMENT_DATE        
             
        from tbl_loan
    ) V
) T"
*/

--- *** 생성된 Stored View(저장된 뷰) 삭제하기 *** ---
drop view view_loan;
-- View VIEW_LOAN이(가) 삭제되었습니다.


--- *** 생성된 Stored View(저장된 뷰) 조회하기 *** ---
select *
from user_views;

select * from view_loan;
-- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다



----- !!! [퀴즈] tbl_board 테이블에서 글번호 3번을 조회했을때 아래처럼 나오도록 하세요 !!! -----
select boardno, subject, content 
from tbl_board;
    
/*
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    이전글번호      이전글제목                           글번호    글제목                                글내용                 다음글번호    다음글제목
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
     4	           기쁘고 감사함이 넘치는 좋은 하루되세요    3	   건강하세요	                            로또 1등을 기원합니다       2        반갑습니다
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

-- [틀린 풀이] --
select  lag(boardno, 1) over(order by boardno desc) 이전글번호
      , lag(subject, 1) over(order by boardno desc) 이전글제목
      , boardno AS 글번호
      , subject AS 글제목
      , content AS 글내용
      , lead(boardno, 1) over(order by boardno desc) 다음글번호
      , lead(subject, 1) over(order by boardno desc) 다음글제목
from tbl_board
where boardno = 3;


-- [올바른 풀이] --
select V.*
from 
(
    select  lag(boardno, 1) over(order by boardno desc) 이전글번호
          , lag(subject, 1) over(order by boardno desc) 이전글제목
          , boardno AS 글번호
          , subject AS 글제목
          , content AS 글내용
          , lead(boardno, 1) over(order by boardno desc) 다음글번호
          , lead(subject, 1) over(order by boardno desc) 다음글제목
    from tbl_board
) V
where V.글번호 = 3;



-- === 마스킹 처리하기 === --
select employee_id AS 사원번호, 
       first_name || ' ' || last_name AS 사원명,
       rpad( substr(jubun, 1, 7), length(jubun), '*') AS 주민번호
from employees;





-- ================================================================================ --
                         
                  ------ >> 그룹 함수(집계 함수) << ------ 
/*
    1. sum       -- 합계
    2. avg       -- 평균
    3. max       -- 최대값
    4. min       -- 최소값
    5. count     -- select 되어서 나오는 결과물의 행의 개수
    6. variance  -- 분산
    7. stddve    -- 표준편차
    
    분산     : 분산의 제곱근이 표준편차  (평균에서 떨어진 정도)
    표준편차 :  표준편차의 제곱승이 분산  (평균과의 차액)
    
    >> 주식투자 <<
    50  60  40  50  55  45  52  48   평균 50    편차가 적음   -- 안정투자
    10  90  20  80  30  70  90  10   평균 50    편차가 큼     -- 투기성투자(위험을 안고서 투자함) 
    
    분산과 표준편차는 어떤 의사결정시 도움이 되는 지표이다.
*/
 
   -- !!!! 그룹 함수는 결과값이 오로지 1개행만 나온다. !!!!
   select sum(salary)
   from employees; 
                  
   -- !!!! 단일행 함수는 결과값이 메모리에 로드되어진 행의 개수만큼 동일한 개수로 나온다. !!!!               
   select substr(jubun, 7, 1)
   from employees;
   
   
   ---- !!!! 중요중요중요 !!!! ----
   /*
       그룹함수(집계함수)에서는 null 이 있으면 무조건 null 을 제외시킨 후 연산을 한다.!!!!!!
       그룹함수(집계함수)를 사용하면 1개의 결과값을 가진다.
   */
   select 20 + 57 + 178 + 43 + null + 109
   from dual;
   
   select 20 + 57 + 178 + 43 + 109
   from dual;
   
   select sum(salary * commission_pct)
   from employees;
   -- 73690
   
   select sum(salary), avg(salary), 
          max(salary), min(salary), count(salary), 
          variance(salary), stddev(salary)
   from employees;
   --     691416	6461.831775700934579439252336448598130841	
   --     24000	 2100   107
   --     15284813.66954681713983424440134015164874   3909.579730552481921059198878167256201202
   
   
   select sum(salary * commission_pct), avg(salary * commission_pct), 
          max(salary * commission_pct), min(salary * commission_pct), count(salary * commission_pct), 
          variance(salary * commission_pct), stddev(salary * commission_pct)
   from employees;
   --     73690	    2105.428571428571428571428571428571428571	
   --     5600	 610	35	
   --     1354447.60504201680672268907563025210085     1163.807374543578326917875190458887616995
                         
   select count(*) AS 모든인원수
        , count(department_id) AS "부서번호가NULL이아닌개수"
        , count(commission_pct) AS "커미션이NULL이아닌개수"
        , count(salary) AS "기본급여가NULL이아닌개수"
   from employees;
   -- 107	106	  35	107 
   
   
   
   ---- **** avg(평균)을 구하실때는 많은 주의를 요합니다. **** ----
   
   -- employees 테이블에서 기본급여(salary)의 평균치를 구하세요.
   select avg(salary), sum(salary)/count(salary), sum(salary), count(salary)
   from employees;
   -- 6461.831775700934579439252336448598130841	6461.831775700934579439252336448598130841	691416	107
   
   
   -- employees 테이블에서 수당(salary * commission_pct)의 평균치를 구하세요.
   select avg(salary * commission_pct),  sum(salary * commission_pct)/count(salary * commission_pct),
          sum(salary * commission_pct),  count(salary * commission_pct)
   from employees;
   -- 2105.428571428571428571428571428571428571	   2105.428571428571428571428571428571428571
   -- 73690	   35
   --   avg(salary * commission_pct) 은 salary * commission_pct 값이 NULL 이 아닌 사원들만의 수당 평균치를 말한다.
   
   select avg( NVL(salary * commission_pct, 0) )
       ,  sum( NVL(salary * commission_pct, 0) )/count( NVL(salary * commission_pct, 0) )
       ,  sum( NVL(salary * commission_pct, 0) )
       ,  sum( salary * commission_pct )
       ,  count(NVL(salary * commission_pct, 0))
   from employees;
   -- 688.691588785046728971962616822429906542	
   -- 688.691588785046728971962616822429906542	
   -- 73690	 
   -- 73690	
   -- 107
   --   avg( NVL(salary * commission_pct, 0) ) 은  salary * commission_pct 값이 NULL 이라면 0 으로 처리하기 때문에
   --   employees 테이블에 있는 모든 직원들에 대한 커미션(수당)의 평균치를 구해주는 것이다.
   
  
  
  
  
  -- **** ==== 그룹함수와 함께 사용되어지는 group by 절에 대해서 알아봅니다. ==== **** --
  
  -- employees 테이블에서 부서번호별로 인원수를 나타내세요. --
  select department_id AS 부서번호
       , count(*) AS 인원수
  from employees
  group by department_id     -- department_id 컬럼의 값이 같은것 끼리 그룹을 짓는다.
  order by 1;
  /*
     ----------------
      부서번호   인원수
     -----------------
        10	     1
        20	     2
        30       6
        40	     1
        50	    45
        60    	 5
        70	     1
        80	    34
        90	     3
        100	     6
        110	     2
        null     1
  */   
  
  
  -- employees 테이블에서 성별로 인원수를 나타내세요. --
  select gender AS 성별
       , count(*) AS 인원수 
  from
  (
    select case when substr(jubun, 7, 1) in ('1','3') then '남' else '여' end AS GENDER
    from employees
  ) V
  group by gender;
  /*
     --------------
      성별   인원수
     --------------
       남     56
       여     51
  */
  
  
  ---- [퀴즈] employees 테이블에서 연령대별로 인원수를 나타내세요. ----
   
  select V.age_line AS 연령대
       , count(*) AS 인원수 
  from   
  (
      select trunc( extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end) + 1 , -1) 
             AS AGE_LINE
      from employees
  ) V
  group by V.age_line
  order by 1;
  /*
      ----------------
       연령대   인원수
      ----------------
        10	    16
        20	    18
        30	    21
        40	    20
        50	    16
        60	    16
  */
  
  
  ------ ***** 1차 그룹, 2차 그룹 짓기  ***** ------
  
  --- employees 테이블에서 부서번호별, 성별 인원수를 나타내세요. ---
  select department_id AS 부서번호
       , gender AS 성별
       , count(*) AS 인원수
  from 
  (
      select department_id
           , case when substr(jubun, 7, 1) in ('1','3') then '남' else '여' end AS GENDER
      from employees
  ) V
  group by department_id, gender
  order by 1, 2;
  /*
      ---------------------------
       부서번호    성별    인원수
      ----------------------------
        ...       ...     ....
        50        남       24
        50        여       13
        60        남        5
        60        여       17
        ...       ...     ....
  */
  
  
  --- [퀴즈] employees 테이블에서 연령대별, 성별 인원수를 나타내세요. ---
      select V.AGE_LINE AS 연령대
           , V.GENDER AS 성별
           , count(*) AS 인원수
      from 
      (
          select trunc( extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun, 7, 1) in('1','2') then 1900 else 2000 end) + 1 , -1) 
                 AS AGE_LINE
              ,  case when substr(jubun, 7, 1) in ('1','3') then '남' else '여' end AS GENDER 
          from employees
      ) V 
      group by V.AGE_LINE, V.GENDER
      order by 1, 2;
  /*
      ----------------------
       연령대   성별   인원수
      ----------------------
        10	    남	    10
        10  	여	    6
        20	    남	    8
        20  	여	    10
        30	    남	    10
        30  	여	    11
        40	    남	    9
        40  	여	    11
        50	    남	    10
        50	    여	    6
        60	    남	    9
        60	    여	    7
  */


     -----------------------------------------------------------------------------------

  --- **** 요약값을 보여주는 rollup, cube, grouping sets, grouping 에 대해서 알아봅니다. **** --- 
  
  --- employees 테이블에서 부서번호별로 인원수를 나타내면서 동시에 전체 인원수도 나타내세요. ---
  select department_id AS 부서번호
       , count(*) AS 인원수
       , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
  from employees
  group by rollup(department_id);
      
  
  select department_id AS 부서번호
       , grouping(department_id)   -- grouping(department_id) 은 결과값이 오로지 2개만 나온다. 0 또는 1 이 나오는데, 0 이라함은 department_id 컬럼의 값으로 그룹을 지었다는 말이고, 1 이라함은 그룹을 안지었다는 말이다.  
       , count(*) AS 인원수
  from employees
  group by rollup(department_id);


  select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체') AS 부서번호 
       , count(*) AS 인원수
       , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
  from employees
  group by rollup(department_id);
  
  
  select decode(grouping(V.GENDER), 0, V.GENDER, '전체') AS 성별
       , count(*) AS 인원수
       , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
  from   
  (  select case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
     from employees
  ) V
  group by rollup(V.GENDER);
  /*
     -------------------------
      성별   인원수    퍼센티지
     -------------------------
       남     56       52.3
       여     51       47.7
       전체  107       100.0
  */

   select department_id, grouping(department_id)
        , gender, grouping(gender)
        , count(*)
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by ROLLUP(department_id, gender);
    
   
   select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체' ) AS 부서번호
        , decode( grouping(gender), 0, gender, '전체') AS 성별
        , count(*) AS 인원수
        , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by ROLLUP(department_id, gender);
 /*
      ------------------------------------
       부서번호    성별    인원수    퍼센티지
      ------------------------------------
        ...       ...     ....      ....
        50        남       23       21.5
        50        여       22       20.6
        50       전체      45       42.1
        60        남        4        3.7
        60        여        1        0.9
        60       전체       5        4.7
        ...       ...     ....      ....
        전체	     전체	  107	    100.0
  */
  
  
  ----- >>>>> 요약값(rollup, cube, grouping sets) <<<<< ------
  /*
      1. rollup(a,b,c) 은 grouping sets( (a,b,c),(a,b),(a),() ) 와 같다.
    
         group by rollup(department_id, gender) 은
         group by grouping sets( (department_id, gender), (department_id), () ) 와 같다.
  
      2. cube(a,b,c) 은 grouping sets( (a,b,c),(a,b),(b,c),(a,c),(a),(b),(c),() ) 와 같다.
 
         group by cube(department_id, gender) 은
         group by grouping sets( (department_id, gender), (department_id), (gender), () ) 와 같다.
  */
    
   select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체' ) AS 부서번호
        , decode( grouping(gender), 0, gender, '전체') AS 성별
        , count(*) AS 인원수
        , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by CUBE(department_id, gender);
    
   -- 또는
   select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체' ) AS 부서번호
        , decode( grouping(gender), 0, gender, '전체') AS 성별
        , count(*) AS 인원수
        , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by GROUPING SETS( (department_id, gender), (department_id), (gender), () )
    order by 1;
    
    
   select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체' ) AS 부서번호
        , decode( grouping(gender), 0, gender, '전체') AS 성별
        , count(*) AS 인원수
        , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by GROUPING SETS( (department_id, gender), (department_id), (gender), () )
    order by department_id;

   ------------------------------------------------------------------------------------------------    
    
   select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체' ) AS 부서번호
        , decode( grouping(gender), 0, gender, '전체') AS 성별
        , count(*) AS 인원수
        , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by ROLLUP(department_id, gender);
    
   -- 또는
   select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체' ) AS 부서번호
        , decode( grouping(gender), 0, gender, '전체') AS 성별
        , count(*) AS 인원수
        , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by GROUPING SETS( (department_id, gender), (department_id), () );
    
 -----------------------------------------------------------------------------------------------
 
   select decode( grouping(department_id), 0, NVL( to_char(department_id), '인턴') , '전체' ) AS 부서번호
        , decode( grouping(gender), 0, gender, '전체') AS 성별
        , count(*) AS 인원수
        , TO_CHAR( round( count(*)/(select count(*) from employees) * 100 , 1), '990.0') AS 퍼센티지
   from
   (select department_id
         , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
    from employees) V
    group by GROUPING SETS( (department_id), (gender), () )
    order by department_id;
    
 ------------------------------------------------------------------------------------------------------   
 

 
 
         ----- ===== ***     having 그룹함수조건절   *** ====== ------
   /*
       group by 절을 사용하여 그룹함수의 값을 나타내었을때
       그룹함수의 값이 특정 조건에 해당하는 것만 추출하고자 할 때는 where 절을 사용하는 것이 아니라
       having 그룹함수조건절 을 사용해야 한다.
   */ 
   
   --- employees 테이블에서 사원이 10명 이상 근무하는 부서번호와 그 인원수를 나타내세요.
   select department_id AS 부서번호
        , count(*) AS 인원수 
   from employees
   group by department_id
   having count(*) >= 10
   order by 2 asc;
   
   
   --- employees 테이블에서 부서번호별로 벌어들이는 salary 의 합계가 50000 이상인 부서에 대해서만
   --- 부서번호, 기본급여의합계 를 나타내세요.
   select department_id AS 부서번호
        , sum(salary) AS 기본급여의합계
   from employees
   group by department_id
   having sum(salary) >= 50000
   order by 2 desc;
   
   --- [퀴즈] employees 테이블에서 부서번호별로 벌어들이는 월급 합계가 40000 이상인 부서에 대해서만
   --- 부서번호, 월급의합계 를 나타내세요.
   select department_id AS 부서번호
        , sum( NVL(salary + salary*commission_pct, salary) ) AS 월급의합계
   from employees
   group by department_id
   having sum( NVL(salary + salary*commission_pct, salary) ) >= 40000
   order by 2 desc;
   
   
   --- [퀴즈] employees 테이블에서 부서번호별 월급의 합계와 함께 등수(석차)도 나타내세요. ---
   select department_id AS 부서번호
        , sum( NVL(salary + salary*commission_pct, salary) ) AS 월급의합계
        , ROUND( sum( NVL(salary + salary*commission_pct, salary) ) / ( select SUM( NVL(salary + salary*commission_pct, salary) ) from employees ) * 100 , 1 )  AS 퍼센티지 
        , rank() over(order by sum( NVL(salary + salary*commission_pct, salary) ) desc) 월급합계등수
   from employees
   group by department_id;
   
   
   --- [퀴즈] employees 테이블에서 부서번호별 월급의 합계에 대한 퍼센티지가 5% 이상인 부서만 
   ---       부서번호, 월급의합계, 퍼센티지를 나타내세요.
 /*  
   select 부서번호, 월급의합계, 퍼센티지
   from employees
   group by department_id 
   having sum(월급)/(모든사원들의월급합계)*100 >= 5
 */
   select department_id AS 부서번호
        , sum( NVL(salary + salary*commission_pct, salary) ) AS 월급의합계
        , ROUND( sum( NVL(salary + salary*commission_pct, salary) )/( select SUM(NVL(salary + salary*commission_pct, salary)) from employees )*100 , 1 ) AS 퍼센티지
   from employees
   group by department_id
   having sum( NVL(salary + salary*commission_pct, salary) )/( select SUM(NVL(salary + salary*commission_pct, salary)) from employees )*100 >= 5
   order by 2 desc;
   
   
   select department_id AS 부서번호
        , sum_month_sal AS 월급의합계
        , sum_month_sal_pct AS 퍼센티지
   from 
   (
       select department_id
            , SUM( NVL(salary + salary*commission_pct, salary) ) AS SUM_MONTH_SAL
            , ROUND( SUM( NVL(salary + salary*commission_pct, salary) ) / ( select SUM( NVL(salary + salary*commission_pct, salary) ) from employees ) * 100 , 1 ) AS SUM_MONTH_SAL_PCT 
       from employees
       group by department_id
   ) V
   where SUM_MONTH_SAL_PCT >= 5
   order by 2 desc;
   
   
   
         ----- **** !!! 누적(누계)에 대해서 알아봅니다. !!! **** -----
   /*
        sum(누적되어야할 컬럼명) over(order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
        
        sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
                                   order by 누적되어질 기준이 되는 컬럼명 asc[desc] )
   */
   
 create table tbl_panmae
 (panmaedate  date
 ,jepumname   varchar2(20)
 ,panmaesu    number
 );

 -- delete from tbl_panmae;

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2), '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+1, '새우깡', 15); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+2, '감자깡', 20);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+3, '새우깡', 10);
 
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+3, '새우깡', 3);
 
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1), '고구마깡', 7);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+1, '새우깡', 8); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+2, '감자깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+3, '감자깡', 5);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 4, '허니버터칩', 30);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 3, '고구마깡', 15);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 2, '고구마깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 1, '허니버터칩', 20);


 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '감자깡', 5);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '허니버터칩', 15);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '고구마깡', 20);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '감자깡', 10); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 commit;
   
 select *
 from tbl_panmae;
   
   
 --- ***  tbl_panmae 테이블에서 '새우깡' 에 대한 일별판매량과 일별누적판매량을 나타내세요. *** ---
 
 select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss') AS panmaedate
      , panmaesu
 from tbl_panmae  
 where jepumname = '새우깡';  
 
 /*
    ---------------------------------------
      판매일자      일별판매량   일별누적판매량
    ---------------------------------------  
      2022-05-06      10          10
      2022-05-07      15          25
      2022-05-09      13          38
      2022-06-07       8          46
      2022-07-06      30          76
    ----------------------------------------  
 */  
 
 select to_char(panmaedate, 'yyyy-mm-dd') AS 판매일자
      , sum(panmaesu) AS 일별판매량
 from tbl_panmae 
 where jepumname = '새우깡'
 group by to_char(panmaedate, 'yyyy-mm-dd')
 order by 1;
 
 
 select to_char(panmaedate, 'yyyy-mm-dd') AS 판매일자
      , sum(panmaesu) AS 일별판매량
      , sum( sum(panmaesu) ) over(order by to_char(panmaedate, 'yyyy-mm-dd') asc) AS 일별누적판매량 
 from tbl_panmae 
 where jepumname = '새우깡'
 group by to_char(panmaedate, 'yyyy-mm-dd');
 
 
 --- ***  tbl_panmae 테이블에서 모든제품에 대한 일별판매량과 일별누적판매량을 나타내세요. *** ---
 
 /*
 
    ----------------------------------------------
      제품명  판매일자      일별판매량   일별누적판매량
    ----------------------------------------------  
      .....   ..........      ..          ..
      감자깡   2022-05-08	  20	      20
      감자깡   2022-06-08	  10	      30
      감자깡   2022-06-09	   5	      35
      감자깡   2022-07-06	  15	      50
      .....   ..........      ..          ..
      새우깡   2022-05-06      10          10
      새우깡   2022-05-07      15          25
      새우깡   2022-05-09      13          38
      새우깡   2022-06-07       8          46
      새우깡   2022-07-06      30          76
      .....   ..........      ..          ..
    -----------------------------------------------  
 */
  select jepumname AS 제품명
       , to_char(panmaedate, 'yyyy-mm-dd') AS 판매일자
       , sum(panmaesu) AS 일별판매량
  from tbl_panmae
  group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
  order by 1, 2;
  
  
  select jepumname AS 제품명
       , to_char(panmaedate, 'yyyy-mm-dd') AS 판매일자
       , sum(panmaesu) AS 일별판매량
       , sum( sum(panmaesu) ) over(partition by jepumname 
                                   order by to_char(panmaedate, 'yyyy-mm-dd') asc ) AS 일별누적판매량
  from tbl_panmae
  group by jepumname, to_char(panmaedate, 'yyyy-mm-dd');

  
  create or replace view view_panmae
  as 
  select jepumname AS 제품명
       , to_char(panmaedate, 'yyyy-mm-dd') AS 판매일자
       , sum(panmaesu) AS 일별판매량
       , sum( sum(panmaesu) ) over(partition by jepumname 
                                   order by to_char(panmaedate, 'yyyy-mm-dd') asc ) AS 일별누적판매량
  from tbl_panmae
  group by jepumname, to_char(panmaedate, 'yyyy-mm-dd');
  -- View VIEW_PANMAE이(가) 생성되었습니다.
  
  select *
  from view_panmae;
  
  select * 
  from view_panmae
  where 제품명 in('감자깡','새우깡');
  
  
  
  --- *** [퀴즈] tbl_panmae 테이블에서 판매일자가 1개월전 '01'일(즉, 현재가 2022년 7월 6일 이므로 2022년 6월 1일) 부터 현재까지 판매된
  --            모든 제품에 대해 일별판매량과 일별누적판매량을 나타내세요. *** ---
  
  /*
    -----------------------------------------------
      제품명  판매일자      일별판매량   일별누적판매량
    -----------------------------------------------  
  */
  
  -- 1개월전 '01'일
  select last_day(add_months(sysdate, -2)) + 1
       , to_char( last_day(add_months(sysdate, -2)) + 1, 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  -- 1개월전 '01'일
  select to_date( to_char(add_months(sysdate, -1), 'yyyy-mm-') || '01', 'yyyy-mm-dd')
      ,  to_char( to_date( to_char(add_months(sysdate, -1), 'yyyy-mm-') || '01', 'yyyy-mm-dd'), 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  /*
  select jepumname, panmaedate
       , to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss')
       , to_char(to_date( to_char(panmaedate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), 'yyyy-mm-dd hh24:mi:ss')
  from tbl_panmae;
 
 
  select *
  from tbl_panmae
  where to_char(panmaedate, 'yyyy-mm-dd') = '2022-05-09';
  */
  
  select jepumname AS 제품명
       , to_char(panmaedate, 'yyyy-mm-dd') AS 판매일자
       , sum(panmaesu) AS 일별판매량
       , sum( sum(panmaesu) ) over(partition by jepumname 
                                   order by to_char(panmaedate, 'yyyy-mm-dd') asc ) AS 일별누적판매량
  from tbl_panmae
  where panmaedate >= to_date( to_char(add_months(sysdate, -1), 'yyyy-mm-') || '01', 'yyyy-mm-dd')  
        -- 이전달 '01'일 부터 현재까지 판매된 행만 메모리에 로드시킨다.
  group by jepumname, to_char(panmaedate, 'yyyy-mm-dd');
  
  
  
  --------  ====  [퀴즈] *** 아래처럼 나오도록 하세요 *** ==== --------
  
 /* 
    ---------------------------------------------------------
      전체사원수    10대    20대    30대   40대   50대   60대
    ---------------------------------------------------------  
         107       16	   18	   21	   20	16	   16
    ---------------------------------------------------------     
 */ 
 
 select TRUNC( extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 , -1 )
     ,  decode( 연령대, 10, 1 ) AS "10대"
     ,  decode( 연령대, 20, 1 ) AS "20대"
 
 
 select age_line
      , decode( age_line, 10, 1 ) AS "10대"
      , decode( age_line, 20, 1 ) AS "20대"
      , decode( age_line, 30, 1 ) AS "30대"
      , decode( age_line, 40, 1 ) AS "40대"
      , decode( age_line, 50, 1 ) AS "50대"
      , decode( age_line, 60, 1 ) AS "60대"
 from 
 (
   select TRUNC( extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 , -1 ) AS AGE_LINE 
   from employees
 ) V;
 
  
 select count(age_line) AS 전체사원수 
      , sum( decode( age_line, 10, 1 ) ) AS "10대"
      , sum( decode( age_line, 20, 1 ) ) AS "20대"
      , sum( decode( age_line, 30, 1 ) ) AS "30대"
      , sum( decode( age_line, 40, 1 ) ) AS "40대"
      , sum( decode( age_line, 50, 1 ) ) AS "50대"
      , sum( decode( age_line, 60, 1 ) ) AS "60대"
 from 
 (
   select TRUNC( extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 , -1 ) AS AGE_LINE 
   from employees
 ) V;
 
  
  
  ------ ==== [퀴즈] 아래처럼 나오도록 하세요 ==== ------
  
  select employee_id, first_name, job_id
  from employees;
  
  ---------------------------------------------------------------------------------------------------------
     직종ID         남자기본급여평균     여자기본급여평균     기본급여평균    평균과남자평균차액    평균과여자평균차액
  ---------------------------------------------------------------------------------------------------------
     .....            ....                ....             .....              ...                ...
     FI_ACCOUNT       7900                7950             7920               -20	              30
     IT_PROG          5700                6000             5760               -60	             240
     .....            ....                ....             .....              ...                ...
   ---------------------------------------------------------------------------------------------------------  
   
  select job_id AS 직종ID
       , TRUNC( avg( decode(GENDER, '남', salary) ) ) AS 남자기본급여평균
       , TRUNC( avg( decode(GENDER, '여', salary) ) ) AS 여자기본급여평균
       , TRUNC( avg(salary) ) AS 기본급여평균
       , TRUNC( avg( decode(GENDER, '남', salary) ) ) - TRUNC( avg(salary) ) AS 평균과남자평균차액
       , TRUNC( avg( decode(GENDER, '여', salary) ) ) - TRUNC( avg(salary) ) AS 평균과여자평균차액
  from 
  (
      select job_id
           , case when substr(jubun, 7, 1) in('2','4') then '여' else '남' end AS GENDER
           , salary
      from employees
  ) V
  group by job_id 
  order by 1;
  
  
  
  
  
  -------------------------------------------------------------------------------------------
  
              ------ ===== **** Sub Query (서브쿼리) *** ===== ------
  /*
      -- Sub Query (서브쿼리)란? --
      select 문 속에 또 다른 select 문이 포함되어져 있을 때 포함되어진 select 문을 Sub Query (서브쿼리)라고 부른다.
      
      select ....
      from ....   ==> Main Query(메인쿼리 == 외부쿼리)
      where ... in(select ...
                   from ....) ==> Sub Query (서브쿼리 == 내부쿼리)
  */
  
  /*
      employees 테이블에서
      기본급여가 제일 많은 사원과 기본급여가 제일 적은 사원의 정보를
      사원번호, 사원명, 기본급여로 나타내세요.
  */
  
  from employees
  where salary = (employees 테이블에서 salary 의 최대값) OR 
        salary = (employees 테이블에서 salary 의 최소값);
        
  employees 테이블에서 salary 의 최대값 ==> select max(salary) from employees  ==> 24000    
  employees 테이블에서 salary 의 최소값 ==> select min(salary) from employees  ==>  2100
  
  
  select employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary AS 기본급여
  from employees
  where salary = (select max(salary) from employees) OR 
        salary = (select min(salary) from employees);
  /*
     -------------------------------
      사원번호   사원명        기본급여
     ------------------------------- 
        100	    Steven King	  24000
        132	    TJ Olson	   2100
  */
  
  
  /*
     [퀴즈]
     employees 테이블에서 부서번호가 60, 80번 부서에 근무하는 사원들중에
     월급이 50번 부서 직원들의 '평균월급' 보다 많은 사원들만
     부서번호, 사원번호, 사원명, 월급을 나타내세요..
  */
  
  from employees
  where department_id in(60,80) AND
        월급 > (50번 부서 직원들의 '평균월급');
        
        
  select department_id AS 부서번호
       , employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , NVL(salary + (salary*commission_pct), salary) AS 월급    
  from employees
  where department_id in(60,80) AND
        NVL(salary + (salary*commission_pct), salary) > ( select AVG( NVL(salary + (salary*commission_pct), salary) ) 
                                                          from employees 
                                                          where department_id = 50 )
  order by 1, 4 desc;
  
  
  ------------------------------------------------------------------------------------
  
  ---- [Sub Query 퀴즈] ----
  create table tbl_authorbook
   (bookname       varchar2(100)
   ,authorname     varchar2(20)
   ,loyalty        number(5)
   );
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('자바프로그래밍','이순신',1000);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','한석규',800);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','이순신',500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('조선왕조실록','엄정화',2500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','유관순',1200);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','이혜리',1300);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','서강준',1700);

   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('어린왕자','김유신',1800);
   
   commit;
   
   
   select * 
   from tbl_authorbook;
   
   --- 아래와 같이 tbl_authorbook 테이블에서 공저(도서명은 동일하지만 작가명이 다른 도서)로 지어진 도서정보를 나타내세요... ---
   /*
       ---------------------------------
         도서명         작가명    로얄티
       ---------------------------------  
         로빈슨크루소    한석규	 800
         로빈슨크루소    이순신	 500
         그리스로마신화  유관순	1200
         그리스로마신화  이혜리	1300
         그리스로마신화  서강준	1700
       ---------------------------------  
   */
   
   from tbl_authorbook
   where bookname in( 공저로 지어진 도서명 ); 
   
   공저로 지어진 도서명 ==> 도서명은 동일하지만 작가명이 다른 도서명
   
   select bookname, count(*)
   from tbl_authorbook
   group by bookname
   having count(*) > 1;
   /*
      로빈슨크루소	2
      그리스로마신화	3
   */
   
   select bookname
   from tbl_authorbook
   group by bookname
   having count(*) > 1;
   /*
      로빈슨크루소
      그리스로마신화
   */
   
   select * 
   from tbl_authorbook
   where bookname in( select bookname
                      from tbl_authorbook
                      group by bookname
                      having count(*) > 1 );
                      
  
  
  
  ------ **** Sub Query(서브쿼리)에서 사용되어지는 ANY, ALL 에 대해서 알아봅니다. **** ------
  /*
      Sub Query(서브쿼리)에서 사용되어지는 ANY 는 OR 와 흡사하고,
      Sub Query(서브쿼리)에서 사용되어지는 ALL 은 AND 와 흡사하다.
  */
  
  -- employees 테이블에서 salary 가 30번 부서에 근무하는 사원들의 salary 와 동일한 사원들만 추출하세요..
  -- 단, 출력시 30번 부서에 근무하는 사원은 제외합니다.
  select salary
  from employees
  where department_id = 30;
  /*
       11000
        3100
        2900
        2800
        2600
        2500
  */
  
  desc employees;
  
  select department_id AS 부서번호
       , employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary AS 기본급여
  from employees
  where NVL(department_id, -9999) != 30 AND
        salary in(11000, 3100, 2900, 2800, 2600, 2500)
  order by 1, 4;        
  
  
  select department_id AS 부서번호
       , employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary AS 기본급여
  from employees
  where NVL(department_id, -9999) != 30 AND
        salary in(select distinct salary
                  from employees
                  where department_id = 60)
  order by 1, 4;
  -- select 되어져 나온 결과물에서 중복된 행값이 있으면 중복을 피하고 1번만 나타내고자 할때는 
  -- select 바로 다음에 distinct 를 넣어주면 중복된 행값을 피하고 1번만 나온다.
  
  
  select department_id AS 부서번호
       , employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary AS 기본급여
  from employees
  where NVL(department_id, -9999) != 30 AND
        salary =ANY (11000, 3100, 2900, 2800, 2600, 2500)
  order by 1, 4;                                                        
                                                          
  
  select department_id AS 부서번호
       , employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary AS 기본급여
  from employees
  where NVL(department_id, -9999) != 30 AND
        salary =ANY (select distinct salary
                     from employees
                     where department_id = 60)
  order by 1, 4;
  
  
  /*
     기본급여(salary)가 제일 많은 사원만
     사원번호, 사원명, 기본급여(salary)를 나타내세요..
  */
  
  from employees
  where salary = (employees 테이블에서 salary 의 최대값);
  
  
  select employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary AS 기본급여
  from employees
  where salary = (select max(salary) from employees);
  
  desc employees;
  
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary AS 기본급여
   from employees
   where salary >= ALL (select salary 
                        from employees 
                        where salary is not null);
-- where salary >= (24000, 17000, 17000, 9000, 6000, 4800, 4800, 4200 ..... ); 
 /*
         24000 >= 24000   참    AND 
         24000 >= 17000   참    AND
         24000 >= 17000   참    AND
         24000 >=  9000   참    AND
         24000 >=  6000   참    AND
         24000 >=  4800   참    AND
         24000 >=  4200   참    AND
         ..........
 */
  
  
  /*
     수당(salary * commission_pct)이 제일 많은 사원만
     사원번호, 사원명, 기본급여(salary)를 나타내세요..
  */
  from employees
  where salary = (employees 테이블에서 수당(salary * commission_pct) 의 최대값);
  
  
  select employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary * commission_pct AS 수당
  from employees
  where salary * commission_pct = (select max(salary * commission_pct) from employees);
                                 -- 5600
  -- 145	John Russell	5600                                   
  
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary * commission_pct AS 수당
   from employees
   where salary * commission_pct >= ALL (select salary * commission_pct from employees);
   -- 결과물이 아무것도 나오지 않음.
   /*
        salary * commission_pct >= ALL (5600, 4050, 3600, null, ...... )
   
                           5600 >= 5600  참 AND
                           5600 >= 4050  참 AND
                           5600 >= 3600  참 AND
                           5600 >= null  ? 
   */
   
  --- **** Sub Query 절에서 사용하는 ALL 은 사용시 주의를 요한다.!!!!!!!
  --       select 결과물에서 null 은 존재하지 않도록 만들어야 한다.!!!!!! 
  
  -- 아래가 올바른 해결책이다.
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , salary * commission_pct AS 수당
   from employees
   where salary * commission_pct >= ALL (select salary * commission_pct 
                                         from employees
                                         where salary * commission_pct is not null);
 -- 145	John Russell	5600                                         
  
  
 
 /*
     수당(salary * commission_pct)이 NULL 은 아니면서 제일 적은 사원을 제외한 사원들만
     사원번호, 사원명, 기본급여(salary)를 나타내세요..
 */
  select employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary * commission_pct AS 수당
  from employees
  where salary * commission_pct > (select min(salary * commission_pct) from employees)  -- 610 
  order by 3 asc;
  
  
  select employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary * commission_pct AS 수당
  from employees
  where salary * commission_pct > ANY (select salary * commission_pct from employees)   
  order by 3 asc;
  /*
     where salary * commission_pct > ANY (5600, 4050, 3600, 610, null, ......)
     
                              5600 > 5600  거짓  OR 
                              5600 > 4050  참    OR 
                              5600 > 3600  참    OR 
                              5600 >  610  참    OR 
                              5600 > null  ?    OR 
                              ===> 참
                              
                              4050 > 5600  거짓  OR 
                              4050 > 4050  거짓  OR 
                              4050 > 3600  참    OR 
                              4050 >  610  참    OR 
                              4050 > null  ?    OR 
                              ===> 참 
                              
                              3600 > 5600  거짓  OR 
                              3600 > 4050  거짓  OR 
                              3600 > 3600  거짓  OR 
                              3600 >  610  참    OR 
                              3600 > null  ?    OR 
                              ===> 참 
                              
                              610 > 5600  거짓  OR 
                              610 > 4050  거짓  OR 
                              610 > 3600  거짓  OR 
                              610 >  610  거짓  OR 
                              610 > null  ?    OR 
                              ===> 거짓  
                              
                              null > 5600  ?  OR 
                              null > 4050  ?  OR 
                              null > 3600  ?  OR 
                              null >  610  ?  OR 
                              null > null  ?    OR 
                              ===> ?                                 
  */
  
  
  
  
  ------ ==== ****  PairWise(쌍) Sub Query **** ==== ------
  /*
      employees 테이블에서 
      부서번호별로 salary 가 최대인 사원과
      부서번호별로 salary 가 최소인 사원의 정보를
      부서번호, 사원번호, 사원명, 기본급여를 나타내세요..
  */
  
  select department_id, salary
  from employees
  order by 1, 2 desc;
  /*
      ---------------------------
        department_id    salary
      ---------------------------
             10	         4400
      
             20	         13000
             20	          6000
             
             30	         11000
             30	          3100
             30	          2900
             30	          2800
             30	          2600
             30	          2500
             
             ...          .....
             60	          9000
             60	          6000
             60	          4800
             60	          4800
             60	          4200
             
             ...          .....
             
      원하는 결과값
      ---------------------------
        department_id    salary
      ---------------------------     
             10	          4400
             20	         13000
             20	          6000
             30	         11000
             30	          2500
             ..           ....
             60	          9000
             60	          4200
             ..           ....
  */
  select department_id, max(salary)
  from employees
  group by department_id
  order by 1;
  /*
    ---------------------------
     department_id    salary
    --------------------------- 
          10	       4400
          20	      13000
          30	      11000
          ..          .....
          60	       9000
          ..          .....
  */
  
  select department_id, min(salary)
  from employees
  group by department_id
  order by 1;
  /*
    ---------------------------
     department_id    salary
    --------------------------- 
          10	       4400
          20	       6000
          30	       2500
          ..          .....
          60	       4200
          ..          .....
  */
  
  select department_id AS 부서번호
       , employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , salary AS 기본급여
  from employees
  where (NVL(department_id, -9999) , salary) in ( select NVL(department_id, -9999) , max(salary)
                                                  from employees
                                                  group by department_id ) 
      OR
        (NVL(department_id, -9999) , salary) in ( select NVL(department_id, -9999), min(salary)
                                                  from employees
                                                  group by department_id )
  order by 1, 4 desc;  
  
  
  
  
  
  ------------ ==== **** 상관서브쿼리(== 서브상관쿼리) **** ==== ----------------
  /*
     상관서브쿼리(== 서브상관쿼리) 이라함은 Main Query(== 외부쿼리)에서 사용된 테이블(뷰)에 
     존재하는 컬럼이 Sub Query(== 내부쿼리)의 조건절(where 절, having 절)에 사용되어질때를
     상관서브쿼리(== 서브상관쿼리) 라고 부른다.
  */
  
  -- employees 테이블에서 기본급여에 대해 전체등수 및 부서내등수를 구하세요.
  -- 첫번째 방법은 rank() 함수를 사용하여 구해본다.
  select department_id AS 부서번호
       , employee_id AS 사원번호
       , salary AS 기본급여
       , rank() over(order by salary desc) AS 전체등수
       , rank() over(partition by department_id
                     order by salary desc) AS 부서내등수
  from employees
  order by 1, 3 desc;
  
  
  -- employees 테이블에서 기본급여에 대해 전체등수 및 부서내등수를 구하세요.
  -- 두번째 방법은 상관서브쿼리(== 서브상관쿼리)를 사용하여 구해본다.
  select salary
  from employees;
  
  select count(*) + 1 AS 기본급여등수
  from employees
  where salary > 24000;  -- 자신의 기본급여가 24000 이라면 
  
  select count(*) + 1 AS 기본급여등수
  from employees
  where salary > 17000;  -- 자신의 기본급여가 17000 이라면 
  
  
  select E.department_id AS 부서번호
       , E.employee_id AS 사원번호
       , E.salary AS 기본급여
       
       , (select count(*) + 1  
          from employees
          where salary > E.salary ) AS 전체등수
          
       , (select count(*) + 1  
          from employees
          where department_id = E.department_id and
                salary > E.salary ) AS 부서내등수 
  from employees E
  order by 1, 3 desc;
  
  
  
  
  
  ------ ====== **** Sub Query 를 사용하여 테이블을 생성할 수 있습니다. **** ===== -------
  
   create table tbl_employees_3060
   as 
   select department_id
        , employee_id
        , first_name || ' ' || last_name AS ENAME
        , nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
        , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end AS GENDER
        , jubun
   from employees
   where department_id in (30, 60);
   -- Table TBL_EMPLOYEES_3060이(가) 생성되었습니다.
   
   
   select * from tab;
   
   select *
   from TBL_EMPLOYEES_3060;
   
   --- *** employees 테이블을 가지고 데이터 없이 employees 테이블의 구조만 동일한 tbl_employees_sub 이라는 테이블을 생성해봅니다. *** ---
   select *
   from employees
   where 1=1;
   
   select *
   from employees
   where 1=2;
   
   create table tbl_employees_sub
   as
   select *
   from employees
   where 1=2;
   -- Table TBL_EMPLOYEES_SUB이(가) 생성되었습니다.
      
   select * from tab;
   
   desc TBL_EMPLOYEES_SUB;
   
   select * from TBL_EMPLOYEES_SUB;
   
   
   ------ ***** !!!! 필수로 꼭 알아두시길 바랍니다. !!!! ***** ------
   -----   상관서브쿼리(== 서브상관쿼리)를 사용한 UPDATE 처리하기 -----
   /*
       회사에 입사하셔서 delete 또는 update 를 할 때 먼저 반드시 해당 테이블을 백업해두시고 
       그런 다음에 delete 또는 update 하셔야만 안전합니다.
   */
   create table tbl_employees_backup
   as
   select *
   from employees;
   -- Table TBL_EMPLOYEES_BACKUP이(가) 생성되었습니다.
   
   select *
   from tbl_employees_backup;
      
   update employees set first_name = '순신', last_name = '이';
   -- 107개 행 이(가) 업데이트되었습니다.
   
   commit;
   -- 커밋 완료.
   
   select *
   from employees;
   
   rollback;
   
   select *
   from tbl_employees_backup;
   
   update employees E set E.first_name = ( select first_name 
                                           from tbl_employees_backup
                                           where employee_id = E.employee_id )
                        , E.last_name = ( select last_name
                                          from tbl_employees_backup
                                          where employee_id = E.employee_id );
   -- 107개 행 이(가) 업데이트되었습니다.
   
   select *
   from employees;
   
   commit;
   -- 커밋 완료.
   
   
   
   ----- **** Sub Query 절을 사용하여 데이터를 입력(insert)할 수 있습니다. **** -----
   
   select count(*) 
   from TBL_EMPLOYEES_SUB;
   -- 0
   
   insert into TBL_EMPLOYEES_SUB
   select *
   from employees
   where department_id in (50,80) AND
         substr(jubun, 7, 1) in ('2','4');
   -- 37개 행 이(가) 삽입되었습니다.
   
   commit;
   -- 커밋 완료.
   
   select count(*) 
   from TBL_EMPLOYEES_SUB;
   -- 37
   
   select * 
   from TBL_EMPLOYEES_SUB;
   
   
   ----- **** Sub Query 절을 사용하여 데이터를 수정(update)할 수 있습니다. **** -----
   
   --- tbl_employees_sub 테이블에서 부서번호 50번에 해당하는 사원들의 commission_pct 값을 
   --  employees 테이블에서 가장 적게 받는 commission_pct 값으로 수정하세요.
   
   update tbl_employees_sub set commission_pct = (employees 테이블에서 가장 적게 받는 commission_pct 값)
   where department_id = 50;
   
   employees 테이블에서 가장 적게 받는 commission_pct 값
   ==> 
   select min(commission_pct)
   from employees;
   
   update tbl_employees_sub set commission_pct = (select min(commission_pct)
                                                  from employees)
   where department_id = 50;
   -- 22개 행 이(가) 업데이트되었습니다.
   
   commit;
   
   select * 
   from tbl_employees_sub;
   
   
   ----- **** Sub Query 절을 사용하여 데이터를 삭제(delete)할 수 있습니다. **** -----
   
   -- tbl_employees_sub 테이블에서 salary 가 평균 salary 보다 적은 행들만 삭제하세요...
   
   delete from tbl_employees_sub
   where salary < (tbl_employees_sub 테이블에서 평균 salary);
   
   tbl_employees_sub 테이블에서 평균 salary
   ==> 
   select avg(salary)
   from tbl_employees_sub;  -- 5645.945945945945945945945945945945945946
   
   delete from tbl_employees_sub
   where salary < (select avg(salary)
                   from tbl_employees_sub);
   -- 21개 행 이(가) 삭제되었습니다.
   
   commit;
   
   select * 
   from tbl_employees_sub;
   
   
   
   
   
   
   ----------------------------------------------------------------------------------------------
   
   ----------------------------------------------------------------------------------------------
        -- !!!!!!!!! 중요   JOIN 은 면접에 가시면 무조건무조건무조건 물어봅니다.  중요 !!!!!!!!! --
   ----------------------------------------------------------------------------------------------
   /*
       JOIN(조인)은 테이블(뷰)과 테이블(뷰)을 합치는 것을 말하는데 
       행(ROW) 과 행(ROW)을 합치는 것이 아니라, 컬럼(COLUMN) 과 컬럼(COLUMN)을 합치는 것을 말한다.
       위에서 말한 행(ROW) 과 행(ROW)을 합치는 것은 UNION 연산자를 사용하는 것이다.
   
       -- 면접질문 : INNER JOIN(내부조인) 과 OUTER JOIN(외부조인)의 차이점에 대해 말해보세요.
       -- 면접질문 : JOIN 과 UNION 의 차이점에 대해서 말해보세요.
       
       
       A = {1, 2, 3}    원소가 3개
       B = {a, b}       원소가 2개
       
       A ⊙ B = { (1,a), (1,b)
                 ,(2,a), (2,b)
                 ,(3,a), (3,b) }
                 
       데카르트곱(수학)  ==> 원소의 곱 :   3 * 2 = 6개(모든 경우의 수)
       --> 수학에서 말하는 데카르트곱을 데이터베이스에서는 Catersian Product 라고 부른다.
       
       
       JOIN  =>  SQL 1992 CODE 방식  -->  테이블(뷰) 과 테이블(뷰) 사이에 콤마(,)를 찍어주는 것.  
                                         콤마(,)를 찍어주는 것을 제외한 나머지 문법은 데이터베이스 밴더(회사) 제품마다 조금씩 다르다.   
       
       JOIN  =>  SQL 1999 CODE 방식(ANSI) --> 테이블(뷰) 과 테이블(뷰) 사이에 JOIN 이라는 단어를 넣어주는 것.
                                             ANSI(표준화) SQL
   */
   
   select * 
   from employees;
   
   select count(*) 
   from employees;   -- 107개 행
   
   select * 
   from departments;
   
   select count(*) 
   from departments;  -- 27개 행
   
   select *
   from employees , departments;  --> SQL 1992 CODE 방식 , Catersian Product
   
   select count(*)
   from employees , departments;  --> SQL 1992 CODE 방식
                                  --  2889개 행
                                  
   select 107 * 27  -- 2889 
   from dual;
   
   select *
   from employees CROSS JOIN departments;  --> SQL 1999 CODE 방식 , Catersian Product
   
   select count(*)
   from employees CROSS JOIN departments;  --> SQL 1999 CODE 방식
                                           --  2889개 행
                                  
   select 107 * 27  -- 2889 
   from dual;
   
   /*
       1. CROSS JOIN 은 프로야구를 예로 들면 10개 팀이 있는데
          각 1팀당 경기를 몇번해야 하는지 구할때 쓰인다. 1팀당 모든 다른팀과 경기를 펼쳐야 한다.
   
       2. CROSS JOIN 은 그룹함수로 나온 1개의 행을 가지고 어떤 데이터 값을 얻으려고 할때 사용된다.
   */
   
   -- [CROSS JOIN 사용 예]
   /*
       사원번호  사원명  부서번호  기본급여  모든사원들의기본급여평균   기본급여평균과의차액  이 나오도록 하세요..
   */
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , department_id AS 부서번호
        , salary AS 기본급여
        , avg(salary) AS 모든사원들의기본급여평균
   from employees; -- 오류!!!!
   
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , department_id AS 부서번호
        , salary AS 기본급여
   from employees;  -- 107개 행
   
   
   select avg(salary) AS 모든사원들의기본급여평균
   from employees;  -- 1개 행
   
   
   -- 사원번호  사원명  부서번호  기본급여      모든사원들의기본급여평균
      ================================  +   ####################
                    A(107개 행)                       B(1개 행)
                             A CROSS JOIN B ==> 107*1 = 107개 행
   
   select A.employee_id AS 사원번호
        , A.ename AS 사원명
        , A.department_id AS 부서번호
        , A.salary AS 기본급여 
     -- , B.avg_salaray AS 기본급여평균
        , A.salary - B.avg_salaray AS 기본급여평균과의차액
   from 
   (
       select employee_id
            , first_name || ' ' || last_name AS ENAME
            , department_id 
            , salary 
       from employees) A
   CROSS JOIN
   (
       select trunc( avg(salary) ) AS AVG_SALARAY
       from employees
   ) B
   order by 5 asc;
   
   
   
   select employee_id AS 사원번호
        , ename AS 사원명
        , department_id AS 부서번호
        , salary AS 기본급여 
     -- , avg_salaray AS 기본급여평균
        , salary - avg_salary AS 기본급여평균과의차액
   from 
   (
       select employee_id
            , first_name || ' ' || last_name AS ENAME
            , department_id 
            , salary 
       from employees) A
   CROSS JOIN
   (
       select trunc( avg(salary) ) AS AVG_SALARY
       from employees
   ) B
   order by 5 asc;
   
   
   
   ------ **** EQUI JOIN (SQL 1992 CODE 방식) **** ------
   /*
       [EQUI JOIN 예]
       
       부서번호   부서명    사원번호    사원명     기본급여 
       이 나오도록 하세요..
       
       
       부서번호                      부서명                사원번호    사원명     기본급여 
       ---------------------------------------------    ------------------------------
       department_id                department_name               employees 테이블
       departments.department_id    departments 테이블 
       employees.department_id
   */
   
   select * 
   from employees , departments
   where employees.department_id = departments.department_id;
   -- 이때 where 절을 JOIN 조건절 이라고 부른다.
   
   select * 
   from employees E , departments D
   where E.department_id = D.department_id;
   -- 이때 where 절을 JOIN 조건절 이라고 부른다.
   
   
   select  E.department_id AS 부서번호
        ,  D.department_name AS 부서명
        ,  E.employee_id AS 사원번호
        ,  E.first_name || ' ' || E.last_name AS 사원명
        ,  E.salary AS 기본급여 
   from employees E , departments D
   where E.department_id = D.department_id;
   
   
   select  E.department_id AS 부서번호   -- 양쪽 테이블에 모두 존재하는 컬럼명은 반드시 테이블소속을 밝혀야 한다.
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where E.department_id = D.department_id;
   
   
   --- [부서번호가 없는 킴벨리그랜트가 나오도록 하고싶다. 그런데 이것은 틀린풀이 이다.] ---
   select  E.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where NVL(E.department_id, -9999) = NVL(D.department_id, -9999);
   
   desc departments;
   /*
     이름              널?       유형           
    --------------- -------- ------------ 
     DEPARTMENT_ID   NOT NULL NUMBER(4) 
   */
   
   desc employees;
   /*
     이름              널?       유형           
    --------------- -------- ------------ 
     DEPARTMENT_ID           NUMBER(4)
   */
   
   --- [부서번호가 없는 킴벨리그랜트가 나오도록 하고싶다. 올바른풀이] ---
   select  E.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where E.department_id = D.department_id(+);
   /*
        (+) 가 안붙은 테이블인 E(employees) 의 모든 행(107개)을 출력해주고 나서 
        그 다음에 where E.department_id = D.department_id 조건에 만족하는 행들을 보여준다.
   */
   
   select *
   from departments;
   
   select distinct department_id
   from employees
   order by 1;
   
   
   --- [departments 테이블에 있는 모든 부서정보와 함께 그 부서에 근무하는 사원의 정보를 보고 싶다. 올바른풀이] ---
   select  D.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where E.department_id(+) = D.department_id;
   /*
        (+) 가 안붙은 테이블인 D(departments) 의 모든 행(27개)을 출력해주고 나서 
        그 다음에 where E.department_id = D.department_id 조건에 만족하는 행들을 보여준다.
   */
   
   
   
   ------ **** SQL 1992 CODE 방식인 EQUI JOIN 을 SQL 1999 CODE 방식으로 바꾼것은 3가지가 있다. **** ------
   -- 1. Inner JOIN (내부조인) ==> SQL 1992 CODE 방식에서 (+) 가 없는것.
   -- 2. Outer JOIN (외부조인) ==> SQL 1992 CODE 방식에서 (+) 가 있는것.
   --    Left Outer JOIN , Right Outer JOIN , Full Outer JOIN
   
   select  E.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where E.department_id = D.department_id;
   
   -- SQL 1992 CODE 방식인 위의것은 아래처럼 SQL 1999 CODE 방식으로 바꿀수 있다.
   select  E.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
-- from employees E INNER JOIN departments D
   from employees E JOIN departments D  -- INNER 는 생략가능함.
   ON E.department_id = D.department_id;
   -- 여기서 ON E.department_id = D.department_id 을 조인조건절이라고 부른다.
   
   
   select  E.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where E.department_id = D.department_id(+);
   
   -- SQL 1992 CODE 방식인 위의것은 아래처럼 SQL 1999 CODE 방식으로 바꿀수 있다.
   select  E.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
-- from employees E LEFT OUTER JOIN departments D
   from employees E LEFT JOIN departments D   -- OUTER 는 생략가능함.
   ON E.department_id = D.department_id;
   /*
       왼쪽에 있는 employees 테이블의 모든 행(107개 행)들을 출력한 다음에 
       ON E.department_id = D.department_id 조건에 맞는 행을 찾아서 짝을 지어서 보여줘라는 뜻이다.
   */  
   
   
   select  D.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where E.department_id(+) = D.department_id;
   
   -- SQL 1992 CODE 방식인 위의것은 아래처럼 SQL 1999 CODE 방식으로 바꿀수 있다.
   select  D.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
-- from employees E RIGHT OUTER JOIN departments D
   from employees E RIGHT JOIN departments D   -- OUTER 는 생략가능함.
   ON E.department_id = D.department_id;
   /*
       오른쪽에 있는 departments 테이블의 모든 행(27개 행)들을 출력한 다음에 
       ON E.department_id = D.department_id 조건에 맞는 행을 찾아서 짝을 지어서 보여줘라는 뜻이다.
   */  
   
   
   select  D.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
   from employees E , departments D
   where E.department_id(+) = D.department_id(+); -- 오류!!!
   -- ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다
   -- 위와같이 SQL 1992 CODE 방식은 양쪽 테이블에 있는 모든 행들은 출력할 수 없다.
   
   
   -- 그런데 SQL 1999 CODE 방식은 아래와 같이 양쪽 테이블에 있는 모든 행들을 출력할 수 있다.
   select  D.department_id AS 부서번호   
        ,  department_name AS 부서명
        ,  employee_id AS 사원번호
        ,  first_name || ' ' || last_name AS 사원명
        ,  salary AS 기본급여 
-- from employees E FULL OUTER JOIN departments D
   from employees E FULL JOIN departments D   -- OUTER 는 생략가능함.
   ON E.department_id = D.department_id
   order by 1;
   /*
       양쪽에 있는 employees 테이블의 모든 행(107개 행) 과 departments 테이블의 모든 행(27개 행) 들을 출력한 다음에 
       ON E.department_id = D.department_id 조건에 맞는 행을 찾아서 짝을 지어서 보여줘라는 뜻이다.
   */ 
   
  
   --- **** JOIN 을 사용한 응용문제 **** ---
   /*
        아래와 같이 나오도록 하세요.
        
        ----------------------------------------------------------------------------
         부서번호   사원번호   사원명   기본급여   부서평균기본급여    부서평균급여와의차액 
        ----------------------------------------------------------------------------
        
         --------------------------------------
          부서번호   사원번호   사원명   기본급여  ==> employees  107개 행
         --------------------------------------
         
         ---------------------------
          부서번호    부서평균기본급여    ==> select문(뷰) 10번 ~ 110번  11개 행
         ---------------------------
   
         --------------------------------------      ---------------------------
          부서번호   사원번호   사원명   기본급여   +     부서번호    부서평균기본급여 
         --------------------------------------      ---------------------------
                     employees 테이블                     select문(뷰)
   */
   
   select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
   from employees;
      
   select department_id, avg(salary) AS AVG_DEPTID_SALARY
   from employees
   group by department_id;
   
   
   select * 
   FROM 
   (
     select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
   ) A
   JOIN
   (
     select department_id, avg(salary) AS AVG_DEPTID_SALARY
     from employees
     group by department_id
   ) B
   ON A.department_id = B.department_id;
   
   
   select  A.department_id AS 부서번호
         , employee_id AS 사원번호
         , ename AS 사원명
         , salary AS 기본급여
         , TRUNC(avg_deptid_salary) AS 부서평균기본급여
         , salary - TRUNC(avg_deptid_salary) AS 부서평균급여와의차액
   FROM 
   (
     select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
   ) A
   JOIN
   (
     select department_id, avg(salary) AS AVG_DEPTID_SALARY
     from employees
     group by department_id
   ) B
   ON A.department_id = B.department_id
   order by 1; 
   -- 위의 결과물은 부서번호가 NULL 인 킴벨리그랜트는 나오지 않는다.
   
   
   -- 그래서 아래처림 해야만 부서번호가 NULL 인 킴벨리그랜트가 나온다.
   
   -- [틀린풀이]
   select  A.department_id AS 부서번호
         , employee_id AS 사원번호
         , ename AS 사원명
         , salary AS 기본급여
         , TRUNC(avg_deptid_salary) AS 부서평균기본급여
         , salary - TRUNC(avg_deptid_salary) AS 부서평균급여와의차액
   FROM 
   (
     select NVL(department_id, -9999) AS department_id , employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
   ) A
   JOIN
   (
     select NVL(department_id, -9999) AS department_id , avg(salary) AS AVG_DEPTID_SALARY
     from employees
     group by department_id
   ) B
   ON A.department_id = B.department_id
   order by 1;                      
                    
                         
   -- [올바른 풀이] --   
   select  A.department_id AS 부서번호
         , employee_id AS 사원번호
         , ename AS 사원명
         , salary AS 기본급여
         , TRUNC(avg_deptid_salary) AS 부서평균기본급여
         , salary - TRUNC(avg_deptid_salary) AS 부서평균급여와의차액
   FROM 
   (
     select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
   ) A
   JOIN
   (
     select department_id, avg(salary) AS AVG_DEPTID_SALARY
     from employees
     group by department_id
   ) B
   ON NVL(A.department_id, -9999) = NVL(B.department_id, -9999)
   order by 1;
   
   
   
   /*
       [퀴즈] 부서번호가 10, 30, 50 번 부서에 근무하는 사원들만 아래와 같이 나오도록 하세요.
        
        ---------------------------------------------------------------------------------------------------------------
         부서번호   사원번호   사원명   기본급여   부서평균기본급여    부서평균급여와의차액   부서내기본급여등수    전체기본급여등수
        ---------------------------------------------------------------------------------------------------------------
   */ 
   select  A.department_id AS 부서번호
         , employee_id AS 사원번호
         , ename AS 사원명
         , salary AS 기본급여
         , TRUNC(avg_deptid_salary) AS 부서평균기본급여
         , salary - TRUNC(avg_deptid_salary) AS 부서평균급여와의차액
         , rank() over(partition by A.department_id
                       order by salary desc) AS 부서내기본급여등수
         , rank() over(order by salary desc) AS 전체기본급여등수              
   FROM 
   (
     select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
   ) A
   JOIN
   (
     select department_id, avg(salary) AS AVG_DEPTID_SALARY
     from employees
     group by department_id
   ) B
   ON NVL(A.department_id, -9999) = NVL(B.department_id, -9999);
   
   
   
   select  A.department_id AS 부서번호
         , employee_id AS 사원번호
         , ename AS 사원명
         , salary AS 기본급여
         , TRUNC(avg_deptid_salary) AS 부서평균기본급여
         , salary - TRUNC(avg_deptid_salary) AS 부서평균급여와의차액
         , rank() over(partition by A.department_id
                       order by salary desc) AS 부서내기본급여등수
         , rank() over(order by salary desc) AS 전체기본급여등수              
   FROM 
   (
     select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
   ) A
   JOIN
   (
     select department_id, avg(salary) AS AVG_DEPTID_SALARY
     from employees
     group by department_id
   ) B
   ON NVL(A.department_id, -9999) = NVL(B.department_id, -9999)
   WHERE A.department_id IN(10,30,50);
   
   -- 그런데 위의 것도 맞지만 아래처럼 하시길 권장합니다.
   select  A.department_id AS 부서번호
         , employee_id AS 사원번호
         , ename AS 사원명
         , salary AS 기본급여
         , TRUNC(avg_deptid_salary) AS 부서평균기본급여
         , salary - TRUNC(avg_deptid_salary) AS 부서평균급여와의차액
         , rank() over(partition by A.department_id
                       order by salary desc) AS 부서내기본급여등수
         , rank() over(order by salary desc) AS 전체기본급여등수              
   FROM 
   (
     select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
     where department_id in (10,30,50)
   ) A
   JOIN
   (
     select department_id, avg(salary) AS AVG_DEPTID_SALARY
     from employees
     where department_id in (10,30,50)
     group by department_id
   ) B
   ON A.department_id = B.department_id;
   
   
   --- 또는 
   --- ===== with 절을 사용한 inline view 를 사용하여 구해보겠습니다. ===== ---
   --  지금까지 사용해왔던 inline view 는 오라클 이나 MS-SQL 에서도 사용가능 한 것이다.
   --  그런데 지금 사용할 with 절은 오라클에서만 사용가능한 것입니다.
      
   WITH 
   A as (
     select department_id, employee_id, first_name || ' ' || last_name AS ENAME, salary 
     from employees
     where department_id in (10,30,50)
   ),
   B as (
     select department_id, avg(salary) AS AVG_DEPTID_SALARY
     from employees
     where department_id in (10,30,50)
     group by department_id
   )
   select A.department_id AS 부서번호
         , employee_id AS 사원번호
         , ename AS 사원명
         , salary AS 기본급여
         , TRUNC(avg_deptid_salary) AS 부서평균기본급여
         , salary - TRUNC(avg_deptid_salary) AS 부서평균급여와의차액
         , rank() over(partition by A.department_id
                       order by salary desc) AS 부서내기본급여등수
         , rank() over(order by salary desc) AS 전체기본급여등수
   FROM A JOIN B
   ON A.department_id = B.department_id;
   
   
   
   ------- ===== *** NON-EQUI JOIN *** ==== -------
   /*
      조인조건절에 사용되는 컬럼의 값이 특정한 범위에 속할 때 사용하는 것이 NON-EQUI JOIN 이다.
      NON-EQUI JOIN 에서는 조인조건절에 = 을 사용하는 것이 아니라 between A and B 를 사용한다.
   */
  
  -- 소득세율 지표 관련 테이블을 생성한다. 
  create table tbl_taxindex
  (lowerincome   number       -- 연봉의 최저
  ,highincome    number       -- 연봉의 최대
  ,taxpercent    number(2,2)  -- 세율  -0.99 ~ 0.99 
  );
   
  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(1, 99999, 0.02);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(100000, 149999, 0.05);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(150000, 199999, 0.08);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(200000, 10000000000000000, 0.1);

  commit;
  
  select * 
  from tbl_taxindex;
  
  ------------------------------------------------------
   사원번호     사원명     연봉     세율      소득세액
  ------------------------------------------------------
    1001       홍길동    50000    0.02      50000 *  0.02
    1002       엄정화   170000    0.08     170000 *  0.08
    ....       ......  ......    .....     .............
    
  
  --- SQL 1992 CODE ---
  /*
     ----------------------------      -----
      사원번호     사원명     연봉        세율
     ----------------------------      -----
           employees 테이블             tbl_taxindex 테이블
  */
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 AS 연봉
        , T.taxpercent AS 세율
        , nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 * T.taxpercent AS 소득세액
   from employees E , tbl_taxindex T  -- SQL 1992 CODE
   where nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 between T.lowerincome and T.highincome;  -- JOIN 조건절
   
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 AS 연봉
        , T.taxpercent AS 세율
        , nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 * T.taxpercent AS 소득세액
   from employees E JOIN tbl_taxindex T  -- SQL 1999 CODE
   ON nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 between T.lowerincome and T.highincome;  -- JOIN 조건절
   
   
   
   ------------------ ===== **** SELF JOIN(자기조인) **** ===== ------------------ 
   /*
       자기자신의 테이블(뷰)을 자기자신의 테이블(뷰)과 JOIN 시키는 것을 말한다.
       이때 반드시 테이블(뷰)에 대한 alias(별칭)를 다르게 주어서 실행해야 한다.
   */
   
   --- 아래처럼 나오도록 하세요... ---
   -------------------------------------------------------------------------------------------------------
    사원번호              사원명             이메일     급여      직속상관번호             직속상관명
  employee_id   first_name || last_name    email     salary   employee_id      first_name || last_name
  -------------------------------------------------------------------------------------------------------
     100	          Steven King	        SKING     24000     null                 null 
     102	          Lex De Haan	        LDEHAAN   17000     100                  Steven King
     103	          Alexander	Hunold	    AHUNOLD   9000      102                  Lex De Haan
     104	          Bruce Ernst	        BERNST    6000      103                  Alexander Hunold
   
   -----------------------------------------------------       ---------------------------------
   사원번호              사원명             이메일     급여        직속상관번호             직속상관명
   -----------------------------------------------------       ---------------------------------
               사원자신의 정보                                            직속상관의 정보
               employees 테이블                                          employees 테이블
                    E1                                                         E2    
               
   select E1.employee_id AS 사원번호
        , E1.first_name || ' ' || E1.last_name AS 사원명
        , E1.email AS 이메일
        , E1.salary AS 급여
        , E2.employee_id AS 직속상관번호
        , E2.first_name || ' ' || E2.last_name 직속상관명            
   from employees E1, employees E2     --- SQL 1992 CODE
   where E1.manager_id = E2.employee_id(+)
   order by 1;
   
   
   select E1.employee_id AS 사원번호
        , E1.first_name || ' ' || E1.last_name AS 사원명
        , E1.email AS 이메일
        , E1.salary AS 급여
        , E2.employee_id AS 직속상관번호
        , E2.first_name || ' ' || E2.last_name 직속상관명            
   from employees E1 LEFT JOIN employees E2     --- SQL 1999 CODE
   ON E1.manager_id = E2.employee_id
   order by 1;
               
  

   select * 
   from tbl_authorbook;
   
   --- [퀴즈] SELF JOIN 을 사용하여 아래와 같이 공저(도서명은 동일하지만 작가명이 다른 도서)로 지어진 도서정보를 나타내세요... ---
   --                                                      =               !=
   /*
       ---------------------------------
         도서명         작가명    로얄티
       ---------------------------------  
         로빈슨크루소    한석규	 800
         로빈슨크루소    이순신	 500
         그리스로마신화  유관순	1200
         그리스로마신화  이혜리	1300
         그리스로마신화  서강준	1700
       ---------------------------------  
   */               
   
   select distinct A.*
   from tbl_authorbook A , tbl_authorbook B
   where A.bookname = B.bookname and  -- SQL 1992 CODE 
         A.authorname != B.authorname;
        
         
   select distinct A.*
   from tbl_authorbook A JOIN tbl_authorbook B
   ON A.bookname = B.bookname and  -- SQL 1999 CODE 
      A.authorname != B.authorname;  
      
      
      

   ------- ===== ***** Multi Table JOIN (다중 테이블 조인) ***** ====== ------- 
   
   ---> 3개 이상의 테이블(뷰)을 가지고 조인 시켜주는 것이다.
   
   /*
       
      -------------------------------------------------------------------------------------------------------------------------
         대륙명        국가명                       부서주소                    부서번호   부서명      사원번호  사원명       기본급여
      --------------------------------------------------------------------------------------------------------------------------   
         Americas     United States of America     Seattle 2004 Charade Rd      90      Executive   100    Steven King   24000
   
   
         대륙명   ==>  regions.region_name                                    regions.region_id 
         국가명   ==>  countries.country_name                                 countries.region_id       countries.country_id
         부서주소  ==> locations.city || ' ' || locations.street_address      locations.country_id      locations.location_id
         부서명   ==> departments.department_name                             departments.location_id   departments.department_id 
         사원명   ==> employees.first_name || ' ' || employees.last_name      employees.department_id
   */
   
   select * from tab;
   
   select *
   from EMPLOYEES;   -- employees.department_id
   
   select * 
   from DEPARTMENTS; -- departments.department_id    departments.location_id
   
   select * 
   from LOCATIONS;   -- locations.location_id        locations.country_id
   
   select * 
   from COUNTRIES;   -- countries.country_id         countries.region_id
   
   select * 
   from REGIONS;     -- regions.region_id
   
   --------------------------------------------------------------------------------------
   
   --- !!!!!! 다중테이블 JOIN 시 시작을 부모 테이블 부터 시작하는 것이 편합니다. !!!!!!!! ---
   
   select * 
   from REGIONS R
   JOIN COUNTRIES C 
   ON R.region_id = C.region_id
   JOIN LOCATIONS L 
   ON C.country_id = L.country_id
   JOIN DEPARTMENTS D
   ON L.location_id = D.location_id
   JOIN EMPLOYEES E 
   ON D.department_id = E.department_id
   order by 1;
   -- 106개 행이 나옴.
   
   
   -- 부서번호가 없는 킴밸리그랜트가 나오도록 하세요.
   select * 
   from REGIONS R
   JOIN COUNTRIES C 
   ON R.region_id = C.region_id
   JOIN LOCATIONS L 
   ON C.country_id = L.country_id
   JOIN DEPARTMENTS D
   ON L.location_id = D.location_id
   RIGHT JOIN EMPLOYEES E 
   ON D.department_id = E.department_id
   order by 1;
   -- 107개 행이 나옴.
   
  /* 
   select *
   from EMPLOYEES E 
   LEFT JOIN DEPARTMENTS D
   ON E.department_id = D.department_id
   LEFT JOIN LOCATIONS L 
   ON D.location_id = L.location_id
   LEFT JOIN COUNTRIES C 
   ON L.country_id = C.country_id
   LEFT JOIN REGIONS R
   ON C.region_id = R.region_id
  */ 
   
   
   --- [대분류값 검색]
   --- *** 'Americas' 대륙에 근무하는 사원들만 
   --      국가명     부서주소     부서번호   부서명    사원번호  사원명   기본급여 를 나타내세요.
   with V as
   (
       select R.region_id, region_name,
              C.country_id, country_name,
              L.location_id, street_address, postal_code, city, state_province,
              D.department_id, department_name, D.manager_id, 
              employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, E.manager_id AS SASUNO, jubun  
       from REGIONS R
       JOIN COUNTRIES C 
       ON R.region_id = C.region_id
       JOIN LOCATIONS L 
       ON C.country_id = L.country_id
       JOIN DEPARTMENTS D
       ON L.location_id = D.location_id
       RIGHT JOIN EMPLOYEES E 
       ON D.department_id = E.department_id
   )
   select country_name AS 국가명
       ,  city || ' ' || street_address AS 부서주소
       ,  department_id AS 부서번호
       ,  department_name AS 부서명
       ,  employee_id AS 사원번호
       ,  first_name || ' ' || last_name AS 사원명
       ,  salary AS 기본급여
   from V 
   where region_name = 'Americas'
   order by 1;
   
   
   
   --- [중분류값 검색] 
   --- *** 'Seattle' 도시에 근무하는 사원들만 
   --      부서주소     부서번호   부서명    사원번호  사원명   기본급여 를 나타내세요.
   with V as
   (
       select R.region_id, region_name,
              C.country_id, country_name,
              L.location_id, street_address, postal_code, city, state_province,
              D.department_id, department_name, D.manager_id, 
              employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, E.manager_id AS SASUNO, jubun  
       from REGIONS R
       JOIN COUNTRIES C 
       ON R.region_id = C.region_id
       JOIN LOCATIONS L 
       ON C.country_id = L.country_id
       JOIN DEPARTMENTS D
       ON L.location_id = D.location_id
       RIGHT JOIN EMPLOYEES E 
       ON D.department_id = E.department_id
       RIGHT JOIN EMPLOYEES E1
       ON D.MANAGER_ID = E1.EMPLOYEE_ID
   )
   select city || ' ' || street_address AS 부서주소
       ,  department_id AS 부서번호
       ,  department_name AS 부서명
       ,  employee_id AS 사원번호
       ,  first_name || ' ' || last_name AS 사원명
       ,  salary AS 기본급여
   from V
   where city = 'Seattle';
   
   
   
   --- [소분류값 검색]
   --- *** 'Finance' 부서명에 근무하는 사원들만 
   --      부서번호   부서명    사원번호  사원명   기본급여 를 나타내세요.
   with V as
   (
       select R.region_id, region_name,
              C.country_id, country_name,
              L.location_id, street_address, postal_code, city, state_province,
              D.department_id, department_name, D.manager_id, 
              employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, E.manager_id AS SASUNO, jubun  
       from REGIONS R
       JOIN COUNTRIES C 
       ON R.region_id = C.region_id
       JOIN LOCATIONS L 
       ON C.country_id = L.country_id
       JOIN DEPARTMENTS D
       ON L.location_id = D.location_id
       
   )
   select department_id AS 부서번호
       ,  department_name AS 부서명
       ,  employee_id AS 사원번호
       ,  first_name || ' ' || last_name AS 사원명
       ,  salary AS 기본급여
   from V
   where department_name = 'Finance';
   
   
   
  
     
     
     
     
     
     ---- [과제] -----
    --  아래와 같이 나오도록 하세요...
    
   
    /*
        ----------------------------------------------------------------------------------------------------------------------------------------------------
         부서번호    부서명    부서주소    부서장성명    사원번호   사원명    성별    나이    연봉    연봉소득세액    부서내연봉평균차액    부서내연봉등수     전체연봉등수 
        ----------------------------------------------------------------------------------------------------------------------------------------------------
    */
   
    
    /*
        email : tjdudgkr0959@naver.com
        메일제목 : SQL과제_황광빈
        첨부파일 : SQL과제_황광빈.txt
        제출기한 : 2022년 7월 15일 18:00 까지 제출
    */
    
 
   with V as
   (
   select D.department_id as 부서번호
         ,D.department_name as 부서명
         ,L.city || ' ' || L.street_address as 부서주소
         ,E1.first_name || ' ' || E1.last_name as 부서장성명
         , E.employee_id as 사원번호
         ,E.first_name || ' ' || E.last_name as 사원명
         ,case when substr(E.jubun,7,1) in ('2','4')then '여' else '남' end as 성별
         ,extract(year from sysdate) - (to_number(substr(E.jubun,1,2)) + case when substr(E.jubun,7,1) in ('1','2') then 1900 else 2000 end) +1 as 나이
         ,nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 as 연봉
         ,(select trunc(avg(nvl( E2.salary + E2.salary*E2.commission_pct, E2.salary )))*12 from employees E2 where E.department_id = E2.department_id) as 부서내연봉평균차액
         , rank() over(partition by E.department_id order by nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 desc) as 부서내연봉등수
         , rank()over(order by nvl(E.salary + (E.salary * E.commission_pct), E.salary)*12 desc) as 전체연봉등수
         
         from regions R
         join countries C
         on R.region_id = C.region_id
         join locations L
         on C.country_id = L.country_id
         join departments D
         on L.location_id = D.location_id
         right join employees E1
         on D.manager_id = E1.employee_id
         right join employees E
         on D.department_id = E.department_id
         )
         select 부서번호,부서명,부서주소,부서장성명,사원번호,사원명,성별,나이,연봉,연봉 * taxpercent as 연봉소득세액,부서내연봉평균차액,부서내연봉등수,전체연봉등수
         from V left JOIN tbl_taxindex
         on 연봉 between lowerincome and highincome
         order by 1
     
     ---- %%%%%%%%%%%%%%%%%%%%% 강사님 풀이 %%%%%%%%%%%%%%%%%%%%% ----
     
     -- 사원수가 107명이 나오도록 하겠습니다.
     
     부서번호    부서명    부서주소    부서장성명
     
     select D.department_id
          , D.department_name
          , L.street_address || ' ' || L.city || ' ' || L.state_province as ADDRESS
          , E.FIRST_NAME || ' ' || E.last_name as DEPTHEADNAME            
     from departments D JOIN employees E
     on D.manager_id = E.employee_id
     JOIN locations L
     ON D.location_id = L.location_id
     
     
     
     
     사원번호   사원명    성별    나이    연봉    연봉소득세액
     
     select employee_id
          , first_name || ' ' || last_name AS ENAME
          , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end as GENDER
          , extract(year from sysdate) - ( to_number(substr(jubun,1,2) ) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 as AGE
          , nvl(salary + (salary*commission_pct), salary )*12 as YEARSAL
          , (nvl(salary + (salary*commission_pct), salary )*12) * taxpercent as YEARSAL_TAX
     from employees E JOIN tbl_taxindex T
     ON nvl(salary + (salary*commission_pct), salary )*12 between lowerincome and highincome
     
     
     
     부서번호   부서번호별연봉평균  
     
     select department_id
          , avg(nvl(salary + (salary*commission_pct), salary )*12 ) AS DEPT_AVG_YEARSAL
     from employees
     group by department_id
     
     
     
     WITH
     A as
     (
         select D.department_id
              , D.department_name
              , L.street_address || ' ' || L.city || ' ' || L.state_province as ADDRESS
              , E.FIRST_NAME || ' ' || E.last_name as DEPTHEADNAME            
         from departments D JOIN employees E
         on D.manager_id = E.employee_id
         JOIN locations L
         ON D.location_id = L.location_id
     )
     ,
     B as
     (
         select department_id
              , employee_id
              , first_name || ' ' || last_name AS ENAME
              , case when substr(jubun, 7, 1) in('1','3') then '남' else '여' end as GENDER
              , extract(year from sysdate) - ( to_number(substr(jubun,1,2) ) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 as AGE
              , nvl(salary + (salary*commission_pct), salary )*12 as YEARSAL
              , (nvl(salary + (salary*commission_pct), salary )*12) * taxpercent as YEARSAL_TAX
         from employees E JOIN tbl_taxindex T
         ON nvl(salary + (salary*commission_pct), salary )*12 between lowerincome and highincome
     )
     ,
     C as
     (
         select department_id
              , trunc( avg(nvl(salary + (salary*commission_pct), salary )*12 ) ) AS DEPT_AVG_YEARSAL
         from employees
         group by department_id
     )
     
     select A.department_id AS 부서번호
          , A.department_name AS 부서명 
          , A.address AS 부서주소
          , A.deptheadname AS 부서장성명
          , B.employee_id AS 사원번호
          , B.ename AS 사원명
          , B.gender AS 성별
          , B.age AS 나이
          , B.yearsal AS 연봉
          , B.Yearsal_Tax AS 연봉소득세액
          , B.yearsal - C.dept_avg_yearsal AS 부서내연봉평균차액
          , rank() over(partition by A.department_id
                        order by B.yearsal desc) AS 부서내연봉등수
          , rank() over(order by B.yearsal desc) AS 전체연봉등수 
     from A RIGHT JOIN B 
     on A.department_id = B.department_id
     JOIN C
     on NVL(B.department_id, -9999) = NVL(C.department_id, -9999)
     order by 1 asc, 9 desc
     
     
     
     
     --------- ======= **** 계층형 쿼리 **** ======= -----------
   /*
       계층형 쿼리는 Spring 프레임워크 시간에 답변형 게시판에서 사용한다.
       또한 전자결재 에서도 사용된다.
   */
     
    /*
          1            진혜린
                         |
                 ---------------
          2      장진영     진민지
                  |
                ---------------------
                  |      |        |
          3     조상운   최현우    이예은
                  |               |
               -------            |
               |     |            |
          4  손여진  임선우        조하솔
    */

    select *
    from employees;
    
    
    -- 결제라인을 만들어 보겠습니다.
    -- 출발   104  ==>  103  ==>  102  ==>  100  ==>  NULL
    --        1         2         3         4
    
    select level
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , manager_id AS 직속결제권자
    from employees
    start with employee_id = 104
    connect by prior manager_id = employee_id;
/*
    connect by prior manager_id = employee_id;
*/
    
    --- *** !!!! prior 다음에 나오는 manager_id 컬럼은 start with 되어지는 행의 manager_id 컬럼의 값이다. !!!! *** ---
    
    
    
    select level
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , manager_id AS 직속결제권자
    from employees
    start with employee_id = 100             -- start with employee_id = 101
    connect by prior employee_id = manager_id;
    /*
        connect by prior 100 = manager_id;   -- connect by prior 101 = manager_id;       
    */
    
    select *
    from employees
   -- where manager_id = 109;  -- 없음.
   -- where manager_id = 110;  -- 없음.
   -- where manager_id = 111;  -- 없음.
   -- where manager_id = 112;  -- 없음.
   -- where manager_id = 113;  -- 없음.
   
   
   
   select level
         , employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , manager_id AS 직속결제권자
    from employees
    start with employee_id = 100
    connect by prior employee_id = manager_id
    order by level asc;
    
    
    
   
   
   ------- ===== **** SET Operator(SET 연산자, 집합연산자) **** ===== --------
   /*
       -- 종류 --
       1. UNION
       2. UNION ALL 
       3. INTERSECT
       4. MINUS
       
       --- 면접시 JOIN 과 UNION 의 차이점에 대해서 말해 보세요~~~!! ---
       ==> UNION 은 테이블(뷰)과 테이블(뷰)을 합쳐서 보여주는 것으로써,
           이것은 행(ROW)과 행(ROW)을 합친 결과를 보여주는 것이다.
   
    A = { a, x, b, e, g }
          -     -
    B = { c, d, a, b, y, k, m}    
                -  -    
    A ∪ B = {a, b, c, d, e, g, k, m, x, y}  ==> UNION               
                                             {a, b, c, d, e, g, k, m, x, y}

                                             ==> UNION ALL 
                                             {a, x, b, e, g, c, d, a, b, y, k, m} 

    A ∩ B = {a,b}  ==> INTERSECT
                       {a,b}

    A - B = {x,e,g} ==> MINUS 
                        {x,e,g}

    B - A = {c,d,y,k,m} ==> MINUS 
                           {c,d,y,k,m}
   */
   
   select *
   from tbl_panmae;
   
   -- tbl_panmae 테이블에서 2달전에 해당하는 월에(현재가 2022년 7월 이므로 2022년 5월) 판매되어진 정보만 추출해서 tbl_panmae_202205 라는 테이블로 생성하세요.
   create table tbl_panmae_202205
   as 
   select *
   from tbl_panmae
   where to_char(panmaedate, 'yyyy-mm') = to_char(add_months(sysdate, -2), 'yyyy-mm');
   --                                     '2022-05'  
   -- Table TBL_PANMAE_202205이(가) 생성되었습니다.
   
   select * 
   from tbl_panmae_202205;
   
   delete from tbl_panmae
   where to_char(panmaedate, 'yyyy-mm') = to_char(add_months(sysdate, -2), 'yyyy-mm');
   -- 5개 행 이(가) 삭제되었습니다.
   
   commit;
   -- 커밋 완료.
   
   
   -- tbl_panmae 테이블에서 1달전에 해당하는 월에(현재가 2022년 7월 이므로 2022년 6월) 판매되어진 정보만 추출해서 tbl_panmae_202206 라는 테이블로 생성하세요.
   create table tbl_panmae_202206
   as 
   select *
   from tbl_panmae
   where to_char(panmaedate, 'yyyy-mm') = to_char(add_months(sysdate, -1), 'yyyy-mm');
   --                                     '2022-06'  
   -- Table TBL_PANMAE_202206이(가) 생성되었습니다.
   
   select * 
   from tbl_panmae_202206;
   
   delete from tbl_panmae
   where to_char(panmaedate, 'yyyy-mm') = to_char(add_months(sysdate, -1), 'yyyy-mm');
   -- 4개 행 이(가) 삭제되었습니다.
   
   commit;
   -- 커밋 완료.
   
   select *
   from tbl_panmae;
   
   
   --- *** 최근 3개월간 판매되어진 정보를 가지고 제품별 판매량의 합계를 추출하세요 *** ---
   
   select *
   from tbl_panmae_202205;  -- 2달전 판매정보
   
   select *
   from tbl_panmae_202206;  -- 1달전 판매정보
   
   select *
   from tbl_panmae;  -- 이번달 판매정보
   
   
   
   select *
   from tbl_panmae_202205  -- 2달전 판매정보
   UNION
   select *
   from tbl_panmae_202206  -- 1달전 판매정보
   UNION
   select *
   from tbl_panmae;  -- 이번달 판매정보
   
   
   select *
   from tbl_panmae  -- 이번달 판매정보 
   UNION
   select *
   from tbl_panmae_202205  -- 2달전 판매정보
   UNION
   select *
   from tbl_panmae_202206;  -- 1달전 판매정보
   -- UNION 을 하면 항상 첫번째 컬럼(지금은 panmaedate)을 기준으로 오름차순 정렬되어 나온다.
   -- 그래서 2022년 5월 데이터 부터 먼저 나온다.
   
   
   select *
   from tbl_panmae  -- 이번달 판매정보 
   UNION ALL
   select *
   from tbl_panmae_202205  -- 2달전 판매정보
   UNION ALL
   select *
   from tbl_panmae_202206;  -- 1달전 판매정보
   -- UNION ALL 을 하면 정렬 없이 그냥 순서대로 행을 붙여서 보여줄 뿐이다.
   -- 그래서 맨처음이 tbl_panmae 테이블이고, 그 다음이 tbl_panmae_202205 테이블이고, 마지막이 tbl_panmae_202206 테이블 이므로
   -- 순서대로 보여질 뿐이다.
  
  select jepumname AS 제품명
       , sum(panmaesu) AS 판매합계
  from 
  ( 
       select *
       from tbl_panmae_202205 
       UNION
       select *
       from tbl_panmae_202206  
       UNION
       select *
       from tbl_panmae
  ) V
  group by jepumname 
  order by 2 desc;
   
   
 -- 또는
 with V as
 ( 
   select *
   from tbl_panmae_202205 
   UNION
   select *
   from tbl_panmae_202206  
   UNION
   select *
   from tbl_panmae
 )
 select jepumname AS 제품명
      , sum(panmaesu) AS 판매합계
 from V  
 group by jepumname   
 order by 2 desc;
 
 
 -- 최근 3개월간 판매되어진 판매량의 총합계는?
 -- 1. 틀린풀이
 select sum(panmaesu)
 from 
 (
   select panmaesu
   from tbl_panmae_202205 
   UNION
   select panmaesu
   from tbl_panmae_202206  
   UNION
   select panmaesu
   from tbl_panmae  
 ) V; 
 -- 98 
 
 -- 2. 올바른풀이
 select sum(panmaesu)
 from 
 (
   select panmaesu
   from tbl_panmae_202205 
   UNION ALL 
   select panmaesu
   from tbl_panmae_202206  
   UNION ALL 
   select panmaesu
   from tbl_panmae  
 ) V; 
 -- 243
   
 
 ---- *** [퀴즈] 최근 3개월간 판매되어진 정보를 가지고 
 --             아래와 같이 제품명, 판매년월, 판매량의합계, 백분율(%) 을 추출하세요 *** ----  
 
 ------------------------------------------------
  제품명     판매년월     판매량의합계    백분율(%)
 ------------------------------------------------
  감자깡     2022-05       20            8.2
  감자깡     2022-06       15            6.2
  감자깡     2022-07       15            6.2
  감자깡                   50           20.6
  새우깡     2022-05       38           15.6
  새우깡     2022-06        8            3.3
  새우깡     2022-07       30           12.3
  새우깡                   76           31.3
  .....     .......       ...          ....
  전체                    243          100.0
 ------------------------------------------------   
 
 
-- 첫번째 풀이 방법
select decode( grouping( jepumname ), 0, jepumname, '전체') AS 제품명 
     , decode( grouping( to_char(panmaedate, 'yyyy-mm') ), 0, to_char(panmaedate, 'yyyy-mm'), ' ') AS  판매년월 
     , sum(panmaesu) AS 판매량의합계
     , to_char( ROUND( sum(panmaesu)/( select sum(panmaesu)
                                       from 
                                      (
                                        select panmaesu
                                        from tbl_panmae_202205 
                                        UNION ALL 
                                        select panmaesu
                                        from tbl_panmae_202206  
                                        UNION ALL 
                                        select panmaesu
                                        from tbl_panmae  
                                      ) 
                                    ) * 100, 1), '999.0') AS "백분율(%)"
from 
  ( 
   select *
   from tbl_panmae_202205 
   UNION
   select *
   from tbl_panmae_202206  
   UNION
   select *
   from tbl_panmae
  ) V
group by grouping sets( (jepumname, to_char(panmaedate, 'yyyy-mm')), (jepumname), () ); 
-- 또는
--group by rollup( jepumname, to_char(panmaedate, 'yyyy-mm') ); 
  
  
-- 두번째 풀이 방법
with V as
( 
   select *
   from tbl_panmae_202205 
   UNION
   select *
   from tbl_panmae_202206  
   UNION
   select *
   from tbl_panmae
)
select decode( grouping( jepumname ), 0, jepumname, '전체') AS 제품명 
     , decode( grouping( to_char(panmaedate, 'yyyy-mm') ), 0, to_char(panmaedate, 'yyyy-mm'), ' ') AS  판매년월 
     , sum(panmaesu) AS 판매량의합계
     , to_char( ROUND( sum(panmaesu)/(select sum(panmaesu) from V)*100, 1), '999.0') AS "백분율(%)"
from V
group by grouping sets( (jepumname, to_char(panmaedate, 'yyyy-mm')), (jepumname), () ); 



    ----- ===== **** INTERSECT(교집합) **** ===== -----
  insert into tbl_panmae_202205(panmaedate, jepumname, panmaesu)
  values( to_date('2021-04-05', 'yyyy-mm-dd'), '쵸코파이', 10);
  
  insert into tbl_panmae_202206(panmaedate, jepumname, panmaesu)
  values( to_date('2021-04-05', 'yyyy-mm-dd'), '쵸코파이', 10);
  
  insert into tbl_panmae(panmaedate, jepumname, panmaesu)
  values( to_date('2021-04-05', 'yyyy-mm-dd'), '쵸코파이', 10);
  
  commit;
  
  select *
  from tbl_panmae_202205 
  INTERSECT
  select *
  from tbl_panmae_202206  
  INTERSECT
  select *
  from tbl_panmae;
  -- 21/04/05	쵸코파이	10
  
  delete from tbl_panmae_202205
  where jepumname = '쵸코파이';
  
  delete from tbl_panmae_202206
  where jepumname = '쵸코파이';
  
  delete from tbl_panmae
  where jepumname = '쵸코파이';
  
  commit;


  ----- ===== **** MINUS(차집합) **** ===== -----
  select *
  from tab;
  
  select *
  from TBL_EMPLOYEES_BACKUP;
  
  select * 
  from employees
  where employee_id in (173, 185, 195);
  
  select * 
  from TBL_EMPLOYEES_BACKUP
  where employee_id in (173, 185, 195);
  
  delete from employees
  where employee_id in (173, 185, 195);
  -- 3개 행 이(가) 삭제되었습니다.
  
  commit;
  -- 커밋 완료.
  
  /*
      개발자가 실수로 employees 테이블에 있던 사원들을 삭제(delete)했다.
      그런데 누구를 삭제했는지 모른다.!!!!
      백업받은 TBL_EMPLOYEES_BACKUP 테이블을 이용하여 삭제된 사원들을 다시 복구하도록 하겠다.!!!
  */
  select * 
  from TBL_EMPLOYEES_BACKUP
  MINUS
  select * 
  from employees;
  -- TBL_EMPLOYEES_BACKUP 테이블에만 존재하고 employees 테이블에는 존재하지 않는 행들을 찾아주는 것이다.
  
  select *
  from employees
  where employee_id in (173, 185, 195);
  -- 없음.
  
  insert into employees
  select * 
  from TBL_EMPLOYEES_BACKUP
  MINUS
  select * 
  from employees;
  -- 3개 행 이(가) 삽입되었습니다.
  
  commit;
  -- 커밋 완료.
  
  select *
  from employees
  where employee_id in (173, 185, 195);
  -- 나온다. 즉, 복구완료됨.
  
  
  
  
  
  
  -------- ====== ***** Pseudo(의사, 유사, 모조) Column ***** ====== --------
  -- Pseudo(의사) Column 은 rowid 와 rownum 이 있다.!!
  
  /*
     1. rowid
        rowid 는 오라클이 내부적으로 사용하기 위해 만든 id 값으로써 
        행에 대한 id 값인데 오라클 전체내에서 고유한 값을 가진다.
  */
  
  create table tbl_heowon
  (userid     varchar2(20),
   name       varchar2(20),
   address    varchar2(100)
  );
  -- Table TBL_HEOWON이(가) 생성되었습니다.
    
  insert into tbl_heowon(userid, name, address) values('leess','이순신','서울');
  insert into tbl_heowon(userid, name, address) values('eomjh','엄정화','인천');
  insert into tbl_heowon(userid, name, address) values('kangkc','강감찬','수원');
    
  insert into tbl_heowon(userid, name, address) values('leess','이순신','서울');
  insert into tbl_heowon(userid, name, address) values('eomjh','엄정화','인천');
  insert into tbl_heowon(userid, name, address) values('kangkc','강감찬','수원');
        
  insert into tbl_heowon(userid, name, address) values('leess','이순신','서울');
  insert into tbl_heowon(userid, name, address) values('eomjh','엄정화','인천');
  insert into tbl_heowon(userid, name, address) values('kangkc','강감찬','수원');
        
  commit;
  -- 커밋 완료.
    
  select userid, name, address
  from tbl_heowon;
    
  select userid, name, address, rowid
  from tbl_heowon;
    
  select userid, name, address, rowid
  from tbl_heowon
  where rowid > 'AAASDUAAHAAAAHVAAC';
  
  delete from tbl_heowon
  where rowid > 'AAASDUAAHAAAAHVAAC';
  -- 6개 행 이(가) 삭제되었습니다.
  
  commit;
  
  select userid, name, address
  from tbl_heowon;
  
  
  /*
     2. rownum (!!!!! 게시판 등 웹에서 아주아주아주 많이많이 사용됩니다. !!!!!)
  */
  
  select * 
  from tbl_board;
  
  select boardno AS 글번호
       , subject AS 글제목
       , userid  AS 글쓴이
       , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자 
  from tbl_board;
  
  --------------------------------------------------------------------------------------
   번호   글번호    글제목                               글쓴이    작성일자
  -------------------------------------------------------------------------------------- 
    1       5	  오늘도 좋은 하루되세요	               hongkd	2022-07-04 12:15:50
    2       4	  기쁘고 감사함이 넘치는 좋은 하루되세요	   leess	2022-07-04 12:15:50
    3       3	  건강하세요	                           youks	2022-07-04 12:15:50
    4       2	  반갑습니다	                           eomjh	2022-07-04 12:15:50
    5       1	  안녕하세요	                           leess	2022-07-04 12:15:50
  --------------------------------------------------------------------------------------
                  1  2  3  ==> 페이지바
                  
                  
  select rownum   -- rownum(행번호)은 기본적으로 insert 되어진 순서대로 나온다.
       , boardno AS 글번호
       , subject AS 글제목
       , userid  AS 글쓴이
       , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자 
  from tbl_board;
  
  
  select rownum, boardno, subject, userid, registerday 
  from 
  (
      select boardno
           , subject
           , userid
           , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY  
      from tbl_board
      order by boardno desc
  ) V;
  
  
  /*
     한 페이지당 2개씩 보여주고자 한다.
     
     1 페이지 ==>  rownum : 1 ~ 2   boardno : 5 ~ 4
     2 페이지 ==>  rownum : 3 ~ 4   boardno : 3 ~ 2
     3 페이지 ==>  rownum : 5 ~ 6   boardno : 1
  */   
  
  -- 1 페이지 ==>  rownum : 1 ~ 2   boardno : 5 ~ 4
  -- 틀린것
  select rownum, boardno, subject, userid, registerday 
  from 
  (
      select boardno
           , subject
           , userid
           , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY  
      from tbl_board
      order by boardno desc
  ) V
  where rownum between 1 and 2;
  
  
  -- 2 페이지 ==>  rownum : 3 ~ 4   boardno : 3 ~ 2
  -- 틀린것
  select rownum, boardno, subject, userid, registerday 
  from 
  (
      select boardno
           , subject
           , userid
           , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY  
      from tbl_board
      order by boardno desc
  ) V
  where rownum between 3 and 4;
  -- rownum 은 where 절에 바로 쓸 수가 없다.!!!
  -- 그래서 rownum 을 가지는 컬럼의 별칭(alias)을 만든 후에 inline view 를 사용해야만 된다.!!!!!!
  
  
  -- 1 페이지 ==>  RNO : 1 ~ 2   boardno : 5 ~ 4
  -- 올바른것
  select boardno, subject, userid, registerday
  from 
  (
      select rownum AS RNO, boardno, subject, userid, registerday 
      from 
      (
          select boardno
               , subject
               , userid
               , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY  
          from tbl_board
          order by boardno desc
      ) V
  ) T
  where RNO between 1 and 2;
  /*
      === 페이징처리의 공식 ===
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (1 * 2) - (2 - 1) and (1 * 2);
      where RNO between (2) - (1) and (2);
      where RNO between 1 and 2;
  */
  
  
  
  -- 2 페이지 ==>  RNO : 3 ~ 4   boardno : 3 ~ 2
  -- 올바른것
  select boardno, subject, userid, registerday
  from 
  (
      select rownum AS RNO, boardno, subject, userid, registerday 
      from 
      (
          select boardno
               , subject
               , userid
               , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY  
          from tbl_board
          order by boardno desc
      ) V
  ) T
  where RNO between 3 and 4;
  /*
      === 페이징처리의 공식 ===
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (2 * 2) - (2 - 1) and (2 * 2);
      where RNO between (4) - (1) and (4);
      where RNO between 3 and 4;
  */
  
  -- 3 페이지 ==>  RNO : 5 ~ 6   boardno : 1 
  -- 올바른것
  select boardno, subject, userid, registerday
  from 
  (
      select rownum AS RNO, boardno, subject, userid, registerday 
      from 
      (
          select boardno
               , subject
               , userid
               , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY  
          from tbl_board
          order by boardno desc
      ) V
  ) T
  where RNO between 5 and 6;
  /*
      === 페이징처리의 공식 ===
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (3 * 2) - (2 - 1) and (3 * 2);
      where RNO between (6) - (1) and (6);
      where RNO between 5 and 6;
  */
  
  
  /*
      === 페이징처리의 공식 ===
      한페이지당 10개씩을 보여주고자 할때 1페이지는 
      
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (1 * 10) - (10 - 1) and (1 * 10);
      where RNO between (10) - (9) and (10);
      where RNO between 1 and 10;
      
      
      한페이지당 10개씩을 보여주고자 할때 2페이지는 
      
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (2 * 10) - (10 - 1) and (2 * 10);
      where RNO between (20) - (9) and (20);
      where RNO between 11 and 20;
      
      
      한페이지당 10개씩을 보여주고자 할때 3페이지는 
      
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (3 * 10) - (10 - 1) and (3 * 10);
      where RNO between (30) - (9) and (30);
      where RNO between 21 and 30;
  */
  
  ------------------------------------------------------------------------------
  
  --- **** 또는 rownum 을 사용하지 않고 row_number() 함수를 사용하여도 된다. **** ---
  
  select row_number() over(order by boardno desc)
       , boardno AS 글번호
       , subject AS 글제목
       , userid  AS 글쓴이
       , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자 
  from tbl_board;
  
  -- 1 페이지 ==>  row_number() over(order by boardno desc) : 1 ~ 2   boardno : 5 ~ 4
  -- 틀린것
  select row_number() over(order by boardno desc)
       , boardno AS 글번호
       , subject AS 글제목
       , userid  AS 글쓴이
       , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자 
  from tbl_board
  where row_number() over(order by boardno desc) between 1 and 2;
  -- 오류!! row_number() over(order by boardno desc) 은 where 절에 바로 쓸 수가 없다.!!
  -- 그러므로 이것 또한 inline view 를 사용해야 한다.
  
  -- 1 페이지 ==>  RNO : 1 ~ 2   boardno : 5 ~ 4
  -- 올바른것
  select boardno, subject, userid, registerday
  from 
  (
      select row_number() over(order by boardno desc) AS RNO
           , boardno
           , subject
           , userid 
           , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
      from tbl_board
  ) V
  where RNO between 1 and 2;
  /*
      === 페이징처리의 공식 ===
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (1 * 2) - (2 - 1) and (1 * 2);
      where RNO between (2) - (1) and (2);
      where RNO between 1 and 2;
  */
   
   
  -- 2 페이지 ==>  RNO : 3 ~ 4   boardno : 3 ~ 2
  -- 올바른것
  select boardno, subject, userid, registerday
  from 
  (
      select row_number() over(order by boardno desc) AS RNO
           , boardno
           , subject
           , userid 
           , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
      from tbl_board
  ) V
  where RNO between 3 and 4; 
 /*
      === 페이징처리의 공식 ===
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (2 * 2) - (2 - 1) and (2 * 2);
      where RNO between (4) - (1) and (4);
      where RNO between 3 and 4;
  */


  -- 3 페이지 ==>  RNO : 5 ~ 6   boardno : 1
  -- 올바른것
  select boardno, subject, userid, registerday
  from 
  (
      select row_number() over(order by boardno desc) AS RNO
           , boardno
           , subject
           , userid 
           , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS REGISTERDAY 
      from tbl_board
  ) V
  where RNO between 5 and 6; 
  /*
      === 페이징처리의 공식 ===
      where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
      
      where RNO between (3 * 2) - (2 - 1) and (3 * 2);
      where RNO between (6) - (1) and (6);
      where RNO between 5 and 6;
  */ 
  
  
  
  
  
  
  
  -----------------------------------------------------------------------------------
  /*
      DML(Data Manuplation Language) : 데이터 조작어 ==> insert, update, delete, merge
                                     : 수동 commit 이므로 rollback 이 가능하다.
                                     
      DDL(Data Definition Language) : 데이터 정의어 ==> create, drop, alter, truncate
                                    : 자동 commit( Auto commit) 이므로 rollback 이 불가하다.
                                    
      DCL(Data Control Language) : 데이터 제어어 ==> grant, revoke     
                                 : 자동 commit( Auto commit) 이므로 rollback 이 불가하다.
                                 
      TCL(Transaction Control Language) : 트랜잭션 제어어 ==> commit, rollback
      
      DQL(Data Query Language) : 데이터 질의어 ==> select 
   */
   
  
   -------- **** 데이터 조작어(DML == Data Manuplation Language) **** ---------
   --- DML 문은 기본적으로 수동 commit 이다.
   --- 즉, DML 문을 수행한 다음에는 바로 디스크(파일)에 적용되지 않고 commit 해야만 적용된다.
   --- 그래서 DML 문을 수행한 다음에 디스크(파일)에 적용치 않고자 한다라면 rollback 하면 된다.
   
   1. insert  --> 데이터 입력
   2. update  --> 데이터 수정
   3. delete  --> 데이터 삭제
   4. merge   --> 데이터 병합 
    
   insert 는 문법이
   insert into 테이블명(컬럼명1,컬럼명2,...) values(값1,값2,...); 
   이다.
   
   
   ※ Unconditional insert all  -- ==>조건이 없는 insert 
    [문법] insert all 
           into 테이블명1(컬럼명1, 컬럼명2, ....)
           values(값1, 값2, .....)
           into 테이블명2(컬럼명3, 컬럼명4, ....)
           values(값3, 값4, .....)
           SUB Query문;
           
   
   create table tbl_emp1
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );         
   -- Table TBL_EMP1이(가) 생성되었습니다.
   
   select count(*)
   from tbl_emp1; -- 0
   
   
   create table tbl_emp1_backup
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(6)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );  
   -- Table TBL_EMP1_BACKUP이(가) 생성되었습니다.
   
   select count(*)
   from tbl_emp1_backup; -- 0
   
   
   
   insert all 
   into tbl_emp1(empno, ename, monthsal, gender, manager_id, department_id, department_name)
   values(employee_id, ename, month_sal, gender||'자', manager_id, department_id, department_name)
   into tbl_emp1_backup(empno, ename, monthsal, gender, manager_id, department_id, department_name)
   values(employee_id, ename, month_sal, gender||'자', manager_id, department_id, department_name)
   select employee_id
        , first_name || ' ' || last_name AS ename 
        , nvl(salary + (salary * commission_pct), salary) AS month_sal
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end AS gender
        , E.manager_id
        , E.department_id
        , department_name
   from employees E LEFT JOIN departments D 
   on E.department_id = D.department_id
   order by E.department_id asc, employee_id asc;
   -- 214개 행 이(가) 삽입되었습니다.  (107 + 107 ==> 214)
   
   commit;
   -- 커밋 완료.
   
   select count(*)
   from tbl_emp1; -- 107        
     
   select *
   from tbl_emp1;  
        
        
   select count(*)
   from tbl_emp1_backup; -- 107 
   
   
   select *
   from tbl_emp1_backup;
           
           
           
   ※ Conditional insert all -- ==> 조건이 있는 insert 
   조건(where절)에 일치하는 행들만 특정 테이블로 찾아가서 insert 하도록 하는 것이다.       
   
   create table tbl_emp_dept30
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(4)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );
   -- Table TBL_EMP_DEPT30이(가) 생성되었습니다.

   create table tbl_emp_dept50
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(4)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   );
   -- Table TBL_EMP_DEPT50이(가) 생성되었습니다.

   create table tbl_emp_dept80
   (empno            number(6)
   ,ename            varchar2(50)
   ,monthsal         number(7)
   ,gender           varchar2(4)
   ,manager_id       number(6)
   ,department_id    number(4)
   ,department_name  varchar2(30)
   ); 
   -- Table TBL_EMP_DEPT80이(가) 생성되었습니다.
  
  
   insert all 
   when department_id = 30 then
   into tbl_emp_dept30(empno, ename, monthsal, gender, manager_id, department_id, department_name)
   values(employee_id, ename, month_sal, gender, manager_id, department_id, department_name)
   when department_id = 50 then
   into tbl_emp_dept50(empno, ename, monthsal, gender, manager_id, department_id, department_name)
   values(employee_id, ename, month_sal, gender, manager_id, department_id, department_name)
   when department_id = 80 then
   into tbl_emp_dept80(empno, ename, monthsal, gender, manager_id, department_id, department_name)
   values(employee_id, ename, month_sal, gender, manager_id, department_id, department_name)
   select employee_id
        , first_name || ' ' || last_name AS ename 
        , nvl(salary + (salary * commission_pct), salary) AS month_sal
        , case when substr(jubun,7,1) in('1','3') then '남' else '여' end AS gender
        , E.manager_id
        , E.department_id
        , department_name
   from employees E LEFT JOIN departments D 
   on E.department_id = D.department_id
   where E.department_id in (30,50,80)
   order by E.department_id asc, employee_id asc;
   -- 85개 행 이(가) 삽입되었습니다.
      
   commit;
   -- 커밋 완료.
   
   select *
   from tbl_emp_dept30;
   
   select *
   from tbl_emp_dept50;
   
   select *
   from tbl_emp_dept80;
  
  
   
   ------- ====== **** merge(병합) **** ====== -------
   -- 어떤 2개 이상의 테이블에 존재하는 데이터를 다른 테이블 한곳으로 모으는 것(병합)이다.
   
   
   ------ *** 데이터베이스 링크(database link) 만들기 *** -------
   0. DB서버가 될 컴퓨터에서는 제어판-방화벽-TCP포트 1521를 허용 으로 만들어야 한다.
   
   1. DB클라이언트 컴퓨터의 탐색기에서  C:\OracleXE18C\product\18.0.0\dbhomeXE\network\admin 에 간다.
   
   2. tnsnames.ora 파일을 메모장으로 연다.
   
   3. TEACHER =
      (DESCRIPTION =
        (ADDRESS = (PROTOCOL = TCP)(HOST = 211.238.142.40)(PORT = 1521))
        (CONNECT_DATA =
          (SERVER = DEDICATED)
          (SERVICE_NAME = XE)
        )
      )
     을 추가한다.
     HOST = 211.238.142.40 이 연결하고자 하는 원격지 오라클서버의 IP 주소이다.
     그런데 전제조건은 원격지 오라클서버(211.238.142.40)의 방화벽에서 포트번호 1521 을 허용으로 만들어주어야 한다.
     
     그리고 TEACHER 를 'Net Service Name (네트서비스명)' 이라고 부른다.
     
  4. 명령프롬프트를 열어서 원격지 오라클서버(211.238.142.40)에 연결이 가능한지 테스트를 한다.
     C:\Users\sist>tnsping TEACHER 5
     
     별칭 분석을 위해 TNSNAMES 어댑터 사용
    (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = 211.238.142.40)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = XE)))에 접속하려고 시도하는 중
     확인(0밀리초)
     확인(30밀리초)
     확인(20밀리초)
     확인(10밀리초)
     확인(30밀리초)
     
     
  5. 데이터베이스 링크(database link) 만들기  
  
    -- drop database link teacherServer; 
    -- Database link TEACHERSERVER이(가) 삭제되었습니다.
  
    create database link teacherServer
    connect to hr identified by aclass 
    using 'TEACHER';
    -- Database link TEACHERSERVER이(가) 생성되었습니다.
    
    -- 이때 hr 과 암호 aclass 는 연결하고자 하는 원격지 오라클서버(211.238.142.40)의 계정명과 암호이다. 
    -- using 다음에 나오는 'TEACHER' 은 tnsnames.ora 파일에서 추가해준 'Net Service Name (네트서비스명)' 이다.
    
    select *
    from employees
    order by employee_id asc;
    
    update employees set first_name = '광빈', last_name = '황'
    where employee_id = 100; -- Steven	King
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
  
    select *
    from employees   -- 로컬서버
    order by employee_id asc; 
    
    select *
    from employees@teacherServer -- 원격지 오라클서버(211.238.142.40)
    order by employee_id asc; 
     
     
    ---- *** 생성되어진 데이터베이스 링크를 조회해봅니다. *** ----
    select *
    from user_db_links;
    /*
      ------------------------------------------------------------
       DB_LINK          USERNAME    PASSWORD   HOST      CREATED
      -----------------------------------------------------------
      TEACHERSERVER	    HR		    (NULL)     TEACHER	 22/07/11
                                            -- TEACHER 는 C:\OracleXE18C\product\18.0.0\dbhomeXE\network\admin\tnsnames.ora 파일에 존재하는 Net Service Name (네트서비스명) 이다.
    */
   
    ---- *** 데이터베이스 링크 삭제하기 *** ----
    drop database link teacherServer; 
    -- Database link TEACHERSERVER이(가) 삭제되었습니다.
    
    
    -- 각 지점 DB서버에서 tbl_reservation_hwanggwangbin 이라는 테이블을 생성한다.
    create table tbl_reservation_hwanggwangbin
    (rsvno       varchar2(20)    -- 예약고유번호
    ,memberid    varchar2(20)    -- 회원ID
    ,ticketcnt   number          -- 티켓개수
    ,constraint PK_tbl_reservation_seoyounghak primary key(rsvno)
    );
    -- Table TBL_RESERVATION_HWANGGWANGBIN이(가) 생성되었습니다.
    
    insert into tbl_reservation_seoyounghak(rsvno, memberid, ticketcnt)
    values('hwanggwangbin001', '황광빈', 2);
    
    commit;
    
    select * 
    from tbl_reservation_hwanggwangbin; -- 각 지점 DB서버(여러분들)에서 하는 것입니다.
    
    
    -- 아래는 본점 DB서버(쌤PC)에서만 하는 것이다.
    /*
    create table tbl_reservation_merge
    (rsvno       varchar2(20)    -- 예약고유번호
    ,memberid    varchar2(20)    -- 회원ID
    ,ticketcnt   number          -- 티켓개수
    ,constraint PK_tbl_reservation_merge primary key(rsvno)
    );
    -- Table TBL_RESERVATION_MERGE이(가) 생성되었습니다.
    
    select *
    from tbl_reservation_merge; -- 본점 DB서버(쌤)에서 하는 것 입니다.
    */
    select *
    from tbl_reservation_merge@teacherServer; -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
    
    select * 
    from tbl_reservation_seoyounghak; -- 각 지점 DB서버(여러분들)에서 하는 것입니다.
    
    
    -- 아래는 각 지점 DB서버(여러분들)에서 하는 것입니다.
    merge into tbl_reservation_merge@teacherServer R 
    using tbl_reservation_hwanggwangbin L 
    on (L.rsvno = R.rsvno)
    when matched then
         update set R.memberid = L.memberid
                  , R.ticketcnt = L.ticketcnt
    when not matched then 
         insert(rsvno, memberid, ticketcnt) values(L.rsvno, L.memberid, L.ticketcnt);
    -- 1 행 이(가) 병합되었습니다.
    
    commit;  -- 각 지점 DB서버(여러분들)에서 하는 것입니다.
    -- 커밋 완료.
   
    -- rollback;
    
    select *
    from tbl_reservation_merge@teacherServer; -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
  
    select * 
    from tbl_reservation_hwanggwangbin; -- 각 지점 DB서버(여러분들)에서 하는 것입니다.
   
    update tbl_reservation_hwanggwangbin set memberid = 'Hwang G.B', ticketcnt = 77
    where rsvno = 'hwanggwangbin001';  -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
    -- 1 행 이(가) 업데이트되었습니다.
    
    commit;  -- 각 지점 DB서버(여러분들)에서 하는 것입니다.
    -- 커밋 완료.
    
    insert into tbl_reservation_hwanggwangbin(rsvno, memberid, ticketcnt)
    values('hwanggwangbin002', '황광빈_77', 77); -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
    -- 1 행 이(가) 삽입되었습니다.
    
    commit; -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
               
    select * 
    from tbl_reservation_hwanggwangbin; -- 각 지점 DB서버(여러분들)에서 하는 것입니다.
   
    select *
    from tbl_reservation_merge@teacherServer; -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
    
    
    -- 아래는 각 지점 DB서버(여러분들)에서 하는 것입니다.
    merge into tbl_reservation_merge@teacherServer R 
    using tbl_reservation_hwanggwangbin L 
    on (L.rsvno = R.rsvno)
    when matched then
         update set R.memberid = L.memberid
                  , R.ticketcnt = L.ticketcnt
    when not matched then 
         insert(rsvno, memberid, ticketcnt) values(L.rsvno, L.memberid, L.ticketcnt);
    -- 2개 행 이(가) 병합되었습니다.
    
    commit; -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
    
    select * 
    from tbl_reservation_hwanggwangbin; -- 각 지점 DB서버(여러분들)에서 하는 것입니다.
   
    select *
    from tbl_reservation_merge@teacherServer; -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
    
    
    
    -------- **** 데이터 질의어(DQL == Data Query Language) **** ---------
    --> DQL 은 select 를 말한다.
    
    
    
    -------- **** 트랜잭션 제어어(TCL == Transaction Control Language) **** ---------
    --> TCL 은 commit, rollback 을 말한다.
    
   -- *** Transaction(트랜잭션) 처리 *** --
   --> Transaction(트랜잭션)이라 함은 관련된 일련의 DML로 이루어진 한꾸러미(한세트)를 말한다.
   --> Transaction(트랜잭션)이라 함은 데이터베이스의 상태를 변환시키기 위하여 논리적 기능을 수행하는 하나의 작업단위를 말한다. 
   /*
      예>   네이버카페(다음카페)에서 활동
            글쓰기(insert)를 1번하면 내포인트 점수가 10점이 올라가고(update),
            댓글쓰기(insert)를 1번하면 내포인트 점수가 5점이 올라가도록 한다(update)
           
           위와같이 정의된 네이버카페(다음카페)에서 활동은 insert 와 update 가 한꾸러미(한세트)로 이루어져 있는 것이다.
           이와 같이 서로 다른 DML문이 1개의 작업을 이룰때 Transaction(트랜잭션) 처리라고 부른다.
           
           Transaction(트랜잭션) 처리에서 가장 중요한 것은 
           모든 DML문이 성공해야만 최종적으로 모두 commit 을 해주고,
           DML문중에 1개라도 실패하면 모두 rollback 을 해주어야 한다는 것이다. 
           
           예를 들면 네이버카페(다음카페)에서 글쓰기(insert)가 성공 했다라면
           그 이후에 내포인트 점수가 10점이 올라가는(update) 작업을 해주고, update 작업이 성공했다라면
           commit 을 해준다. 
           만약에 글쓰기(insert) 또는 10점이 올라가는(update) 작업이 실패했다라면
           rolllback 을 해준다.
           이러한 실습은 자바에서 하겠습니다.
   */
   
   
   
   
   ------ ***** ==== ROLLBACK TO SAVEPOINT ==== ***** ------
   ------ ***** 특정 시점까지 rollback 을 할 수 있습니다. ***** ------
   
   select *
   from employees
   where department_id = 50;
   
   update employees set first_name = '몰라'
   where department_id = 50;
   -- 45개 행 이(가) 업데이트되었습니다.
   
   savepoint point_1;
   -- Savepoint이(가) 생성되었습니다.
   
   delete from employees
   where department_id is null;
   -- 1 행 이(가) 삭제되었습니다.
   
   select first_name
   from employees
   where department_id = 50;
   -- 전부다 '몰라' 로 나온다.
   
   select * 
   from employees
   where department_id is null;
   -- 행이 없다.
   
   rollback to savepoint point_1;
   -- 롤백 완료.
   -- savepoint point_1; 이 선언되어진 이후로 실행된 DML문을 rollback 시킨다. 
   /*
      그러므로 
      delete from employees
      where department_id is null; 만 롤백시킨다.
   */
   
   select * 
   from employees
   where department_id is null;
   -- 행이 나온다.
   
   select first_name
   from employees
   where department_id = 50;
   -- 아직까지 전부다 '몰라' 로 나온다.
   
   rollback;  --> commit; 한 이후로 수행되어진 모든 DML문을 롤백시킨다.
   -- 롤백 완료.
   
   select first_name
   from employees
   where department_id = 50;
   -- first_name 컬럼의 값이 원상복구됨.
   
   
   
   
   ----- ==== DDL(Data Definition Language) : 데이터 정의어 ==> create, drop, alter, truncate ==== -----
   
   --> 여기서 중요한 것은 DDL 문을 실행을 하면 자동적으로 commit; 이 되어진다.
   --  즉, DDL 문은 auto commit 이다.
   
   select *
   from employees
   where employee_id = 100;
   -- salary ==> 24000
   -- email  ==> SKING
   
   update employees set salary = 54321, email = 'sfdsfsdfds'
   where employee_id = 100;
   -- 1 행 이(가) 업데이트되었습니다.
   
   create table tbl_temp
   (no    number
   ,name  varchar2(20)
   );
   -- Table TBL_TEMP이(가) 생성되었습니다.
   
   -- DDL 문을 실행했으므로 자동적으로 auto commit; 이 되어진다.
   
   select *
   from employees
   where employee_id = 100;
   
   rollback;
   -- 롤백 완료.
   
   select *
   from employees
   where employee_id = 100;
   -- 위에서 DDL문(create)을 실행했으므로 자동적으로 commit; 이 되었기 때문에 rollback 안 됨.
   
   select *
   from user_db_links;
   
   select * 
   from employees@TEACHERSERVER;
   
   update employees set first_name = 'Steven' , last_name = 'King', email = 'SKING', salary = 24000
   where employee_id = 100;
   
   commit;
   
   select * 
   from employees;
   
   update employees LE set first_name = (select first_name from employees@TEACHERSERVER where employee_id = LE.employee_id)
                         , last_name = (select last_name from employees@TEACHERSERVER where employee_id = LE.employee_id)
                         , salary = (select salary from employees@TEACHERSERVER where employee_id = LE.employee_id); 
   
   commit;
   
   select * 
   from employees;
   
   
   
   ------ ====== **** TRUNCATE table 테이블명; **** ====== ------  
   --> TRUNCATE table 테이블명; 을 실행하면 테이블명 에 존재하던 모든 행(row)들을 삭제해주고,
   --  테이블명에 해당하는 테이블은 완전초기화 가 되어진다.
   --  중요한 사실은 TRUNCATE table 테이블명; 은 DDL 문이기에 auto commit; 되어지므로 rollback 이 불가하다.
   
   --  delete from 테이블명; 을 실행하면 이것도 테이블명 에 존재하던 모든 행(row)들을 삭제해준다.
   --  이것은 DML문 이므로 rollback 이 가능하다.
   
   create table tbl_emp_copy1
   as
   select * from employees;
   -- Table TBL_EMP_COPY1이(가) 생성되었습니다.
   
   select *
   from tbl_emp_copy1;
   
   delete from tbl_emp_copy1;
   -- 107개 행 이(가) 삭제되었습니다.
   
   select count(*)
   from tbl_emp_copy1;  -- 0
   
   rollback;
   -- 롤백 완료.
   
   select count(*)
   from tbl_emp_copy1;  -- 107
   
   
   truncate table tbl_emp_copy1;
   -- Table TBL_EMP_COPY1이(가) 잘렸습니다.
   
   select *
   from tbl_emp_copy1;
   
   select count(*)
   from tbl_emp_copy1; -- 0
   
   rollback;  -- auto commit; 이 되어졌으므로 rollback 해봐야 소용없다.
   -- 롤백 완료.
   
   select *
   from tbl_emp_copy1;
   
   select count(*)
   from tbl_emp_copy1; -- 0
   
   
   ----- **** ===== 오라클 계정 생성하기 ===== **** -----
   
   --- 오라클 계정 생성을 위해서 SYS 또는 SYSTEM 으로 연결하여 작업을 해야 합니다. [SYS 시작]  ---
   show user;
   -- USER이(가) "SYS"입니다.
   
   -- c##orauser1 이라는 오라클 일반사용자 계정을 생성합니다. 암호는 aclass 라고 하겠습니다.
   create user c##orauser1 identified by aclass default tablespace users;
   -- User C##ORAUSER1이(가) 생성되었습니다.
   
   grant create session to c##orauser1;
   -- Grant을(를) 성공했습니다.
   
   -- c##orauser1 이라는 오라클 일반사용자 계정을 삭제하겠습니다.
   select *
   from dba_users;
   
   drop user c##orauser1;
   -- User C##ORAUSER1이(가) 삭제되었습니다.
   
   
   
   -- 이제 부터 오라클 계정생성시 계정명앞에 c## 붙이지 않고 생성하도록 하겠다.
   alter session set "_ORACLE_SCRIPT"=true;
   -- Session이(가) 변경되었습니다.
   
   create user orauser1 identified by aclass default tablespace users;
   -- User ORAUSER1이(가) 생성되었습니다.
      
   
   --- **** === DCL(Data Control Language) : 데이터 제어어 ==> grant, revoke === **** ----    
   --           DCL(Data Control Language)문은 자동 commit( Auto commit) 이므로 rollback 이 불가하다.
   
   --  grant 는 권한을 부여하는 명령어이고, revoke 는 부여하였던 권한을 뺐는 명령어이다.
   
   grant create session to orauser1; 
   --  orauser1 이라는 오라클 사용자에게 오라클서버에 접속이 가능하도록 하는 권한을 부여해주는 것이다.
   -- Grant을(를) 성공했습니다.
   
   revoke create session from orauser1;
   --  orauser1 이라는 오라클 사용자에게 부여하였던 오라클서버에 접속할 수 있는 권한을 취소하는 것이다.
   -- Revoke을(를) 성공했습니다.
   
   
   drop user orauser1 cascade;
   -- User ORAUSER1이(가) 삭제되었습니다.
   /*
      데이터베이스에서 객체라 함은 ==> create 되어진 테이블, 뷰, 인덱스, 시퀀스, 프로시저, 함수 등등을 말한다.
      orauser1 이라는 사용자 계정을 삭제하기 위한 전제조건은 orauser1 로 생성되어진 객체가 존재하지 않을때 이다.
      그런데 모든 객체를 제거하기에는 너무나 불편하다. 그래서 cascade 라는 옵션을 주면
      orauser1 로 생성되어진 모든 객체를 먼저 제거해주고 나서 orauser1 이라는 사용자 계정을 지우는 것이다.
   */
   
   
   -- orauser1 이라는 오라클 일반사용자 계정을 생성합니다. 암호는 aclass 라고 하겠습니다.
   create user orauser1 identified by aclass default tablespace users;
   -- User ORAUSER1이(가) 생성되었습니다.
   
   -- 위에서 생성되어진 orauser1 이라는 오라클 일반사용자 계정에게 오라클서버에 접속이 되어지고, 테이블 등등을 생성할 수 있도록 여러가지 권한을 부여해주겠습니다. 
   grant connect, resource, create view, unlimited tablespace to orauser1;
   -- Grant을(를) 성공했습니다.
   
   --- 오라클 계정 생성을 위해서 SYS 또는 SYSTEM 으로 연결하여 작업을 해야 합니다. [SYS 끝]  ---
   
   
   
   --- **** 아래의 작업은 다시 HR로 연결해서 하는 것이다. **** ---
   show user;
   -- USER이(가) "HR"입니다.
   
   select *
   from HR.employees;
   
   select *
   from employees;
   -- 현재 오라클 서버에 접속된 사용자가 HR 이므로 HR.employees 대신에 employees 을 쓰면 HR.employees 으로 인식해준다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select 할 수 있도록 권한을 부여해주겠습니다.
   grant select on employees to orauser1;
   -- Grant을(를) 성공했습니다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 update 할 수 있도록 권한을 부여해주겠습니다.
   grant update on employees to orauser1;
   -- Grant을(를) 성공했습니다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 delete 할 수 있도록 권한을 부여해주겠습니다.
   grant delete on employees to orauser1;
   -- Grant을(를) 성공했습니다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 delete 할 수 있도록 부여해준 권한을 회수하겠습니다.
   revoke delete on employees from orauser1;
   -- Revoke을(를) 성공했습니다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 update 할 수 있도록 부여해준 권한을 회수하겠습니다.
   revoke update on employees from orauser1;
   -- Revoke을(를) 성공했습니다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select 할 수 있도록 부여해준 권한을 회수하겠습니다.
   revoke select on employees from orauser1;
   -- Revoke을(를) 성공했습니다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select, update, delete 할 수 있도록 권한을 부여해주겠습니다.
   grant select, update, delete on employees to orauser1;
   -- Grant을(를) 성공했습니다.
   
   
   -- orauser1 에게 HR이 자신의 소유인 employees 테이블에 대해 select, update, delete 할 수 있도록 부여해준 권한을 회수하겠습니다.
   revoke select, update, delete on employees from orauser1;
   -- Revoke을(를) 성공했습니다.
   
   
   
   
   
   
  
             ------- **** ==== 시퀀스(sequence) ==== **** -------
             
  -- 시퀀스(sequence)란? 쉽게 생각하면 은행에서 발급해주는 대기번호표 와 비슷한 것이다.
  -- 시퀀스(sequence)는 숫자로 이루어져 있으며 매번 정해진 증가치 만큼 숫자가 증가되어지는 것이다.
  
  /*
     create sequence seq_yeyakno   -- seq_yeyakno 은 시퀀스(sequence) 이름이다.
     start with 1                  -- 첫번째 출발은 1 부터 한다.
     increment by 1                -- 증가치 값    2 3 4 5 ......
     maxvalue 5                    -- 최대값이 5 이다.
  -- nomaxvalue                    -- 최대값이 없는 무제한. 계속 증가시키겠다는 말이다.
     minvalue 2                    -- 최소값이 2 이다. cycle 이 있을때만 minvalue 에 주어진 값이 사용된다. 
                                   --                nocycle 일 경우에는 minvalue 에 주어진 값이 사용되지 않는다.
                                   -- minvalue 숫자 에 해당하는 숫자 값은 start with 숫자 에 해당하는 숫자 값과 같든지 
                                   -- 아니면 start with 숫자 에 해당하는 숫자보다 작아야 한다.
                     
  -- nominvalue                    -- 최소값이 없다.   
     cycle                         -- 반복을 한다.
  -- nocycle                       -- 반복이 없는 직진.
     nocache;
  */ 
   
   create sequence seq_yeyakno_1
   start with 1          -- 첫번째 출발은 1 부터 한다.
   increment by 1        -- 증가치는 1 이다. 즉, 1씩 증가한다.
   maxvalue 5            -- 최대값이 5 이다.
   minvalue 2            -- 최소값이 2 이다.
   cycle                 -- 반복을 한다.
   nocache;
   /*
   오류 보고 -
   ORA-04006: START WITH 에 MINVALUE 보다 작은 값은 지정할 수 없습니다

   minvalue 숫자 에 해당하는 숫자 값은 start with 숫자 에 해당하는 숫자 값과 같든지 
   또는 start with 숫자 에 해당하는 숫자보다 작아야 한다.
*/

   create sequence seq_yeyakno_1
   start with 2          -- 첫번째 출발은 2 부터 한다.
   increment by 1        -- 증가치는 1 이다. 즉, 1씩 증가한다.
   maxvalue 5            -- 최대값이 5 이다.
   minvalue 1            -- 최소값이 2 이다.
   cycle                 -- 반복을 한다.
   nocache;
   -- 2(start with) 3 4 5(maxvalue) 1(minvalue) 2 3 4 5(maxvalue) 1(minvalue) 2 3 4 5(maxvalue) 1(minvalue) 2 3 4 5 
   -- Sequence SEQ_YEYAKNO_1이(가) 생성되었습니다.
   
   
   create table tbl_board_test_1
   (boardno         number
   ,subject         varchar2(100)
   ,registerdate    date default sysdate
   );
   -- Table TBL_BOARD_TEST_1이(가) 생성되었습니다.
     
   insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '첫번째 글입니다.');
   -- 1 행 이(가) 삽입되었습니다.
   -- seq_yeyakno_1 시퀀스의 start 값이 2 이었다.
     
   insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '두번째 글입니다.');
   -- 1 행 이(가) 삽입되었습니다.
   -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
     
     insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '세번째 글입니다.');
     -- 1 행 이(가) 삽입되었습니다.
     -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
     
     insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '네번째 글입니다.');
     -- 1 행 이(가) 삽입되었습니다.
     -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
     -- seq_yeyakno_1 시퀀스의 maxvalue 값이 5 이었고, cycle 이었다. 즉, 반복을 한다.
     
     insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '다섯번째 글입니다.');
     -- 1 행 이(가) 삽입되었습니다.
     -- seq_yeyakno_1 시퀀스의 minvalue 값이 1 이었고, cycle(반복) 이었으므로
     -- maxvalue 값이 사용되어진 다음에 들어오는 시퀀스 값은 minvalue 값인 1 이 들어온다.
     
     insert into tbl_board_test_1(boardno, subject) values(seq_yeyakno_1.nextval, '여섯번째 글입니다.');
     -- 1 행 이(가) 삽입되었습니다.
     -- seq_yeyakno_1 시퀀스의 increment 값이 1 이었다.
     
     commit;
     
     select *
     from tbl_board_test_1;
   
   
   create sequence seq_yeyakno_2
   start with 1          -- 첫번째 출발은 1 부터 한다.
   increment by 1        -- 증가치는 1 이다. 즉, 1씩 증가한다.
   nomaxvalue            -- 최대값이 없는 무제한. 계속 증가시키겠다는 말이다.
   nominvalue            -- 최소값이 없다.
   nocycle               -- 반복을 안한다.
   nocache;
   -- Sequence SEQ_YEYAKNO_2이(가) 생성되었습니다.
   
   create table tbl_board_test_2
   (boardno         number
   ,subject         varchar2(100)
   ,registerdate    date default sysdate
   );
   -- Table TBL_BOARD_TEST_2이(가) 생성되었습니다.
     
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '첫번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '두번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '세번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '네번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '다섯번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '여섯번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '일곱번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '여덟번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '아홉번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '열번째 글입니다.');
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '열한번째 글입니다.');
     
   commit;
   
   select *
   from tbl_board_test_2;
   
   
   ---- ***  생성되어진 시퀀스(sequence) 정보를 조회하고자 합니다. *** ----
   select *
   from user_sequences;
   
   ---- *** 시퀀스 SEQ_YEYAKNO_1 이 마지막으로 사용되어진 값을 알고자 한다. *** ----
   select SEQ_YEYAKNO_1.currval
   from dual;  -- 2 
   
   ---- *** 시퀀스 SEQ_YEYAKNO_2 이 마지막으로 사용되어진 값을 알고자 한다. *** ----
   select SEQ_YEYAKNO_2.currval
   from dual;  -- 11 
   
   
   ---- *** 시퀀스 SEQ_YEYAKNO_2 에 다음에 들어올 값을 조회하고자 한다. *** ----
   -- 틀린풀이
   select SEQ_YEYAKNO_2.nextval   -- 이것은 시퀀스 SEQ_YEYAKNO_2 값을 써버리는 것이다.
   from dual;  -- 12
   
   select SEQ_YEYAKNO_2.nextval   -- 이것은 시퀀스 SEQ_YEYAKNO_2 값을 써버리는 것이다.
   from dual;  -- 13
   
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '서교밥집(5000원에 모십니다)');
   -- 14	서교밥집(5000원에 모십니다)	22/07/12
   commit;
   -- 커밋 완료.
   
   select *
   from tbl_board_test_2;
   
   
   ---- *** 시퀀스 SEQ_YEYAKNO_2 에 다음에 들어올 값을 조회하고자 한다. *** ----
   -- 올바른풀이 
   select last_number
   from user_sequences
   where sequence_name = 'SEQ_YEYAKNO_2';
   -- 15 
   
   insert into tbl_board_test_2(boardno, subject) values(seq_yeyakno_2.nextval, '강아지와 친해요~');
   -- 15	강아지와 친해요~	22/07/12
   commit;
   
   select *
   from tbl_board_test_2;
   
   
   --- **** 시퀀스 SEQ_YEYAKNO_1 삭제하기 **** ---
   select *
   from user_sequences;
   
   drop sequence seq_yeyakno_1;
   -- Sequence SEQ_YEYAKNO_1이(가) 삭제되었습니다.
   
   
   
   
   
   ------ ===== **** 시노님(Synonym, 동의어) **** ===== -------
   
   -- 테이블명이 아주 길때 테이블명을 짧게 만들어서 사용하고자 할때 사용되는 것이 시노님(Synonym, 동의어)이다.
   
    select *
    from tbl_reservation_merge@teacherServer; -- 각 지점 DB서버(여러분들)에서 하는 것 입니다.
    
    create or replace synonym tbl_bon_merge for tbl_reservation_merge@teacherServer;
    -- Synonym TBL_BON_MERGE이(가) 생성되었습니다.
    -- tbl_bon_merge 이 시노님(Synonym, 동의어) 이고, for 다음에 나오는 tbl_reservation_merge@teacherServer 이 원래 이름이다.
    
    select *
    from tbl_bon_merge;
    
    ---- **** 생성되어진 시노님(Synonym, 동의어)을 조회해봅니다. **** ----
    select * 
    from  user_synonyms;
    
    
    ---- **** 시노님(Synonym, 동의어) 삭제하기 **** ----
    drop synonym tbl_bon_merge;
    -- Synonym TBL_BON_MERGE이(가) 삭제되었습니다.
   
   
   
   
   
   
    --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ---
   --------------------------------------------------------------------------------
   --- === Constraint(제약조건)을 사용하여 테이블을 생성해 보겠습니다. === ---
   
   /*
     >>>> 제약조건(Constraint)의 종류 <<<<
     
     --   제약조건의 이름은 오라클 전체에서 고유해야 한다.
     
     1. Primary Key(기본키, 대표식별자) 제약 [P]  -- 하나의 테이블당 오로지 1개만 생성할 수 있다.
                                               -- 어떤 컬럼에 Primary Key(기본키) 제약을 주면 그 컬럼에는 자동적으로 NOT NULL 이 주어지면서 동시에 그 컬럼에는 중복된 값은 들어올 수 없고 오로지 고유한 값만 들어오게 되어진다.
                                               -- 컬럼 1개를 가지고 생성된 Primary Key 를 Single Primary Key 라고 부르고,
                                               -- 컬럼 2개 이상을 가지고 생성된 Primary Key 를 Composite(복합) Primary Key 라고 부른다.
     
     2. Unique 제약 [U]              -- 하나의 테이블당 여러개를 생성할 수 있다.                                 
                                    -- 어떤 컬럼에 Unique 제약을 주면 그 컬럼에는 NULL 을 허용할 수 있으며, 그 컬럼에는 중복된 값은 들어올 수 없고 오로지 고유한 값만 들어오게 되어진다.             
                                    -- Unique Key 중에 후보키, 후보식별자가 되려면 해당 컬럼은 NOT NULL 이어야 한다. 
  
     3. Foreign Key(외래키) 제약 [R]  -- 하나의 테이블당 여러개를 생성할 수 있다. 
                                     -- Foreign Key(외래키) 제약에 의해 참조(Reference)받는 컬럼은 반드시 NOT NULL 이어야 하고, 중복된 값을 허락하지 않는 고유한 값만 가지는 컬럼이어야 한다. 
                                     
     4. Check 제약 [C]               -- 하나의 테이블당 여러개를 생성할 수 있다.
                                    -- insert(입력) 또는 update(수정) 시 어떤 컬럼에 입력되거나 수정되는 데이터값을 아무거나 허락하는 것이 아니라 조건에 맞는 데이터값만 넣고자 할 경우에 사용되는 것이다.
  
     5. NOT NULL 제약 [C]            -- 하나의 테이블당 여러개를 생성할 수 있다.
                                    -- 특정 컬럼에 NOT NULL 제약을 주면 그 컬럼에는 반드시 데이터값을 주어야 한다는 말이다. 
  */
   

   ----- >>>> Primary Key(기본키, 대표식별자) 제약[P] 및 Unique 제약[U] 에 대해서 알아봅니다. <<<< -----
   
   ---- **** "회원" 이라는 테이블을 생성해 보겠습니다. **** ----
   select * from tab;
   
   -- drop table tbl_new_member purge;
   
   create table tbl_new_member
   ( member_id   varchar2(20)             -- 아이디
   , passwd      varchar2(20)  not null   -- 비밀번호
   , name        Nvarchar2(10) not null   -- 성명
   , email       varchar2(50)  not null   -- 이메일
   , mobile      varchar2(11)             -- 휴대폰 
   ,constraint PK_tbl_new_member_member_id primary key(member_id)  -- Single Primary Key
   -- 참고로 ORACLE 11g 에서는 객체명은 최대글자수가 30글자 이다. 그래서 ORACLE 11g 에서 30글자가 넘으며 오류이다.!!
   -- ORACLE 18C 에서는 객체명의 글자수 제한이 없다.
   ,constraint UQ_tbl_new_member_email unique(email)
   ,constraint UQ_tbl_new_member_mobile unique(mobile)
   );
   -- Table TBL_NEW_MEMBER이(가) 생성되었습니다.
   
   desc tbl_new_member;
/*
    이름        널?       유형            
    --------- -------- ------------- 
    MEMBER_ID NOT NULL VARCHAR2(20)  
    PASSWD    NOT NULL VARCHAR2(20)  
    NAME      NOT NULL NVARCHAR2(10) 
    EMAIL     NOT NULL VARCHAR2(50)  
    MOBILE             VARCHAR2(11)
*/
   
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values(null, 'qwer1234$', '이순신', 'leess@naver.com', null);
/*
    오류 보고 -
    ORA-01400: NULL을 ("HR"."TBL_NEW_MEMBER"."MEMBER_ID") 안에 삽입할 수 없습니다
*/
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('leess', 'qwer1234$', '이순신', 'leess@naver.com', null);
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('leess', 'qwer1234$', '이삼순', 'leess@naver.com', null);
   /*
     오류 보고 -
     ORA-00001: 무결성 제약 조건(HR.PK_TBL_NEW_MEMBER_MEMBER_ID)에 위배됩니다
   */
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('leesamsun', 'qwer1234$', '이삼순', 'leess@naver.com', null);
   /*
    오류 보고 -
    ORA-00001: 무결성 제약 조건(HR.UQ_TBL_NEW_MEMBER_EMAIL)에 위배됩니다
   */
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('leesamsun', 'qwer1234$', '이삼순', 'leess@daum.net', null);
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_member;
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('eomjh', 'qwer1234$', '엄정화', null, '01023456789');
   /*
     오류 보고 -
     ORA-01400: NULL을 ("HR"."TBL_NEW_MEMBER"."EMAIL") 안에 삽입할 수 없습니다
   */
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('eomjh', 'qwer1234$', '엄정화', 'eomjh@gmail.com', '01023456789');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_member;
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('kangkc', 'qwer1234$', '강감찬', 'kangkc@gmail.com', '01023456789');
 /*
    오류 보고 -
    ORA-00001: 무결성 제약 조건(HR.UQ_TBL_NEW_MEMBER_MOBILE)에 위배됩니다
 */
 
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('kangkc', 'qwer1234$', '강감찬', 'kangkc@gmail.com', '01077778888');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('junghwa', 'qwer1234$', '엄정화', 'junghwa@gmail.com', '01055559999');
   -- 일부러 동명이인을 입력함.
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_member;
   
   
   ---- *** Composite(복합) Primary Key 예제 *** ----
   -- drop table tbl_new_jumun purge;
   
   create table tbl_new_jumun   -- '주문' 테이블
   (member_id   varchar2(20) not null            -- 회원아이디
   ,product_id  varchar2(50) not null            -- 제품아이디
   ,jumun_date  date default sysdate not null    -- 주문일자
   ,jumun_qty   number not null                  -- 주문량
   ,constraint PK_tbl_new_jumun primary key(member_id, product_id, jumun_date)  -- Composite(복합) Primary Key
   );
   -- Table TBL_NEW_JUMUN이(가) 생성되었습니다.
   
   insert into tbl_new_jumun(member_id, product_id, jumun_date, jumun_qty)
   values('leess', '새우깡', default, 10);
   
   insert into tbl_new_jumun(member_id, product_id, jumun_date, jumun_qty)
   values('leess', '감자깡', default, 10);
   
   insert into tbl_new_jumun(member_id, product_id, jumun_date, jumun_qty)
   values('leess', '새우깡', default, 20);
   
   commit;
   
   select *
   from tbl_new_jumun;
   
   
   
   
   ----- >>>> Foreign Key(외래키) 제약 [R] 에 대해서 알아봅니다. <<<< -----
   select *
   from tbl_new_member;
   
   -- drop table tbl_new_board purge;
   
   create table tbl_new_board
   (boardno        number  not null               -- 게시글 글번호
   ,subject        Nvarchar2(200)  not null       -- 글제목
   ,content        Nvarchar2(2000) not null       -- 글내용 
   ,registerday    date default sysdate not null  -- 작성일자 
   ,fk_member_id   varchar2(20)  not null         -- 작성자아이디
   ,constraint PK_tbl_new_board_boardno primary key(boardno)
   ,constraint FK_tbl_new_board_fk_member_id foreign key(fk_member_id) references tbl_new_member(member_id) 
    -- cascade 옵션이 없는 foreign key 이다.
   );
   -- Table TBL_NEW_BOARD이(가) 생성되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(1, '첫번째 글', '안녕하세요~ 일빠입니다.', default, 'batman');
   /*
     오류 보고 -
     ORA-02291: 무결성 제약조건(HR.FK_TBL_NEW_BOARD_NAME)이 위배되었습니다- 부모 키가 없습니다
   */
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(1, '첫번째 글', '안녕하세요~ 일빠입니다.', default, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(2, '두번째 글', '좋은 하루되세요.', default, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(3, '세번째 글', '장진영한테 존대말할까? 반말할까?', default, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_board;
   
   ------------------------------------------
    글번호   글제목    작성자명   작성일자
   ------------------------------------------
    글번호    --> tbl_new_board.boardno
    글제목    --> tbl_new_board.subject
    작성일자  --> tbl_new_board.registerday
    작성자명  --> tbl_new_member.name
    
    select  B.boardno AS 글번호
          , B.subject AS 글제목
          , M.name AS 작성자명
          , to_char(B.registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자
    from tbl_new_board B JOIN tbl_new_member M
    ON B.fk_member_id = M.member_id
    order by 1 desc;
   
   
   
   -------- **** ==== !!!!!  Foreign Key 생성시 on delete cascade 옵션을 주는 것 !!!! ==== **** -------
   
   -- drop table tbl_new_comment purge;
   
   create table tbl_new_comment    -- 게시글테이블에 대한 댓글테이블
   (commentno         number not null                -- 댓글번호
   ,comment_content   Nvarchar2(2000) not null       -- 댓글내용
   ,registerday       date default sysdate not null  -- 댓글작성일자 
   ,fk_boardno        number not null                -- 게시글의 원글번호
   ,fk_member_id      varchar2(20) not null          -- 댓글작성자아이디
   ,constraint PK_tbl_new_comment_commentno primary key(commentno)
   ,constraint FK_tbl_new_comment_fk_boardno foreign key(fk_boardno) references tbl_new_board(boardno)
   ,constraint FK_tbl_new_comment_fk_member_id foreign key(fk_member_id) references tbl_new_member(member_id)
   );
   -- Table TBL_NEW_COMMENT이(가) 생성되었습니다.
   
   select *
   from tbl_new_board;
   
   select *
   from tbl_new_comment;
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(1, '댓글내용 입니다.', default, 1, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(2, '두번째 댓글내용 입니다.', default, 1, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(3, '이것은 댓글입니다', default, 5, 'leess');
   /*
    오류 보고 -
    ORA-02291: 무결성 제약조건(HR.FK_TBL_NEW_COMMENT_FK_BOARDNO)이 위배되었습니다- 부모 키가 없습니다
   */
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(3, '이것은 댓글입니다', default, 3, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_comment;
   -- 현재는 원게시글 1번글, 3번글에 대한 댓글이 있습니다.
   
   
   --- 게시글(tbl_new_board) 테이블에서 특정글을 삭제(delete)하겠습니다. ---
   select * 
   from tbl_new_board;
   
   delete tbl_new_board
   where boardno = 2; -- 원게시글 2번글을 삭제한다.
   -- 1 행 이(가) 삭제되었습니다.
   
   delete tbl_new_board
   where boardno = 1; -- 원게시글 1번글을 삭제한다.
   /*
    오류 보고 -
    ORA-02292: 무결성 제약조건(HR.FK_TBL_NEW_COMMENT_FK_BOARDNO)이 위배되었습니다- 자식 레코드가 발견되었습니다
   */
   
   rollback;
   
   delete from tbl_new_comment
   where fk_boardno = 1;
   -- 2개 행 이(가) 삭제되었습니다.
   
   select *
   from tbl_new_comment;
   -- fk_boardno 컬럼에 1 번글이 없습니다.
   
   delete tbl_new_board
   where boardno = 1; -- 원게시글 1번글을 삭제한다.
   -- 1 행 이(가) 삭제되었습니다.
   
   select * 
   from tbl_new_board;
   
   rollback;
  
   ---------------------------------------------------------------------------
   
   drop table tbl_new_comment purge;
   -- Table TBL_NEW_COMMENT이(가) 삭제되었습니다.
   
   create table tbl_new_comment    -- 게시글테이블에 대한 댓글테이블
   (commentno         number not null                -- 댓글번호
   ,comment_content   Nvarchar2(2000) not null       -- 댓글내용
   ,registerday       date default sysdate not null  -- 댓글작성일자 
   ,fk_boardno        number not null                -- 게시글의 원글번호
   ,fk_member_id      varchar2(20) not null          -- 댓글작성자아이디
   ,constraint PK_tbl_new_comment_commentno primary key(commentno)
   ,constraint FK_tbl_new_comment_fk_boardno foreign key(fk_boardno) references tbl_new_board(boardno) on delete cascade 
   -- 부모 테이블인 tbl_new_board 테이블에 어떤 행을 삭제할 시, 먼저 자식 테이블인 tbl_new_comment 테이블에 자식 행(레코드)이 있다라면 
   -- 먼저 자식 테이블인 tbl_new_comment 테이블에 자식 행(레코드)을 삭제해주겠다는 말이다.
   
   ,constraint FK_tbl_new_comment_fk_member_id foreign key(fk_member_id) references tbl_new_member(member_id)
   );
   -- Table TBL_NEW_COMMENT이(가) 생성되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(1, '댓글내용 입니다.', default, 1, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(2, '두번째 댓글내용 입니다.', default, 1, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(3, '이것은 댓글입니다', default, 3, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_comment; -- 자식 테이블
   
   select * 
   from tbl_new_board; -- 부모 테이블
   
   delete from tbl_new_board
   where boardno = 1;
   -- 1 행 이(가) 삭제되었습니다.
   
   select *
   from tbl_new_comment;  -- fk_boardno 컬럼에 1 번글이 있던것이 자동적으로 삭제 되어졌다.
   
   select * 
   from tbl_new_board;
   
   rollback;
   
   --------------------------------------------------------------
   select *
   from tbl_new_member;
   
   delete from tbl_new_member
   where member_id = 'leesamsun';
   
   delete from tbl_new_member
   where member_id = 'leess';
   
   rollback;
   -------------------------------------------------------------------------------------------------
     
   
   
   -------- **** ==== !!!!!  Foreign Key 생성시 on delete set null 옵션을 주는 것 !!!! ==== **** -------
   delete from tbl_new_member
   where member_id = 'leess';
   /*
     오류 보고 -
     ORA-02292: 무결성 제약조건(HR.FK_TBL_NEW_BOARD_FK_MEMBER_ID)이 위배되었습니다- 자식 레코드가 발견되었습니다
   */
   
   select *
   from tbl_new_board;
   
   desc tbl_new_board;
   
   alter table tbl_new_board
   modify fk_member_id null;
   -- Table TBL_NEW_BOARD이(가) 변경되었습니다.
   
   desc tbl_new_board;
   
   update tbl_new_board set fk_member_id = null
   where fk_member_id = 'leess';
   -- 2개 행 이(가) 업데이트되었습니다.
   
   delete from tbl_new_member
   where member_id = 'leess';
   /*
     오류 보고 -
     ORA-02292: 무결성 제약조건(HR.FK_TBL_NEW_COMMENT_FK_MEMBER_ID)이 위배되었습니다- 자식 레코드가 발견되었습니다
   */
   
   select *
   from tbl_new_comment;
   
   desc tbl_new_comment;
   
   alter table tbl_new_comment
   modify fk_member_id null;
   -- Table TBL_NEW_COMMENT이(가) 변경되었습니다.
   
   update tbl_new_comment set fk_member_id = null
   where fk_member_id = 'leess';
   -- 1 행 이(가) 업데이트되었습니다.
   
   commit;
   
   delete from tbl_new_member
   where member_id = 'leess';
   -- 1 행 이(가) 삭제되었습니다.
   
   select *
   from tbl_new_member;
   
   rollback;
   
   ----------------------------------------------------------------------------
   
   drop table tbl_new_comment purge;
   -- Table TBL_NEW_COMMENT이(가) 삭제되었습니다.
   -- 테이블을 drop 할때도 자식테이블 있는 경우 부모테이블을 drop 할 수가 없습니다. 
   -- 그러므로 부모테이블과 자식테이블 모두 삭제할 경우에는 먼저 자식테이블 부터 drop 을 하고 
   -- 그 다음에 부모테이블을 drop 해야 합니다.
   
   drop table tbl_new_board purge;
   -- Table TBL_NEW_BOARD이(가) 삭제되었습니다.
   
   
   -- 테이블 생성시는 부모테이블 부터 먼저 만들고 나서 그 다음에 자식 테이블을 생성해야 합니다.
   
   create table tbl_new_board
   (boardno        number  not null               -- 게시글 글번호
   ,subject        Nvarchar2(200)  not null       -- 글제목
   ,content        Nvarchar2(2000) not null       -- 글내용 
   ,registerday    date default sysdate not null  -- 작성일자 
   ,fk_member_id   varchar2(20)                   -- 작성자아이디
   ,constraint PK_tbl_new_board_boardno primary key(boardno)
   ,constraint FK_tbl_new_board_fk_member_id foreign key(fk_member_id) references tbl_new_member(member_id) on delete set null   
   -- 부모 테이블인 tbl_new_member 테이블에서 특정 행을 삭제시 자식 테이블인 tbl_new_board 테이블에
   -- 삭제하려는 부모테이블의 행을 참조하고 있는 행이 있을시 fk_member_id 컬럼의 값을 먼저 null 로 update 하고 나서
   -- 부모 테이블인 tbl_new_member 테이블에서 특정 행을 삭제한다는 말이다.
   -- 그런데 이것을 하기 위한 전제조건은 fk_member_id 컬럼의 값은 null 을 허용해야 한다.
   );
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(1, '첫번째 글', '안녕하세요~ 일빠입니다.', default, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(2, '두번째 글', '좋은 하루되세요.', default, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(3, '세번째 글', '장진영한테 존대말할까? 반말할까?', default, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_board;
   
   delete from tbl_new_member
   where member_id = 'leess';
   -- 1 행 이(가) 삭제되었습니다.
   
   rollback;
   
   ----------------------------------------------------------------------------
   ------------------ **** 최종 **** -------------------------
   drop table tbl_new_comment purge;
   drop table tbl_new_board purge;
   drop table tbl_new_member purge;
   
   create table tbl_new_member
   ( member_id   varchar2(20)  not null          -- 아이디
   , passwd      varchar2(20)  not null          -- 비밀번호
   , name        Nvarchar2(10) not null          -- 성명
   , email       varchar2(50)  not null          -- 이메일
   , mobile      varchar2(11)                    -- 휴대폰 
   , status      number(1) default 1 not null    -- 회원의 탈퇴유무를 알려주는 용도 (1:가입중, 0:탈퇴)
   , point       number(4) default 100 not null  -- 포인트  
   , constraint PK_tbl_new_member_member_id primary key(member_id)  
   , constraint UQ_tbl_new_member_email unique(email)
   , constraint UQ_tbl_new_member_mobile unique(mobile)
   , constraint CK_tbl_new_member_status check( status in(0,1) )
   , constraint CK_tbl_new_member_point check( point between 0 and 9000 )
   );
   -- Table TBL_NEW_MEMBER이(가) 생성되었습니다.
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('leess', 'qwer1234$', '이순신', 'leess@naver.com', null);
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('eomjh', 'qwer1234$', '엄정화', 'eomjh@gmail.com', '01023456789');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_member(member_id, passwd, name, email, mobile) 
   values('kangkc', 'qwer1234$', '강감찬', 'kangkc@gmail.com', '01077778888');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_new_member;
   
   update tbl_new_member set status = 5
   where member_id = 'leess';
   /*
     오류 보고 -
     ORA-02290: 체크 제약조건(HR.CK_TBL_NEW_MEMBER_STATUS)이 위배되었습니다
   */
   
   update tbl_new_member set status = 0
   where member_id = 'leess';
   -- 1 행 이(가) 업데이트되었습니다.
   
   update tbl_new_member set status = 1
   where member_id = 'leess';
   -- 1 행 이(가) 업데이트되었습니다.
   
   update tbl_new_member set point = 9500
   where member_id = 'leess';
   /*
      오류 보고 -
      ORA-02290: 체크 제약조건(HR.CK_TBL_NEW_MEMBER_POINT)이 위배되었습니다
   */
   
   update tbl_new_member set point = 300
   where member_id = 'leess';
   -- 1 행 이(가) 업데이트되었습니다.
   
   select *
   from tbl_new_member;
    
   commit; 
   
   
   create table tbl_new_board
   (boardno        number  not null               -- 게시글 글번호
   ,subject        Nvarchar2(200)  not null       -- 글제목
   ,content        Nvarchar2(2000) not null       -- 글내용 
   ,registerday    date default sysdate not null  -- 작성일자 
   ,fk_member_id   varchar2(20)  not null         -- 작성자아이디
   ,constraint PK_tbl_new_board_boardno primary key(boardno)
   ,constraint FK_tbl_new_board_fk_member_id foreign key(fk_member_id) references tbl_new_member(member_id)
   );
   -- Table TBL_NEW_BOARD이(가) 생성되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(1, '첫번째 글', '안녕하세요~ 일빠입니다.', default, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(2, '두번째 글', '좋은 하루되세요.', default, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_board(boardno, subject, content, registerday, fk_member_id)
   values(3, '세번째 글', '장진영한테 존대말할까? 반말할까?', default, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select * 
   from tbl_new_board;
   
   
   create table tbl_new_comment    -- 게시글테이블에 대한 댓글테이블
   (commentno         number not null                -- 댓글번호
   ,comment_content   Nvarchar2(2000) not null       -- 댓글내용
   ,registerday       date default sysdate not null  -- 댓글작성일자 
   ,fk_boardno        number not null                -- 게시글의 원글번호
   ,fk_member_id      varchar2(20) not null          -- 댓글작성자아이디
   ,constraint PK_tbl_new_comment_commentno primary key(commentno)
   ,constraint FK_tbl_new_comment_fk_boardno foreign key(fk_boardno) references tbl_new_board(boardno) on delete cascade 
   ,constraint FK_tbl_new_comment_fk_member_id foreign key(fk_member_id) references tbl_new_member(member_id)
   );
   -- Table TBL_NEW_COMMENT이(가) 생성되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(1, '댓글내용 입니다.', default, 1, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(2, '두번째 댓글내용 입니다.', default, 1, 'eomjh');
   -- 1 행 이(가) 삽입되었습니다.
   
   insert into tbl_new_comment(commentno, comment_content, registerday, fk_boardno, fk_member_id)
   values(3, '이것은 댓글입니다', default, 3, 'leess');
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   
   select *
   from tbl_new_comment;
   
   select *
   from tbl_new_board;
   
   select *
   from tbl_new_member;
   
   
   ------------------------------------------
    글번호   글제목   댓글개수   작성자명   작성일자
   ------------------------------------------
    글번호    --> tbl_new_board.boardno
    글제목    --> tbl_new_board.subject
    댓글개수  --> tbl_new_comment
    작성일자  --> tbl_new_board.registerday
    작성자명  --> tbl_new_member.name
    
     3      세번째 글 [1]   이순신   2022-07-15 11:20:25
     2      두번째 글       엄정화   2022-07-15 11:18:20
     1      첫번째 글 [2]   이순신   2022-07-15 11:17:25
     
     WITH
     CMT as 
     (select fk_boardno, count(*) AS CMTCNT   
     from tbl_new_comment
     group by fk_boardno
     )
     select  BRD.boardno as 글번호
           , BRD.subject ||
             case when CMT.cmtcnt is not null then '['|| CMT.cmtcnt ||']' else '' end as 글제목        
      --   , CMT.cmtcnt  as 댓글개수
           , MBR.name  as 작성자명 
           , to_char(BRD.registerday, 'yyyy-mm-dd hh24:mi:ss') as 작성일자
     from tbl_new_board BRD LEFT JOIN CMT
     ON BRD.boardno = CMT.fk_boardno     
     JOIN tbl_new_member MBR
     ON BRD.fk_member_id = MBR.member_id
     order by 1 desc
     
     
     select *
     from tbl_new_comment   -- 댓글
     where fk_boardno = 1;
     
     
     delete from tbl_new_board -- 원게시글
     where boardno = 1;
     -- 1 행 이(가) 삭제되었습니다.
     
     select *
     from tbl_new_comment   -- 댓글
     where fk_boardno = 1;
     
     
     rollback;
     
     
     delete from tbl_new_member
     where member_id = 'leess';
     /*
       오류 보고 -
       ORA-02292: 무결성 제약조건(HR.FK_TBL_NEW_BOARD_FK_MEMBER_ID)이 위배되었습니다- 자식 레코드가 발견되었습니다
     */
     
     update tbl_new_member set status = 0
     where member_id = 'leess';
     -- 1 행 이(가) 업데이트되었습니다.
     
     select *
     from tbl_new_member;
     
select case ( select count(*)  
              from tbl_new_member
              where status = 1 and member_id = 'leess' and passwd = 'qwer1234$' ) 
       when 1 then '로그인성공'           
              else  '로그인실패'         
       end AS 로그인결과 
from dual;
   
    
select case ( select count(*)  
              from tbl_new_member
              where status = 1 and member_id = 'eomjh' and passwd = 'qwer1234$' ) 
       when 1 then '로그인성공'           
              else  '로그인실패'         
       end AS 로그인결과 
from dual;
     

select *     
from employees;   

update employees set manager_id = 9004
where employee_id = 101;
/*
오류 보고 -
ORA-02291: 무결성 제약조건(HR.EMP_MANAGER_FK)이 위배되었습니다- 부모 키가 없습니다
*/

update employees set manager_id = 102
where employee_id = 101;
-- 1 행 이(가) 업데이트되었습니다.    

rollback;
     
     
create table tbl_sawon
(sawon_no    number(4) not null
,saname      varchar2(40) not null
,manager_no  number(4) 
,constraint PK_tbl_sawon_sawonno primary key(sawon_no)
,constraint FK_tbl_sawon_manager_no foreign key(manager_no) references tbl_sawon(sawon_no)
);    
   
insert into tbl_sawon(sawon_no, saname, manager_no) values(101, '나사장', null);  
-- 1 행 이(가) 삽입되었습니다.

insert into tbl_sawon(sawon_no, saname, manager_no) values(102, '김부장', 101);  
---- 1 행 이(가) 삽입되었습니다.

insert into tbl_sawon(sawon_no, saname, manager_no) values(103, '이과장', 300); 
/*
오류 보고 -
ORA-02291: 무결성 제약조건(HR.FK_TBL_SAWON_MANAGER_NO)이 위배되었습니다- 부모 키가 없습니다
*/
 
 
 commit;  
 
 
         ---- >>>> NOT NULL 제약에 대해서 알아봅니다. <<<< -----

 desc tbl_new_member;
 
 -- tbl_new_member 테이블의 name 컬럼에 있는 NOT NULL 제약 제거하기 --
 alter table tbl_new_member
 modify name null;
 -- Table TBL_NEW_MEMBER이(가) 변경되었습니다.
 
 -- tbl_new_member 테이블의 name 컬럼에 NOT NULL 제약 추가하기 --
 alter table tbl_new_member
 modify name not null;
 -- Table TBL_NEW_MEMBER이(가) 변경되었습니다.
 
 
 -- tbl_new_member 테이블의 mobile 컬럼에 NOT NULL 제약 추가하기 --
 alter table tbl_new_member
 modify mobile not null;
 /*
   오류 보고 -
   ORA-02296: (HR.) 사용으로 설정 불가 - 널 값이 발견되었습니다.
*/
 
 select *
 from tbl_new_member
 where mobile is null;
 -- 1
 
 
 
 
  -------- ***** 제약조건 (Constraint) 조회하기 ***** -----------
  select *
  from user_constraints
  where table_name = 'TBL_NEW_MEMBER';
  -- P : primary key
  -- U : unique
  -- C : check, not null
  
  select *
  from user_constraints
  where table_name = 'TBL_NEW_BOARD';
  -- R : foreign key 
  
  select *
  from user_cons_columns
  where table_name = 'TBL_NEW_MEMBER';
  
  select *
  from user_cons_columns
  where table_name = 'TBL_NEW_BOARD';
  
  --- TBL_NEW_MEMBER 테이블에 생성된 제약조건 조회하기 ---
  select A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name,
         A.STATUS, A.index_name, B.column_name, B.position
  from user_constraints A JOIN user_cons_columns B
  on A.constraint_name = B.constraint_name
  where A.table_name = 'TBL_NEW_MEMBER';
  
  
  --- TBL_NEW_BOARD 테이블에 생성된 foreign key 제약조건 조회하기 ---
  select A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name,
         A.STATUS, A.index_name, B.column_name, B.position
  from user_constraints A JOIN user_cons_columns B
  on A.constraint_name = B.constraint_name
  where A.table_name = 'TBL_NEW_BOARD' and constraint_type = 'R';
  
  
  --- TBL_NEW_BOARD 테이블에 생성된 foreign key 제약조건 조회하기 ---
  /*
     --------------------------------------------------------------------------------------------------
     자식테이블명     제약조건명                         포린키컬렴명      부모테이블명         부모테이블의컬럼명 
     -------------------------------------------------------------------------------------------------
     TBL_NEW_BOARD  FK_TBL_NEW_BOARD_FK_MEMBER_ID    FK_MEMBER_ID    TBL_NEW_MEMBER       MEMBER_ID
     
  */
     
     select A.table_name as 자식테이블명
          , A.constraint_name as 제약조건명 
          , B.column_name as 포린키컬렴명   
          , A.r_constraint_name 
     from user_constraints A join user_cons_columns B
     on A.constraint_name = B.constraint_name
     where A.table_name = 'TBL_NEW_BOARD' and A.constraint_type = 'R'
     
     
     select *
     from user_cons_columns 
     where constraint_name = 'PK_TBL_NEW_MEMBER_MEMBER_ID';
     
     select r_constraint_name
     from user_constraints
     where table_name = 'TBL_NEW_BOARD' and constraint_type = 'R';
     
     select *
     from user_cons_columns 
     where constraint_name = ( select r_constraint_name
                               from user_constraints
                               where table_name = 'TBL_NEW_BOARD' and constraint_type = 'R' );
     
     
     WITH
     V1 AS
     (
       select A.table_name 
            , A.constraint_name 
            , B.column_name 
            , A.r_constraint_name 
       from user_constraints A join user_cons_columns B
       on A.constraint_name = B.constraint_name
       where A.table_name = 'TBL_NEW_BOARD' and A.constraint_type = 'R'
     )
     ,
     V2 AS 
     (
       select constraint_name, table_name, column_name
       from user_cons_columns 
       where constraint_name in ( select r_constraint_name
                                 from user_constraints
                                 where table_name = 'TBL_NEW_BOARD' and constraint_type = 'R' )
     )
     select V1.table_name as 자식테이블명
          , V1.constraint_name as 제약조건명  
          , V1.column_name as 포린키컬렴명
          , V2.table_name as 부모테이블명  
          , V2.column_name as 부모테이블의컬럼명 
     from V1 JOIN V2
     ON V1.r_constraint_name = V2.constraint_name;
     
     
  
   --- TBL_NEW_COMMENT 테이블에 생성된 foreign key 제약조건 조회하기 ---
   
   WITH
     V1 AS
     (
       select A.table_name 
            , A.constraint_name 
            , B.column_name   
            , A.r_constraint_name 
       from user_constraints A join user_cons_columns B
       on A.constraint_name = B.constraint_name
       where A.table_name = 'TBL_NEW_COMMENT' and A.constraint_type = 'R'
     )
     ,
     V2 AS 
     (
       select constraint_name, table_name, column_name
       from user_cons_columns 
       where constraint_name in ( select r_constraint_name
                                 from user_constraints
                                 where table_name = 'TBL_NEW_COMMENT' and constraint_type = 'R' )
     )
     select V1.table_name as 자식테이블명
          , V1.constraint_name as 제약조건명  
          , V1.column_name as 포린키컬렴명
          , V2.table_name as 부모테이블명  
          , V2.column_name as 부모테이블의컬럼명 
     from V1 JOIN V2
     ON V1.r_constraint_name = V2.constraint_name;    
 
   --------------------------------------------------------------------------
   
  create or replace procedure pcd_search_fk
  (p_table_name IN varchar2)
  is
     cursor cur_name
     is 
     WITH 
     V1 as
     (
       select A.table_name
            , A.constraint_name
            , B.column_name
            , A.r_constraint_name 
       from user_constraints A join user_cons_columns B 
       on A.constraint_name = B.constraint_name
       where A.table_name = p_table_name and A.constraint_type = 'R'
     )
     ,
     V2 as
     (
       select constraint_name, table_name, column_name 
       from user_cons_columns
       where constraint_name in ( select r_constraint_name
                                  from user_constraints
                                  where table_name = p_table_name and constraint_type = 'R' ) 
     )
     select V1.table_name  AS CHILD_TABLE_NAME
          , V1.constraint_name 
          , V1.column_name AS FK_COLUMN_NAME
          , V2.table_name  AS PARENT_TABLE_NAME
          , V2.column_name AS PARENT_COLUMN_NAME
     from V1 join V2
     on V1.r_constraint_name = V2.constraint_name;
  
  begin
  
       for v_rcd in cur_name loop
           if cur_name%rowcount = 1 then
              dbms_output.put_line( lpad('-',60,'-') );
              dbms_output.put_line( '자식테이블명   제약조건명   포린키컬럼명  부모테이블명  부모테이블의컬럼명' );
              dbms_output.put_line( lpad('-',60,'-') );
           end if;   
           
           dbms_output.put_line( v_rcd.CHILD_TABLE_NAME || '  ' || 
                                 v_rcd.constraint_name || '  ' || 
                                 v_rcd.FK_COLUMN_NAME || '  ' || 
                                 v_rcd.PARENT_TABLE_NAME || '  ' ||
                                 v_rcd.PARENT_COLUMN_NAME );
       end loop;
  
  end pcd_search_fk;
   
   -- Procedure PCD_SEARCH_FK이(가) 컴파일되었습니다.
   
   
   
   exec pcd_search_fk('TBL_NEW_COMMENT');
/*
  ------------------------------------------------------------
  자식테이블명   제약조건명   포린키컬럼명  부모테이블명  부모테이블의컬럼명
  ------------------------------------------------------------
  TBL_NEW_COMMENT  FK_TBL_NEW_COMMENT_FK_MEMBER_ID  FK_MEMBER_ID  TBL_NEW_MEMBER  MEMBER_ID
  TBL_NEW_COMMENT  FK_TBL_NEW_COMMENT_FK_BOARDNO  FK_BOARDNO  TBL_NEW_BOARD  BOARDNO
*/
   
   exec pcd_search_fk('TBL_NEW_BOARD');
/*
   ------------------------------------------------------------
   자식테이블명   제약조건명   포린키컬럼명  부모테이블명  부모테이블의컬럼명
   ------------------------------------------------------------
   TBL_NEW_BOARD  FK_TBL_NEW_BOARD_FK_MEMBER_ID  FK_MEMBER_ID  TBL_NEW_MEMBER  MEMBER_ID
*/
   
   
   
   
   ------------------------------------------------------------------------------
   
   --------- **** 어떤 테이블에 제약조건을 추가하기 **** -----------
  /*
       제약조건 추가시 NOT NULL 제약을 제외한 나머지 4개는 아래와 같이한다.
       
       alter table 테이블명 add constraint 제약조건명 primary key(컬럼명);
       alter table 테이블명 add constraint 제약조건명 unique(컬럼명);
       alter table 테이블명 add constraint 제약조건명 check( ... );
       
       alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모테이블명(식별자컬럼명);
       alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모테이블명(식별자컬럼명) on delete casecade;
       alter table 테이블명 add constraint 제약조건명 foreign key(컬럼명) references 부모테이블명(식별자컬럼명) on delete set null;
 */
 
 /*
       NOT NULL 제약을 추가할 때는 아래와 같이 한다.
       
       alter table 테이블명 modify 컬럼명 [constraint 제약조건명] not null;
 */
 create table tbl_buseo
 (buseono     number(3)
 ,buname       varchar2(40)
 );
 -- Table TBL_BUSEO이(가) 생성되었습니다.
 
  select A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name,
         A.STATUS, A.index_name, B.column_name, B.position
  from user_constraints A JOIN user_cons_columns B
  on A.constraint_name = B.constraint_name
  where A.table_name = 'TBL_BUSEO';
  
  alter table tbl_buseo
  add constraint PK_tbl_buseono primary key(buseono);
  -- Table TBL_BUSEO이(가) 변경되었습니다.
  
  
  alter table tbl_buseo
  modify buname constraint NN_tbl_buseo_buname not null;
  
  create table tbl_jikwon
  (jikwon_no   number(5)
  ,jikname     varchar2(30)
  ,email       varchar2(30)
  ,jikkub      varchar2(20)
  ,fk_buseono  number(3)
  );
  
  
  alter table tbl_jikwon add constraint PK_tbl_jikwon_jikwon_no primary key(jikwon_no);
  -- Table TBL_JIKWON이(가) 변경되었습니다.
  
  
  alter table tbl_jikwon add constraint UQ_tbl_jikwon_email unique(email);
  -- Table TBL_JIKWON이(가) 변경되었습니다.
  
  
  alter table tbl_jikwon add constraint CK_tbl_jikwon_jikkub check( jikkub in('사원','대리','과장','부장','사장') );
  -- Table TBL_JIKWON이(가) 변경되었습니다.
  
  
  alter table tbl_jikwon add constraint FK_tbl_jikwon_fk_buseono foreign key(fk_buseono) references tbl_buseo(buseono) on delete set null;
  -- Table TBL_JIKWON이(가) 변경되었습니다. 
  
  
   alter table tbl_jikwon modify jikname constraint NN_tbl_jikwon_jikname not null;
   -- Table TBL_JIKWON이(가) 변경되었습니다.
   
   
   alter table tbl_jikwon modify jikname constraint NN_tbl_jikwon_jikname not null;
  -- Table TBL_JIKWON이(가) 변경되었습니다.
  
  
   alter table tbl_jikwon modify email not null;
  -- Table TBL_JIKWON이(가) 변경되었습니다.
 
 
   select A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name,
         A.STATUS, A.index_name, B.column_name, B.position
   from user_constraints A JOIN user_cons_columns B
   on A.constraint_name = B.constraint_name
   where A.table_name = 'TBL_JIKWON'; 
   
   
   create table tbl_jikwon_2
  (jikwon_no   number(5)     primary key   -- 이렇게 해도 틀린것은 아니지만  제약조건명이 SYS_C숫자 로 나오므로 유지관리가 힘들기 때문에 웬만하면 이와같이 사용하지 말자!!!
  ,jikname     varchar2(30)  not null
  ,email       varchar2(30)  unique
  ,jikkub      varchar2(20)  
  ,fk_buseono  number(3)     
  );
  -- Table TBL_JIKWON_2이(가) 생성되었습니다.

  
   select A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name,
         A.STATUS, A.index_name, B.column_name, B.position
   from user_constraints A JOIN user_cons_columns B
   on A.constraint_name = B.constraint_name
   where A.table_name = 'TBL_JIKWON_2'; 
   
  ---- *** 어떤 테이블에 제약조건을 삭제하기 *** ----
  /*
      alter table 테이블명 drop constraint 제약조건명;
        
      그런데 NOT NULL 제약은 위의 것처럼 해도 되고, 또는 아래처럼 해도 된다.
      alter table 테이블명 modify 컬럼명 null;
        
      어떤 테이블에 primary key 제약조건을 삭제할 경우에는 위의 것처럼 해도 되고, 또는 아래처럼 해도 된다.
      alter table 테이블명 drop primary key;
  */ 
   
   
   -------------- **** 제약조건의 내용 변경하기 **** ----------------
   
   -- TBL_JIKWON 테이블에 있는 jikkub 컬럼에 CHECK 제약의 내용을 변경하고자 한다.
   -- 직급의 종류는 '사원','대리','과장','부장','사장' 에사
   -- '사원','대리','과장','차장','부장','이사','사장' 으로 변경하고자 한다.
   
   -- !!!! 제약조건의 내용 변경하는 명령어는 없습니다. !!!!
   -- 그러므로 해당 제약조건을 삭제하고 다시 새롭게 만드는 것입니다.!!!
   
   
   select A.constraint_name, A.constraint_type, A.search_condition, A.r_constraint_name,
         A.STATUS, A.index_name, B.column_name, B.position
   from user_constraints A JOIN user_cons_columns B
   on A.constraint_name = B.constraint_name
   where A.table_name = 'TBL_JIKWON'; 
   
   
   alter table TBL_JIKWON drop constraint CK_TBL_JIKWON_JIKKUB;
   -- Table TBL_JIKWON이(가) 변경되었습니다.
   
   alter table TBL_JIKWON add constraint CK_TBL_JIKWON_JIKKUB check ( jikkub in ('사원','대리','과장','차장','부장','이사','사장') );
   -- Table TBL_JIKWON이(가) 변경되었습니다.
   -------------- **** 제약조건명 변경하기 **** ---------------------
   /*
        alter table 테이블명
        rename constraint 현재사용중인제약조건명 to 새로운제약조건명;
   */
   alter table tbl_jikwon_2
   rename constraint PK_tbljikwon_2_jikwon_no to PK_tbl_jikwon_2_jikwon_no;
   -- Table TBL_JIKWON_2이(가) 변경되었습니다.
   
   
   
   ---- *** 어떤 테이블에 존재하는 제약조건을 비활성화 시키기 *** ----
   /*
        alter table 테이블명 disable constraint 제약조건명;
   */
        alter table TBL_JIKWON disable constraint CK_TBL_JIKWON_JIKKUB;
        -- Table TBL_JIKWON이(가) 변경되었습니다.
        
   ---- *** 어떤 테이블에 존재하는 제약조건을 활성화 시키기 *** ----
   /*
        alter table 테이블명 enable constraint 제약조건명;
   */
        alter table TBL_JIKWON enable constraint CK_TBL_JIKWON_JIKKUB;
        -- Table TBL_JIKWON이(가) 변경되었습니다.
   
   
   --- **** 어떤 테이블에 새로운 컬럼을 추가하기 *** ---
   /*
       alter table 테이블명 add 추가할컬럼명 데이터타입;
   */
   desc TBL_JIKWON;
   
   alter table TBL_JIKWON add SALARY NUMBER(5);
   
   desc TBL_JIKWON;

   select *
   from TBL_JIKWON;
   
   
   
   --- **** 어떤 테이블에 새로운 컬럼을 삭제하기 *** ---
   /*
       alter table 테이블명 drop 삭제할컬럼명;
   */
   alter table TBL_JIKWON drop column salary;    

   desc TBL_JIKWON;
   
   
   --- **** 어떤 테이블에 새로운 컬럼을 추가하는데 NOT NULL 을 주고 싶다. *** ---
   -- 1. 해당 테이블에 데이터가 전혀 없는 경우
  
   alter table TBL_JIKWON add salary number(5) not null;
   -- Table TBL_JIKWON이(가) 변경되었습니다.
   
   desc TBL_JIKWON;
   
   insert into tbl_buseo values(10, '관리부');
   -- 1 행 이(가) 삽입되었습니다.
  
   insert into TBL_JIKWON values(1001, '이순신', 'leess@gmail.com', '사장', 10, 9000);
   -- 1 행 이(가) 삽입되었습니다.
   
   commit;
   
   select *
   from tbl_jikwon;
   
   -- salary 컬럼을 삭제하겠습니다. --
   alter table tbl_jikwon drop column salary;
   -- Table TBL_JIKWON이(가) 변경되었습니다.
   
   select *
   from tbl_jikwon;
   


   -- 2. 해당 테이블에 데이터가 존재하는 경우
   
   alter table TBL_JIKWON add salary number(5) not null;
   /*
      오류 보고 -
      ORA-01758: 테이블은 필수 열을 추가하기 위해 (NOT NULL) 비어 있어야 합니다.
      --> TBL_JIKWON 테이블에 행이 1개도 없어야 한다는 말이다.
   */
       
   /*
       alter table 테이블명 add 추가할컬럼명 데이터타입 default 기본값 NOT NULL;
       이다.
   */   
       
   alter table TBL_JIKWON add salary number(5) default 0 not null;         
   -- Table TBL_JIKWON이(가) 변경되었습니다.   
    
   select *
   from tbl_jikwon;
   
   update tbl_jikwon set salary = 9000
   where jikwon_no = 1001;
   -- 1 행 이(가) 업데이트되었습니다.
   
   commit;
   
   select *
   from tbl_jikwon;
   
   --- *** 어떤 테이블에 존재하는 컬럼의 데이터타입 변경하기 *** ---
   
    -- 1. 해당 컬럼에 데이터가 모두 NULL 인 경우
    alter table tbl_jikwon add hire_date varchar2(10);
    -- Table TBL_JIKWON이(가) 변경되었습니다.
    
    desc tbl_jikwon;
    -- HIRE_DATE           VARCHAR2(10) 
    
    select *
    from tbl_jikwon;
    
    /*
        alter table 테이블명 modify 컬럼명 새로운타입명;     
    */
    alter table tbl_jikwon modify hire_date date;
    -- Table TBL_JIKWON이(가) 변경되었습니다.
    
    desc tbl_jikwon;
    -- HIRE_DATE           DATE  
    
    select *
    from tbl_jikwon;
    
    
    
    -- 2. 해당 컬럼에 데이터가 모두 NULL 이 아닌 값이 들어가 있는 경우
    
    alter table tbl_jikwon modify salary varchar2(10);
    /*
        오류 보고 -
        ORA-01439: 데이터 유형을 변경할 열은 비어 있어야 합니다
        
        해당 컬럼에 데이터가 모두 null 일때만 새로운 타입으로 변경이 가능하다.!!
    */
   
   
   
   
    -- 3. 해당 컬럼에 데이터가 모두 NULL 이 아닌 값이 들어가 있는 경우에는
    --    데이터타입의 크기는 축소는 이미 들어가 있는 데이터값 보다 작게는 불가하지만 증가는 가능하다.
    desc tbl_jikwon;
    -- SALARY     NOT NULL NUMBER(5)
    
    select *
    from tbl_jikwon;  -- 9000 ==> number(4)
    
    alter table tbl_jikwon modify salary number(3);
    /*
       오류 보고 -
       ORA-01440: 정도 또는 자리수를 축소할 열은 비어 있어야 합니다
    */
    
    alter table tbl_jikwon modify salary number(8);
    -- Table TBL_JIKWON이(가) 변경되었습니다.
    
    desc tbl_jikwon;
    -- SALARY     NOT NULL NUMBER(8) 
    
    
    
    ---- *** 어떤 테이블에 존재하는 컬럼의 이름을 변경하기 *** ----
    /*
       alter table 테이블명 rename column 현재컬럼명 to 새로운컬럼명;
    */
    
    alter table tbl_jikwon rename column salary to sal;
    -- Table TBL_JIKWON이(가) 변경되었습니다.
    
    desc tbl_jikwon;
    -- SAL        NOT NULL NUMBER(8)    
    
    
    ---- *** 어떤 테이블의 테이블 이름을 변경하기 *** ----
    /*
         rename 현재테이블명 to 새로운테이블명;
    */
    rename tbl_jikwon to jikwon;
    -- 테이블 이름이 변경되었습니다.
    
    select *
    from tbl_jikwon;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    
    
    select *
    from jikwon;
    -- 1001	이순신	leess@gmail.com	사장	10	9000	
    
    
    rename jikwon to tbl_jikwon;
    -- 테이블 이름이 변경되었습니다.
    
    
    
    ----- **** 어떤 테이블의 어떤 컬럼에 DEFAULT 값 조회하기 및 DEFAULT 값 변경하기 **** ------
    
    -- tbl_jikwon 테이블의 컬럼에 존재하는 DEFAULT 값 조회하기
    
    select column_name, data_type, data_default
    from user_tab_columns
    where table_name = 'TBL_JIKWON';
    
    alter table TBL_JIKWON modify hire_date default sysdate;
    -- Table TBL_JIKWON이(가) 변경되었습니다.
    
    alter table TBL_JIKWON modify sal default 500;
    -- Table TBL_JIKWON이(가) 변경되었습니다.
    
    
    -- *** 어떤 테이블의 어떤 컬럼에 주어진 default 삭제는 default 값으로 null 을 주는 것을 한다. *** --
    
    alter table TBL_JIKWON modify hire_date default null;
    -- Table TBL_JIKWON이(가) 변경되었습니다.
    
    
   
    
    
   ---- !!!!!!!!! 테이블을 생성한 이후에 웬만하면 테이블명에 대한 주석문을 달아주도록 합시다. !!!!!!!!!! ----
   
   --- *** 테이블명에 달려진 주석문 조회하기 *** --
   select *
   from user_tab_comments;
   
   comment on table TBL_JIKWON
   is '우리회사 사원들의 정보가 들어있는 테이블';
   -- Comment이(가) 생성되었습니다.
   
   
   
   ---- !!!! 테이블을 생성한 이후에 웬만하면 컬럼명에 대한 주석문을 달아주도록 합시다.!!!! ----
   select * 
   from user_col_comments
   where table_name = 'EMPLOYEES';
   
   
   select * 
   from user_col_comments
   where table_name = 'TBL_JIKWON';
      
   comment on column TBL_JIKWON.JIKWON_NO is '사원번호 Primary Key';  -- Comment이(가) 생성되었습니다.
   comment on column TBL_JIKWON.JIKNAME is '사원명 NOT NULL';     -- Comment이(가) 생성되었습니다.
   comment on column TBL_JIKWON.EMAIL is '이메일';  -- Comment이(가) 생성되었습니다.  
   comment on column TBL_JIKWON.JIKKUB is '직급 사장,이사,부장,과장,대리,사원 만 가능함';     -- Comment이(가) 생성되었습니다.
   comment on column TBL_JIKWON.FK_BUSEONO is '부서번호 TBL_BUSEO 테이블의 BUSEONO 컬럼을 참조하는 외부키 컬럼임'; -- Comment이(가) 생성되었습니다.
   
      
   select column_name, comments  
   from user_col_comments
   where table_name = 'TBL_JIKWON';
 
 
 
 
 
   ---------------------------------------------------------------------------------------------
   --- **** !!! 테이블을 삭제시 휴지통에 버리기 !!! ****
   ---     ==> 테이블을 삭제할 때 휴지통에 버리면 drop 되어진 테이블을 복구할 수 있다.
   
   create table tbl_exam_01
   (name  varchar2(20));
   insert into tbl_exam_01(name) values('연습1');
   commit;
   
   create table tbl_exam_02
   (name  varchar2(20));
   insert into tbl_exam_02(name) values('연습2');
   commit;
   
   create table tbl_exam_03
   (name  varchar2(20));
   insert into tbl_exam_03(name) values('연습3');
   commit;
   
   create table tbl_exam_04
   (name  varchar2(20));
   insert into tbl_exam_04(name) values('연습4');
   commit;
   
   create table tbl_exam_05
   (name  varchar2(20));
   insert into tbl_exam_05(name) values('연습5');
   commit;
      
   create table tbl_exam_06
   (name  varchar2(20));
   insert into tbl_exam_06(name) values('연습6');
   commit;
   
   drop table tbl_exam_01; --> tbl_exam_01 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다.
   -- Table TBL_EXAM_01이(가) 삭제되었습니다.
   
   select * from tab;
   -- 결과물에서 tname 컬럼에 BIN$ 로 시작하는 것은 휴지통에 버려진 테이블이다.
   
   drop table tbl_exam_02; --> tbl_exam_01 테이블을 영구히 삭제하는 것이 아니라 휴지통에 버리는 것이다.
   -- Table TBL_EXAM_02이(가) 삭제되었습니다.
   
   select * from tab;
   -- 결과물에서 tname 컬럼에 BIN$ 로 시작하는 것은 휴지통에 버려진 테이블이다.
 
   select *
   from tbl_exam_01;
   -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
   
   select *
   from tbl_exam_02;
   -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
   
   select *
   from "BIN$97VurdJrTkiM5K3avtFT4Q==$0";
   
   select *
   from "BIN$bWA9nIG5TdS+ZkjoteKmmw==$0";
   
   
   
   ----- ==== *** 휴지통 조회하기 *** ==== -----
   
   select *
   from user_recyclebin;
   
   
   ----- ==== *** 휴지통에 있던 테이블을 복원하기 *** ==== -----
   flashback table TBL_EXAM_01 to before drop; 
   -- Flashback을(를) 성공했습니다.
   -- TBL_EXAM_01 은 original_name 컬럼에 나오는 것이었다.
   
   
   select *
   from TBL_EXAM_01;
   
   
   ----- ==== *** 휴지통에 있던 특정테이블을 영구히 삭제하기 *** ==== -----
   
   select *
   from user_recyclebin;
   
   purge table TBL_EXAM_02;
   -- Table이(가) 비워졌습니다.
   -- TBL_EXAM_02 은 original_name 컬럼에 나오는 것이었다.
   
   
   
   ----- ==== *** 휴지통에 있던 모든테이블을 영구히 삭제하기 *** ==== -----
   drop table tbl_exam_03;  -- Table TBL_EXAM_03이(가) 삭제되었습니다.
   drop table tbl_exam_04;  -- Table TBL_EXAM_04이(가) 삭제되었습니다.
   
   select *
   from user_recyclebin;
   
   purge recyclebin; -- 휴지통에 있던 모든 테이블들을 영구히 삭제하는 것이다.
   -- Recyclebin이(가) 비워졌습니다.
   
   
   select *
   from tab;
   
   
   
   ----- ***** 테이블을 삭제시 영구히 삭제하기 ==> drop 되어진 테이블은 복원이 불가하다.!!! **** ----
   select *
   from tbl_exam_05;
   
   drop table tbl_exam_05 purge;
   -- Table TBL_EXAM_05이(가) 삭제되었습니다.
   
   select *
   from user_recyclebin;
   
   
   
   
   
   
   
   ---------- ======== **** INDEX(인덱스, 색인) **** ======== -----------
   
    /* 
       index(==색인)는 예를 들어 설명하면 아주 두꺼운 책 뒤에 나오는 "찾아보기" 와 같은 기능을 하는 것이다.
       "찾아보기" 의 특징은 정렬되어 있는 것인데 index(==색인) 에 저장된 데이터도 정렬되어 저장되어 있다는 것이 특징이다.
    */
    -- index(==색인)를 생성해서 사용하는 이유는 where 절이 있는 select 명령문의 속도를 향상 시키기 위함이다.
    -- index(==색인)은 어떤 컬럼에 만들어 할까요?
    /*
       1. where 절에서 자주 사용되어진 컬럼에 만들어야 한다.
       
       2. 선택도(selectivity)가 높은 컬럼에 만들어야 한다.
       ※ 선택도(selectivity)가 높다라는 것은 고유한 데이터일수록 선택도(selectivity)가 높아진다.
       예: 성별컬럼 --> 선택도(selectivity)가 아주 낮다. 왜냐하면 수많은 사람중 남자 아니면 여자중 하나만 골라야 하므로 선택의 여지가 아주 낮다.
           학번    --> 선택도(selectivity)가 아주 좋다. 왜냐하면 학번은 다양하고 고유하므로 골라야할 대상이 아주 많으므로 선택도가 높은 것이다.
    
       3. 카디널리티(cardinality)가 높은 컬럼에 만들어야 한다.
       ※ 카디널리티(cardinality)의 사전적인 뜻은 집합원의 갯수를 뜻하는 것으로서,
          카디널리티(cardinality)가 높다라는 것은 중복도가 낮아 고유한 데이터일수록 카디널리티(cardinality)가 상대적으로 높다 라는 것이다.
          카디널리티(cardinality)가 낮다라는 것은 중복도가 높아 중복된 데이터가 많을수록 카디널리티(cardinality)가 상대적으로 낮다 라는 것이다.
          
          카디널리티(cardinality)는 "상대적인 개념" 이다.
          예를들어, 주민등록번호 같은 경우는 중복되는 값이 없으므로 카디널리티(cardinality)가 높다고 할 수 있다.
          이에 비해 성명같은 경우는 "주민등록번호에 비해" 중복되는 값이 많으므로, 성명은 "주민등록번호에 비해" 카디널리티가 낮다고 할 수 있다.
          이와같이 카디널리티(cardinality)는 상대적인 개념으로 이해해야 한다.
    */
    
    
    create table tbl_student_1
    (hakbun      varchar2(20) not null
    ,name        varchar2(20)
    ,email       varchar2(30)
    ,address     varchar2(200)
    );
    -- Table TBL_STUDENT_1이(가) 생성되었습니다.
   
    
    --- *** unique 한 index 생성하기 *** ---
   /* 
      어떤 컬럼에 unique 한 index 를 생성하면 그 컬럼에 들어오는 값은 중복된 값은 들어올 수 없으며 오로지 고유한 값만 들어오게 된다.
      unique 한 index 가 뒤에 나오는 non-unique 한 index 보다 검색속도가 조금 더 빠르다.
   */ 
  /*
     [문법]
     create unique index 인덱스명
     on 해당테이블명(컬럼명 asc|desc);
  */
  create unique index idx_tbl_student_1_hakbun
  on tbl_student_1(hakbun);  -- on tbl_student_1(hakbun asc); 와 동일하다.
  -- on tbl_student_1(hakbun asc);
  -- on tbl_student_1(hakbun desc);
   --Index IDX_TBL_STUDENT_1_HAKBUN이(가) 생성되었습니다.
  
  
  insert into tbl_student_1(hakbun, name, email, address) values('1', '일미자', 'ilmj@naver.com', '서울시 강동구');
  -- 1 행 이(가) 삽입되었습니다.
   
  insert into tbl_student_1(hakbun, name, email, address) values('1', '이미자', 'twomj@naver.com', '서울시 강서구');
  /*
    오류 보고 -
    ORA-00001: 무결성 제약 조건(HR.IDX_TBL_STUDENT_1_HAKBUN)에 위배됩니다
  */
  
  insert into tbl_student_1(hakbun, name, email, address) values('2', '이미자', 'twomj@naver.com', '서울시 강서구');
  -- 1 행 이(가) 삽입되었습니다.
  
  commit;
  
  
  ----- *** tbl_student_1 테이블에 생성되어진 index 조회하기 *** -----
  
  select *
  from user_indexes
  where table_name = 'TBL_STUDENT_1';
  
  select *
  from user_ind_columns
  where table_name = 'TBL_STUDENT_1';
  
  
  select A.index_name, A.uniqueness, B.column_name, B.descend
  from user_indexes A JOIN user_ind_columns B
  ON A.index_name = B.index_name
  where A.table_name = 'TBL_STUDENT_1';
  /*
     ---------------------------------------------------------------------------
       index_name                        uniqueness   column_name       descend
      ---------------------------------------------------------------------------
      IDX_TBL_STUDENT_1_HAKBUN	           UNIQUE  	   HAKBUN  	         ASC
  */
  
  
  --- *** non-unique 한 index 생성하기 *** ---
  /* 
     어떤 컬럼에 non-unique 한 index 생성하면 그 컬럼에 들어오는 값은 중복된 값이 들어올 수 있다는 것이다.
     non-unique 한 index 는 unique 한 index 보다 검색속도가 다소 늦은 편이다.
  */ 
  /*
    [문법]
    create index 인덱스명
    on 해당테이블명(컬럼명 asc|desc);
  */
    
     create index idx_tbl_student_1_name
     on tbl_student_1(name);
     -- Index IDX_TBL_STUDENT_1_NAME이(가) 생성되었습니다.
     
     
     insert into tbl_student_1(hakbun, name, email, address) values('3', '삼미자', 'threemj@naver.com', '서울시 강서구');
    -- 1 행 이(가) 삽입되었습니다.
    
    insert into tbl_student_1(hakbun, name, email, address) values('4', '삼미자', 'threemj2@naver.com', '서울시 강남구');
    -- 1 행 이(가) 삽입되었습니다.
    
    commit;
    
    
    select *
    from tbl_student_1;
    
    
    select A.index_name, A.uniqueness, B.column_name, B.descend
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
      ---------------------------------------------------------------------------
       index_name                        uniqueness   column_name       descend
      ---------------------------------------------------------------------------
      IDX_TBL_STUDENT_1_HAKBUN            UNIQUE	  HAKBUN	         ASC
      IDX_TBL_STUDENT_1_NAME	          NONUNIQUE	  NAME	             ASC
    */
     
     
     
    select *
    from tbl_student_1
    where hakbun = '2';  -->  unique한 인덱스 IDX_TBL_STUDENT_1_HAKBUN 를 사용하여 빠르게 조회해옴.
    
    
    select *
    from tbl_student_1
    where name = '이미자';  --> non-unique한 인덱스 IDX_TBL_STUDENT_1_NAME 를 사용하여 빠르게 조회해옴.
    
    
    select *
    from tbl_student_1
    where address = '서울시 강동구';  --> address 컬럼에는 인덱스가 없으므로 tbl_student_1 테이블에 있는 모든 데이터를 조회해서 
                                    --  address 컬럼의 값이  '서울시 강동구' 인 데이터를 가져온다.
                                    --  이와 같이 인덱스를 사용하지 않고 데이터를 조회해올 때를 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 이라고 부른다.
                                    --  Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)이 속도가 가장 느린 것이다.
                                    
    
    delete from tbl_student_1;  
    -- 4개 행 이(가) 삭제되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    
    -- drop sequence seq_tbl_student_1;
    
    create sequence seq_tbl_student_1
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    -- Sequence SEQ_TBL_STUDENT_1이(가) 생성되었습니다.
    
    
    declare
       v_cnt  number := 1;
       v_seq  number;
       v_day  varchar2(8);
    begin
        loop 
           exit when v_cnt > 10000;
        
           select seq_tbl_student_1.nextval, to_char(sysdate, 'yyyymmdd') 
                  into v_seq, v_day
           from dual;
        
           insert into tbl_student_1(hakbun, name, email, address)
           values(v_day||'-'||v_seq, '이순신'||v_seq, 'leess'||v_seq||'@gmail.com', '서울시 마포구 월드컵로 '||v_seq);
           
           v_cnt := v_cnt + 1;
        end loop;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    
    commit;
    -- 커밋 완료.
     
     
     
    select count(*)
    from tbl_student_1; -- 10000
    
    
    select seq_tbl_student_1.currval  AS 최근에사용한시퀀스값   -- 10000
    from dual;
    
    -- (seq_tbl_student_1.currval + 1)
    
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 1), '배수지'||(seq_tbl_student_1.currval + 1), 'baesuji'||(seq_tbl_student_1.currval + 1)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 1));
    --    '20220718-10001'
    
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 2), '배수지'||(seq_tbl_student_1.currval + 2), 'baesuji'||(seq_tbl_student_1.currval + 2)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 2));
    --    '20220718-10002'
    
    insert into tbl_student_1(hakbun, name, email, address)
    values(to_char(sysdate, 'yyyymmdd')||'-'||(seq_tbl_student_1.currval + 3), '배수지'||(seq_tbl_student_1.currval + 3), 'baesuji'||(seq_tbl_student_1.currval + 1)||'@gmail.com', '서울시 마포구 월드컵로 '||(seq_tbl_student_1.currval + 3));
    --    '20220718-10003'
    
    commit;
    
    select count(*)
    from tbl_student_1;   -- 10003
    
    
    select A.index_name, A.uniqueness, B.column_name, B.descend
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
      ---------------------------------------------------------------------------
       index_name                        uniqueness   column_name       descend
      ---------------------------------------------------------------------------
      IDX_TBL_STUDENT_1_HAKBUN            UNIQUE	  HAKBUN	         ASC
      IDX_TBL_STUDENT_1_NAME	          NONUNIQUE	  NAME	             ASC
    */
    
    
    select *
    from tbl_student_1;
    
    
    
    
    -- ==== *** SQL*Developer 에서 Plan(실행계획) 확인하는 방법 *** ==== --
    /*
      select 문이 실행될 때 인덱스를 사용하여 데이터를 얻어오는지 인덱스를 사용하지 않고 
      Table Full Scan 하여 얻어오는지 알아봐야 한다.
      이럴때 사용하는 것이 SQL Plan(실행계획)이다. 
      
      SQL*Developer 에서는 "SQL편집창(SQL 워크시트)"에 Plan(실행계획) 과 Trace(자동추적) 메뉴가 상단에 있다.
      
      Plan(실행계획) 과 Trace(자동추적) 의 차이는,
      Plan(실행계획) 은 SQL을 실행하기 전에 Oracle Optimizer(옵티마이저, 최적화기)가 SQL을 어떻게 실행할지를 미리 알려주는 것이고,
      Trace(자동추적) 는 SQL을 실행해보고, Oracle Optimizer(옵티마이저, 최적화기)가 SQL을 어떻게 실행했는지 그 결과를 알려주는 것이다.

      그러므로, 정확도로 말하자면, Trace(자동추적)가 Plan(실행계획) 보다 훨씬 정확한 것이다.
      Plan(실행계획) 은 말그대로 계획이라서 Oracle Optimizer가 계획은 그렇게 세우긴 했으나 
      실제 실행할때는 여러가지 이유로 다르게 실행할 수도 있기 때문이다.
      그래서 Trace(자동추적)가 정확하기는 하나 Trace(자동추적)는 한번 실행해봐야 하는것이라서 
      시간이 오래 걸리는 SQL인 경우에는 한참 기다려야 하는 단점이 있기는 하다.
   */       
    
    
   /* 
      실행해야할 SQL문을 블럭으로 잡은 후에
      "SQL 워크시트" 의 상단 아이콘들중에 3번째 아이콘( 계획 설명... (F10) )을 클릭하면 현재 SQL의 Plan(실행계획)을 아래에 보여준다.
      COST(비용)의 값이 적을 수록 속도가 빠른 것이다.
   */
   select *
   from tbl_student_1
   
    select *
    from tbl_student_1
    where hakbun = '20220718-6789';  --> unique한 인덱스 IDX_TBL_STUDENT_1_HAKBUN 를 사용하여 빠르게 조회해옴.
    
    
    select *
    from tbl_student_1
    where name = '이순신5783';  --> non-unique한 인덱스 IDX_TBL_STUDENT_1_NAME 를 사용하여 빠르게 조회해옴.
    
    
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 3987';  --> address 컬럼에는 인덱스가 없으므로 tbl_student_1 테이블에 있는 모든 데이터를 조회해서 
                                    --  address 컬럼의 값이  '서울시 마포구 월드컵로 3987' 인 데이터를 가져온다.
                                    --  이와 같이 인덱스를 사용하지 않고 데이터를 조회해올 때를 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회) 이라고 부른다.
                                    --  Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)이 속도가 가장 느린 것이다.
    
    
    select *
    from tbl_student_1
    where email = 'leess2654@gmail.com';  -- email 컬럼에는 인덱스가 없으므로 Table Full-scan(인덱스를 사용하지 않고 테이블 전체 조회)하여 조회해 오는 것임.
    
    
    -----------------------------------------------------------------------------------------------------------
    -- *** Trace(자동추적)을 하기 위해서는 SYS 또는 SYSTEM 으로 부터 권한을 부여 받은 후 HR은 재접속을 해야 한다. *** --
    show user;
    -- USER이(가) "SYS"입니다.
    
    grant SELECT_CATALOG_ROLE to HR;
    -- Grant을(를) 성공했습니다.
    
    grant SELECT ANY DICTIONARY to HR;
    -- Grant을(를) 성공했습니다.
    -----------------------------------------------------------------------------------------------------------
      
   /* 
      실행해야할 SQL문을 블럭으로 잡은 후에
      "SQL 워크시트" 의 상단 아이콘들중에 4번째 아이콘( 자동 추적... (F6) )을 클릭하면 현재 SQL의 Trace(자동추적)을 아래에 보여준다.
      
      Trace(자동추적)을 하면 Plan(실행계획) 도 나오고, 동시에 아래쪽에 통계정보도 같이 나온다.

      오른쪽에 Plan(실행계획)에서는 보이지 않던 LAST_CR_BUFFER_GETS 와 LAST_ELAPSED_TIME 컬럼이 나온다.
      LAST_CR_BUFFER_GETS 는 SQL을 실행하면서 각 단계에서 읽어온 블록(Block) 갯수를 말하는 것이고,
      LAST_ELAPSED_TIME 은 경과시간 정보이다.
      즉, 이 정보를 통해서 어느 구간에서 시간이 많이 걸렸는지를 확인할 수 있으므로, 이 부분의 값이 적게 나오도록 SQL 튜닝을 하게 된다.
    */
    
    
    
    ---- *** DML(insert, update, delete)이 빈번하게 발생하는 테이블에 index가 생성되어 있으면
    ---      DML(insert, update, delete) 작업으로 인해 Index 에 나쁜 결과를 초래하므로  
    ---      index 가 많다고 해서 결코 좋은 것이 아니기에 테이블당 index 의 개수는 최소한의 개수로 만드는 것이 좋다.
    
    ---- *** index 가 생성되어진 테이블에 insert 를 하면 Index Split(인덱스 쪼개짐) 가 발생하므로
    ----     index 가 없을시 보다 insert 의 속도가 떨어지게 된다.
    ----     그러므로 index 가 많다고 결코 좋은 것이 아니므로 최소한의 개수로 index 를 만드는 것이 좋다.
    ----     Index Split(인덱스 쪼개짐)란 Index 의 block(블럭)들이 1개에서 2개로 나뉘어지는 현상을 말한다.
    ----     Index Split(인덱스 쪼개짐)이 발생하는 이유는 Index 는 정렬이 되어 저장되기 때문에 
    ---      Index 의 마지막 부분에 추가되는 것이 아니라 정렬로 인해 중간 자리에 끼워들어가는 현상이
    ----     발생할 수 있기 때문이다. 
    
    
    ---- *** index 가 생성되어진 테이블에 delete 를 하면 테이블의 데이터는 삭제가 되어지지만 
    ----     Index 자리에는 데이터는 삭제되지 않고서 사용을 안한다는 표시만 하게 된다.
    ----     그래서 10만 건이 들어있던 테이블에 9만건의 데이터를 delete 를 하면 테이블에는 데이터가 삭제되어 지지만
    ----     Index 자리에는 10만 건의 정보가 그대로 있고 1만건만 사용하고 9만건은 사용되지 않은채로 되어있기에
    ----     사용하지 않는 9만건의 Index 정보로 인해서 index를 사용해서 select를 해올 때 index 검색속도가 떨어지게 된다.   
    ----     이러한 경우 Index Rebuild 작업을 해주어 사용하지 않는 9만건의 index 정보를 삭제해주어야만 
    ----     select를 해올 때 index 검색속도가 빨라지게 된다. 
    
    
    ---- *** index 가 생성되어진 테이블에 update 를 하면 테이블의 데이터는 "수정" 되어지지만 
    ----     Index 는 "수정" 이라는 작업은 없고 index 를 delete 를 하고 새로이 insert 를 해준다.
    ----     그러므로 index 를 delete 할 때 발생하는 단점 및 index 를 insert 를 할 때 발생하는 Index Split(인덱스 쪼개짐) 가 발생하므로
    ----     Index 에는 최악의 상황을 맞게 된다. 
    ----     이로 인해 테이블의 데이터를 update를 빈번하게 발생시켜 버리면 select를 해올 때 index 검색속도가 현저히 느려지게 된다. 
    ----     이러한 경우도 select를 해올 때 index 검색속도가 빨라지게끔 Index Rebuild 작업을 해주어야 한다.       
  
  
  
    ---- **** Index(인덱스)의 상태 확인하기 **** ----
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
       인덱스상태(Balance)
       ------------------
              0          <== 0 에 가까울 수록 인덱스 상태가 좋은 것이다.
    */
  
    select count(*)
    from tbl_student_1;  
    -- 10003
    
    delete from tbl_student_1
    where hakbun between '20220718-400' and '20220718-9400'
    -- 6,001개 행 이(가) 삭제되었습니다.
    
    commit;
    
    
    select count(*)
    from tbl_student_1;  
    -- 4002
    
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
       인덱스상태(Balance)
       ------------------
              0          <== delete 하기전의 index 를 분석한 것이므로 0 이라고 나올 뿐이다.
    */
    
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
       인덱스상태(Balance)
       ------------------
       59.99108333467217197114534967787542374243          <== 인덱스 밸런스가 대략 60% 정도가 깨진 것이다.
    */
    
    update tbl_student_1 set name = '홍길동'
    where hakbun between '20220718-9401' and '20220718-9901';
    -- 556개 행 이(가) 업데이트되었습니다.
    
    commit;
    -- 커밋 완료.
    
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
       인덱스상태(Balance)
       ------------------
       59.99108333467217197114534967787542374243          <== 인덱스 밸런스가 대략 60% 정도가 깨진 것이다.
    */
    
    
    
    
    -------- **** ===== Index Rebuild(인덱스 재건축)하기 ====== **** --------
    --- !!! 인덱스 밸런스가 대략 대략 60% 정도 깨진 IDX_TBL_STUDENT_1_NAME 을 Index Rebuild(인덱스 재건축) 하겠습니다.!!! ---
    
    alter index IDX_TBL_STUDENT_1_NAME rebuild;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 변경되었습니다.
    
    
    analyze index IDX_TBL_STUDENT_1_NAME validate structure;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 분석되었습니다.
    
    
    select (del_lf_rows_len / lf_rows_len) * 100 "인덱스상태(Balance)"
    from index_stats
    where name = 'IDX_TBL_STUDENT_1_NAME';
    /*
       인덱스상태(Balance)
       ------------------
              0          <== 0 에 가까울 수록 인덱스 상태가 좋은 것이다.
    */
     
     
    ---- **** index 삭제하기 **** ----
    ---  drop index 삭제할인덱스명;
    
    select A.index_name, uniqueness, column_name, descend 
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
      ---------------------------------------------------------------------
       index_name                   uniqueness      column_name    descend
      --------------------------------------------------------------------- 
       IDX_TBL_STUDENT_1_HAKBUN       UNIQUE           HAKBUN           ASC
       IDX_TBL_STUDENT_1_NAME       NONUNIQUE       NAME           ASC
      ---------------------------------------------------------------------
    */
    
    drop index IDX_TBL_STUDENT_1_NAME;
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 삭제되었습니다.
    
    drop index IDX_TBL_STUDENT_1_HAKBUN;
    -- Index IDX_TBL_STUDENT_1_HAKBUN이(가) 삭제되었습니다. 
    
    
    
    
    
     
     
     
    ------ **** !!!!! 복합인덱스(Composite index) 생성하기 !!!!! **** -------
    -- 복합인덱스(composite index)란? 
    -- 2개 이상의 컬럼으로 묶어진 인덱스를 말하는 것으로서
    -- where 절에 2개의 컬럼이 사용될 경우 각각 1개 컬럼마다 각각의 인덱스를 만들어서 사용하는 것보다
    -- 2개의 컬럼을 묶어서 하나의 인덱스로 만들어 사용하는 것이 속도가 좀 더 빠르다.
    select *
    from tbl_student_1
    where name = '배수지10001' and address = '서울시 마포구 월드컵로 10001'; 
    
    
    -- !!!!  중요  !!!! --
    -- 복합인덱스(composite index) 생성시 중요한 것은 선행컬럼을 정하는 것이다.
    -- 선행컬럼은 맨처음에 나오는 것으로 아래에서는 name 이 선행컬럼이 된다.
    -- 복합인덱스(composite index)로 사용되는 컬럼중 선행컬럼으로 선정되는 기준은 where 절에 가장 많이 사용되는 것이며 
    -- 선택도(selectivity)가 높은 컬럼이 선행컬럼으로 선정되어야 한다.
    
    create index idx_tbl_student_1_name_addr
    on tbl_student_1(name, address);   -- name 컬럼이 선행컬럼이 된다.
--  Index IDX_TBL_STUDENT_1_NAME_ADDR이(가) 생성되었습니다.

--  create index idx_tbl_student_1_name_addr
--  on tbl_student_1(address, name);   -- address 컬럼이 선행컬럼이 된다.

    select A.index_name, uniqueness, column_name, descend, B.column_position 
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    /*
        -------------------------------------------------------------------------------------------
         index_name                     uniqueness    column_name   descend   column_position
        ------------------------------------------------------------------------------------------- 
         IDX_TBL_STUDENT_1_NAME_ADDR   NONUNIQUE     ADDRESS       ASC          2
         IDX_TBL_STUDENT_1_NAME_ADDR   NONUNIQUE     NAME           ASC         1(숫자 1이 선행컬럼이다)
    */
    
    
    select *
    from tbl_student_1
    where name = '배수지10001' and address = '서울시 마포구 월드컵로 10001'; 
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 10001' and name = '배수지10001'; 
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    select *
    from tbl_student_1
    where name = '배수지10001'; 
    -- where 절에 선행컬럼인 name 이 사용되어지면 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하여 빨리 조회해온다.
    
    select *
    from tbl_student_1
    where address = '서울시 마포구 월드컵로 10001'; 
    -- where 절에 선행컬럼이 없으므로 복합인덱스(composite index)인 IDX_TBL_STUDENT_1_NAME_ADDR 을 사용하지 못하고 Table Full Scan 하여 조회해오므로 속도가 떨어진다.  
     
     
     
     
     
     
     
     
     
    create table tbl_member
    (userid      varchar2(20)
    ,passwd      varchar2(30) not null
    ,name        varchar2(20) not null 
    ,address     varchar2(100)
    ,email       varchar2(50) not null 
    ,constraint  PK_tbl_member_userid primary key(userid)
    ,constraint  UQ_tbl_member_email unique(email)
    );
    -- Table TBL_MEMBER이(가) 생성되었습니다.
    
    declare 
         v_cnt  number := 1;  
    begin
         loop
             exit when v_cnt > 10000;
             
             insert into tbl_member(userid, passwd, name, address, email)
             values('hongkd'||v_cnt, 'qwer1234$', '홍길동'||v_cnt, '서울시 마포구 '||v_cnt, 'hongkd'||v_cnt||'@gmail.com');
             
             v_cnt := v_cnt + 1;
         end loop;
    end;
    -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
    
    commit;
    -- 커밋 완료.
    
    select *
    from tbl_member;
    
    
    --- 로그인을 하는데 로그인이 성공되어지면 그 회원의 성명만을 보여주도록 한다.
    select name 
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    
    
    --- **** userid, passwd, name 컬럼을 가지고 복합인덱스(composite index)를 생성해 봅니다. **** ---
    create index idx_tbl_member_id_pwd_name
    on tbl_member(userid, passwd, name);
    -- Index IDX_TBL_MEMBER_ID_PWD_NAME이(가) 생성되었습니다.
    
    select name 
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    -- where 절 및 select 에 복합인덱스(composite index)인 IDX_TBL_MEMBER_ID_PWD_NAME 에 사용되어진 컬럼만 있으므로
    -- 테이블 tbl_member 에는 접근하지 않고 인덱스 IDX_TBL_MEMBER_ID_PWD_NAME 에만 접근해서 조회하므로 속도가 빨라진다. 
    
    
    select name, address 
    from tbl_member
    where userid = 'hongkd201' and passwd = 'qwer1234$';
    -- where 절에 userid 및 passwd 가 사용되었으므로 복합인덱스(composite index)인 IDX_TBL_MEMBER_ID_PWD_NAME 을 사용하는데 
    -- select 절에 IDX_TBL_MEMBER_ID_PWD_NAME 에 없는 address 컬럼이 있으므로 테이블 tbl_member 에 접근해야 한다.
    -- 그러므로 인덱스 IDX_TBL_MEMBER_ID_PWD_NAME 만 접근하는 것 보다는 조회 속도가 쬐금 느려진다. 
    
    
    drop index idx_tbl_member_id_pwd_name;
    -- Index IDX_TBL_MEMBER_ID_PWD_NAME이(가) 삭제되었습니다.                    
    
    
    
    
    
    
    
    
    
    ------ **** 함수기반 인덱스(function based index) 생성하기 **** -------
    drop index IDX_TBL_STUDENT_1_NAME_ADDR;
    -- Index IDX_TBL_STUDENT_1_NAME_ADDR이(가) 삭제되었습니다.
    
    select A.index_name, uniqueness, column_name, descend, B.column_position 
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_1';
    
    create index idx_tbl_student_1_name
    on tbl_student_1(name);
    -- Index IDX_TBL_STUDENT_1_NAME이(가) 생성되었습니다.
    
    select *
    from tbl_student_1
    where name = '배수지10002';
    -- IDX_TBL_STUDENT_1_NAME 인덱스를 사용하여 조회해온다.
    
    select *
    from tbl_student_1
    where substr(name, 2, 2) = '수지';
    -- IDX_TBL_STUDENT_1_NAME 인덱스를 사용하지 않고 Table Full Scan 하여 조회해온다.
    
    create index idx_func_tbl_student_1_name
    on tbl_student_1( substr(name, 2, 2) ); -- 함수기반 인덱스(function based index) 생성
    -- Index IDX_FUNC_TBL_STUDENT_1_NAME이(가) 생성되었습니다.
    
    select *
    from tbl_student_1
    where substr(name, 2, 2) = '수지';
    -- 함수기반 인덱스인 IDX_FUNC_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    drop index IDX_FUNC_TBL_STUDENT_1_NAME;
    -- Index IDX_FUNC_TBL_STUDENT_1_NAME이(가) 삭제되었습니다.
    
    
    select *
    from tbl_student_1
    where name = '배수지10002';
    -- 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    select *
    from tbl_student_1
    where name like '배수지10002';
    -- 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    select *
    from tbl_student_1
    where name like '배수지%';
    -- 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하여 조회해온다.
    
    select *
    from tbl_student_1
    where name like '%배수지%';
    -- 맨앞에 % 또는 _ 가 나오면 인덱스 IDX_TBL_STUDENT_1_NAME 을 사용하지 않고 Table Full Scna 하여 조회해온다.
    
    
    
    
    
    
    --- **** 어떤 테이블의 어떤 컬럼에 Primary Key 제약 또는 Unique 제약을 주면
    --       자동적으로 그 컬럼에는 unique 한 index가 생성되어진다.
    --       인덱스명은 제약조건명이 된다. **** 
    
    create table tbl_student_2
    (hakbun      varchar2(10) 
    ,name        varchar2(20)
    ,email       varchar2(20) not null
    ,address     varchar2(20)
    ,constraint PK_tbl_student_2_hakbun primary key(hakbun)
    ,constraint UQ_tbl_student_2_email unique(email)
    );
    -- Table TBL_STUDENT_2이(가) 생성되었습니다.
    
    select A.index_name, uniqueness, column_name, descend 
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_2';
    
    
    -- Primary Key 제약 또는 Unique 제약으로 생성되어진 index 의 제거는 
    -- drop index index명; 이 아니라
    -- alter table 테이블명 drop constraint 제약조건명; 이다.
    -- 제약조건을 삭제하면 자동적으로 index 도 삭제가 된다.
    
    drop index PK_TBL_STUDENT_2_HAKBUN;
    /*
       오류 보고 -
       ORA-02429: cannot drop index used for enforcement of unique/primary key
    */
    
    drop index UQ_TBL_STUDENT_2_EMAIL;
    /*
       오류 보고 -
       ORA-02429: cannot drop index used for enforcement of unique/primary key
    */
   
    alter table tbl_student_2
    drop primary key;
    -- Table TBL_STUDENT_2이(가) 변경되었습니다.
    
    alter table tbl_student_2
    drop constraint UQ_tbl_student_2_email;
    -- Table TBL_STUDENT_2이(가) 변경되었습니다.
    
    
    select A.constraint_name, A.constraint_type, A.search_condition, 
           B.column_name, B.position 
    from user_constraints A join user_cons_columns B 
    on A.constraint_name = B.constraint_name
    where A.table_name = 'TBL_STUDENT_2';
    
    
    select A.index_name, uniqueness, column_name, descend 
    from user_indexes A JOIN user_ind_columns B
    ON A.index_name = B.index_name
    where A.table_name = 'TBL_STUDENT_2';
     
     
     
     
     
     
     
     ------ ====== **** 데이터사전(Data Dictionary) **** ====== -------
     
     ---- **** ORACLE DATA DICTIONARY VIEW(오라클 데이터 사전 뷰) **** ---- 
    show user;
    -- USER이(가) "HR"입니다.
    
    select * 
    from dictionary;
    -- 또는
    select * 
    from dict;
    /*
      USER_CONS_COLUMNS
      ALL_CONS_COLUMNS
    */  
     
     
     
     
     --  ========= SYS 로 접속한 것 시작 ========== --
    show user;
    -- USER이(가) "SYS"입니다.
    
    -- 먼저 아래와 같이 HR 에게 index 공부를 할때 trace(자동추적) 때문에 아래와 같이 hr에게 부여했던 SELECT ANY DICTIONARY 권한을 회수하겠습니다.
    revoke SELECT ANY DICTIONARY from HR;
    -- Revoke을(를) 성공했습니다.
    
    select * 
    from dictionary;
    -- 또는
    select * 
    from dict;
    
    /*
       USER_CONS_COLUMNS
       ALL_CONS_COLUMNS
       DBA_CONS_COLUMNS
    */
    
    /*
     DBA_로 시작하는 것 
     ==> 관리자만 조회가능한 것으로 모든오라클사용자정보, 모든테이블, 모든인덱스, 모든데이터베이스링크 등등등 의 정보가 다 들어있는 것.
     
     USER_로 시작하는 것 
     ==> 오라클서버에 접속한 사용자 소유의 자신의오라클사용자정보, 자신이만든테이블, 자신이만든인덱스, 자신이만든데이터베이스링크 등등등 의 정보가 다 들어있는 것.
     
     ALL_로 시작하는 것 
     ==> 오라클서버에 접속한 사용자 소유의 즉, 자신의오라클사용자정보, 자신이만든테이블, 자신이만든인덱스, 자신이만든데이터베이스링크 등등등 의 정보가 다 들어있는 것
         과(와)
         자신의 것은 아니지만 조회가 가능한 다른사용자의오라클사용자정보, 다른사용자소유의테이블, 다른사용자소유의인덱스, 다른사용자소유의데이터베이스링크 등등등 의 정보가 다 들어있는 것. 
    */
    
    
    select *
    from dba_tables;
    
    select *
    from dba_tables
    where owner in ('HR', 'ORAUSER1');
    
    --  ========= SYS 로 접속한 것 끝 ========== --
    
    
    
    --  ========= HR 로 접속한 것 시작 ========== --
    show user;
    -- USER이(가) "HR"입니다.
    
    select *
    from dba_tables;
    -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
    
    select *
    from user_tables;
    
    select *
    from all_tables;
    
    select *
    from all_tables
    where owner = 'ORAUSER1';
    
    
    
    -- *** 자신이 만든 테이블에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** ---
    
    select *
    from dict 
    where table_name like 'USER_%' and lower(comments) like '%table%' ;
    
    
    select *
    from USER_TABLES;
    
    
    -- *** USER_TABLES 에서 보여지는 컬럼에 대한 설명을 보고 싶으면 아래와 같이하면 됩니다. *** --
    
    select *
    from dict_columns
    where table_name = 'USER_TABLES';
    
    
    
    -- *** 자신이 만든 테이블의 컬럼에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** ---
    
    select *
    from dict 
    where table_name like 'USER_%' and lower(comments) like '%column%';
    
    
    select *
    from USER_TAB_COLUMNS
    where table_name = 'EMPLOYEES'; 
    
    
    -- *** USER_TAB_COLUMNS 에서 보여지는 컬럼에 대한 설명을 보고 싶으면 아래와 같이하면 됩니다. *** --
    
    select *
    from dict_columns
    where table_name = 'USER_TAB_COLUMNS';
    
    
    -- *** 자신이 만든 테이블의 제약조건에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** ---
    
    
    select *
    from dict 
    where table_name like 'USER_%' and lower(comments) like '%constraint%';
    
    select *
    from USER_CONSTRAINTS
    where table_name = 'EMPLOYEES';
    
    
    select *
    from USER_CONS_COLUMNS
    where table_name = 'EMPLOYEES';
    
    
    
    -- *** 자신이 만든 데이터베이스 링크에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** ---
    
    select *
    from dict 
    where table_name like 'USER_%' and lower(comments) like '%database link%';
    
    
    select *
    from USER_DB_LINKS;
    
    
    -- *** 자신이 만든 시퀀스에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** ---
    
    select *
    from dict 
    where table_name like 'USER_%' and lower(comments) like '%sequence%';
    
    select *
    from USER_SEQUENCES;
    
    
    -- *** 자신이 만든 인덱스에 대한 모든 정보를 조회하고 싶다. 어디서 보면 될까요? *** ---
    
    select *
    from dict 
    where table_name like 'USER_%' and lower(comments) like '%index%';
   
    select * 
    from USER_INDEXES
    where table_name = 'EMPLOYEES';
    
    select *
    from USER_IND_COLUMNS
    where table_name = 'EMPLOYEES';
    
    
    -- *** 자신이 만든 테이블 'TBL_BOARD_TEST_1' 에서 어떤 컬럼에 default 값을 부여했는지 조회하고 싶다. 어디서 보면 될까요? *** ---
    
     select *
    from dict 
    where table_name like 'USER_%' and lower(comments) like '%column%';
    
    
    
    select column_name, data_default 
    from USER_TAB_COLUMNS
    where table_name = 'TBL_BOARD_TEST_1'
    
    
   
   
   
   --------------------------------------------------------------------------------------
   
        ----- **** PL/SQL(Procedure Language / Structured Query Language) **** -----
   
        
   ---- *** PL/SQL 구문에서 변수의 사용법 *** ----
   exec pcd_empInfo(101);
   /*
      <결과물>
      ----------------------------------------
        사원번호    사원명    성별    월급   나이
      ----------------------------------------
         101       ......   ...     ....  ...
   */
   
   exec pcd_empInfo(103);
   /*
      <결과물>
      ----------------------------------------
        사원번호    사원명    성별    월급   나이
      ----------------------------------------
         103       ......   ...     ....  ... 
   */
   
   exec pcd_empInfo(104);
   /*
      <결과물>
      ----------------------------------------
        사원번호    사원명    성별    월급   나이
      ----------------------------------------
         104       ......   ...     ....  ...
   */
   
   create or replace procedure pcd_empInfo 
   (p_employee_id IN number)  -- IN 은 입력모드를 말한다. number(5)와 같이 자리수를 넣어주면 오류이다.!!!!
   is 
      -- 변수의 선언부
      v_employee_id  number(5);     -- 자리수를 사용해도 된다.
      v_ename        varchar2(50);  -- 자리수를 사용해야 한다.
      v_gender       varchar2(10);  -- 자리수를 사용해야 한다.
      v_monthsal     varchar2(20);  -- 자리수를 사용해야 한다.
      v_age          number(3);     -- 자리수를 사용해도 된다.
   begin
      -- 실행부
      select employee_id, first_name || ' ' || last_name,
             case when substr(jubun,7,1) in('1','3') then '남' else '여' end,
             to_char( nvl(salary + (salary * commission_pct), salary), '$9,999,999'),
             extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 
             INTO
             v_employee_id, v_ename, v_gender, v_monthsal, v_age
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호    사원명    성별     월급   나이' );
      dbms_output.put_line( lpad('-',40,'-') );
      
      dbms_output.put_line( v_employee_id || '  ' || v_ename || '  ' || v_gender || '  ' || v_monthsal || '  ' || v_age);
      
   end pcd_empInfo;
   
   -- Procedure PCD_EMPINFO이(가) 컴파일되었습니다.
   
   /* 
       === SQL Developer 의 메뉴의 보기를 클릭하여 DBMS 출력을 클릭해주어야 한다. ===
       === 이어서 하단부에 나오는 DBMS 출력 부분의 녹색 + 기호를 클릭하여 local_hr 로 연결을 해준다. === 
   */
   
   exec pcd_empInfo(101);
   /*
    -----------------------------------------
    사원번호    사원명    성별     월급     나이
    -----------------------------------------
    101  Neena Kochhar  남      $17,000   58
   */
   
   exec pcd_empInfo(103);
   /*
    -------------------------------------------
    사원번호    사원명    성별     월급     나이
    -------------------------------------------
    103  Alexander Hunold  남       $9,000  48
   */
   
   exec pcd_empInfo(104);
   /*
    ----------------------------------------
    사원번호    사원명    성별     월급    나이
    ----------------------------------------
    104  Bruce Ernst  여       $6,000    62
   */
     
     
     
   ---- **** 생성되어진 프로시저의 소스를 조회해봅니다. **** -----
   select text
   from user_source
   where type = 'PROCEDURE' and name = 'PCD_EMPINFO';
   
/*
"procedure pcd_empInfo 
"
"   (p_employee_id IN number)  -- IN 은 입력모드를 말한다. number(5)와 같이 자리수를 넣어주면 오류이다.!!!!
"
"   is 
"
"      -- 변수의 선언부
"
"      v_employee_id  number(5);     -- 자리수를 사용해도 된다.
"
"      v_ename        varchar2(50);  -- 자리수를 사용해야 한다.
"
"      v_gender       varchar2(10);  -- 자리수를 사용해야 한다.
"
"      v_monthsal     varchar2(20);  -- 자리수를 사용해야 한다.
"
"      v_age          number(3);     -- 자리수를 사용해도 된다.
"
"   begin
"
"      -- 실행부
"
"      select employee_id, first_name || ' ' || last_name,
"
"             case when substr(jubun,7,1) in('1','3') then '남' else '여' end,
"
"             to_char( nvl(salary + (salary * commission_pct), salary), '$9,999,999'),
"
"             extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 
"
"             INTO
"
"             v_employee_id, v_ename, v_gender, v_monthsal, v_age
"
"      from employees
"
"      where employee_id = p_employee_id;
"
"
"
"      dbms_output.put_line( lpad('-',40,'-') );
"
"      dbms_output.put_line( '사원번호    사원명    성별     월급   나이' );
"
"      dbms_output.put_line( lpad('-',40,'-') );
"
"
"
"      dbms_output.put_line( v_employee_id || '  ' || v_ename || '  ' || v_gender || '  ' || v_monthsal || '  ' || v_age);
"
"
"
   end pcd_empInfo;
*/
   

   create or replace procedure pcd_empInfo_2 
   (p_employee_id IN employees.employee_id%type)  -- p_employee_id 변수의 타입은 employees 테이블에 있는 employee_id 컬럼의 타입을 쓰겠다는 말이다. 
   is 
      -- 변수의 선언부
      v_employee_id  employees.employee_id%type; 
      v_ename        varchar2(50);  
      v_gender       varchar2(10);  
      v_monthsal     varchar2(20);
      v_age          number(3);
   begin
      -- 실행부
      select employee_id, first_name || ' ' || last_name,
             case when substr(jubun,7,1) in('1','3') then '남' else '여' end,
             to_char( nvl(salary + (salary * commission_pct), salary), '$9,999,999'),
             extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 
             INTO
             v_employee_id, v_ename, v_gender, v_monthsal, v_age
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호    사원명    성별     월급   나이' );
      dbms_output.put_line( lpad('-',40,'-') );
      
      dbms_output.put_line( v_employee_id || '  ' || v_ename || '  ' || v_gender || '  ' || v_monthsal || '  ' || v_age );
      
   end pcd_empInfo_2;
   -- Procedure PCD_EMPINFO_2이(가) 컴파일되었습니다.
   
   execute pcd_empInfo_2(101); 
   /*
   ----------------------------------------
    사원번호    사원명    성별     월급   나이
    ----------------------------------------
    101  Neena Kochhar  남      $17,000  38
   */
   
   exec pcd_empInfo_2(104);
/*
    ----------------------------------------
    사원번호    사원명    성별     월급   나이
    ----------------------------------------
    104  Bruce Ernst  여       $6,000  62
*/
   
   
   create or replace procedure pcd_empInfo_3 
   (p_employee_id IN employees.employee_id%type) 
   is 
      --- record 타입 생성 ---
      type empInfoType is record
      (employee_id  employees.employee_id%type
      ,ename        varchar2(50)  
      ,gender       varchar2(10)  
      ,monthsal     varchar2(20)
      ,age          number(3)
      );
      
      v_rcd  empInfoType;
      
   begin
 
      select employee_id, first_name || ' ' || last_name,
             case when substr(jubun,7,1) in('1','3') then '남' else '여' end,
             to_char( nvl(salary + (salary * commission_pct), salary), '$9,999,999'),
             extract(year from sysdate) - ( to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 
             INTO
             v_rcd
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호    사원명    성별     월급   나이' );
      dbms_output.put_line( lpad('-',40,'-') );
      
      dbms_output.put_line( v_rcd.employee_id || '  ' || v_rcd.ename || '  ' || v_rcd.gender || '  ' || v_rcd.monthsal || '  ' || v_rcd.age );
      
   end pcd_empInfo_3;
   
   -- Procedure PCD_EMPINFO_3이(가) 컴파일되었습니다.
   
   exec pcd_empInfo_3(102); 
/*
    ----------------------------------------
    사원번호    사원명    성별     월급   나이
    ----------------------------------------
    101  Neena Kochhar  남      $17,000  38
*/
   
   
   create or replace procedure pcd_empInfo_4 
   (p_employee_id IN employees.employee_id%type) 
   is 
      v_all      employees%rowtype;  -- v_all 변수의 타입은 employees 테이블의 모든 컬럼을 받아주는 행타입이다.
      v_result   varchar2(1000);
   begin
     select * INTO v_all
     from employees
     where employee_id = p_employee_id;
 
     v_result := v_all.employee_id || '  ' ||
                 v_all.first_name || ' ' || v_all.last_name || '  ' ||
                 case when substr(v_all.jubun,7,1) in('1','3') then '남' else '여' end || '  ' ||
                 to_char( nvl(v_all.salary + (v_all.salary * v_all.commission_pct), v_all.salary), '$9,999,999') || '  ' ||
                ( extract(year from sysdate) - ( to_number(substr(v_all.jubun,1,2)) + case when substr(v_all.jubun,7,1) in('1','2') then 1900 else 2000 end ) + 1 ); 
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호    사원명    성별     월급   나이' );
      dbms_output.put_line( lpad('-',40,'-') );
      
      dbms_output.put_line( v_result );
      
   end pcd_empInfo_4;
   -- Procedure PCD_EMPINFO_4이(가) 컴파일되었습니다.
   
   exec pcd_empInfo_4(101);
/*
    ----------------------------------------
    사원번호    사원명    성별     월급   나이
    ----------------------------------------
    101  Neena Kochhar  남      $17,000  38
*/
   
   select name, text
   from user_source
   where type = 'PROCEDURE' and name in('PCD_EMPINFO','PCD_EMPINFO_2','PCD_EMPINFO_3','PCD_EMPINFO_4');
   
   
   
   ------------------------------------------------------------------------------------------------
   
            ------ ****** 사용자 정의 함수(Function) ****** ------ 
   
   ------------------------------------------------------------------------------------------------
   
   -- 주민번호를 입력받아서 성별을 알려주는 함수 func_gender(주민번호)을 생성해보겠습니다. --
  /*
      [문법]
      create or replace function 함수명 
      (파라미터변수명  IN  파라미터변수의타입)
      return 리턴되어질타입
      is
         변수선언;
      begin
         실행문;
         return 리턴되어질값;
      end 함수명;
   */
   
   create or replace function func_gender 
   (p_jubun IN varchar2)    -- varchar2(13) 와 같이 자리수를 쓰면 오류이다.!!! 
   return varchar2          -- varchar2(6) 와 같이 자리수를 쓰면 오류이다.!!!
   is
     v_result  varchar2(6); -- 여기는 자리수를 써야 한다.!!!
   begin
     select case when substr(p_jubun, 7, 1) in ('1','3') then '남' else '여' end
            into 
            v_result
     from dual;
     
     return v_result;
   end func_gender;
   -- Function FUNC_GENDER이(가) 컴파일되었습니다.
   
   select func_gender('9007201234567'), func_gender('9007202234567')
        , func_gender('0107203234567'), func_gender('0107204234567')
   from dual;
   -- 남	 여	남	여
   
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , jubun AS 주민번호
        , func_gender(jubun) AS 성별
   from employees;
   
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , jubun AS 주민번호
        , func_gender(jubun) AS 성별
   from employees
   where func_gender(jubun) = '여';
   
   
   ---- *** 생성되어진 함수 조회하기 *** ----
   select *
   from user_source
   where type = 'FUNCTION' and name = 'FUNC_GENDER';
   
   -- 나이를 구해주는 함수 만들기
   create or replace function func_age
   (p_jubun IN varchar2)
   return number
   is
     v_age number(3);
   begin
     v_age := extract(year from sysdate) - ( to_number( substr(p_jubun, 1 ,2))+ case when substr(p_jubun, 7, 1)in('1','2')then 1900 else 2000 end) + 1;
     return v_age;
   end func_age;
   -- unction FUNC_AGE이(가) 컴파일되었습니다.

   select func_age('9007131234567'),func_age('0107134234567')
   from dual;
   -- 33	22
   
   
   select employee_id AS 사원번호
        , first_name || ' ' || last_name AS 사원명
        , jubun AS 주민번호
        , func_gender(jubun) AS 성별
        , func_age(jubun) as 현재나이
        , trunc(func_age(jubun), -1) as 연령대
   from employees
   where func_gender(jubun) = '여' and trunc(func_age(jubun), -1) in (20, 40);
   
   
   -- 정년퇴직일을 구해주는 함수 만들기
   create or replace function func_retirement_day
   (p_jubun IN varchar2)
   return date
   is
      v_retirement_day date;
   begin
      
      select last_day( to_date( to_char (add_months( sysdate, (63-func_age(p_jubun))*12), 'yyyy') || 
                      case when substr(p_jubun,3,2 ) between '03' and '08' then '-08-01' else '02-01' end
                     ,'yyyy-mm-dd') )
             into v_retirement_day
      from dual; 
   
      return v_retirement_day;
   end func_retirement_day;
   -- Function FUNC_RETIREMENT_DAY이(가) 컴파일되었습니다.
  
/*
   --- [퀴즈] ---
   employees 테이블에서 모든 사원들에 대해
   사원번호, 사원명, 주민번호, 성별, 현재나이, 월급, 입사일자, 정년퇴직일, 정년까지근무할개월수, 퇴직금 을 나타내세요.

   여기서 정년퇴직일이라 함은 
   해당 사원의 생월이 3월에서 8월에 태어난 사람은 
   해당사원의 나이(한국나이)가 63세가 되는 년도의 8월말일(8월 31일)로 하고,
   해당사원의 생월이 9월에서 2월에 태어난 사람은 
   해당사원의 나이(한국나이)가 63세가 되는 년도의 2월말일(2월 28일 또는 2월 29일)로 한다.

*/

  select employee_id AS 사원번호
       , first_name || ' ' || last_name AS 사원명
       , jubun AS 주민번호
       , func_gender(jubun) AS 성별
       , func_age(jubun) as 현재나이
       , nvl(salary + (salary * commission_pct), salary) as 월급
       , hire_date as 입사일자
       , func_retirement_day(jubun) as 정년퇴직일
       , trunc( months_between(func_retirement_day(jubun), hire_date )) as 정년까지근무할개월수
       , trunc(trunc( months_between(func_retirement_day(jubun), hire_date ))/12)*nvl(salary + (salary * commission_pct), salary) 퇴직금
   from employees;
   
   
   
--- [퀴즈] 아래와 같은 결과물이 나오도록 프로시저 pcd_employees_info 를 생성하세요..
---        성별과 나이는 위에서 만든 함수를 사용하세요..

execute pcd_employees_info(101); -- 여기서 숫자 101 은 사원번호이다.
exec pcd_employees_info(101); -- 여기서 숫자 101 은 사원번호이다.

/*
   ----------------------------------------
   사원번호  부서명  사원명  입사일자  성별  나이
   ----------------------------------------
     101     ...    ...   ......   ...  ...
     
*/
   
 
 select employee_id, D.department_name, E.first_name || ' ' || E.last_name,
        E.hire_date, func_gender(E.jubun), func_age(E.jubun)
 from departments D RIGHT JOIN employees E
 ON D.department_id = E.department_id
 where E.employee_id = 101;
 
 
 
 with E as
 (
 select employee_id, first_name || ' ' || last_name as ename,
        hire_date, func_gender(jubun) as gender , func_age(jubun) as age , department_id
 from employees
 where employee_id = 178
 )
 , D as
 ( 
 select department_id, department_name
 from departments
 )
 select E.employee_id, D.department_name, E.ename, E.hire_date, E.GENDER , E.AGE
 from E LEFT JOIN D
 ON E.department_id = D.department_id;
 
 
 
 
 
 create or replace procedure pcd_employees_info
 (p_employee_id IN employees.employee_id%type)
 is 
   V_employee_id      employees.employee_id%type;
   V_department_name  departments.department_name%type;
   V_ename            varchar2(40);
   V_hire_date       employees.hire_date%type;
   V_GENDER          varchar(6);
   V_AGE              number(3);
 begin
     with E as
     (
     select employee_id, first_name || ' ' || last_name as ename,
            hire_date, func_gender(jubun) as gender , func_age(jubun) as age , department_id
     from employees
     where employee_id = p_employee_id
     )
     , D as
     ( 
     select department_id, department_name
     from departments
     )
     select E.employee_id, D.department_name, E.ename, E.hire_date, E.GENDER , E.AGE
            INTO
            V_employee_id, V_department_name, V_ename, V_hire_date, V_GENDER , V_AGE
            
     from E LEFT JOIN D
     ON E.department_id = D.department_id;
     
     dbms_output.put_line( lpad('-',50,'-') );
     dbms_output.put_line( '사원번호  부서명  사원명  입사일자  성별  나이');
     dbms_output.put_line( lpad('-',50,'-') );
     dbms_output.put_line( V_employee_id || ' ' || V_department_name || ' ' || V_ename || ' ' || V_hire_date || ' ' || V_GENDER || ' ' || V_AGE);
     
 end pcd_employees_info;
 
 exec pcd_employees_info(101);
/*
--------------------------------------------------
사원번호   부서명   사원명   입사일자   성별   나이
--------------------------------------------------
101 Executive Neena Kochhar 05/09/21 남 38
*/

exec pcd_employees_info(178);
/*
--------------------------------------------------
사원번호   부서명   사원명   입사일자   성별   나이
--------------------------------------------------
178               Kimberely Grant 07/05/24 여 25
*/


create table tbl_abcd
(bunho_1 number    --   -10의 130승 ~ 10 127승
,bunho_2 number(2) --   -99 ~ 99
);
--Table TBL_ABCD이(가) 생성되었습니다

insert into tbl_abcd(bunho_1, bunho_2) values(123456785646464646546, 10)
-- 1 행 이(가) 삽입되었습니다.
insert into tbl_abcd(bunho_1, bunho_2) values(123456785646464646546, 999)
/*
오류 보고 -
ORA-01438: 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
*/
 
 
create table tbl_def
(memo  varchar2
);
/*
오류 보고 -
ORA-00906: 누락된 좌괄호
*/

create table tbl_def
(memo  varchar2(50)
)
-- Table TBL_DEF이(가) 생성되었습니다.

    
exec pcd_employees_info(3370);
/*
오류 보고 -
ORA-01403: 데이터를 찾을 수 없습니다.
01403. 00000 -  "no data found"
*/
-- !!!! 프로시저에서 데이터가(행)이 없을 경우 "no data found" 라는 오류가 발생한다.

-- [데이터가(행)이 없을 경우 해결책]
-- ==> 예외절(Exception)처리를 해주면 된다.

create or replace procedure pcd_employees_info
 (p_employee_id IN employees.employee_id%type)
 is 
   V_employee_id      employees.employee_id%type;
   V_department_name  departments.department_name%type;
   V_ename            varchar2(40);
   V_hire_date        employees.hire_date%type;
   V_GENDER           varchar(6);
   V_AGE              number(3);
 begin
     with E as
     (
     select employee_id, first_name || ' ' || last_name as ename,
            hire_date, func_gender(jubun) as gender , func_age(jubun) as age , department_id
     from employees
     where employee_id = p_employee_id
     )
     , D as
     ( 
     select department_id, department_name
     from departments
     )
     select E.employee_id, D.department_name, E.ename, E.hire_date, E.GENDER , E.AGE
            INTO
            V_employee_id, V_department_name, V_ename, V_hire_date, V_GENDER , V_AGE
            
     from E LEFT JOIN D
     ON E.department_id = D.department_id;
     
     dbms_output.put_line( lpad('-',50,'-') );
     dbms_output.put_line( '사원번호  부서명  사원명  입사일자  성별  나이');
     dbms_output.put_line( lpad('-',50,'-') );
     dbms_output.put_line( V_employee_id || ' ' || V_department_name || ' ' || V_ename || ' ' || V_hire_date || ' ' || V_GENDER || ' ' || V_AGE);
     
     EXCEPTION
          WHEN no_data_found THEN -- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우 발생하는 오류임.
               dbms_output.put_line('>> 사원번호 '|| p_employee_id || '은 존재하지 않습니다. <<');
 
 end pcd_employees_info;
 -- Procedure PCD_EMPLOYEES_INFO이(가) 컴파일되었습니다.
 
 
 exec pcd_employees_info(3370);
 -- >> 사원번호 3370은 존재하지 않습니다. <<
 
 
 
 
 --------- ===== *** 제어문(IF 문) *** ==== ----------
 
 /*
   ※ 형식
   
   if     조건1  then  실행문장1;
   elsif  조건2  then  실행문장2;
   elsif  조건3  then  실행문장3;
   else               실행문장4;
   end if;
   
*/


-- 나이를 구해주는 함수 만들기
   create or replace function func_age_2
   (p_jubun IN varchar2)
   return number
   is
     v_age           number(3);
     v_year          number(4);
     v_gender_number varchar2(1) := substr(p_jubun, 7, 1); 
     
     error_jubun     EXCEPTION; -- error_jubun 은 사용자가 정의하는 예외절(Exception)임을 선언한다.
     
   begin
     if    v_gender_number in('1','2') then v_year := 1900;
     elsif v_gender_number in('3','4') then v_year := 2000;
     else  RAISE error_jubun; -- error_jubun 은 사용자가 정의하는 예외절(Exception)이다
     end if; 
   
     v_age := extract(year from sysdate) - ( to_number( substr(p_jubun, 1 ,2))+ v_year ) + 1;
     return v_age;
     
     EXCEPTION 
          WHEN error_jubun THEN
               RAISE_APPLICATION_ERROR(-20001, '>> 주민번호 성별은 1,2,3,4 중에 하나이어야 합니다. <<');
               -- -- -20001 은 오류번호로써, 사용자가 정의해주는 EXCEPTION 에 대해서는 오류번호를 -20001 부터 -20999 까지만 사용하도록 오라클에서 비워두었다.
          WHEN others THEN
               RAISE_APPLICATION_ERROR(-20002, '>> 올바른 주민번호가 아닙니다. <<');
               
   end func_age_2;
   -- Function FUNC_AGE_2이(가) 컴파일되었습니다.
 
   select func_age_2('9007131234567')
   from dual;
   
   select func_age_2('sdfdsf1fd5672')
   from dual;
   
   select func_age_2('9007139234567')
   from dual;
   
   
   
   ------- ==== *** 반복문 *** ==== --------
   /*
      반복문에는 종류가 3가지가 있다.
      
      1. 기본 LOOP 문
      2. FOR LOOP 문
      3. WHILE LOPP 문
   */


   ----- ===== 1. 기본 LOOP 문 ===== -----
   /*
      [문법]
      LOOP
          실행문장;
      EXIT WHEN 탈출조건;   -- 탈출조건이 참 이라면 LOOP 를 탈출한다.
      END LOOP;
  */
  create table tbl_looptest_1
  (bunho       number
  ,name        varchar2(50)
  );
  -- Table TBL_LOOPTEST_1이(가) 생성되었습니다.
  
  --- *** tbl_looptest_1 테이블에 행을 20000 개를 insert 해보겠습니다. *** ---
  create or replace procedure pcd_tbl_looptest_1_insert 
  (p_name   IN   tbl_looptest_1.name%type
  ,p_count  IN   number)   -- p_count 에 20000 을 넣을 것이다.
  is
     v_bunho  tbl_looptest_1.bunho%type := 0;  -- 변수의 초기화!!!(변수에 값을 처음부터 넣어주기)
  begin
        LOOP
           v_bunho := v_bunho + 1;
           EXIT WHEN v_bunho > p_count;
           insert into tbl_looptest_1(bunho, name) values(v_bunho, p_name||v_bunho);
        END LOOP;
  end pcd_tbl_looptest_1_insert;
  -- Procedure PCD_TBL_LOOPTEST_1_INSERT이(가) 컴파일되었습니다.
  
  exec pcd_tbl_looptest_1_insert('홍길동', 20000);
  -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
  
  select *
  from tbl_looptest_1
  order by bunho asc;
  
  select count(*)
  from tbl_looptest_1;
  -- 20000
  
  rollback;
  -- 롤백 완료.
  
  exec pcd_tbl_looptest_1_insert('엄정화', 50000); 
  -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
  
  commit;

  select *
  from tbl_looptest_1
  order by bunho asc;
  
  select count(*)
  from tbl_looptest_1;
  -- 50000
  
  
  
   ----- *** 이름이 없는 익명 (Anonymous Procedure프로시저 로 tbl_looptest_1 테이블에 행을 20000 개를 insert 하겠습니다. *** --------
  declare
        v_bunho    number := 50000;          -- 변수의 선언 및 초기화
        v_count    number := 0;          -- 변수의 선언 및 초기화
        v_name     varchar2(20) := '이혜리';  -- 변수의 선언 및 초기화
  begin 
        LOOP
           v_bunho := v_bunho + 1;
           v_count := v_count + 1; 
           EXIT WHEN v_count > 20000;
           insert into tbl_looptest_1(bunho, name) values(v_bunho, v_name||v_count);
        END LOOP;
  end ;
  -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
  
  commit;
  
  
   ----- ===== 2. FOR LOOP 문 ===== -----
   /*
      [문법]
      
      for 변수 in [reverse] 시작값..마지막값 loop
          실행문장;
      end loop;
  */
  
  truncate table tbl_looptest_1;
  -- Table TBL_LOOPTEST_1이(가) 잘렸습니다.
  
  select count(*)
  from tbl_looptest_1;
  -- 0
  
  create or replace procedure pcd_tbl_looptest_1_insert_2
  (p_name   IN   tbl_looptest_1.name%type
  ,p_count  IN   number)   -- p_count 에 20000 을 넣을 것이다.
  is
  begin
       for i in 1..p_count loop  -- 변수 i 에 맨처음에는 1이 들어가고 다음에는 매번 1씩 증가된 값이 i 에 들어가는데 p_count 까지                                  
            insert into tbl_looptest_1(bunho, name) values(i, p_name||i);                             
       end loop;       
  end pcd_tbl_looptest_1_insert_2;
  -- Procedure PCD_TBL_LOOPTEST_1_INSERT_2이(가) 컴파일되었습니다.

  exec pcd_tbl_looptest_1_insert_2('김민수', 20000);
  -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
  
  commit
  
  select *
  from tbl_looptest_1
  order by bunho asc;
  
  select count(*)
  from tbl_looptest_1;
  -- 20000
  
  truncate table tbl_looptest_1;
  -- Table TBL_LOOPTEST_1이(가) 잘렸습니다.
  
  declare
      v_name varchar2(20) := '이순신';
  begin
       for i in reverse 1..100 loop  -- 변수 i 에 맨처음에는 100이 들어가고 다음에는 매번 1씩 감소된 값이 i 에 들어가는데 p_count 까지 i에 들어간다                                 
            insert into tbl_looptest_1(bunho, name) values(i, v_name||i);                             
       end loop;       
  end ;
  -- PL/SQL 프로시저가 성공적으로 완료되었습니다.
  
  commit;
  
  select *
  from tbl_looptest_1;
  
  
  ----- ===== 3. WHILE LOOP 문 ===== -----
  /*
     [문법]
     WHILE 조건 LOOP
        실행문장;   -- 조건이 참이라면 실행문장; 을 실행함. 조건이 거짓이 되면 반복문을 빠져나간다.
     END LOOP;
     
     
     WHILE NOT 조건 LOOP
        실행문장;   -- 조건이 참이라면 반복문을 빠져나간다.
     END LOOP;       
  */
  
  truncate table tbl_looptest_1;
  -- Table TBL_LOOPTEST_1이(가) 잘렸습니다.
  
  declare
     v_name varchar2(20) := '유관순'; -- 변수의 선언 및 초기화
     v_cnt  number(3) := 1;
    begin 
         
         while v_cnt <= 100 loop        
            insert into tbl_looptest_1(bunho, name) values(v_cnt, v_name)||v_cnt);   -- 조건이 참이라면 실행문장; 을 실행함. 조건이 거짓이 되면 반복문을 빠져나간다.
            v_cnt := v_cnt + 1;
        
         end loop;
    end; 
    
     
     
     truncate table tbl_looptest_1;
  -- Table TBL_LOOPTEST_1이(가) 잘렸습니다
  
  
    declare
     v_name varchar2(20) := '유관순'; -- 변수의 선언 및 초기화
     v_cnt  number(3) := 1;
    begin         
         while not (v_cnt > 100) loop  -- not(탈출조건)은 탈출조건이 참이라면 전체가 거짓이 되어지므로 반복문을 빠져나간다.     
            insert into tbl_looptest_1(bunho, name) values(v_cnt, v_name||v_cnt);   -- 조건이 참이라면 실행문장; 을 실행함. 조건이 거짓이 되면 반복문을 빠져나간다.
            v_cnt := v_cnt + 1;       
         end loop;
    end; 
    --PL/SQL 프로시저가 성공적으로 완료되었습니다.
    
    commit;
  
  select *
  from tbl_looptest_1;
  
  
  ------------------------------------------------------------------------------------
  
  create table tbl_member_test1
  (userid      varchar2(20)
  ,passwd      varchar2(20) not null
  ,name        varchar2(30) not null
  ,constraint  PK_tbl_member_test1_userid  primary key(userid)
  ); 
  -- Table TBL_MEMBER_TEST1이(가) 생성되었습니다.
  
  insert into tbl_member_test1(userid, passwd, name) values('leess', 'abcd1234', '이순신');
  -- 1 행 이(가) 삽입되었습니다.

  rollback;
  -- 롤백 완료.
  
  select * from tbl_member_test1
  
  exec pcd_tbl_member_test1_insert('leess', 'ad12$!', '이순신');
  --> insert 가 안되어지고 오류메시지 -20003 '암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.'
  
  exec pcd_tbl_member_test1_insert('leess', 'abcd1234', '이순신');
  --> insert 가 안되어지고 오류메시지 -20003 '암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.'
   
  exec pcd_tbl_member_test1_insert('leess', 'abcd1234$', '이순신');
  --> insert 가 안되어지고 오류메시지 -20003 '암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.'
   
  exec pcd_tbl_member_test1_insert('leess', 'qWer1234$', '이순신');
  --> 입력 성공!!
   
   
   create or replace procedure pcd_tbl_member_test1_insert
  (p_userid IN tbl_member_test1.userid%type
  ,p_passwd    tbl_member_test1.passwd%type   -- IN 만큼은 생략가능한데 생략하면 IN 으로 본다.
  ,p_name      tbl_member_test1.name%type
  )
  is
     v_length        number(2);     --  -99 ~ 99 
     error_insert    exception;
     v_ch            varchar2(1);
     v_flag_upper    number(1) := 0; -- 대문자 표식
     v_flag_lower    number(1) := 0; -- 소문자 표식
     v_flag_num      number(1) := 0; -- 숫자 표식
     v_flag_special  number(1) := 0; -- 특수문자 표식
     
  begin
       v_length := length(p_passwd);
        
       if( v_length < 8 OR v_length > 20 ) then
           raise  error_insert;  -- 사용자가 정의하는 예외절(EXCEPTION)을 구동시켜라.
       else
           for i in 1..v_length loop
              v_ch := substr(p_passwd, i, 1);
              
              if( v_ch between 'A' and 'Z' )    then v_flag_upper := 1;
              elsif( v_ch between 'a' and 'z' ) then v_flag_lower := 1;
              elsif( v_ch between '0' and '9' ) then v_flag_num := 1;
              else v_flag_special := 1;
              end if;
               
           end loop;
           
           if (v_flag_upper * v_flag_lower * v_flag_num * v_flag_special = 1) then
               insert into tbl_member_test1(userid, passwd, name) values(p_userid, p_passwd, p_name);
               dbms_output.put_line('입력성공!!');
           else
               raise error_insert;  -- 사용자가 정의하는 예외절(EXCEPTION)을 구동시켜라.
           end if;    
           
       end if;
       
       exception
            when error_insert then
                 raise_application_error(-20003, '암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.');
         
  end pcd_tbl_member_test1_insert;
  -- Procedure PCD_TBL_MEMBER_TEST1_INSERT이(가) 컴파일되었습니다.
  
  select * from tbl_member_test1;
  
  exec pcd_tbl_member_test1_insert('leess', 'ab12$!', '이순신');
  -- ORA-20003: 암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.
  
  exec pcd_tbl_member_test1_insert('leess', 'abcd1234', '이순신');
  -- ORA-20003: 암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.
  
  exec pcd_tbl_member_test1_insert('leess', 'qwer1234$', '이순신');
  -- ORA-20003: 암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.
  
  exec pcd_tbl_member_test1_insert('leess', 'qWer1234$', '이순신');
  --> 입력성공!!
  
  select * from tbl_member_test1;
  
  commit;
  -- 커밋 완료.
 
 
 
 
  
  
   ------------ ***** 사용자 정의 예외절(EXCEPTION) ***** ----------------
     예외절 = 오류절
     
     ※ 형식
     
     exception
          when  익셉션이름1  [or 익셉션이름2]  then
                실행문장1;
                실행문장2;
                실행문장3;
                
          when  익셉션이름3  [or 익셉션이름4]  then
                실행문장4;
                실행문장5;
                실행문장6; 
                
          when  others  then  
                실행문장7;
                실행문장8;
                실행문장9; 
   ------------------------------------------------------------------  
  
   /*
      === tbl_member_test1 테이블에 insert 할 수 있는 요일명과 시간을 제한해 두겠습니다. ===
        
          tbl_member_test1 테이블에 insert 할 수 있는 요일명은 월,화,수,목,금 만 가능하며
          또한 월,화,수,목,금 중에 오후 2시 부터 오후 5시 이전까지만(오후 5시 정각은 안돼요) insert 가 가능하도록 하고자 한다.
          만약에 insert 가 불가한 요일명(토,일)이거나 불가한 시간대에 insert 를 시도하면 
          '영업시간(월~금 14:00 ~ 16:59:59 까지) 아니므로 입력불가함!!' 이라는 오류메시지가 뜨도록 한다. 
   */
  create or replace procedure pcd_tbl_member_test1_insert
  (p_userid IN tbl_member_test1.userid%type
  ,p_passwd    tbl_member_test1.passwd%type   -- IN 만큼은 생략가능한데 생략하면 IN 으로 본다.
  ,p_name      tbl_member_test1.name%type
  )
  is
     v_length        number(2);     --  -99 ~ 99 
     error_insert    exception;
     v_ch            varchar2(1);
     v_flag_upper    number(1) := 0; -- 대문자 표식
     v_flag_lower    number(1) := 0; -- 소문자 표식
     v_flag_num      number(1) := 0; -- 숫자 표식
     v_flag_special  number(1) := 0; -- 특수문자 표식
     error_dayTime   exception;
     
  begin
       
       -- 입력(insert)이 불가한 요일명과 시간대를 알아봅니다. --
       if ( to_char(sysdate, 'd') in('1','7') OR    -- to_char(sysdate, 'd') ==> '1'(일), '2'(월), '3'(화), '4'(수), '5'(목), '6'(금), '7'(토) 
            to_char(sysdate, 'hh24') < '14' OR to_char(sysdate, 'hh24') > '16'
           ) then raise error_dayTime;
       
       else -- 암호검사를 하겠다.
           v_length := length(p_passwd);
            
           if( v_length < 8 OR v_length > 20 ) then
               raise  error_insert;  -- 사용자가 정의하는 예외절(EXCEPTION)을 구동시켜라.
           else
               for i in 1..v_length loop
                  v_ch := substr(p_passwd, i, 1);
                  
                  if( v_ch between 'A' and 'Z' )    then v_flag_upper := 1;
                  elsif( v_ch between 'a' and 'z' ) then v_flag_lower := 1;
                  elsif( v_ch between '0' and '9' ) then v_flag_num := 1;
                  else v_flag_special := 1;
                  end if;
                   
               end loop;
               
               if (v_flag_upper * v_flag_lower * v_flag_num * v_flag_special = 1) then
                   insert into tbl_member_test1(userid, passwd, name) values(p_userid, p_passwd, p_name);
                   dbms_output.put_line('입력성공!!');
               else
                   raise error_insert;  -- 사용자가 정의하는 예외절(EXCEPTION)을 구동시켜라.
               end if;    
               
           end if;
           
       end if;    
       
       exception
            when error_dayTime then
                 raise_application_error(-20004, '영업시간(월~금 14:00 ~ 16:59:59 까지) 아니므로 입력불가함!!');
            when error_insert then
                 raise_application_error(-20003, '암호는 최소 8글자 이상이면서 대문자, 소문자, 숫자, 특수문자가 혼합되어져야 합니다.');
         
  end pcd_tbl_member_test1_insert;
  -- Procedure PCD_TBL_MEMBER_TEST1_INSERT이(가) 컴파일되었습니다.
  
  exec pcd_tbl_member_test1_insert('eomjh', 'aBcd1234$', '엄정화');
  -- 입력성공!!
  
   exec pcd_tbl_member_test1_insert('kangkc', 'wXyz1234$', '강감찬');
  
  commit;
   
  select * 
  from tbl_member_test1; 
  
  
  
  
  
  
  ----- ==== **** 오라클에서는 배열이 없습니다만 배열처럼 사용되어지는 table 타입 변수가 있습니다. **** ===== -----
  --              그래서 table 타입 변수를 사용하여 자바의 배열처럼 사용합니다. -- 
  
 create or replace procedure pcd_employees_info_deptid
 (p_department_id IN employees.department_id%type)
 is
   v_department_id    employees.department_id%type;
   V_employee_id      employees.employee_id%type;
   V_department_name  departments.department_name%type;
   V_ename            varchar2(40);
   V_hire_date        employees.hire_date%type;
   V_GENDER           varchar(6);
   V_AGE              number(3);
 begin
     with E as
     (
     select employee_id, first_name || ' ' || last_name as ename,
            hire_date, func_gender(jubun) as gender , func_age(jubun) as age , department_id
     from employees
     where department_id = p_department_id
     )
     , D as
     ( 
      select department_id, department_name
      from departments
     )
     select E.department_id,E.employee_id, D.department_name, E.ename, E.hire_date, E.GENDER , E.AGE
            INTO
            v_department_id,V_employee_id, V_department_name, V_ename, V_hire_date, V_GENDER , V_AGE           
     from E LEFT JOIN D
     ON E.department_id = D.department_id;
     
     dbms_output.put_line( lpad('-',60,'-') );
     dbms_output.put_line( '부서번호  부서명  사원번호  사원명  입사일자  성별  나이');
     dbms_output.put_line( lpad('-',60,'-') );
     dbms_output.put_line( v_department_id || ' ' || V_department_name || ' ' || V_employee_id || ' ' || V_ename || ' ' || V_hire_date || ' ' || V_GENDER || ' ' || V_AGE);
     
     EXCEPTION
          WHEN no_data_found THEN -- no_data_found 은 오라클에서 데이터가 존재하지 않을 경우 발생하는 오류임.
               dbms_output.put_line('>> 부서번호 '|| p_department_id || '은 존재하지 않습니다. <<');
 
 end pcd_employees_info_deptid;
 -- Procedure PCD_EMPLOYEES_INFO_DEPTID이(가) 컴파일되었습니다.

  
 exec pcd_employees_info_deptid(10);
 
 exec pcd_employees_info_deptid(30);
/*
오류 보고 -
ORA-01422: 실제 인출은 요구된 것보다 많은 수의 행을 추출합니다
*/


  --- *** 위에서 만든 pcd_employees_info_deptid 을 올바르게 작동하도록 해결하기 *** ---
  --  table 타입 변수를 사용하면 해결된다.
  
create or replace procedure pcd_employees_info_deptid
(p_department_id IN employees.department_id%type)
is
    type department_id_Type
    is table of employees.department_id%type index by binary_integer;
    
    type department_name_Type
    is table of departments.department_name%type index by binary_integer;
    
    type employee_id_Type
    is table of employees.employee_id%type index by binary_integer;
    
    type ename_Type
    is table of varchar2(30) index by binary_integer;
    
    type hire_date_Type
    is table of varchar2(10) index by binary_integer;
    
    type gender_Type
    is table of varchar2(6) index by binary_integer;
    
    type age_Type
    is table of number(3) index by binary_integer;
    
    v_tab_department_id      department_id_Type;
    v_tab_department_name    department_name_Type;
    v_tab_employee_id        employee_id_Type;
    v_tab_ename              ename_Type;
    v_tab_hire_date          hire_date_Type;
    v_tab_gender             gender_Type;
    v_tab_age                age_Type;
    
    i  binary_integer := 0;  -- i 가 마치 배열의 방번호 용도 처럼 쓰인다.
                             -- 그런데 자바에서 배열의 시작은 0 번 부터 시작하지만
                             -- 오라클에서는 1 번 부터 시작한다. 
   
begin

    FOR v_rcd IN (  WITH 
                     E AS
                     (
                      select employee_id, first_name || ' ' || last_name AS ENAME,
                            hire_date, func_gender(jubun) AS GENDER, func_age(jubun) AS AGE, department_id
                      from employees
                      where department_id = p_department_id
                    )
                    , 
                    D AS 
                    (
                     select department_id, department_name
                     from departments
                    )
                    select E.department_id, E.employee_id, D.department_name, E.ename, to_char(E.hire_date, 'yyyy-mm-dd') AS hire_date , E.gender, E.age
                    from E LEFT JOIN D
                    ON E.department_id = D.department_id ) LOOP
    
         i := i+1;
         
         v_tab_department_id(i) := v_rcd.department_id;
         v_tab_department_name(i) := v_rcd.department_name; 
         v_tab_employee_id(i) := v_rcd.employee_id;
         v_tab_ename(i) := v_rcd.ename;
         v_tab_hire_date(i) := v_rcd.hire_date;
         v_tab_gender(i) := v_rcd.gender;
         v_tab_age(i) := v_rcd.age;
    
    END LOOP;
    
    -- dbms_output.put_line('~~~~ 확인용 i => ' || i);
    
    if(i = 0) then
       raise no_data_found;
    else 
    
        dbms_output.put_line( lpad('-',60,'-') );
        dbms_output.put_line( '부서번호  부서명  사원번호   사원명   입사일자   성별   나이' );
        dbms_output.put_line( lpad('-',60,'-') );
        
        FOR k IN 1..i LOOP
             dbms_output.put_line( v_tab_department_id(k) || '  ' ||
                                   v_tab_department_name(k) || '  ' ||
                                   v_tab_employee_id(k) || '  ' ||
                                   v_tab_ename(k) || '  ' ||
                                   v_tab_hire_date(k) || '  ' ||
                                   v_tab_gender(k) || '  ' ||
                                   v_tab_age(k) );
        END LOOP;
   end if;
   
   exception
      when no_data_found then -- no_date_found 은 오라클에서 데이터가 존재하지 않을 경우 발생하는 오류임.
           dbms_output.put_line('>> 부서번호 '|| p_department_id|| '은 존재하지 않습니다. <<');
    
end pcd_employees_info_deptid;
-- Procedure PCD_EMPLOYEES_INFO_DEPTID이(가) 컴파일되었습니다.
  
  
exec pcd_employees_info_deptid(10);
/*
------------------------------------------------------------
부서번호  부서명  사원번호   사원명   입사일자   성별   나이
------------------------------------------------------------
10  Administration  200  Jennifer Whalen  2003-09-17  여  45
*/
 
exec pcd_employees_info_deptid(30);
/*
------------------------------------------------------------
부서번호  부서명  사원번호   사원명   입사일자   성별   나이
------------------------------------------------------------
30  Purchasing  114  Den Raphaely  2002-12-07  여  56
30  Purchasing  115  Alexander Khoo  2003-05-18  남  62
30  Purchasing  116  Shelli Baida  2005-12-24  남  63
30  Purchasing  117  Sigal Tobias  2005-07-24  여  62
30  Purchasing  118  Guy Himuro  2006-11-15  남  45
30  Purchasing  119  Karen Colmenares  2007-08-10  남  44
*/
  
 
exec pcd_employees_info_deptid(2342);
-- >> 부서번호 2342은 존재하지 않습니다. << 
  
  
  
--------------------------------------------------------------------------------------

                    ---- ===== **** CURSOR **** ===== -----
              
  --  PL/SQL 에서 SELECT 되어져 나오는 행의 개수가 2개 이상인 경우에는 위에서 한 것처럼
  --  table 타입의 변수를 사용하여 나타낼 수 있고, 또는 CURSOR 를 사용하여 나타낼 수도 있다. 
  --  table 타입의 변수를 사용하는 것 보다 CURSOR 를 사용하는 것이 더 편하므로 
  --  대부분 CURSOR 를 많이 사용한다.

  
  ---- *** ==== 명시적 CURSOR 만들기 ==== *** ----
  ※ 형식

  1.단계 -- CURSOR 의 선언(정의)
     
    CURSOR 커서명
    IS
    SELECT 문;  

  2.단계 -- CURSOR 의 OPEN

    OPEN 커서명;

  3.단계 -- CURSOR 의 FETCH
           (FETCH 란? SELECT 되어진 결과물을 끄집어 내는 작업을 말한다)
    
    FETCH  커서명 INTO 변수;

  4.단계 -- CURSOR 의 CLOSE

    CLOSE 커서명;
    
    
    
 ※ ==== 커서의 속성변수 ==== ※

 1. 커서명%ISOPEN   ==> 커서가 OPEN 되어진 상태인가를 체크하는 것.
                       만약에 커서가 OPEN 되어진 상태이라면 TRUE.

 2. 커서명%FOUND    ==> FETCH 된 레코드(행)이 있는지 체크하는 것.
                       만약에 FETCH 된 레코드(행)이 있으면 TRUE.

 3. 커서명%NOTFOUND ==> FETCH 된 레코드(행)이 없는지 체크하는 것.
                       만약에 FETCH 된 레코드(행)이 없으면 TRUE.

 4. 커서명%ROWCOUNT ==> 현재까지 FETCH 된 레코드(행)의 갯수를 반환해줌.   
 
 
 create or replace procedure pcd_employees_info_deptid_cursor 
 (p_department_id  IN  employees.department_id%type)
 is
    -- 1 단계 -- CURSOR 의 선언(정의)
    cursor cur_empinfo
    is
    WITH 
    E AS
     (
      select employee_id, first_name || ' ' || last_name AS ENAME,
            hire_date, func_gender(jubun) AS GENDER, func_age(jubun) AS AGE, department_id
      from employees
      where department_id = p_department_id
    )
    , 
    D AS 
    (
     select department_id, department_name
     from departments
    )
    select E.department_id, E.employee_id, D.department_name, E.ename, to_char(E.hire_date, 'yyyy-mm-dd') AS hire_date , E.gender, E.age
    from E LEFT JOIN D
    ON E.department_id = D.department_id;  
    
    v_department_id        employees.department_id%type;
    v_department_name      departments.department_name%type;
    v_employee_id          employees.employee_id%type;
    v_ename                varchar2(30);
    v_hiredate             varchar2(10);
    v_gender               varchar2(6);
    v_age                  number(3);
    
    v_cnt                  number := 0;
 begin
    -- 2단계 -- CURSOR 의 OPEN
    OPEN cur_empinfo;
    
    -- 3단계 -- CURSOR 의 FETCH
    --         (FETCH 란? SELECT 되어진 결과물을 끄집어 내는 작업을 말한다)
    LOOP 
        FETCH cur_empinfo INTO v_department_id, v_employee_id, v_department_name, v_ename, v_hiredate, v_gender, v_age;
 
        v_cnt := cur_empinfo%ROWCOUNT;  -- 현재까지 FETCH 된 레코드(행)의 갯수를 반환해줌.
         
        EXIT WHEN cur_empinfo%NOTFOUND; -- 더 이상 select 되어진 행이 없다라면 반복문을 빠져나간다.
        
        if (cur_empinfo%ROWCOUNT = 1) then
            dbms_output.put_line( lpad('-',60,'-') );
            dbms_output.put_line( '부서번호  부서명  사원번호   사원명   입사일자   성별   나이' );
            dbms_output.put_line( lpad('-',60,'-') );
        end if;     
        
        dbms_output.put_line(v_department_id || '  ' || 
                             v_department_name || '  ' ||
                             v_employee_id || '  ' ||
                             v_ename || '  ' ||
                             v_hiredate || '  ' ||
                             v_gender || '  ' ||
                             v_age);
        
    END LOOP;
    
    -- 4단계 -- CURSOR 의 CLOSE
    CLOSE cur_empinfo;
    
    if( v_cnt = 0 ) then 
       dbms_output.put_line('>> 부서번호 '|| p_department_id ||'은 존재하지 않습니다. <<');
    else 
       dbms_output.put_line(' ');
       dbms_output.put_line('>> 조회된 행의 개수 : '|| v_cnt || '개 <<');
    end if;   
    
 end pcd_employees_info_deptid_cursor;
 -- Procedure PCD_EMPLOYEES_INFO_DEPTID_CURSOR이(가) 컴파일되었습니다.
 
 
 exec pcd_employees_info_deptid_cursor(10); 
/*
------------------------------------------------------------
부서번호  부서명  사원번호   사원명   입사일자   성별   나이
------------------------------------------------------------
10  Administration  200  Jennifer Whalen  2003-09-17  여  45

>> 조회된 행의 개수 : 1개 <<
*/

 exec pcd_employees_info_deptid_cursor(30);
/*
------------------------------------------------------------
부서번호  부서명  사원번호   사원명   입사일자   성별   나이
------------------------------------------------------------
30  Purchasing  114  Den Raphaely  2002-12-07  여  56
30  Purchasing  115  Alexander Khoo  2003-05-18  남  62
30  Purchasing  116  Shelli Baida  2005-12-24  남  63
30  Purchasing  117  Sigal Tobias  2005-07-24  여  62
30  Purchasing  118  Guy Himuro  2006-11-15  남  45
30  Purchasing  119  Karen Colmenares  2007-08-10  남  44

>> 조회된 행의 개수 : 6개 <<
*/

exec pcd_employees_info_deptid_cursor(2342);
-- >> 부서번호 2342은 존재하지 않습니다. <<





  ---- *** ==== FOR LOOP CURSOR 만들기 ==== *** ----
/*
     FOR LOOP CURSOR 문을 사용하면
     커서의 OPEN, 커서의 FETCH, 커서의 CLOSE 가 자동적으로 발생되어지기 때문에
     우리는 커서의 OPEN, 커서의 FETCH, 커서의 CLOSE 문장을 기술할 필요가 없다.
*/

  ※ 형식
  FOR 변수명(select 되어진 행의 정보가 담기는 변수) IN 커서명 LOOP
      실행문장;
  END LOOP; 
  
  
 create or replace procedure pcd_employees_info_deptid_forcursor 
 (p_department_id  IN  employees.department_id%type)
 is
    -- 1 단계 -- CURSOR 의 선언(정의)
    cursor cur_empinfo
    is
    WITH 
    E AS
     (
      select employee_id, first_name || ' ' || last_name AS ENAME,
            hire_date, func_gender(jubun) AS GENDER, func_age(jubun) AS AGE, department_id
      from employees
      where department_id = p_department_id
    )
    , 
    D AS 
    (
     select department_id, department_name
     from departments
    )
    select E.department_id, E.employee_id, D.department_name, E.ename, to_char(E.hire_date, 'yyyy-mm-dd') AS hire_date , E.gender, E.age
    from E LEFT JOIN D
    ON E.department_id = D.department_id;  
    
    v_cnt number := 0;
 begin
    /*
       -- 2단계
       
       FOR 변수명(select 되어진 행의 정보가 담기는 변수) IN 커서명 LOOP
           실행문장;
       END LOOP; 
    */
    FOR v_rcd IN cur_empinfo LOOP
       
        v_cnt := cur_empinfo%ROWCOUNT;  -- 현재까지 FETCH 된 레코드(행)의 갯수를 반환해줌.
    
        if (v_cnt = 1) then
            dbms_output.put_line( lpad('-',60,'-') );
            dbms_output.put_line( '부서번호  부서명  사원번호   사원명   입사일자   성별   나이' );
            dbms_output.put_line( lpad('-',60,'-') );
        end if; 
        
        dbms_output.put_line(v_rcd.department_id || '  ' ||
                             v_rcd.department_name || '  ' ||
                             v_rcd.employee_id || '  ' ||
                             v_rcd.ename || '  ' ||
                             v_rcd.hire_date || '  ' ||
                             v_rcd.gender || '  ' ||
                             v_rcd.age);
    
    END LOOP;
        
    if( v_cnt = 0 ) then 
       dbms_output.put_line('>> 부서번호 '|| p_department_id ||'은 존재하지 않습니다. <<');
    else 
       dbms_output.put_line(' ');
       dbms_output.put_line('>> 조회된 행의 개수 : '|| v_cnt || '개 <<');
    end if;   
    
 end pcd_employees_info_deptid_forcursor;
 -- Procedure PCD_EMPLOYEES_INFO_DEPTID_FORCURSOR이(가) 컴파일되었습니다.
 
 
 exec pcd_employees_info_deptid_forcursor(10); 
/*
------------------------------------------------------------
부서번호  부서명  사원번호   사원명   입사일자   성별   나이
------------------------------------------------------------
10  Administration  200  Jennifer Whalen  2003-09-17  여  45

>> 조회된 행의 개수 : 1개 <<
*/

 exec pcd_employees_info_deptid_forcursor(30);
/*
------------------------------------------------------------
부서번호  부서명  사원번호   사원명   입사일자   성별   나이
------------------------------------------------------------
30  Purchasing  114  Den Raphaely  2002-12-07  여  56
30  Purchasing  115  Alexander Khoo  2003-05-18  남  62
30  Purchasing  116  Shelli Baida  2005-12-24  남  63
30  Purchasing  117  Sigal Tobias  2005-07-24  여  62
30  Purchasing  118  Guy Himuro  2006-11-15  남  45
30  Purchasing  119  Karen Colmenares  2007-08-10  남  44

>> 조회된 행의 개수 : 6개 <<
*/

exec pcd_employees_info_deptid_forcursor(2342);
-- >> 부서번호 2342은 존재하지 않습니다. <<
  
  
  
  
  
   -------------------- ****** PACKAGE(패키지) ****** ----------------------
   
   --->   PACKAGE(패키지)란?  여러개의 Procedure 와 여러개의 Function 들의 묶음
   
   
   --- 1. PACKAGE(패키지)의 선언하기
   create or replace package employee_pack
   is
      -- employee_pack 패키지에 들어올 프로시저 또는 함수를 선언해준다.
      procedure pcd_emp_info(p_deptno IN employees.department_id%type);
      procedure pcd_dept_info(p_deptno IN departments.department_id%type);
      function  func_gender(p_jubun IN employees.jubun%type) return varchar2;
   end employee_pack;
   -- Package EMPLOYEE_PACK이(가) 컴파일되었습니다.
   
   
   --- 2. PACKAGE(패키지)의 Body(본문) 생성하기 
   create or replace package body employee_pack
   is
      procedure pcd_emp_info(p_deptno IN employees.department_id%type)
      is
          cursor  cur_empinfo
          is
          select D.department_id, D.department_name, 
                 E.employee_id, E.first_name || ' ' || E.last_name AS ENAME
          from departments D join employees E
          on D.department_id = E.department_id
          where E.department_id = p_deptno;
          
          v_cnt number := 0;
      begin
          for v_rcd in cur_empinfo loop
              
              v_cnt := cur_empinfo%rowcount; 
              
              if (v_cnt = 1) then
                 dbms_output.put_line( lpad('-',60,'-') );
                 dbms_output.put_line('부서번호  부서명       사원번호    사원명');
                 dbms_output.put_line( lpad('-',60,'-') );
              end if;   
              
              dbms_output.put_line(v_rcd.department_id || ' ' || 
                                   v_rcd.department_name || ' ' || 
                                   v_rcd.employee_id || ' ' || 
                                   v_rcd.ENAME);   
          end loop;
          
          if( v_cnt = 0 ) then
              dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 없습니다. <<');
          else
              dbms_output.put_line(' ');
              dbms_output.put_line('>> 조회건수 : ' || v_cnt || '개');
          end if;    
      end pcd_emp_info;
      
      ----------------------------------------------------------------------
      
      procedure pcd_dept_info(p_deptno IN departments.department_id%type)
      is
          v_department_id      departments.department_id%type;
          v_department_name    departments.department_name%type;
      begin
             select department_id, department_name
                    into
                    v_department_id, v_department_name
             from departments
             where department_id = p_deptno;
             
             dbms_output.put_line( lpad('-',40,'-') );
             dbms_output.put_line('부서번호  부서명');
             dbms_output.put_line( lpad('-',40,'-') );
             
             dbms_output.put_line(v_department_id || ' ' || v_department_name);
             
             exception
                 when no_data_found then 
                      dbms_output.put_line('>> 부서번호 ' || p_deptno || '은 없습니다. <<');
      end pcd_dept_info;
      
      ----------------------------------------------------------------------
      
      function  func_gender(p_jubun IN employees.jubun%type) 
      return varchar2
      is
           v_gender_num  varchar2(1);
           v_result      varchar2(100);
      begin
           if( length(p_jubun) = 13 ) then
               v_gender_num := substr(p_jubun, 7, 1);
               
               if( v_gender_num in('1','3') ) then
                   v_result := '남';
               elsif( v_gender_num in('2','4') ) then 
                   v_result := '여';
               else 
                   v_result := '주민번호가 올바르지 않습니다.';
               end if;    
               
           else
               v_result := '주민번호의 길이가 13자리 아닙니다.';
           end if;
           
           return v_result;
      end func_gender;
   
   end employee_pack;
   -- Package Body EMPLOYEE_PACK이(가) 컴파일되었습니다.

   
   begin
       employee_pack.pcd_emp_info(30);
   end;
/*
------------------------------------------------------------
부서번호  부서명       사원번호    사원명
------------------------------------------------------------
30 Purchasing 114 Den Raphaely
30 Purchasing 115 Alexander Khoo
30 Purchasing 116 Shelli Baida
30 Purchasing 117 Sigal Tobias
30 Purchasing 118 Guy Himuro
30 Purchasing 119 Karen Colmenares
 
>> 조회건수 : 6개
*/
   
   begin
       employee_pack.pcd_emp_info(2342);
   end;
   -- >> 부서번호 2342은 없습니다. <<
   
   
   begin
       employee_pack.pcd_dept_info(30);
   end;
/*
    ----------------------------------------
    부서번호  부서명
    ----------------------------------------
    30 Purchasing
*/
  
   begin
       employee_pack.pcd_dept_info(2342);
   end;
   -- >> 부서번호 2342은 없습니다. <<
   
   
   select employee_pack.func_gender('9007301234567')
        , employee_pack.func_gender('0207303234567')
        , employee_pack.func_gender('0107304234567')
        , employee_pack.func_gender('9107302234567')
   from dual;
   -- 남	  남	  여	  여
   
   
   select employee_pack.func_gender('900730123456')
        , employee_pack.func_gender('0207309234567')
   from dual;
   --  주민번호의 길이가 13자리 아닙니다.	주민번호가 올바르지 않습니다.
   
   select employee_id, first_name || ' ' || last_name AS ENAME
        , employee_pack.func_gender(jubun) AS GENDER
   from employees
   order by 1;
  
  
  ------ **** 패키지 소스 보기 **** -------
   select line, text
   from user_source
   where type = 'PACKAGE' and name = 'EMPLOYEE_PACK';
   
   
   ------ **** 패키지 BODY(본문) 소스 보기 **** -------
   select line, text
   from user_source
   where type = 'PACKAGE BODY' and name = 'EMPLOYEE_PACK';
   
    