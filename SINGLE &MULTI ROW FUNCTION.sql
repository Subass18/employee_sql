SELECT * FROM emp_project.employee;
select first_name,upper(first_name) ,upper(last_name)from employee;
select first_name,reverse(first_name) from employee;
select first_name,length(first_name) from employee;
select first_name,substr(first_name,1,2) from employee;
select first_name,substr(first_name,1,length(first_name)/2) from employee;
select salary from employee where mod(salary ,4) = 0;
select * from employee where year(hire_date) = '2019';
-- using aggregate functions
select max(salary),min(salary) from employee;
select avg(salary) from employee;
select sum(salary) from employee;
select count(*) from employee
group by department_id;

