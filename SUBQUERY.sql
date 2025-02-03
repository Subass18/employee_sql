select * from employee
where salary = (select salary from employee where first_name = 'david');
select * from employee
where department_id = (select department_id from department where department_name = 'it');
select project_id ,project_name 
from project where department_id = (select department_id from department 
where department_name = 'sales');
select * from employee_project
where project_id = all(select project_id from project where department_id
 = (select department_id from department where department_name ='hr'));
 select * from project
 where department_id = (select department_id from department
 where department_name = 'operations');
 select start_date
 from project where department_id = any (select department_id 
 from department where department_name = 'marketing' or department_name = 'sales');
 select * from employee where 
 manager_id =all (select manager_id from employee where manager_id = 7);
 select * from employee
 where salary = (select min(salary) from employee where department_id = 103);
 select * from project
 where department_id in  (select department_id from employee
 where first_name like 'e%');
 select * from employee
 where employee_id in(select employee_id from employee_project where role = 'developer');
 
 -- using nested subquery
 select * from employee
 where salary = (select min(salary) from employee 
 where salary >(select min(salary) from employee));
 select * from employee
 where hire_date =(select max(hire_date) from employee 
 where hire_date <(select max(hire_date) from employee 
 where hire_date <(select max(hire_date) from employee)));
 select * from employee_project
 where employee_id in (select employee_id from employee where 
 salary = (select max(salary) from employee where 
 salary < (select max(salary) from employee)));
 select * from project
 where project_id in (select project_id from employee_project where role ='developer');
 -- using employee manager relationship
 select * from employee
 where manager_id in (select manager_id from employee where first_name ='daniel');
 select * from employee
 where employee_id in (select manager_id from employee where last_name = 'scott');
 select * from employee_project
 where employee_id = (select manager_id from employee where first_name = 'amanda');
 select * from employee_project
 where employee_id = (select manager_id from employee where 
 employee_id in(select manager_id from employee where first_name = 'amanda'));
 select * from employee_project
 where employee_id in  (select employee_id from employee where manager_id is null);
 select * from department
 where department_id in (select department_id from employee where manager_id is null);
 select * from project 
 where department_id in (select department_id from employee 
 where manager_id in(select employee_id from employee where salary < 70000));
 select * from employee_project
 where employee_id in (select manager_id from employee
 where salary < 60000);
 -- using corelated subquery
 select e1.salary as "maximum_salary"
 from employee  e1
 where (select count(distinct e2.salary) from employee  e2
 where e1.salary < e2.salary) = 8-1;
 select first_name,e1.salary as "7th minimum_salary",last_name
 from employee  e1
 where (select count(distinct e2.salary) from employee  e2
 where e1.salary > e2.salary) = 8-1;
 select first_name,last_name,e1.hire_date as "hired 10th"
 from employee e1
 where (select count(distinct e2.hire_date)
 from employee e2
 where e1.hire_date < e2.hire_date) = 11-1;
 select first_name,last_name,e1.hire_date as "hired last of 10th"
 from employee e1
 where (select count(distinct e2.hire_date)
 from employee e2
 where e1.hire_date > e2.hire_date) = 11-1;
 select * from department
 where department_id in (select department_id from employee
 where employee.department_id = department.department_id);
 select * from project
 where project_id in (select project_id from employee_project
 where employee_project.project_id = project.project_id);