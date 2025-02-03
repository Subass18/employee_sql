-- using inner join
select * from employee inner join department
on employee.department_id = department.department_id
where employee.salary >= 70000;
select * from employee inner join employee_project
on employee.employee_id = employee_project.employee_id
where employee.hire_date > 2021-02-25;
select * from project inner join employee_project
on project.project_id = employee_project.project_id
where role = 'developer';
-- using cross joins
select * from employee cross join employee_project;
select * from employee_project cross join department;
select * from department cross join employee;
select * from employee cross join project;
select * from employee_project cross join project; 
-- using natural join
select * from employee natural join employee_project;
select * from employee_project natural join department;
select * from department natural join employee;
select * from employee natural join project;
select * from employee_project natural join project; 
-- using left outer join
select * from employee left outer join project
on employee.department_id = project.department_id
group by project_id
having count(project.department_id) > 2;
select ep.project_id,p.* from project  p left outer join employee_project  ep
on p.project_id = ep.project_id
group by ep.project_id
having count(*) >3;
select * from department  d left outer join project  p
on d.department_id = p.department_id
where start_date > 2022-01-10;
-- using right outer join 
select * from employee right outer join project
on employee.department_id = project.department_id
group by project_id
having count(project.department_id) > 2;
select ep.project_id,p.* from project  p right outer join employee_project  ep
on p.project_id = ep.project_id
group by ep.project_id
having count(*) >3;
select * from department  d right outer join project  p
on d.department_id = p.department_id
where start_date < '2022-01-10';
-- using self join
select concat(e1.first_name,e1.last_name),concat(e2.first_name,e2.last_name)
from employee e1 join employee e2
on e1.employee_id = e2.manager_id;
select concat(e1.first_name,e1.last_name),
concat(e2.first_name,e2.last_name),e1.salary
from employee e1 join employee e2
on e1.employee_id = e2.manager_id
where e1.salary > e2.salary;
select concat(e1.first_name,e1.last_name),
concat(e2.first_name,e2.last_name),e2.hire_date
from employee e1 join employee e2
on e1.manager_id = e2.employee_id
where e1.hire_date > e2.hire_date;
select concat(e1.first_name,e1.last_name),
concat(e2.first_name,e2.last_name),e1.salary "man_sal",e2.salary "emp_sal"
from employee e1 join employee e2
on e1.manager_id = e2.employee_id
where e1.salary > e2.salary;
-- multiple join conditions
select *
from employee  e1 join employee e2
on e1.manager_id = e2.employee_id 
inner join department d1
on e1.department_id = d1.department_id
inner join project  p
on p.department_id = d1.department_id
where e1.salary > e2.salary
order by e1.employee_id asc;
select * from project p inner join employee_project  ep
on p.project_id = ep.project_id join 
employee e 
on ep.employee_id = e.employee_id
where role = 'analyst'
order by ep.project_id asc;
select * from department  d inner join employee e
on d.department_id = e.department_id
inner join project  p
on e.department_id = p.department_id
where e.salary < 60000;