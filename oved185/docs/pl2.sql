-- bind variable PL/SQL <-> SQL
variable b_emp_salary number

begin
    select salary
    into :b_emp_salary
    from employees
    where employee_id = 178;
end;
/

print b_emp_salary

select first_name, last_name
from employees
where salary = :b_emp_salary;

-- autoprint
set autoprint on;

declare
    v_empno number(6) := 100;
begin
    select salary
    into :b_emp_salary
    from employees
    where employee_id = v_empno;
end;