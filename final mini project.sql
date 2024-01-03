create database ICIC_Bank_Management_System;

use ICIC_Bank_Management_System;

create table Account_Type (Account_no int primary key,
Type_Account varchar (255),
Manager_id int (0),
Department_name varchar(255),
 Opening_Date date);
 
 insert into account_type (Account_no,Type_Account,Manager_id,Department_name,Opening_Date)values
(12345, "Saving",	20	,"Account",	"2003-04-23"),
(67899  ,"loan",	21	,"Loan",	"2004-05-24"),
(10112	,"Saving",	22	,"HR",	    "2006-01-04"),
(13145	,"loan",    23	,"Admin",	"2003-04-23"),
(15167	,"current",	24	,"Sales",	"2004-05-24"),
(18190	,"business",25	,"Security","2006-01-04"),
(20210	,"loan",	26	,"Account",	"2003-04-23"),
(22230	,"Saving",	27	,"Loan",	"2004-05-24"),
(24250	,"loan",	28	,"HR",		"2006-01-04"),
(26270	,"current",	29	,"Admin",	"2003-04-23"),
(28290	,"business",30	,"Sales",	"2004-05-24"),
(30310	,"current",	31	,"Security","2006-01-04"),
(32330	,"Saving",	32	,"Account",	"2003-04-23"),
(34350	,"loan",	33	,"Loan",	"2004-05-24"),
(36370	,"current",	34	,"HR",		"2006-01-04"),
(38390	,"current",	35	,"Admin",	"2003-04-23"),
(40410	,"business",36	,"Sales",	"2004-05-24"),
(42430	,"loan",	37	,"Security","2006-01-04"),
(44450	,"Saving",	38	,"Account",	"2003-04-23"),
(46470	,"loan",	39	,"Loan",	"2004-05-24"),
(48490	,"Saving",	40	,"HR",		"2006-01-04");


SELECT * FROM ACCOUNT_TYPE;
 
 
 create table department (
Department_id int primary key,
Department_name varchar (255),
Manager_id int (0),
Employee_id int (0),
Account_no int (0));

ALTER TABLE department
ADD FOREIGN KEY (account_no) REFERENCES account_type(account_no);


insert into department (Department_id,Department_name,Manager_id,Employee_id,Account_no) values
(1	,"Account", 20	,50	,12345),
(8	,"Loan",	21	,51	,67899),
(11	,"HR",		22	,52	,10112),
(16	,"Admin",	23	,53	,13145),
(19	,"Sales",	24	,54	,15167),
(21	,"Security",25	,55	,18190);

##(1,'null',null,56,20210);

SELECT * FROM department;

create table Bank_Details(
Branch_code int primary key,
Address varchar(255),
Department_id int(0),
Branch_name varchar (255),
State varchar (255));

ALTER TABLE bank_details
ADD FOREIGN KEY (department_id) REFERENCES department(department_id);

select * from bank_details;

insert into Bank_Details
(Branch_code, Address, Department_id, Branch_name, State)values
(100,'Ngapur'	,1,'ICIC_N',	'Maharashtra'),
(101,'pune'		,1,'ICIC_P',	'Maharashtra'),
(102,'Mumbai'	,1,	'ICIC_M'	,'Maharashtra'),
(103,'delhi'	,1,	'ICIC_D'	,'DEL'),
(104,'Mumbai'	,1,	'ICIC_M'	,'Maharashtra'),
(105,'delhi'	,1,	'ICIC_D'	,'DEL'),
(106,'Ngapur'	,1,	'ICIC_N'	,'Maharashtra'),
(107,'pune'		,8,	'ICIC_P'	,'Maharashtra'),
(108,'Mumbai'	,8,	'ICIC_M'	,'Maharashtra'),
(109,'Ngapur'	,8,	'ICIC_N'	,'Maharashtra'),
(110,'pune'		,11,'ICIC_P'	,'Maharashtra'),
(111,'Mumbai'	,11,'ICIC_M'	,'Maharashtra'),
(112,'delhi'	,11,'ICIC_D'	,'DEL'),
(113,'Ngapur'	,11,'ICIC_N'	,'Maharashtra'),
(114,'pune'		,11,'ICIC_P'	,'Maharashtra'),
(115,'Mumbai'	,16,'ICIC_M'	,'Maharashtra'),
(116,'Ngapur'	,16,'ICIC_N'	,'Maharashtra'),
(117,'pune'		,16,'ICIC_P'	,'Maharashtra'),
(118,'Mumbai'	,19,'ICIC_M'	,'Maharashtra'),
(119,'delhi'	,19,'ICIC_D'	,'DEL'),
(120,'Pune'		,21,'ICIC_P'	,'Maharashtra');

select * from bank_details;



create table job_details (
Job_id VARCHAR (255) primary key,
Department_id int,
Branch_code int);

ALTER TABLE job_details
ADD FOREIGN KEY (department_id) REFERENCES bank_details(department_id);

ALTER TABLE JOB_DETAILS
ADD foreign key (BRANCH_CODE) references BANK_DETAILS(BRANCH_CODE);

insert into job_details (Job_id, Department_id, Branch_code)VALUES
('ST_CLERK' ,1, 101),
("ST_MAN" ,8,108),
("FI_ACCOUNT" ,11,113),
("SA_REP" ,19,118);

select * from job_details;

create table Employees (
Employee_id int primary key,
First_name varchar(255),
Department_id int,
Manager_id int,
Job_id varchar(255),
Email varchar(255),
Hire_Date date,
Phone_no VARCHAR(255),
Salary int);

Alter table employees 
Add foreign key (Department_id) references Department(Department_id);

Alter table 
employees Add foreign key (Job_id) references Job_details(Job_id);


INSERT INTO employees (Employee_id,First_name,Department_id,Manager_id,Job_id,
Email,Hire_Date,Phone_no,Salary)values
(50,'Samuel',1,	20,	'ST_CLERK','SMCCAIN',	'2007-11-23','650.505.1876',3800),
(51,'Allan',8,21,'ST_CLERK','SSEWALL',		'2004-01-30','650.505.2876',3600),
(52,'Irene',11,22,'ST_CLERK','SSTILES',		'2004-03-04','650.505.3876',2900),
(53,'Kevin',16,23,'ST_CLERK','STOBIAS',		'2004-08-01','650.505.4876',2500),
(54,'Julia',19,24,'ST_CLERK','SVOLLMAN',	'2005-03-10','650.501.1876',4000),
(55,'Donald',21,25,'ST_CLERK','TFOX',		'2005-12-15','650.501.2876',3900),
(56,'Christopher',1,26,'ST_CLERK','TGATES',	'2006-11-03','650.501.3876',3200),
(57,'TJ',8,27,'ST_MAN','TJOLSON',			'2005-11-11','650.501.4876',2800),
(58,'Lisa',11,28,'ST_MAN','TRAJS',			'2007-03-19','650.507.9811',3100),
(59,'Karen',16,29,'ST_MAN','VJONES',		'2008-01-24','650.507.9822',3000),
(60,'Valli',19,30,'ST_MAN','VPATABAL',		'2008-02-23','650.507.9833',2600),
(61,'Joshua',21,31,'ST_MAN','WGIETZ',		'2003-05-01','650.507.9844',6400),
(62,'Randall',1,32,'FI_ACCOUNT','WSMITH',	'2005-10-10','515.123.4444',6200),
(63,'Hazel',8,33,'FI_ACCOUNT','WTAYLOR',	'2007-11-16','515.123.5555',11500),
(64,'Luis',11,34,'FI_ACCOUNT','JNAYER',		'2005-07-16','603.123.6666',10000),
(65,'Trenna',16,35,'FI_ACCOUNT','JPATEL',	'2006-09-28','515.123.7777',9600),
(66,'Den',19,36,'FI_ACCOUNT','JRUSSEL',		'2007-01-14','515.123.8888',7400),
(67,'Michael',21,37,'SA_REP','JSEO',		'2008-03-08','515.123.8080',7300),
(68,'John',1,38,'SA_REP','JTAYLOR',			'2005-08-20','011.44.1346.329268',6100),
(69,'Nandita',8,39,'SA_REP','JWHALEN',		'2005-10-30','011.44.1346.529268',11000),
(70,'Ismael',11,40,'SA_REP','KCHUNG',		'2005-02-16','011.44.1346.52',8800);

select * from employees;

create table Customer(
Account_No int primary key,
First_Name varchar (255),
City varchar (255),
Phone_no varchar(255),
ATM_NO INT UNIQUE KEY,
Exp_date varchar (255),
Pin_No Int unique key,
employee_id int (0),
branch_code int(0));

ALTER TABLE customer
ADD FOREIGN KEY (branch_code) REFERENCES bank_details(branch_code);

ALTER TABLE customer
ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

INSERT INTO customer(Account_No,First_Name,City,Branch_code,Employee_id,Phone_no,ATM_NO,Exp_date,Pin_No) values
(12345	,'Samuel','Ngapur',100,50,'650.505.1876',423705689,2006-04-23,5689),
(67899	,'Allan','pune',101,51,'650.505.2876',423568971,2007-05-24,8971),
(10112	,'Irene','Mumbai',102,52,'650.505.3876',423432253,2008-01-04,12253),
(13145	,'Kevin','delhi',103,53,'650.505.4876',423295535,2006-01-24,15535),
(15167	,'Julia','Mumbai',104,54,'650.501.1876',423158817,2006-02-23,18817),
(18190	,'Donald','delhi',105,55,'650.501.2876',423022099,2007-06-21,22099),
(20210	,'Christopher','Ngapur',106,56,'650.501.3876',422885381,2008-02-03,25381),
(22230	,'TJ','	pune',107,57,'650.501.4876',422748663,2004-01-27,28663),
(24250	,'Lisa','Mumbai',108,58,'650.507.9811',422611945,005-02-20,31945),
(26270	,'Karen','Ngapur',109,59,'650.507.9822',422475227,2006-06-24,35227),
(28290	,'Valli','pune',110,60,'650.507.9833',422338509,2007-02-07,38509),
(30310	,'Joshua','Mumbai',111,61,'650.507.9844',422201791,2008-01-13,41791),
(32330	,'Randall','delhi',112,62,'515.123.4444',422065073,2003-09-17,45073),
(34350	,'Hazel','Ngapur',113,63,'515.123.5555',421928355,2004-02-17,48355),
(36370	,'Luis','pune',	114,64,'603.123.6666',421791637,2005-08-17,51637),
(38390	,'Trenna','Mumbai',115,65,'515.123.7777',421654919,2002-06-07,	54919),
(40410	,'Den','Ngapur',116,66,'515.123.8888',421518201,2002-06-07,58201),
(42430	,'Michael','pune',117,67,'515.123.8080',421381483,2002-06-07,61483),
(44450	,'John','Mumbai',118,68,'011.44.1346.329268',421244765,2002-06-07,64765),
(46470	,'Nandita','delhi',119,69,'011.44.1346.529268',421108047,2008-04-21,68047),
(48490	,'Ismael','	Pune',120,70,'011.44.1346.52',420971329,2005-03-11,71329);

select * from customer;

#1. Find an employee’s whose id is 52 and branch name is icicp

Select employees.employee_id, bank_details.Branch_name From employees
Join bank_details On employees.Department_id = bank_details.Department_id
Where employees.Employee_id = 52 And bank_details.Branch_name LIKE 'icic_p';

#2. Count the number of employees working in the loan department and show its
#opening dates and address.

select count(department.Employee_id) as LoanD_Emp, 
account_type.Opening_Date, bank_details.Address from account_type
join department on account_type.Account_no = department.Account_no
join bank_details on department.Department_id = bank_details.Department_id
where account_type.Department_name ="Loan"
group by account_type.Opening_Date, bank_details.Address;

##3. Find details department name, address, branch code, dept _id, city of the account no 18190.

Select account_type.department_name,bank_details.address,department.department_id,
bank_details.branch_code,customer.city from account_type
Join department on account_type.account_no = department.account_no
join bank_details on department.department_id = bank_details.department_id
join Customer on customer.branch_code = bank_details.branch_code
where account_type.account_no = 18190;


##4.	Find department id, department name, job id whose only work in Loan, HR, admin.

Select department.department_id,department.department_name,job_details.Job_id from department
Join Job_details on department.department_id = job_details.department_id
where department.Department_name in ("loan","HR","Admin");

##5. Find the type_account, state, account number whose atm no 422748663.

select account_type.type_account,customer.atm_no,customer.account_no from account_type
join customer on account_type.account_no = customer.account_no
where customer.atm_no =  422748663;

##6. Create a view with that show address, branch name, department name, first name ,phone no 

create view details_A as 
select bank_details.address,bank_details.branch_name,department.department_name,
employees.First_name, employees.Phone_no from department
join bank_details on department.Department_id = bank_details.Department_id
join employees on bank_details.Department_id = employees.Department_id;

select * from details_A;

##7.  Create view city, department name whose opening date is less than 24 May 04

create view details_B as
select account_type.Opening_Date, department.Department_name, customer.City from account_type
join department on account_type.Account_no = department.Account_no
join customer on department.Employee_id = customer.Employee_id
where account_type.Opening_Date < "2004-05-24";

select * from details_B;

##8. Create view only job id for clerk, manager, an accountant with all detail and name it employee job_deatils

create view details_C as
select employees.Employee_id, employees.First_name, employees.Department_id, 
employees.Manager_id, employees.Job_id, employees.Email, employees.Hire_Date,
employees.Phone_no, employees.Salary, job_details.Branch_code from employees
Join job_details on employees.Job_id = job_details.Job_id
where job_details.Job_id in ("ST_CLERK" ,"ST_MAN", "FI_ACCOUNT");

select* from details_C;


##9. In the job details change the atm pin 423295535 with 42321992.

UPDATE customer
Set atm_no = "42321992"
Where atm_no = "423295535";


select* from customer;

##10. In the job, details change all sales account into admin and account type into saving

Update job_details
Set job_id = "Admin"
Where job_id = "SA_REP";

SET SQL_SAFE_UPDATES = 0;

Update account_type
Set Type_Account = "Saving"
Where Type_Account = "Sales";

SELECT * FROM job_details;

SELECT * FROM Account_type;

