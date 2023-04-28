drop schema if exists employee_table cascade;
create SCHEMA IF NOT EXISTS employee_table;
SET SCHEMA 'employee_table';

create TABLE IF NOT EXISTS employee_table.departments
(
    id   SERIAL    NOT NULL,
    name VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

create TABLE IF NOT EXISTS employee_table.employees
(
    id                    SERIAL    NOT NULL,
    name                  VARCHAR(150) NOT NULL,
    salary                FLOAT NOT NULL,
    department_id         INT NOT NULL,
    PRIMARY KEY (id),
    foreign key (department_id) references departments (id) on delete cascade
);


insert into employee_table.departments (name)
values ('Java'),
       ('JS');

insert into employee_table.employees (name, salary ,department_id)
values ('Joe', 70000, 1),
       ('Jack', 90000, 1),
       ('Andrew', 80000,2),
       ('Max',60000, 2),
       ('Anton',90000,1);


/*Task 2:  Write a query to find the highest salary in each department.*/

/*Answer:*/
/*SELECT d.name, e.name, salary
FROM employees e
         JOIN departments d
              ON d.id = e.department_id
WHERE salary IN (SELECT max(salary)
                 FROM employees
                 GROUP BY department_id); */


