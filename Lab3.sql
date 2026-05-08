Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
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
6 rows in set (0.01 sec)

mysql> use ecommerce
Database changed
mysql> desc ecommerce
    -> ;
ERROR 1146 (42S02): Table 'ecommerce.ecommerce' doesn't exist
mysql> desc customers;
ERROR 1146 (42S02): Table 'ecommerce.customers' doesn't exist
mysql> show tables
    -> ;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| demo                |
| product             |
+---------------------+
3 rows in set (0.01 sec)

mysql> select * from customer;
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9876543210 |   421306 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
4 rows in set (0.01 sec)

mysql> update customer set phone_no='9988776655' where customer_id='c!4!';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
4 rows in set (0.00 sec)

mysql> select * from customer where name like '%th';
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
2 rows in set (0.01 sec)

mysql> select * from customer where name like '%ar%';
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
2 rows in set (0.00 sec)

mysql> select * from customer where name like 'S____'
    -> ;
+-------------+-------+--------+-----------------+-------------+------------+----------+
| customer_id | name  | city   | email           | address     | phone_no   | pin_code |
+-------------+-------+--------+-----------------+-------------+------------+----------+
| c!1!        | Sammy | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
+-------------+-------+--------+-----------------+-------------+------------+----------+
1 row in set (0.00 sec)

mysql> select * from customer where name like 'S__';
+-------------+------+--------+---------------+-------------+------------+----------+
| customer_id | name | city   | email         | address     | phone_no   | pin_code |
+-------------+------+--------+---------------+-------------+------------+----------+
| c!2!        | Sam  | Mumbai | sam@gmail.com | Kalyan_East | 9930859875 |   421306 |
+-------------+------+--------+---------------+-------------+------------+----------+
1 row in set (0.00 sec)

mysql> select * from customer
    -> ;
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |
+-------------+---------+--------+---------------------------+-------------+------------+----------+
4 rows in set (0.00 sec)

mysql> select * from customer limit 3;
+-------------+---------+--------+-----------------+-------------+------------+----------+
| customer_id | name    | city   | email           | address     | phone_no   | pin_code |
+-------------+---------+--------+-----------------+-------------+------------+----------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com   | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam     | Mumbai | sam@gmail.com   | Kalyan_East | 9930859875 |   421306 |
+-------------+---------+--------+-----------------+-------------+------------+----------+
3 rows in set (0.00 sec)

mysql> select distinct city from customer;
+--------+
| city   |
+--------+
| Mumbai |
+--------+
1 row in set (0.01 sec)

mysql> insert into customer values ('C!3!','Aaditya','Thane','aaditya@gmail.com','Amrai','6666699999','421301');
Query OK, 1 row affected (0.01 sec)

mysql> insert into customer values ('C!5!','Renuka','Thane','renuka@gmail.com','Ulhasnagar','4387914387','421302');
Query OK, 1 row affected (0.02 sec)

mysql> insert into customer values ('C!6!','Mahendra','Thane','mahendra@gmail.com','Mumbra','1209348756','421309');
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+-------------+----------+--------+---------------------------+-------------+------------+----------+
| customer_id | name     | city   | email                     | address     | phone_no   | pin_code |
+-------------+----------+--------+---------------------------+-------------+------------+----------+
| c!0!        | Samarth  | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |
| c!1!        | Sammy    | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |
| c!2!        | Sam      | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |
| C!3!        | Aaditya  | Thane  | aaditya@gmail.com         | Amrai       | 6666699999 |   421301 |
| c!4!        | Samarth  | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |
| C!5!        | Renuka   | Thane  | renuka@gmail.com          | Ulhasnagar  | 4387914387 |   421302 |
| C!6!        | Mahendra | Thane  | mahendra@gmail.com        | Mumbra      | 1209348756 |   421309 |
+-------------+----------+--------+---------------------------+-------------+------------+----------+
7 rows in set (0.00 sec)

mysql> desc products
    -> ;
ERROR 1146 (42S02): Table 'ecommerce.products' doesn't exist
mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| demo                |
| product             |
+---------------------+
3 rows in set (0.00 sec)

mysql> desc product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(10) | NO   | PRI | NULL    |       |
| product_name   | varchar(20) | NO   |     | NULL    |       |
| category       | varchar(10) | NO   |     | NULL    |       |
| sub_category   | varchar(10) | NO   |     | NULL    |       |
| original_price | double      | NO   |     | NULL    |       |
| selling_price  | double      | NO   |     | NULL    |       |
| stock          | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> ALTER TABLE table_name
    -> ADD column_name data_type [constraints];
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'data_type [constraints]' at line 2
mysql> alter table customer add bill_recipt data_type[constraints];
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'data_type[constraints]' at line 1
mysql> alter table customer add bill_recipt;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table customer add bill_recipt int(10);
Query OK, 0 rows affected, 1 warning (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> select * from customer;
+-------------+----------+--------+---------------------------+-------------+------------+----------+-------------+
| customer_id | name     | city   | email                     | address     | phone_no   | pin_code | bill_recipt |
+-------------+----------+--------+---------------------------+-------------+------------+----------+-------------+
| c!0!        | Samarth  | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |        NULL |
| c!1!        | Sammy    | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |        NULL |
| c!2!        | Sam      | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |        NULL |
| C!3!        | Aaditya  | Thane  | aaditya@gmail.com         | Amrai       | 6666699999 |   421301 |        NULL |
| c!4!        | Samarth  | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |        NULL |
| C!5!        | Renuka   | Thane  | renuka@gmail.com          | Ulhasnagar  | 4387914387 |   421302 |        NULL |
| C!6!        | Mahendra | Thane  | mahendra@gmail.com        | Mumbra      | 1209348756 |   421309 |        NULL |
+-------------+----------+--------+---------------------------+-------------+------------+----------+-------------+
7 rows in set (0.00 sec)

mysql> select * from customer where customer_id not between 'c!2!' and 'c!5!';
+-------------+----------+--------+--------------------+-------------+------------+----------+-------------+
| customer_id | name     | city   | email              | address     | phone_no   | pin_code | bill_recipt |
+-------------+----------+--------+--------------------+-------------+------------+----------+-------------+
| c!0!        | Samarth  | Mumbai | sdk@gmail.com      | Kalyan_East | 8591546181 |   421306 |        NULL |
| c!1!        | Sammy    | Mumbai | sammy@gmail.com    | Kalyan_East | 9373744603 |   421306 |        NULL |
| C!6!        | Mahendra | Thane  | mahendra@gmail.com | Mumbra      | 1209348756 |   421309 |        NULL |
+-------------+----------+--------+--------------------+-------------+------------+----------+-------------+
3 rows in set (0.01 sec)

mysql> select * from customer where customer_id between 'c!2!' and 'c!5!';
+-------------+---------+--------+---------------------------+-------------+------------+----------+-------------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code | bill_recipt |
+-------------+---------+--------+---------------------------+-------------+------------+----------+-------------+
| c!2!        | Sam     | Mumbai | sam@gmail.com             | Kalyan_East | 9930859875 |   421306 |        NULL |
| C!3!        | Aaditya | Thane  | aaditya@gmail.com         | Amrai       | 6666699999 |   421301 |        NULL |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |        NULL |
| C!5!        | Renuka  | Thane  | renuka@gmail.com          | Ulhasnagar  | 4387914387 |   421302 |        NULL |
+-------------+---------+--------+---------------------------+-------------+------------+----------+-------------+
4 rows in set (0.00 sec)

mysql> select * from customer where customer_id not in ('c!2!','C!6!',C!3!');
    '> ;
    '> ^C
mysql> select * from customer where customer_id not in ('c!2!','C!3!',C!6!');
    '> ^C
mysql> select * from customer where customer_id not in ('c!2!','C!3!','C!6!');
+-------------+---------+--------+---------------------------+-------------+------------+----------+-------------+
| customer_id | name    | city   | email                     | address     | phone_no   | pin_code | bill_recipt |
+-------------+---------+--------+---------------------------+-------------+------------+----------+-------------+
| c!0!        | Samarth | Mumbai | sdk@gmail.com             | Kalyan_East | 8591546181 |   421306 |        NULL |
| c!1!        | Sammy   | Mumbai | sammy@gmail.com           | Kalyan_East | 9373744603 |   421306 |        NULL |
| c!4!        | Samarth | Mumbai | samarthkasalkar@gmail.com | Kalyan_East | 9988776655 |   421306 |        NULL |
| C!5!        | Renuka  | Thane  | renuka@gmail.com          | Ulhasnagar  | 4387914387 |   421302 |        NULL |
+-------------+---------+--------+---------------------------+-------------+------------+----------+-------------+
4 rows in set (0.00 sec)

mysql> select * from customer where customer_id in ('c!2!','C!3!','C!6!');
+-------------+----------+--------+--------------------+-------------+------------+----------+-------------+
| customer_id | name     | city   | email              | address     | phone_no   | pin_code | bill_recipt |
+-------------+----------+--------+--------------------+-------------+------------+----------+-------------+
| c!2!        | Sam      | Mumbai | sam@gmail.com      | Kalyan_East | 9930859875 |   421306 |        NULL |
| C!3!        | Aaditya  | Thane  | aaditya@gmail.com  | Amrai       | 6666699999 |   421301 |        NULL |
| C!6!        | Mahendra | Thane  | mahendra@gmail.com | Mumbra      | 1209348756 |   421309 |        NULL |
+-------------+----------+--------+--------------------+-------------+------------+----------+-------------+
3 rows in set (0.00 sec)

mysql>