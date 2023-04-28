drop schema if exists brand_info cascade;
create SCHEMA IF NOT EXISTS brand_info;
SET SCHEMA 'brand_info';

create TABLE IF NOT EXISTS brand_info.city
(
    id       SERIAL       NOT NULL,
    name     VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

create TABLE IF NOT EXISTS brand_info.brands
(
    id          SERIAL       NOT NULL,
    name        VARCHAR(150) NOT NULL,
    city_id INT          NOT NULL,
    PRIMARY KEY (id),
    foreign key (city_id) references brand_info.city (id) on delete cascade
);



insert into brand_info.city (name)
values ('London'),
       ('Minsk'),
       ('Warsaw'),
       ('Paris');


insert into brand_info.brands (name,city_id)
values ('IKEA', 1),
       ('Colgate', 2),
       ('Samsung', 3),
       ('Nike',3),
       ('New Balance',1),
       ('Adidas',4),
       ('Lenovo',4),
       ('JYSK',4);





/*Task: Output the name of cities with corresponding number of brands allocated in this city (at least two brands)*/



/*Answer:*/
/*select c.name, count(b.id) number
from cities c
         join brands b
              on c.id = b.city_id
group by c.name
having count(b.id) >= 2
order by c.name desc;*/

