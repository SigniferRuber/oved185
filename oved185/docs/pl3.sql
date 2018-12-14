-- plain pl/sql select into
set serveroutput on

declare
    v_emp_hiredate employees.hire_date%type;
    v_emp_salary employees.salary%type;
begin
    select hire_date, salary
    into v_emp_hiredate, v_emp_salary
    from employees
    where employee_id = 100;

    dbms_output.put('Hire date: ' || v_emp_hiredate);
    dbms_output.put_line(', salary: ' || v_emp_salary);
end;
/

-- pl/sql select from a group function
declare
    v_sum_sal number(10, 2);
    v_deptno number not null := 60;
begin
    select sum(salary)
    into v_sum_sal
    from employees
    where department_id = v_deptno;

    dbms_output.put_line('The sum of salary is ' || v_sum_sal);
end;
/

-- pl/sql insert into
declare
    v_min_sal simple_integer := 5000;
begin
    insert into employees(
        employee_id, first_name, last_name, email, hire_date, job_id, salary
    ) 
    values(
        employees_seq.nextval, 'Bill', 'Cores', 'BCORES',
        sysdate, 'AD_ASST', v_min_sal + 4000
    );
end;
/

select employee_id, first_name, last_name, hire_date, salary 
from employees 
where employee_id = (select max(employee_id) from employees);

rollback;

-- pl/sql update
select job_id, employee_id, salary
from employees
where job_id = 'ST_CLERK';

declare
    v_sal_increase employees.salary%type := 800;
begin
    update employees
    set salary = salary + v_sal_increase
    where job_id = 'ST_CLERK';
end;
/

rollback;

-- pl/sql delete
select employee_id, first_name, last_name
from employees
where first_name = 'Kimberely';

declare
    v_empname employees.first_name%type := 'Kimberely';
begin
    delete from employees
    where first_name = v_empname;
end;
/

rollback;

select count(employee_id)
from employees
where first_name = 'Kimberely';

-- sql%rowcount
select employee_id, first_name, last_name, salary
from employees
where employee_id = (
    select max(employee_id)
    from employees
    where job_id = 'ST_CLERK'
);

declare
    c_increase constant employees.salary%type := 800;
begin
    update employees
    set salary = salary + c_increase
    where job_id = 'ST_CLERK';

    dbms_output.put_line(sql%rowcount || ' rows updated.');
end;
/

rollback;
