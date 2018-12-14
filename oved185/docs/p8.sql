-- view
CREATE VIEW emp_80
AS  SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE department_id = 80;

drop view emp_80;

select * 
from emp_80
where employee_id between 140 and 150;

CREATE VIEW emp_50
AS  SELECT employee_id id, first_name || ' ' || last_name name, salary*12 y_salary
    FROM employees
    WHERE department_id = 50;

select * from emp_50;

CREATE OR REPLACE VIEW emp_80(id_number, full_name, salary, department_id)
AS  SELECT employee_id, first_name || ' ' || last_name, salary, department_id
    FROM employees
    WHERE department_id = 80;

select * from emp_80;

CREATE OR REPLACE VIEW deps_stats(name, minsal, maxsal, avgsal)
AS  SELECT d.department_name, MIN(e.salary), MAX(e.salary), AVG(e.salary)
    FROM employees e JOIN departments d
    ON (e.department_id = d.department_id)
    GROUP BY d.department_name;

select * from deps_stats;

CREATE OR REPLACE VIEW emp_80
AS  SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE department_id = 80
    WITH READ ONLY;

select *
from emp_80
where employee_id = 145;

-- read only!
update emp_80
set first_name = 'Johnny'
where employee_id = 145;

DROP VIEW deps_stats;
DROP VIEW emp_50;
DROP VIEW emp_80;

CREATE SEQUENCE my_seq
    INCREMENT BY 10
    START WITH 120
    MAXVALUE 200
    NOCACHE
    NOCYCLE;

SELECT my_seq.nextval
FROM dual;

select my_seq.currval
from dual;

ALTER SEQUENCE my_seq
    INCREMENT BY 20
    MAXVALUE 300
    NOCACHE
    NOCYCLE;

DROP SEQUENCE my_seq;

-- index
select *
from users
order by credits desc;

CREATE INDEX users_credits_idx
ON users(credits);

drop index users_credits_idx;
