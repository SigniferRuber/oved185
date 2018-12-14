-- DDL

-- create / drop
CREATE TABLE hire_dates (id NUMBER(2), hire_date DATE);

insert into hire_dates values(27, SYSDATE);

select * from hire_dates;

drop table hire_dates;

-- create w/ column constraint
CREATE TABLE users (
    user_id NUMBER(6)
        CONSTRAINT users_id_pk PRIMARY KEY,
    origin char(2)
        CONSTRAINT users_orig_nn NOT NULL,
    name VARCHAR2(20),
    credits number(2),
    location_id number(4)
);

truncate table users;

-- ok
insert into users values(42, 'IT', 'First user', 22, 1000);
-- PK
insert into users values(42, 'IT', 'Duplicated', 22, 1000);

insert into users values(null, 'IT', 'Ghost', 22, 1000);
-- constraint on name?
insert into users values(22, 'IT', 'First user', 22, 1000);
-- constraint on location_id?
insert into users values(52, 'IT', 'Another user', 22, 1);
-- constraint on credits?
insert into users values(52, 'IT', 'Another user', -22, 1000);
-- constraint on origin?
insert into users values(25, null, 'Another user', 22, 1000);

select * from users;
drop table users;

-- create w/ table constraints
CREATE TABLE users (
    user_id NUMBER(6),
    origin char(2)
        CONSTRAINT users_orig_nn NOT NULL,
    name VARCHAR2(20),
    credits number(2),
    location_id number(4),

    CONSTRAINT users_id_pk PRIMARY KEY(user_id),
    CONSTRAINT users_loc_fk FOREIGN KEY (location_id)
        REFERENCES locations(location_id),
    CONSTRAINT users_name_uk UNIQUE(name),
    CONSTRAINT users_credits_ck CHECK (credits > 0)
);

