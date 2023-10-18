create database projects;

use projects;

select * from hr;

-- the first column name is strange, so change it
alter table hr change column 癤퓁d emp_id varchar(20) null;

describe hr;

select birthdate from hr;

set sql_safe_updates = 0;

-- change shape of the birthdate data
update hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
-- change data type to date
alter table hr modify column birthdate date;

-- change shape of the hire_date data
update hr
set hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
    end;
    
    alter table hr modify column hire_date date;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '' AND termdate != ' ';

UPDATE hr SET termdate = NULL WHERE termdate = '';

alter table hr modify column termdate date;

alter table hr add column age int;

update hr
set age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

select count(*) from hr where age < 18;

select count(*) from hr where termdate > curdate();

select location from hr;
