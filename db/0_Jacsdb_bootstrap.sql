-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database Jacsdb;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on Jacsdb.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use Jacsdb;

-- Put your DDL 
CREATE TABLE IF NOT EXISTS Employee
(
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
    points int,
    user_id int PRIMARY KEY
);

INSERT INTO Customer (cst_name, birthday, points, user_id)
VALUES ('Lance Bailey', CURRENT_DATE, 50, 100);

INSERT INTO Customer (cst_name, birthday, points, user_id)
VALUES ('Michael Jackson', CURRENT_DATE, 95, 200);

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
VALUES ('Caramel Macchiato', CURRENT_DATE, 'Online', 01, 100, 50);

INSERT INTO Orders (order_name, order_date, order_method, employee_id, user_id, order_id)
VALUES ('Vanilla Latte', CURRENT_DATE, 'In-Person', 02, 200, 51);

CREATE TABLE IF NOT EXISTS Drink
(
    size varchar(50) not null ,
    milk varchar(50),
    type varchar(50),
    price float not null ,
    pointValue int not null,
    drink_id int PRIMARY KEY
);

INSERT INTO Drink(size, milk, type, price, pointValue, drink_id)
VALUES ('Small', 'Oat', 'Macchiato', 3.50, 5, 75);

INSERT INTO Drink(size, milk, type, price, pointValue, drink_id)
VALUES ('Large', 'Whole', 'Latte', 4.00, 6, 76);

CREATE TABLE IF NOT EXISTS Drnk_Ord
(
    order_id int,
    drink_id int,
    CONSTRAINT fk_03 FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE cascade,
    CONSTRAINT fk_06 FOREIGN KEY (drink_id)
        REFERENCES Drink(drink_id)
);

INSERT INTO Drnk_Ord (order_id, drink_id)
VALUES (50,75);
INSERT INTO Drnk_Ord (order_id, drink_id)
VALUES (51,76);



CREATE TABLE IF NOT EXISTS Rewards
(
    exp_date date ,
    discount int ,
    item varchar(50),
    user_id int ,
    pointValue int,
    reward_id int PRIMARY KEY,
     CONSTRAINT fk_04 FOREIGN KEY (user_id)
        REFERENCES Customer(user_id)
);

INSERT INTO Rewards(exp_date, discount, item, user_id, pointValue, reward_id)
VALUES (CURRENT_DATE, 5, 'Latte', 100, 10, 1000);

INSERT INTO Rewards(exp_date, discount, item, user_id, pointValue, reward_id)
VALUES (CURRENT_DATE, 5, 'Cortado', 200, 20, 1001);


CREATE TABLE IF NOT EXISTS Toppings
(
    order_id int ,
    topping varchar(100) PRIMARY KEY ,
     CONSTRAINT fk_05 FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE cascade
);

INSERT INTO Toppings(order_id, topping)
VALUES(50, 'Whipped Cream');

INSERT INTO Toppings(order_id, topping)
VALUES(51, 'Chocolate Chips');