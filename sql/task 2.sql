drop schema if exists consultant_info cascade;
create SCHEMA IF NOT EXISTS consultant_info;
SET SCHEMA 'consultant_info';

create TABLE IF NOT EXISTS consultant_info.customers
(
    id       SERIAL       NOT NULL,
    name     VARCHAR(150) NOT NULL,
    location VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

create TABLE IF NOT EXISTS consultant_info.consultants
(
    id          SERIAL       NOT NULL,
    name        VARCHAR(150) NOT NULL,
    customer_id INT          NOT NULL,
    level       INT          NOT NULL,
    age         INT          NOT NULL,
    PRIMARY KEY (id),
    foreign key (customer_id) references consultant_info.customers (id) on delete cascade
);



insert into consultant_info.customers (name, location) values ('City EMEA', 'London'),
                                              ('City NAM', 'New'),
                                              ('Morgan Stanley NAM', 'New York'),
                                              ('HSBC','London'),
                                              ('Robobank', 'London');


insert into consultant_info.consultants (name,customer_id,level,age) values ('James', 1, 3, 27),
                                                            ('Cris', 2, 5, 38),
                                                            ('Rama',3,5,41),
                                                            ('Eve',1,4,39),
                                                            ('John', 5,3,47),
                                                            ('Mary',5,5,45),
                                                            ('Bill',2,2,24);


/*Task: Output the name of clients with corresponding number of consultants assigned to them that have at least two consultants*/


/*Answer:*/
/*select customers.name, count(c.id) from customers
join consultants c on customers.id = c.customer_id
group by customers.name
having count(c.id) >= 2;  */

