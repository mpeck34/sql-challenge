-- Drop tables if they exist

drop table if exists dept_emp cascade;
drop table if exists dept_manager cascade;
drop table if exists salaries cascade;
drop table if exists titles cascade;
drop table if exists departments cascade;
drop table if exists employees cascade;


-- Tables created in this order because of dependencies

create table titles (
    title_id varchar(255) not null,
    title varchar(255) not null,
    primary key (title_id)
);

create table employees (
    emp_no int not null,
    emp_title_id varchar(255) not null,
    birth_date varchar(255) not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    sex varchar(255) not null,
    hire_date varchar(255) not null,
    primary key (emp_no),
    foreign key (emp_title_id) references titles(title_id)
);

create table departments (
    dept_no varchar(255) not null,
    dept_name varchar(255) not null,
    primary key (dept_no)
);

create table dept_emp (
    emp_no int not null,
    dept_no varchar(255) not null,
    foreign key (dept_no) references departments (dept_no),
    foreign key (emp_no) references employees (emp_no)
);

create table dept_manager (
    dept_no varchar(255) not null,
    emp_no int not null,
	primary key (dept_no, emp_no),
    foreign key (emp_no) references employees(emp_no),
    foreign key (dept_no) references departments(dept_no)
);

create table salaries (
    emp_no int not null,
    salary int not null,
    foreign key (emp_no) references employees(emp_no)
);
