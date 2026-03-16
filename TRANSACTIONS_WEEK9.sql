#TRANSACTION
#1. create database named BankDB
#and create a table accounts with the fields: account_id, account_holder nad balance
create database BankDB;
use BankDB;

create table accounts(
account_id int primary key,
account_holder varchar(100),
balance decimal(10,2)
);

insert into accounts values
(1, 'ram', 50000),
(2, 'shyam', 30000),
(3, 'sita', 20000);

#write a transaction that transfers Rs. 5000 from Ram's account to Shyam's account.
Start transaction;
update accounts
set balance = balance - 5000
where account_id = 1;
update accounts
set balance = balance + 5000
where account_id = 2;
commit;

select*from accounts;

# Write a transacion that transfers Rs. 10000 from shyam's accounts tp sita's account and demonstrate the use of ROLLBACK.
Start transaction;
update accounts
set balance = balance - 10000
where account_id = 2;
update accounts
set balance = balance + 10000
where account_id = 3;
rollback;
select*from accounts;

#write a transaction that demonstrates the use of SAVEPOINT while updating account balances.
start transaction;
update accounts
set  balance = balance - 2000
where account_id = 1;
savepoint sp1;
update accounts set balance = balance + 2000
where account_id = 2;
rollback to sp1;
commit;

#TRIGGERS
#1. Create a table employees with the filed : emp_id, name, salary.

create table employees(
emp_id int primary key,
name varchar(100),
salary decimal (10,2));

#2. create another table salary_log to record employee salary changes with fields: log_id, emp_id,
# old-salary, new_salary, update_at.

create table salary_log(
log_id int auto_increment primary key,
emp_id int,
old_salary decimal(10,2),
new_salary decimal(10,2),
update_at timestamp default current_timestamp
);

#create a BEFORE INSERT trigger on employees that prevents inserting employees whose salary is less than 10000.

Delimiter $$
create trigger check_salary
before insert on employees
for each row
begin 
if new.salary < 10000 then 
signal sqlstate '45000'
set message_text = "salary must be atleats 10000";
end if ;
end $$
Delimiter ;

#create a AFTER UPDATE trigger on employees that records salary changes into the salary_log table. 

Delimiter $$
create trigger log_salary_update
after update on employees
for each row
begin
insert into salary_log(emp_id, old_salary,new_salary)
values (old.emp_id, old.salary, new.salary);
end $$
Delimiter ;

#Stored Procedure
# create a stored procedure that retrieves all records from the employees table.
Delimiter $$
create procedure getEmployees()
begin
select * from employees;
end $$
Delimiter ;
call getEmployees();

#create a stored procedure that inserts a new employee into the employees table using parameters.
Delimiter $$
create procedure addEmployee(
IN p_id int,
IN p_name varchar (100),
IN p_salary decimal(10,2)
)
begin 
insert into employees values(p_id, p_name, p_salary);
end $$
Delimiter ;
call addEmployee (1, 'hari', 20000);

#3. create a stored procedure that updates the salary of an employee based on employee ID.
Delimiter $$
create procedure updateSalary(
in p_id int,
in new_salary decimal(10,2))
begin 
update employees
set salary = new_salary
where emp_id = p_id;
end $$
Delimiter ;
call updateSalary(1, 30000);

#4. create a stored procedure that transfers money between two accounts using a transaction.
Delimiter $$
create procedure transferMoney(
in from_account int,
in to_account int,
in amount decimal)
begin
Start transaction;
update accounts
set balance = balance - amount
where account_id = from_account;
update accounts
set balance = balance + amount
where account_id = to_account;
commit;
end $$
Delimiter ;
call transferMoney(1,2,5000);





