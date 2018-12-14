set serveroutput on

create table copy_emp2 as(select * from employees);

update copy_emp2
set hire_date = add_months(hire_date, 10 * 12);

-- plain loop
declare
    v_emp_id copy_emp2.employee_id%type := 0;
    v_emp_count number not null := 0;
    v_bonus number(8,2) := 0;
    v_salary copy_emp2.salary%type;
    v_hire_date copy_emp2.hire_date%type;
begin
    select count(*)
    into v_emp_count
    from copy_emp2;

    loop
        select min(employee_id)
        into v_emp_id
        from copy_emp2
        where employee_id > v_emp_id;     

        select salary, hire_date
        into v_salary, v_hire_date
        from copy_emp2
        where employee_id = v_emp_id;      
    
        v_bonus := case 
        when round((months_between(SYSDATE, v_hire_date) / 12), 0) = 10 then
            v_salary * 0.5
        when round((months_between(SYSDATE, v_hire_date) / 12), 0) > 5 and
             round((months_between(SYSDATE, v_hire_date) / 12), 0) < 10 then
            v_salary * 0.25
        else
            v_salary * 0.1
        end;

        dbms_output.put_line('Employee ' || v_emp_id || ' bonus: ' || v_bonus); 

        v_emp_count := v_emp_count - 1;
        exit when v_emp_count = 0;      
    end loop;
end;
/

-- while loop
declare
    v_emp_id copy_emp2.employee_id%type := 0;
    v_emp_count number not null := 0;
    v_bonus number(8,2) := 0;
    v_salary copy_emp2.salary%type;
    v_hire_date copy_emp2.hire_date%type;
begin
    select count(*)
    into v_emp_count
    from copy_emp2;  
  
    while v_emp_count > 0 loop
        select min(employee_id)
        into v_emp_id
        from copy_emp2
        where employee_id > v_emp_id;        
    
        select salary, hire_date
        into v_salary, v_hire_date
        from copy_emp2
        where employee_id = v_emp_id;      
    
        v_bonus := case
        when round((months_between(SYSDATE, v_hire_date) / 12)) = 10 then
            v_salary * 0.5
        when round((months_between(SYSDATE, v_hire_date) / 12)) > 5 and
             round((months_between(SYSDATE, v_hire_date) / 12)) < 10 then           
            v_salary * 0.25
        else
            v_salary * 0.1
        end;

        dbms_output.put_line('Employee ' || v_emp_id || ' bonus: ' || v_bonus); 
        v_emp_count := v_emp_count - 1;
    end loop;
end;
/

-- for loop
DECLARE
    v_emp_id copy_emp2.employee_id%type := 0;
    v_emp_count number not null := 0;
    v_bonus number(8,2) := 0;
    v_salary copy_emp2.salary%type;
    v_hire_date copy_emp2.hire_date%type;
BEGIN
    select count(*)
    into v_emp_count
    from copy_emp2;  

    for i in 1..v_emp_count loop
        select min(employee_id)
        into v_emp_id
        from copy_emp2
        where employee_id > v_emp_id;        

        select salary, hire_date
        into v_salary, v_hire_date
        from copy_emp2
        where employee_id = v_emp_id;      

        v_bonus := case
        when round((months_between(SYSDATE, v_hire_date) / 12),0) = 10 then
            v_salary * 0.5
        when round((months_between(SYSDATE, v_hire_date) / 12),0) > 5 and
             round((months_between(SYSDATE, v_hire_date) / 12),0) < 10 then           
            v_salary * 0.25
        else
            v_salary * 0.1
        end;

        dbms_output.put_line('Employee ' || v_emp_id || ' bonus: ' || v_bonus); 
    end loop;
end;
/
