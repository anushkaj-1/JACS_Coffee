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
    employee_id int PRIMARY KEY,
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    employee_role varchar(50)
);

INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (1,'Darnell','Borzone','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (2,'Laryssa','Ballinger','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (3,'Skyler','Arter','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (4,'Faunie','Lambdean','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (5,'Dyana','Graeme','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (6,'Ailene','Pook','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (7,'Kirbie','Allnutt','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (8,'Georgy','Ganley','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (9,'Etheline','Kennan','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (10,'Luz','Cradey','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (11,'Marga','Clout','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (12,'Elijah','Downage','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (13,'Kenn','Spadollini','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (14,'Norton','Argont','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (15,'Keenan','Innman','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (16,'Dina','Cappleman','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (17,'Josee','Zannotelli','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (18,'Wake','Ashcroft','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (19,'Avivah','Janodet','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (20,'Shaw','Greenslade','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (21,'Marietta','Coppard','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (22,'Shelby','Greves','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (23,'Barry','Leahair','Barista');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (24,'Fin','Swannell','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (25,'Almeta','Croote','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (26,'Masha','Axelbey','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (27,'Pattin','Ewin','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (28,'Kelcie','McManus','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (29,'Allie','Blandamere','Owner');
INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES (30,'Ewell','Harnott','Owner');
;

CREATE TABLE IF NOT EXISTS Customer
(
    cst_name varchar(50) not null ,
    birthday date ,
    points int,
    user_id int PRIMARY KEY
);

INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Emelita Doerr','1909-05-25',1,90);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Janaya Beaton','1978-08-08',2,52);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Juliette Norewood','1907-08-13',3,12);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Jabez Goulden','1952-05-08',4,33);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Sigrid Feaver','1903-11-13',5,46);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Lane Slucock','1932-03-05',6,97);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Herold Matschke','2023-01-18',7,51);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Donall Blazej','1958-04-17',8,84);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Sybila Scrace','1999-01-23',9,77);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Clarie Van','1952-10-07',10,1);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Magdalene Stenning','1998-04-26',11,83);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Niles Plaister','1937-07-28',12,89);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Martie Shurville','1996-11-22',13,84);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Dorotea Dolle','2022-09-27',14,85);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Vladimir Steagall','1973-01-10',15,33);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Sander Beushaw','1944-01-11',16,11);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Burton Gatward','1998-01-21',17,62);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Correna Matei','2016-10-26',18,57);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Myrtice Jorczyk','2005-12-04',19,71);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Si Greenall','1918-04-12',20,21);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Bartie Cayton','1955-11-18',21,79);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Grant Trewhitt','1981-12-14',22,92);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Harvey Simpkins','1942-09-16',23,29);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Natty Deaton','1923-06-17',24,21);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Lorilee Baines','2005-11-21',25,16);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Ara Brockwell','1939-09-08',26,56);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('El Proffitt','2020-08-18',27,91);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Lazaro Kitchingman','1954-11-02',28,49);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Webster Jelks','1918-12-23',29,90);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Parnell Hamblyn','1936-06-24',30,32);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Dominique Rabbitts','1934-04-05',31,88);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Addia Liddicoat','1954-02-17',32,31);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Camilla Cubbinelli','1999-05-03',33,85);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Barbi Gargett','1998-06-02',34,38);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Crosby D''Almeida','1919-10-11',35,86);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Reinold Goter','1977-05-21',36,79);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Willi Denekamp','1962-12-20',37,3);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Monah Wash','1933-03-01',38,10);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Petra Hayer','1974-08-14',39,85);
INSERT INTO Customer(cst_name,birthday,user_id,points) VALUES ('Fern Skettles','2008-05-08',40,30);



CREATE TABLE IF NOT EXISTS Orders
(
    order_id int PRIMARY KEY ,
    order_date date,
    order_method varchar(50),
    employee_id int,
    user_id int,
    CONSTRAINT fk_01 FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id),
    CONSTRAINT fk_02 FOREIGN KEY (user_id)
        REFERENCES Customer(user_id)

);

INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (1,'2022-10-23','Online',25,17);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (2,'2022-10-31','In-Person',11,1);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (3,'2022-06-02','Online',11,23);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (4,'2022-09-01','In-Person',18,30);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (5,'2022-08-08','Online',23,9);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (6,'2022-06-25','Online',17,22);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (7,'2022-07-24','Online',10,33);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (8,'2022-07-24','Online',1,5);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (9,'2023-02-09','Online',21,10);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (10,'2023-02-16','Online',20,8);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (11,'2023-04-16','In-Person',6,2);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (12,'2023-01-31','In-Person',24,35);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (13,'2023-03-24','Online',15,33);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (14,'2022-09-29','In-Person',26,8);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (15,'2022-06-13','Online',19,17);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (16,'2022-12-31','In-Person',6,9);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (17,'2023-01-19','Online',6,7);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (18,'2022-10-06','Online',4,33);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (19,'2022-07-10','In-Person',30,30);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (20,'2022-05-11','Online',19,13);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (21,'2022-07-12','In-Person',5,17);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (22,'2022-12-19','Online',7,33);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (23,'2023-02-01','In-Person',23,12);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (24,'2022-11-14','Online',2,35);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (25,'2022-10-20','In-Person',24,9);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (26,'2022-10-02','In-Person',2,11);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (27,'2023-01-25','Online',23,7);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (28,'2022-06-24','In-Person',7,29);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (29,'2023-01-28','In-Person',22,4);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (30,'2022-07-01','In-Person',1,28);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (31,'2023-01-06','In-Person',20,21);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (32,'2022-07-03','Online',23,14);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (33,'2022-05-11','In-Person',29,4);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (34,'2022-08-25','In-Person',14,33);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (35,'2023-01-30','Online',6,10);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (36,'2022-08-10','In-Person',24,21);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (37,'2022-06-06','In-Person',18,26);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (38,'2022-12-06','Online',24,36);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (39,'2022-08-10','Online',28,35);
INSERT INTO Orders(order_id,order_date,order_method,employee_id,user_id) VALUES (40,'2022-12-23','In-Person',16,20);



CREATE TABLE IF NOT EXISTS Drink
(
    drink_id int PRIMARY KEY,
    size varchar(50) not null ,
    milk varchar(50),
    type varchar(50),
    price float not null ,
    point_value int not null
);


INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (1,'small','oat milk','Macchiato',3.27,55);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (2,'large','hemp milk','Macchiato',3.32,73);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (3,'medium','oat milk','Macchiato',5.34,65);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (4,'small','whole milk','Macchiato',1.19,82);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (5,'large','macadamia milk','Espresso',4.1,56);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (6,'large','goat milk','Frappuccino',7.26,47);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (7,'large','hazelnut milk','Espresso',5.66,73);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (8,'medium','macadamia milk','Drip Coffee',1.94,84);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (9,'small','lactose-free milk','Frappuccino',6.54,93);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (10,'large','coconut milk','Mocha',3.37,52);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (11,'small','hazelnut milk','Macchiato',2.86,53);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (12,'medium','goat milk','Mocha',4.24,93);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (13,'medium','condensed milk','Americano',1.57,36);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (14,'medium','condensed milk','Cold Brew',4.16,80);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (15,'small','condensed milk','Cold Brew',1.84,66);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (16,'small','oat milk','Flat White',2.82,7);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (17,'small','skim milk','Cappuccino',7.3,6);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (18,'large','oat milk','Latte',5.85,91);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (19,'small','hazelnut milk','Iced Coffee',5.2,58);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (20,'large','rice milk','Iced Coffee',5.55,98);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (21,'medium','soy milk','Cold Brew',2.13,64);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (22,'medium','whole milk','Hot Chocolate',1.75,34);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (23,'medium','evaporated milk','Cappuccino',3.55,12);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (24,'large','condensed milk','Hot Chocolate',5.24,39);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (25,'large','condensed milk','Macchiato',3.27,55);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (26,'medium','whole milk','Cappuccino',3.45,74);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (27,'small','almond milk','Macchiato',6.19,65);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (28,'small','condensed milk','Green Tea Latte',1.63,56);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (29,'medium','skim milk','Herbal Tea',6.1,32);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (30,'small','hazelnut milk','Chai Tea Latte',1.39,39);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (31,'small','condensed milk','Herbal Tea',4.74,63);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (32,'large','skim milk','Hot Chocolate',6.98,18);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (33,'small','lactose-free milk','Espresso',4.99,24);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (34,'small','soy milk','Mocha',5.67,94);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (35,'medium','hemp milk','Flat White',4.76,74);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (36,'small','oat milk','Cold Brew',4.86,38);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (37,'small','hazelnut milk','Hot Chocolate',7.46,58);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (38,'small','condensed milk','Cappuccino',1.82,98);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (39,'medium','hazelnut milk','Espresso',3.06,59);
INSERT INTO Drink(drink_id,size,milk,type,price,point_value) VALUES (40,'large','lactose-free milk','Drip Coffee',2.3,14);


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

INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (18,25);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (35,5);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (36,16);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (1,20);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (38,21);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (12,21);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (39,16);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (1,4);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (2,11);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (32,22);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (29,40);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (4,4);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (10,34);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (9,26);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (39,28);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (6,17);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (23,21);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (33,32);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (21,2);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (37,16);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (17,13);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (36,10);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (21,18);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (40,5);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (1,4);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (2,32);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (9,15);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (38,38);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (33,9);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (30,19);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (7,1);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (25,3);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (13,28);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (4,25);
INSERT INTO Drnk_Ord(order_id,drink_id) VALUES (15,37);



CREATE TABLE IF NOT EXISTS Rewards
(
    reward_id int PRIMARY KEY,
    exp_date date ,
    discount int ,
    item varchar(50),
    user_id int ,
    pointValue int,
     CONSTRAINT fk_04 FOREIGN KEY (user_id)
        REFERENCES Customer(user_id)
);

INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (1,'2022-05-20',8,'tea',4,68);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (2,'2022-12-03',2,'custom drink',25,58);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (3,'2022-10-29',6,'birthday item',15,88);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (4,'2022-09-15',8,'coffee',18,97);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (5,'2022-08-02',10,'coffee',39,34);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (6,'2022-09-26',9,'tea',37,56);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (7,'2022-07-09',2,'tea',36,85);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (8,'2023-02-06',1,'birthday item',19,86);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (9,'2022-10-18',2,'tea',5,3);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (10,'2023-02-05',8,'birthday item',31,99);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (11,'2022-11-21',6,'custom drink',15,73);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (12,'2023-02-13',8,'tea',31,99);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (13,'2022-06-02',1,'birthday item',40,25);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (14,'2022-05-02',3,'birthday item',37,38);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (15,'2022-10-22',2,'birthday item',20,45);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (16,'2022-11-13',5,'custom drink',31,27);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (17,'2023-01-10',5,'coffee',21,80);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (18,'2023-03-27',4,'coffee',17,39);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (19,'2022-11-14',10,'birthday item',37,66);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (20,'2022-11-14',10,'birthday item',30,55);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (21,'2022-10-09',7,'birthday item',4,89);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (22,'2023-03-10',7,'custom drink',27,18);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (23,'2023-03-10',4,'coffee',28,10);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (24,'2022-06-26',10,'tea',37,60);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (25,'2022-07-18',1,'coffee',16,24);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (26,'2022-11-02',10,'custom drink',32,71);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (27,'2022-11-11',2,'tea',6,79);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (28,'2023-01-22',7,'birthday item',29,59);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (29,'2022-07-31',10,'coffee',15,73);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (30,'2023-04-07',6,'tea',12,5);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (31,'2023-03-03',9,'custom drink',20,24);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (32,'2022-04-25',2,'coffee',1,96);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (33,'2023-03-22',2,'tea',24,25);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (34,'2022-07-24',3,'birthday item',22,76);
INSERT INTO Rewards(reward_id,exp_date,discount,item,user_id,pointValue) VALUES (35,'2023-01-15',7,'coffee',23,66);



CREATE TABLE IF NOT EXISTS Toppings
(
    order_id int ,
    topping varchar(100),
     CONSTRAINT fk_05 FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE cascade
);

INSERT INTO Toppings(order_id,topping) VALUES (39,'vanilla syrup');
INSERT INTO Toppings(order_id,topping) VALUES (3,'cocoa powder');
INSERT INTO Toppings(order_id,topping) VALUES (31,'peppermint candies');
INSERT INTO Toppings(order_id,topping) VALUES (3,'chocolate shavings');
INSERT INTO Toppings(order_id,topping) VALUES (39,'cocoa powder');
INSERT INTO Toppings(order_id,topping) VALUES (9,'honey');
INSERT INTO Toppings(order_id,topping) VALUES (1,'hazelnut syrup');
INSERT INTO Toppings(order_id,topping) VALUES (1,'whipped cream');
INSERT INTO Toppings(order_id,topping) VALUES (11,'marshmallows');
INSERT INTO Toppings(order_id,topping) VALUES (2,'peppermint candies');
INSERT INTO Toppings(order_id,topping) VALUES (19,'hazelnut syrup');
INSERT INTO Toppings(order_id,topping) VALUES (8,'toffee bits');
INSERT INTO Toppings(order_id,topping) VALUES (29,'coconut flakes');
INSERT INTO Toppings(order_id,topping) VALUES (29,'marshmallows');
INSERT INTO Toppings(order_id,topping) VALUES (39,'chocolate chips');
INSERT INTO Toppings(order_id,topping) VALUES (27,'almond milk foam');
INSERT INTO Toppings(order_id,topping) VALUES (22,'caramel sauce');
INSERT INTO Toppings(order_id,topping) VALUES (11,'hazelnut syrup');
INSERT INTO Toppings(order_id,topping) VALUES (34,'whipped cream');
INSERT INTO Toppings(order_id,topping) VALUES (31,'peppermint candies');
INSERT INTO Toppings(order_id,topping) VALUES (30,'hazelnut syrup');
INSERT INTO Toppings(order_id,topping) VALUES (18,'cinnamon powder');
INSERT INTO Toppings(order_id,topping) VALUES (40,'nutmeg powder');
INSERT INTO Toppings(order_id,topping) VALUES (3,'whipped cream');

