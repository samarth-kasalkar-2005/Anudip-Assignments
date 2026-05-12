Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database joints;
Query OK, 1 row affected (0.08 sec)

mysql> use joints
Database changed
mysql> create table department (dept_ID int (10) primary key not null, dept_name varchar(30) not null);
Query OK, 0 rows affected, 1 warning (0.07 sec)

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_ID   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.06 sec)

mysql> insert into department values(1, 'HR'),(2, 'IT'),(3, 'Finance'), (4, 'Marketing');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from department;
+---------+-----------+
| dept_ID | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | Finance   |
|       4 | Marketing |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> create table employee ( employee_ID int primary key not null, emp_name varchar (20) not null,dept_ID int, foreign key (dept_id) references department( dept_ID));
Query OK, 0 rows affected (0.07 sec)

mysql> desc employee;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| employee_ID | int         | NO   | PRI | NULL    |       |
| emp_name    | varchar(20) | NO   |     | NULL    |       |
| dept_ID     | int         | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into employee values (1, 'aaditya', 1),(2, 'sneha', 2),(3, 'riya', 1),(4, 'shreya', null),(5, 'diya', 4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-------------+----------+---------+
| employee_ID | emp_name | dept_ID |
+-------------+----------+---------+
|           1 | aaditya  |       1 |
|           2 | sneha    |       2 |
|           3 | riya     |       1 |
|           4 | shreya   |    NULL |
|           5 | diya     |       4 |
+-------------+----------+---------+
5 rows in set (0.00 sec)

mysql> select * from department;
+---------+-----------+
| dept_ID | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | Finance   |
|       4 | Marketing |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employee inner join department on employee.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| aaditya  | HR        |
| riya     | HR        |
| sneha    | IT        |
| diya     | Marketing |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employee left join department on employee.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| aaditya  | HR        |
| sneha    | IT        |
| riya     | HR        |
| shreya   | NULL      |
| diya     | Marketing |
+----------+-----------+
5 rows in set (0.01 sec)

mysql> select emp_name, dept_name from employee right join department on employee.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| aaditya  | HR        |
| riya     | HR        |
| sneha    | IT        |
| NULL     | Finance   |
| diya     | Marketing |
+----------+-----------+
5 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employee full join department ;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| aaditya  | Marketing |
| aaditya  | Finance   |
| aaditya  | IT        |
| aaditya  | HR        |
| sneha    | Marketing |
| sneha    | Finance   |
| sneha    | IT        |
| sneha    | HR        |
| riya     | Marketing |
| riya     | Finance   |
| riya     | IT        |
| riya     | HR        |
| shreya   | Marketing |
| shreya   | Finance   |
| shreya   | IT        |
| shreya   | HR        |
| diya     | Marketing |
| diya     | Finance   |
| diya     | IT        |
| diya     | HR        |
+----------+-----------+
20 rows in set, 1 warning (0.01 sec)

mysql> create database sttore_procedure_example;
Query OK, 1 row affected (0.01 sec)

mysql> use sttore_procedure_example;
Database changed
mysql> create table employee(id int primary key not null, name varchar(20) not null, dept varchar(20) not null, salary int);
Query OK, 0 rows affected (0.04 sec)


mysql> desc employee;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| name   | varchar(20) | NO   |     | NULL    |       |
| dept   | varchar(20) | NO   |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> insert into employee values(1, 'shushant', 'HR', 10000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+----+----------+------+--------+
| id | name     | dept | salary |
+----+----------+------+--------+
|  1 | shushant | HR   |  10000 |
+----+----------+------+--------+
1 row in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployees()
    -> BEGIN
    ->     SELECT * FROM Employee;
    -> END //
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> DELIMITER ;
mysql>     SELECT * FROM Employee;
+----+----------+------+--------+
| id | name     | dept | salary |
+----+----------+------+--------+
|  1 | shushant | HR   |  10000 |
+----+----------+------+--------+
1 row in set (0.00 sec)

mysql> CALL GetEmployees();
+----+----------+------+--------+
| id | name     | dept | salary |
+----+----------+------+--------+
|  1 | shushant | HR   |  10000 |
+----+----------+------+--------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT * FROM Employee
    ->     WHERE dept = dept_name;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetEmployeeByDept('HR');
+----+----------+------+--------+
| id | name     | dept | salary |
+----+----------+------+--------+
|  1 | shushant | HR   |  10000 |
+----+----------+------+--------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> CALL GetEmployeeByDept('IT');
Empty set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE AddEmployee(
    ->     IN p_id INT,
    ->     IN p_name VARCHAR(50),
    ->     IN p_dept VARCHAR(50),
    ->     IN p_salary INT
    -> )
    -> BEGIN
    ->     INSERT INTO Employee(id, name, dept, salary)
    ->     VALUES(p_id, p_name, p_dept, p_salary);
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL AddEmployee(2, 'aaditya', 'IT', 25000);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Employee;
+----+----------+------+--------+
| id | name     | dept | salary |
+----+----------+------+--------+
|  1 | shushant | HR   |  10000 |
|  2 | aaditya  | IT   |  25000 |
+----+----------+------+--------+
2 rows in set (0.00 sec)

mysql> SELECT @total;
+----------------+
| @total         |
+----------------+
| NULL           |
+----------------+
1 row in set (0.01 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeCount(OUT total INT)
    -> BEGIN
    ->     SELECT COUNT(*) INTO total
    ->     FROM Employee;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL GetEmployeeCount(@total);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT @total;
+--------+
| @total |
+--------+
|      2 |
+--------+
1 row in set (0.01 sec)

mysql>