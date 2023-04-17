DROP DATABASE IF EXISTS Jacsdb;
CREATE DATABASE Jacsdb;
SHOW DATABASES;

USE Jacsdb;

CREATE TABLE IF NOT EXISTS Employee
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    employee_role varchar(50),
    employee_id int PRIMARY KEY
);

INSERT INTO Employee (first_name, last_name, employee_role, employee_id)
VALUES ('Sally', 'Carpenter', 'Barista', 01);

INSERT INTO Employee (first_name, last_name, employee_role, employee_id)
VALUES ('Bob', 'Marley', 'Cashier', 02);



CREATE TABLE IF NOT EXISTS Customer
(
    cst_name varchar(50) not null ,
    birthday date ,
    user_id int PRIMARY KEY

);

INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Ronna Lande','1959-02-03',1);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Sherman Beale','1977-02-14',2);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Hadrian Couves','1923-08-10',3);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Mayor Lorkin','1947-07-25',4);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Thedric Royan','1911-04-22',5);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Jeanine Dudney','1934-12-18',6);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Grant MacCurlye','1983-01-20',7);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Gustave Geer','1907-09-18',8);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Ally Cartmill','2019-02-09',9);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Sophey Revett','1903-12-16',10);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Valentijn Stichel','1958-10-15',11);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Rosabella Ridsdale','1956-10-08',12);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Raviv Kraut','1979-03-04',13);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Aila Trorey','1986-03-02',14);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Neron Gheeorghie','1946-12-02',15);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Mercie Luppitt','1917-10-22',16);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Ronald McJury','1973-05-02',17);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Rik Geertsen','1968-10-28',18);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Stuart Littley','1930-06-27',19);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Stacey Towriss','1983-02-28',20);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Mavra Bastian','2009-11-25',21);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Kamilah Fairbairn','1975-06-01',22);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Aubine Charley','1997-06-27',23);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Gerrie Gurnee','1914-01-31',24);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Addy Stalman','1958-02-25',25);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Ira Cozby','2012-08-14',26);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Travers Adamczewski','1974-06-19',27);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Christan Bringloe','2001-06-19',28);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Nestor Mastrantone','1948-07-27',29);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Raquela O''Looney','1959-11-07',30);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Zena Domenichelli','1921-12-11',31);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Corey Gamet','2022-03-29',32);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Silva Tiner','1963-12-02',33);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Trula McIlriach','2013-07-23',34);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Addia Chestney','1978-03-09',35);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Darrelle Malser','1973-01-24',36);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Lonnard Bacchus','1978-04-17',37);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Noby Grollmann','2021-07-04',38);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Eada Vallack','1924-05-07',39);
INSERT INTO Customer(cst_name,birthday,user_id) VALUES ('Cory Toothill','2001-05-15',40);


CREATE TABLE IF NOT EXISTS Orders
(
    order_name varchar(50) not null ,
    order_date datetime,
    order_method varchar(50),
    employee_id int,
    user_id int,
    order_id int PRIMARY KEY ,
    CONSTRAINT fk_01 FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id),
    CONSTRAINT fk_02 FOREIGN KEY (user_id)
        REFERENCES Customer(user_id)

);

INSERT INTO Orders (order_name, order_date, order_method, employee_id, user_id, order_id)
VALUES ('Caramel Macchiato', CURRENT_DATE, 'Online', 01, 35, 50);

INSERT INTO Orders (order_name, order_date, order_method, employee_id, user_id, order_id)
VALUES ('Vanilla Latte', CURRENT_DATE, 'In-Person', 02, 23, 51);

CREATE TABLE IF NOT EXISTS Drink
(
    size varchar(50) not null ,
    milk varchar(50),
    type varchar(50),
    price float not null ,
    order_id int,
    drink_id int PRIMARY KEY,
    CONSTRAINT fk_03 FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);

INSERT INTO Drink(size, milk, type, price, order_id, drink_id)
VALUES ('Small', 'Oat', 'Macchiato', 3.50, 50, 75);

INSERT INTO Drink(size, milk, type, price, order_id, drink_id)
VALUES ('Large', 'Whole', 'Latte', 4.00, 51, 76);


CREATE TABLE IF NOT EXISTS Rewards
(
    exp_date date ,
    discount int ,
    item varchar(50),
    user_id int ,
    reward_id int PRIMARY KEY,
     CONSTRAINT fk_04 FOREIGN KEY (user_id)
        REFERENCES Customer(user_id)
);

INSERT INTO Rewards(exp_date, discount, item, user_id, reward_id)
VALUES (CURRENT_DATE, 5, 'Latte', 10, 1000);

INSERT INTO Rewards(exp_date, discount, item, user_id, reward_id)
VALUES (CURRENT_DATE, 5, 'Cortado', 17, 1001);


CREATE TABLE IF NOT EXISTS Toppings
(
    order_id int ,
    topping varchar(100) PRIMARY KEY ,
     CONSTRAINT fk_05 FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);

INSERT INTO Toppings(order_id, topping)
VALUES(50, 'Whipped Cream');

INSERT INTO Toppings(order_id, topping)
VALUES(51, 'Chocolate Chips');

