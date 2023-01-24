CREATE DATABASE sports
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

create table sport_type
(
  id integer primary key ,
  sport_type varchar ,
  salary integer
);

create table coach
(
  id integer primary key not null unique ,
  full_name varchar not null check (coach.full_name != ' '),
  sport_type integer references sport_type (id) not null ,
  phone varchar,
  INN integer not null  unique
);

insert into sport_type (id, sport_type, salary) values
                                                    (1,'Basketball',500),
                                                    (2,'Fitnes',400),
                                                    (3,'football',600),
                                                    (4,'Karate',700);
select * from sport_type;

insert into coach (id, full_name, sport_type, phone, INN) VALUES
                                                              (1,'Bruce Lee',4,'996777777777',123),
                                                              (2,'Suchilin Uriy',1,'996999999999',321),
                                                              (3,'Richard Lawson',2,'996555555555',312),
                                                              (4,'Eric Snyder',4,'996700000000',213),
                                                              (5,'Franklin Larson',3,'996777777775',132),
                                                              (6,'Daryl Stone',3,'996777777778',231),
                                                              (7,'Norman Moore',2,'996777777773',423);
select * from coach;

select coach.id,full_name,salary from sport_type
    join coach on sport_type.id = coach.sport_type
where salary > 500;

select * from coach where full_name like ('%a%');

select * from sport_type where sport_type like ('%ball');

select coach.id,full_name,salary from sport_type
    join coach on sport_type.id = coach.sport_type
order by salary desc ;

select coach.id,full_name,salary from sport_type
    join coach on sport_type.id = coach.sport_type
order by full_name ;


update coach
set full_name = 'Karlo Anchelotti'
where id = 1;

update coach
set full_name = 'Bruce Lee'
where id = 4;
select * from coach;

update sport_type
set salary = salary * 2;

select * from sport_type;


delete
from coach
where full_name = 'Bruce Lee';

select coach.id,full_name,salary from sport_type
join coach on sport_type.id = coach.sport_type
order by full_name ;


