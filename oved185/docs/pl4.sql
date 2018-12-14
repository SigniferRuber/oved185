set serveroutput on

-- plain if then else
declare
    v_bonus number(8,2) not null := 0;
    v_service_period number not null := 3;
    v_salary number(8,2) := 11000;
begin
    if v_service_period  = 10 then
        v_bonus := v_salary * 0.5;
    else
        if v_service_period < 10 and v_service_period >= 5 then 
            v_bonus := v_salary * 0.25;
        else
            v_bonus := v_salary * 0.1;
        end if;
    end if;
    dbms_output.put_line('Bonus: ' || v_bonus);
end;
/

-- if then elsif else
declare
    v_bonus number(8,2) not null := 0;
    v_service_period number not null := 3;
    v_salary number(8,2) := 11000;
begin
    if v_service_period = 10 then
        v_bonus := v_salary * 0.5;
    elsif v_service_period < 10 and v_service_period >= 5 then
        v_bonus := v_salary * 0.25;
    else
        v_bonus := v_salary * 0.1;
    end if;
    dbms_output.put_line('Bonus: ' || v_bonus);
end;
/

-- careful! if the value is null, simply take the else branch
declare
    v_bonus number(8,2) not null := 0;
    v_service_period number;
    v_salary number(8,2) := 11000;
begin
--    if v_service_period is null then
--        dbms_output.put_line('Service period is null');
--        return;
--    end if;

    if v_service_period = 10 then
        v_bonus := v_salary * 0.5;
    elsif v_service_period >= 5 and v_service_period < 10 then
        v_bonus := v_salary * 0.25;
    else
        v_bonus := v_salary * 0.1;
    end if;

    dbms_output.put_line('Service period is '
        || NVL(v_service_period, 'not set!'));
    dbms_output.put_line('Bonus: ' || v_bonus);
end;
/

-- pl/sql case (x) when (v) then
declare
    v_bonus number(8,2) not null := 0;
    v_service_period number not null := 3;
    v_salary number(8,2) := 11000;
begin
    case v_service_period
    when 10 then v_bonus := v_salary * 0.5;
    when 9 then v_bonus := v_salary * 0.25;
    when 8 then v_bonus := v_salary * 0.25;
    when 7 then v_bonus := v_salary * 0.25;
    when 6 then v_bonus := v_salary * 0.25;
    when 5 then v_bonus := v_salary * 0.25;
    else v_bonus := v_salary * 0.1;
    end case;

    dbms_output.put_line('Bonus: ' || v_bonus);
end;
/

-- pl/sql case when (x ~ v) then
declare
    v_bonus number(8,2) not null := 0;
    v_service_period number not null := 3;
    v_salary number(8,2) := 11000;
begin
    v_bonus := case
        when v_service_period = 10 then
            v_salary * 0.5
        when v_service_period >= 5 and v_service_period < 10 then
            v_salary * 0.25
        else
            v_salary * 0.1
    end;

    dbms_output.put_line( 'Bonus: ' || v_bonus);
end;
