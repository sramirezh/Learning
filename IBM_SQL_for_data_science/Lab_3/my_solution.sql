 --Retrieve all employees whose address is in Elgin,IL
 
 select * from EMPLOYEES
 where ADDRESS like '%Elgin%';
 
 
 --Retrieve all employees who were born during the 1970's.
 
select * from EMPLOYEES
where B_DATE like '197%';

--Retrieve all employees in department 5 whose salary is between 60000 and 70000

select * 
from EMPLOYEES
where DEP_ID = '5' and (SALARY between 600000 and 700000);

-- Query 4A Retrieve a list of employees ordered by department ID.
select *
from EMPLOYEES
order by DEP_ID;

--*****************************************
--Query 4B:Retrieve a list of employees ordered in descending order by department
--ID and within each department ordered alphabetically in descending order by last name.
select *
from EMPLOYEES
order by DEP_ID DESC, L_NAME DESC;

-- Query 5A For each department ID retrieve the number of employees in the department.

select DEP_ID , count(DEP_ID)
from EMPLOYEES
group by DEP_ID;

--Query 5B For each department retrieve the number of employees in the department, 
--and the average employees salary in the department

select DEP_ID, count(DEP_ID), avg(SALARY)  --These are the columns that I am retreiving
from EMPLOYEES
group by DEP_ID;


--Query 5C Label the computed columns in the result set of Query 5B as 
--NUM_EMPLOYEES and AVG_SALARY
select DEP_ID,  count(DEP_ID) as "NUM_EMPLOYEES" , 
avg(SALARY)   as "AVG_SALARY"
from EMPLOYEES
group by DEP_ID;

--Query 5D: In Query 5C order the result set by Average Salary.

select DEP_ID,  count(DEP_ID) as "NUM_EMPLOYEES" , 
avg(SALARY)   as "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
order by AVG_SALARY;


--Query 5E: In Query 5D limit the result to departments with fewer than 4 employees.
select DEP_ID,  count(DEP_ID) as "NUM_EMPLOYEES", 
avg(SALARY)   as "AVG_SALARY"
from EMPLOYEES
group by DEP_ID having count(DEP_ID) < 4
order by AVG_SALARY;

/*BONUS Query 6: Similar to 4B but instead of department ID use department name. 
Retrieve a list of employees ordered by department name, and within each department 
ordered alphabetically in descending order by last name*/

select  D.DEP_NAME, E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP  --THis is the connection between the 2 tables
order by D.DEP_NAME, E.L_NAME desc
