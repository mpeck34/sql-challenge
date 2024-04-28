COPY titles FROM 'titles.csv' WITH (FORMAT csv, HEADER true);
COPY employees FROM 'employees.csv' WITH (FORMAT csv, HEADER true);
COPY departments FROM 'departments.csv' WITH (FORMAT csv, HEADER true);
COPY dept_emp FROM 'dept_emp.csv' WITH (FORMAT csv, HEADER true);
COPY dept_manager FROM 'dept_manager.csv' WITH (FORMAT csv, HEADER true);
COPY salaries FROM 'salaries.csv' WITH (FORMAT csv, HEADER true);


select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;


-- Data Analysis

-- Query 1
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
join salaries s 
on e.emp_no = s.emp_no;

-- Query 2
select first_name, last_name, hire_date
from employees
where hire_date like '%1986';

-- Query 3
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager dm
join departments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no;

-- Query 4
select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
join employees e on de.emp_no = e.emp_no
join departments d on de.dept_no = d.dept_no;

-- Query 5
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- Query 6
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

-- Query 7
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

-- Query 8
select last_name, count (*) as frequency
from employees
group by last_name
order by frequency desc, last_name;
