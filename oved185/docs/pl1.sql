-- enable/disable output
set serveroutput on
-- set serveroutput off

-- hello plsql
begin
    dbms_output.put_line('Hello World!');
end;
/

-- variables
declare
    v_myname varchar2(20) := 'Steven';
begin
    dbms_output.put_line('My name is: ' || v_myname);
    v_myname := 'John';
    dbms_output.put_line('My name is: ' || v_myname);
end;
/

declare
    v_desc_size integer(5);
    v_prod_description varchar2(70) := 'You can use this product with your radios for higher frequency';
begin
    v_desc_size := length(v_prod_description);
    dbms_output.put_line('The length of description is: ' || v_desc_size);
end;
/

declare
    v_new_empid number;
    v_other number(2, 2) := 0.27;
begin
    v_new_empid := employees_seq.nextval;
    dbms_output.put_line('New employee id: ' || v_new_empid || ' ... ' || v_other);
end;
/

declare
    v_outervariable varchar2(20) := 'GLOBAL';
begin
    declare
        v_innervariable varchar2(20) := 'LOCAL';
    begin
        dbms_output.put_line(v_innervariable);
        dbms_output.put_line(v_outervariable);
    end;

    dbms_output.put_line(v_outervariable);
end;
