-- using where clauses 
select * from emp_project.employee where salary > 70000;
select * from emp_project.employee where department_id > 103;
select * from employee where hire_date > '2022-06-01';
select * from emp_project.project where project_id > 204;
select * from emp_project.employee_project where project_id > 203;
select * from emp_project.department where department_id < 103;
-- using group by clause
select count(*) ,department_id 
from employee
group by department_id;
select  sum(salary) ,department_id 
from employee 
group by department_id;
select max(salary) ,department_id 
from employee
group by department_id;
select min(salary),department_id
from employee
group by department_id;
select avg(salary),department_id
from employee
group by department_id;
select count(role),role
from emp_project.employee_project
group by role;
select employee.*,count(*) from emp_project.employee
group by department_id;
select employee_project.*,count(*) from emp_project.employee_project
group by project_id;
select count(*) ,project.* from project 
group by project_name;
-- using having clause
select * from employee
group by department_id
having count(*) > 4;
select count(*) ,department_id
from employee
group by department_id
having count(*) >= 4;
select employee.*,count(*) from employee
 where salary > 70000
 group by department_id
 having count(department_id) >3;
select count(*),department_id,avg(salary)
from employee
group by department_id
having avg(salary) > 10000;
select max(salary),min(salary),department_Id
from employee
group by department_id
having avg(salary) > 45000;
select count(*),project_id
from employee_project
group by project_id
having count(project_id)  > 2;
-- using order by
SELECT project_name, COUNT(*) AS total_count
FROM Project
GROUP BY project_name
ORDER BY total_count DESC;
select * from project 
group by project_name
order by project_id asc;
 select * from employee
 where salary > 70000
 group by department_id
 order by salary asc;
 select * from employee
 order by hire_date asc;
 select * from employee
 where manager_id  > 5
 order by manager_id desc;
 select * from project
 order by project_id desc;
 