
drop schema if exists students_table cascade;
create SCHEMA IF NOT EXISTS students_table;
SET SCHEMA 'students_table';

create TABLE IF NOT EXISTS students_table.disciplines
(
    id   SERIAL    NOT NULL,
    name VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

create TABLE IF NOT EXISTS students_table.students
(
    id                     SERIAL    NOT NULL,
    name                   VARCHAR(150) NOT NULL,
    age                    INT NOT NULL,
    disciplines_id         INT NOT NULL,
    PRIMARY KEY (id),
    foreign key (disciplines_id) references disciplines (id) on delete cascade
);


insert into students_table.disciplines (name)
values ('psychology'),
       ('medicine');

insert into students_table.students (name, age ,disciplines_id)
values ('Anna', 18, 1),
       ('Helen', 19, 1),
       ('Andrew', 21,2),
       ('Max',20, 2),
       ('Anton',19,1);

/*Task 1: Show the oldest student in each discipline*/

/*SELECT d.name, s.name, age
FROM students s
         JOIN disciplines d
              ON d.id = s.disciplines_id
WHERE age IN (SELECT max(age)
              FROM students
              GROUP BY disciplines_id)
order by s.name;*/


