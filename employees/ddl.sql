--
--  departments domain
--
create table departments
(
    dept_no   char(4)     not null
        primary key,
    dept_name varchar(40) not null,
    constraint dept_name
        unique (dept_name)
);

--
-- dept_emp domain
--
create table dept_emp
(
    emp_no    int     not null,
    dept_no   char(4) not null,
    from_date date    not null,
    to_date   date    not null,
    primary key (emp_no, dept_no),
    constraint dept_emp_ibfk_1
        foreign key (emp_no) references employees (emp_no)
            on delete cascade,
    constraint dept_emp_ibfk_2
        foreign key (dept_no) references departments (dept_no)
            on delete cascade
);

create index dept_no
    on dept_emp (dept_no);

--
-- dept_manager domain
--

create table dept_manager
(
    emp_no    int     not null,
    dept_no   char(4) not null,
    from_date date    not null,
    to_date   date    not null,
    primary key (emp_no, dept_no),
    constraint dept_manager_ibfk_1
        foreign key (emp_no) references employees (emp_no)
            on delete cascade,
    constraint dept_manager_ibfk_2
        foreign key (dept_no) references departments (dept_no)
            on delete cascade
);

create index dept_no
    on dept_manager (dept_no);

--
-- employees domain
--

create table employees
(
    emp_no     int             not null
        primary key,
    birth_date date            not null,
    first_name varchar(14)     not null,
    last_name  varchar(16)     not null,
    gender     enum ('M', 'F') not null,
    hire_date  date            not null
);

--
-- salaries domain
--

create table salaries
(
    emp_no    int  not null,
    salary    int  not null,
    from_date date not null,
    to_date   date not null,
    primary key (emp_no, from_date),
    constraint salaries_ibfk_1
        foreign key (emp_no) references employees (emp_no)
            on delete cascade
);

--
-- titles domain
--

create table titles
(
    emp_no    int         not null,
    title     varchar(50) not null,
    from_date date        not null,
    to_date   date        null,
    primary key (emp_no, title, from_date),
    constraint titles_ibfk_1
        foreign key (emp_no) references employees (emp_no)
            on delete cascade
);

