-- from shell run sqlplus
sqlplus / as sysdba

-- set orclpdb as current container
alter session set container = orclpdb;

-- check status for orclpdb
select name, open_mode from v$pdbs;

-- if it is not open in READ-WRITE but only MOUNTED:
alter pluggable database open;


-- select w/ LIKE
select *
from COUNTRIES
where COUNTRY_ID like 'I%';

select *
from DEPARTMENTS
where MANAGER_ID = 200;

select EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, JOB_HISTORY.END_DATE
from EMPLOYEES, JOB_HISTORY
where EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

select d.department_id "id", d.DEPARTMENT_NAME "dep name",
    e.FIRST_NAME "first", e.LAST_NAME "last",
    l.CITY
from DEPARTMENTS d, EMPLOYEES e, LOCATIONS l
where d.DEPARTMENT_ID <= 100
    and d.MANAGER_ID = e.EMPLOYEE_ID
    and l.LOCATION_ID = d.LOCATION_ID
ORDER by 1;

-- operators on columns
SELECT last_name, salary, 12*(salary+100) "yearly"
FROM employees;

-- null
SELECT last_name, job_id, salary, commission_pct
FROM employees;

SELECT count(last_name)
FROM employees
where COMMISSION_PCT is not null;

SELECT last_name, 12*salary*commission_pct
FROM employees
where COMMISSION_PCT is not null;

-- concat
SELECT last_name || ': ' || job_id as "Employees"
FROM employees;

-- distinct
SELECT EMPLOYEE_ID, department_id
FROM employees
where EMPLOYEE_ID < 120;

SELECT DISTINCT department_id
FROM employees;

-- where
SELECT employee_id, first_name || ' ' || last_name as "Name", job_id, department_id
FROM employees
WHERE department_id = 90;

-- <=
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

-- between
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3300;

select FIRST_NAME || ' ' || LAST_NAME as "name", d.DEPARTMENT_NAME dept, HIRE_DATE "hired on"
from EMPLOYEES e, DEPARTMENTS d
where HIRE_DATE between '17-GIU-03' and '30-GEN-04'
    and d.DEPARTMENT_ID = e.DEPARTMENT_ID
order by LAST_NAME, FIRST_NAME;

-- in
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE PHONE_NUMBER IN ('515.123.4567');

SELECT first_name
FROM employees
WHERE first_name LIKE '%i';

select *
from COUNTRIES
where COUNTRY_ID like 'I_';

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE -- salary >=10000 AND 
    job_id not LIKE '%MAN%';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%'
order by SALARY desc;

SELECT last_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR 
    job_id = 'AD_PRES' AND salary > 15000;

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES')
    AND salary > 15000;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';


