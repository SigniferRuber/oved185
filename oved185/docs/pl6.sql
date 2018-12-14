set serveroutput on

-- record
declare
    type rec_emp is record (
        first_name employees.first_name%type,
        last_name employees.last_name%type,
        jid employees.job_id%type,
        salary employees.salary%type
    );
    v_emprec rec_emp;
begin
    select first_name, last_name, job_id, salary
    into v_emprec 
    from employees 
    where employee_id = 100;

    dbms_output.put_line('Employee Name: ' || v_emprec.first_name || ' ' || v_emprec.last_name);
    dbms_output.put_line('Job id: ' || v_emprec.jid);
    dbms_output.put_line('Salary: ' || v_emprec.salary);
end;
/

-- rowtype
declare
    v_emp_id employees.employee_id%type := 150;
    v_new_jobid employees.job_id%type := 'SA_MAN';
    v_new_salary employees.salary%type := 10500;
    v_emp_rec employees%rowtype;
begin
    select *
    into v_emp_rec
    from employees
    where employee_id = v_emp_id;

    dbms_output.put_line('**** Before Promotion');
    dbms_output.put_line('Employee Name: ' || v_emp_rec.first_name || ' ' || v_emp_rec.last_name);
    dbms_output.put_line('Job ID: ' || v_emp_rec.job_id);
    dbms_output.put_line('Salary: ' || v_emp_rec.salary);

    v_emp_rec.job_id := 'SA_MAN';
    v_emp_rec.salary := 10500;

    update employees
    set row = v_emp_rec
    where employee_id = v_emp_id;

    select *
    into v_emp_rec
    from employees
    where employee_id = v_emp_id;

    dbms_output.put_line('**** After Promotion');
    dbms_output.put_line('Employee Name: ' || v_emp_rec.first_name || ' ' || v_emp_rec.last_name);
    dbms_output.put_line('Job ID: ' || v_emp_rec.job_id);
    dbms_output.put_line('Salary: ' || v_emp_rec.salary);
end;
/
