Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sammy_demo         |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> create database aggregation;
Query OK, 1 row affected (0.02 sec)

mysql> use aggregation;
Database changed
mysql> create table products(product_id varchar(10) not null primary key, product_name varchar(25) not null, category varchar(25) not null, original_price int(10) not null,selling_price int(10) not null,stock int(3) not null);
Query OK, 0 rows affected, 3 warnings (0.09 sec)

mysql> insert into products values('P101','Chair','Furniture',8000,7000,12);
Query OK, 1 row affected (0.02 sec)

mysql> insert into products values('P102','Table','Furniture',13000,12000,4);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values('P103','Laptop','Electronics',69000,60000,20);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values('P104','Mobile','Electronics',17000,20000,50);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values('P105','Tshirt','Fashion',800,750,10);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values('P106','Jeans','Fashion',1500,1100,8);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values('P107','Webcam','Electronics',6000,5500,5);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values('P108','Watch','Electronics',5000,4500,14);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values('P109','Googles','Fashion',800,700,13);
Query OK, 1 row affected (0.01 sec)

mysql> select * from products;
+------------+--------------+-------------+----------------+---------------+-------+
| product_id | product_name | category    | original_price | selling_price | stock |
+------------+--------------+-------------+----------------+---------------+-------+
| P101       | Chair        | Furniture   |           8000 |          7000 |    12 |
| P102       | Table        | Furniture   |          13000 |         12000 |     4 |
| P103       | Laptop       | Electronics |          69000 |         60000 |    20 |
| P104       | Mobile       | Electronics |          17000 |         20000 |    50 |
| P105       | Tshirt       | Fashion     |            800 |           750 |    10 |
| P106       | Jeans        | Fashion     |           1500 |          1100 |     8 |
| P107       | Webcam       | Electronics |           6000 |          5500 |     5 |
| P108       | Watch        | Electronics |           5000 |          4500 |    14 |
| P109       | Googles      | Fashion     |            800 |           700 |    13 |
+------------+--------------+-------------+----------------+---------------+-------+
9 rows in set (0.00 sec)

mysql> select sum(selling_price)from products;
+--------------------+
| sum(selling_price) |
+--------------------+
|             111550 |
+--------------------+
1 row in set (0.00 sec)

mysql> select avg(selling_price)from products;
+--------------------+
| avg(selling_price) |
+--------------------+
|         12394.4444 |
+--------------------+
1 row in set (0.00 sec)

mysql> select count(*)from products;
+----------+
| count(*) |
+----------+
|        9 |
+----------+
1 row in set (0.00 sec)

mysql> select max(stock)from products;
+------------+
| max(stock) |
+------------+
|         50 |
+------------+
1 row in set (0.00 sec)

mysql> select min(stock)from products;
+------------+
| min(stock) |
+------------+
|          4 |
+------------+
1 row in set (0.00 sec)

mysql> select * from products order by stock;
+------------+--------------+-------------+----------------+---------------+-------+
| product_id | product_name | category    | original_price | selling_price | stock |
+------------+--------------+-------------+----------------+---------------+-------+
| P102       | Table        | Furniture   |          13000 |         12000 |     4 |
| P107       | Webcam       | Electronics |           6000 |          5500 |     5 |
| P106       | Jeans        | Fashion     |           1500 |          1100 |     8 |
| P105       | Tshirt       | Fashion     |            800 |           750 |    10 |
| P101       | Chair        | Furniture   |           8000 |          7000 |    12 |
| P109       | Googles      | Fashion     |            800 |           700 |    13 |
| P108       | Watch        | Electronics |           5000 |          4500 |    14 |
| P103       | Laptop       | Electronics |          69000 |         60000 |    20 |
| P104       | Mobile       | Electronics |          17000 |         20000 |    50 |
+------------+--------------+-------------+----------------+---------------+-------+
9 rows in set (0.00 sec)

mysql> select * from products order by stock desc;
+------------+--------------+-------------+----------------+---------------+-------+
| product_id | product_name | category    | original_price | selling_price | stock |
+------------+--------------+-------------+----------------+---------------+-------+
| P104       | Mobile       | Electronics |          17000 |         20000 |    50 |
| P103       | Laptop       | Electronics |          69000 |         60000 |    20 |
| P108       | Watch        | Electronics |           5000 |          4500 |    14 |
| P109       | Googles      | Fashion     |            800 |           700 |    13 |
| P101       | Chair        | Furniture   |           8000 |          7000 |    12 |
| P105       | Tshirt       | Fashion     |            800 |           750 |    10 |
| P106       | Jeans        | Fashion     |           1500 |          1100 |     8 |
| P107       | Webcam       | Electronics |           6000 |          5500 |     5 |
| P102       | Table        | Furniture   |          13000 |         12000 |     4 |
+------------+--------------+-------------+----------------+---------------+-------+
9 rows in set (0.00 sec)

mysql> select * from products order by stock desc limit 3;
+------------+--------------+-------------+----------------+---------------+-------+
| product_id | product_name | category    | original_price | selling_price | stock |
+------------+--------------+-------------+----------------+---------------+-------+
| P104       | Mobile       | Electronics |          17000 |         20000 |    50 |
| P103       | Laptop       | Electronics |          69000 |         60000 |    20 |
| P108       | Watch        | Electronics |           5000 |          4500 |    14 |
+------------+--------------+-------------+----------------+---------------+-------+
3 rows in set (0.00 sec)

mysql> create table employee(employee_id varchar(10) not null primary key,employee_name varchar(25) not null,department varchar(10) not null,salary int(10) not null);
Query OK, 0 rows affected, 1 warning (0.05 sec)

mysql> insert into employee values('E101','Harshal','HR',40000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values('E102','Pavani','IT',6000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values('E103','Shreya','IT',7000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values('E104','Sheetal','HR',4500);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values('E105','Harsh','Finance',5000);
Query OK, 1 row affected (0.01 sec)

mysql> select department,count(*) as total_employees from employee group by department;
+------------+-----------------+
| department | total_employees |
+------------+-----------------+
| HR         |               2 |
| IT         |               2 |
| Finance    |               1 |
+------------+-----------------+
3 rows in set (0.01 sec)

mysql> select department,sum(salary) as total_salary from employee group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        44500 |
| IT         |        13000 |
| Finance    |         5000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department,avg(salary) as total_salary from employee group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |   22250.0000 |
| IT         |    6500.0000 |
| Finance    |    5000.0000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, salary,count(*) from employee group by department, salary;
+------------+--------+----------+
| department | salary | count(*) |
+------------+--------+----------+
| HR         |  40000 |        1 |
| IT         |   6000 |        1 |
| IT         |   7000 |        1 |
| HR         |   4500 |        1 |
| Finance    |   5000 |        1 |
+------------+--------+----------+
5 rows in set (0.00 sec)

mysql> select * from employee;
+-------------+---------------+------------+--------+
| employee_id | employee_name | department | salary |
+-------------+---------------+------------+--------+
| E101        | Harshal       | HR         |  40000 |
| E102        | Pavani        | IT         |   6000 |
| E103        | Shreya        | IT         |   7000 |
| E104        | Sheetal       | HR         |   4500 |
| E105        | Harsh         | Finance    |   5000 |
+-------------+---------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select department, count(*) as total_employee from employee group by department having count(*) > 1;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| HR         |              2 |
| IT         |              2 |
+------------+----------------+
2 rows in set (0.00 sec)

mysql> select department, sum(salary) as total_salary from employee group by department having sum(salary) > 8000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        44500 |
| IT         |        13000 |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> select department, sum(salary) as total_salary from employee group by department having sum(salary) > 2000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        44500 |
| IT         |        13000 |
| Finance    |         5000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, avg(salary) as average_salary from employee group by department having avg(salary) > 5000;
+------------+----------------+
| department | average_salary |
+------------+----------------+
| HR         |     22250.0000 |
| IT         |      6500.0000 |
+------------+----------------+
2 rows in set (0.00 sec)

mysql>
