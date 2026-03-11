Create database dept;
show databases;
use  dept;

create table dept (
DEPTNO int primary key,
DNAME varchar(20),
LOC varchar(4)
);

select * from Department;
rename table dept to Department;
alter table Department add column PINCODE int not null default 0;

Alter table Department change DNAME DEPT_NAME VARCHAR(20);
Alter table Department modify LOC char(20);
Drop table Department;
