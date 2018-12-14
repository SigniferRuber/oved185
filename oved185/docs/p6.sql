-- DML: select, insert, update, delete
-- DDL: create,  ...
-- TCL: commit, rollback, ...

-- insert fake country
insert into countries (country_id, country_name, region_id)
values('XX', 'Just testing', 1);

-- null country_name ok
insert into countries values('XX', null, 1);

-- bad region_id
insert into countries values('XX', null, 51);

-- bad PK
insert into countries values('IT', null, 1);

-- not enough values
insert into countries values('XX', 1);

rollback;
-- commit;

select *
from COUNTRIES
where COUNTRY_ID = 'XX';

INSERT INTO employees (employee_id, first_name, last_name,
    email, phone_number, hire_date, job_id, salary, commission_pct,
    manager_id, department_id)
VALUES (999, 'Louis', 'Poppy', 'LPOPPY', '515.124.4567', 
--    SYSDATE,
    TO_DATE('FEB 3, 2009', 'MON DD, YYYY'),
    'AC_ACCOUNT', 6900, NULL, 205, 100);

select * from EMPLOYEES where EMPLOYEE_ID = 999;

update COUNTRIES
set COUNTRY_NAME = 'Something'
where COUNTRY_ID = 'XX';

rollback;

-- UPDATE W/ SELECTS
select *
from employees
where employee_id in (114, 205);

UPDATE employees
SET job_id = -- 'PU_MAN',
    (
        SELECT job_id
        FROM employees
        WHERE employee_id = 205),
    salary = -- 12008
    (
        SELECT salary
        FROM employees
        WHERE employee_id = 205)
WHERE employee_id = 114;

-- delete (all rows!)
DELETE FROM job_history
WHERE employee_id = 101;

select *
from job_history;

-- delete email NKOCHHAR
delete from job_history
where employee_id = (
    select employee_id
    from employees
    where email = 'NKOCHHAR'
);

-- DDL: no rollback here
-- autocommit
truncate table be_sure_about_what_you_are_doing;

-- savepoints
insert into countries values('XX', null, 1);
savepoint sp;
insert into countries values('XY', null, 1);
select * from countries where country_id like 'X_';
rollback to sp;
select * from countries where country_id like 'X_';
rollback;


