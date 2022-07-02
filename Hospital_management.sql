drop table payment;
drop table medicine;
drop table test;
drop table appointment;
drop table patient;
drop table doctor;


-----------------lab 01  and LAB 03--------------------
-------table creation--------
create table doctor(
doctorId  number(10) not null PRIMARY KEY,
name      varchar(30) not null,
designation varchar(30),
phoneNo     varchar(20),
gender      varchar(10),
deptName    varchar(30)
);

create table patient(
patientId  number(10) not null,
name      varchar(30) not null,
address varchar(50),
phoneNo     varchar(20),
gender      varchar(10),
age         number(3),
birthdate   date,
doctorId    number(10) not null,
primary key(patientId),
foreign key(doctorId) references doctor(doctorId) on delete cascade
);
create table appointment(
appId  number(10) not null,
doctorId  number(10) not null,
patientId  number(10)  not null,
appDate   date,
primary key(appId),
foreign key(doctorId) references doctor(doctorId) on delete cascade,
foreign key(patientId) references patient(patientId) on delete cascade
);

create table test(
testId  number(10) not null,
testname varchar(30) not null,
doctorId  number(10) not null,
patientId  number(10)  not null,
testResult  varchar(30),
testdate    date,
primary key(testId),
foreign key(doctorId) references doctor(doctorId) on delete cascade,
foreign key(patientId) references patient(patientId) on delete cascade
);

create table medicine(
code  number(10) not null,
name varchar(50) not null,
descrip varchar(200),
price  number(10),
patientId  number(10)  not null,
primary key(code),
foreign key(patientId) references patient(patientId) on delete cascade
);
create table payment(
payID number(10) not null,
patientId  number(10) not null,
doctorCharge number(10,2),
testCharge number(10,2),
medCharge number(10,2),
primary key (payID),
foreign key(patientId) references patient(patientId) on delete cascade
);

describe doctor;
describe  patient;
describe  test;
describe appointment;
describe medicine;
describe payment;

-----------------data insertion doctor table-------------------------------------
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (1,'Dr Mohammed Shamsul Islam Khan','Assistant Professor','01312455662','male','Neurosurgery');
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (2,'Dr Kawser Hasan','Professor','01322455662','male','Surgery');
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (3,'Dr Sheikh Fazle Rabbi','Professor','01342455662','male','ChildSpecialist');
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (4,'Dr Ishrat Jahan','Assistant Professor','01352455662','female','Medicine');
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (5,'Dr Aniruddho Joy','Assistant Professor','01312455662','male','Medicine');
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (6,'Dr Bilkis Akhter','Assistant Professor','01392455662','female','Gynaecology');
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (7,'Dr Shamsul Islam','Assistant Professor','01302455662','male','Plasticsurgery');
insert into doctor (doctorid,name,designation,phoneno,gender,deptname)  values (8,'Dr M.A. Kashem Khan','Professor','01322455662','male','Urologist');

---------------------data insertion patient table-------------------------------
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (101,'Subah','Khulshi','01926667675','female',22,'01-DEC-1999',4);
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (102,'Adnan','Nasirabad','01926663375','male',18,'16-JAN-2004',4);
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (103,'Oishi','Khulna','01877667675','female',22,'26-AUG-1999',6);
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (104,'Tuna','Dhaka','0192546675','female',20,'01-JUL-2002',2);
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (105,'Kuddus','Dhaka','01926889675','male',30,'21-FEB-1992',8);
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (106,'Sakina','Bogura','0144467675','female',35,'23-DEC-1986',6);
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (107,'Rojina','Pabna','0187567675','female',40,'01-JAN-1982',2);
insert into patient (patientid,name,address,phoneno,gender,age,birthdate,doctorid) values (108,'Putul','Chittagong','01926667675','female',14,'13-APR-2008',4);

-----------------------data insertion appointment table-------------------
insert into appointment(appId,doctorid,patientid,appDate) values (1001,4,101,'01-AUG-2022');
insert into appointment(appId,doctorid,patientid,appDate) values (1002,6,103,'03-AUG-2022');
insert into appointment(appId,doctorid,patientid,appDate) values (1003,2,104,'05-AUG-2022');
insert into appointment(appId,doctorid,patientid,appDate) values (1004,4,102,'01-AUG-2022');
insert into appointment(appId,doctorid,patientid,appDate) values (1005,4,108,'02-AUG-2022');
insert into appointment(appId,doctorid,patientid,appDate) values (1006,8,105,'01-AUG-2022');
insert into appointment(appId,doctorid,patientid,appDate) values (1007,6,106,'04-AUG-2022');
insert into appointment(appId,doctorid,patientid,appDate) values (1008,2,107,'05-AUG-2022');

------------------------data insertion test table----------------------
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2001,'Blood Test',4,101,'negative','01-AUG-2022');
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2002,'Thyroid Test',6,103,'negative','03-AUG-2022');
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2003,'Covid Test,2,104,'positive','05-AUG-2022');
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2004,'X-ray',4,102,'negative','01-AUG-2022');
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2005,'Malaria Test',4,108,'positive','02-AUG-2022');
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2006,'Urine analysis',8,105,'positive','01-AUG-2022');
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2007,'Ultrasound',6,106,'negative','04-AUG-2022');
insert into test(testId,testname,doctorid,patientid,testResult,testDate) values (2008,'CT Scan',2,107,'positive','05-AUG-2022');

-----------------------data insertion medicine table----------------------
insert into medicine(code,name,descrip,price,patientId) values(501,'Motigut','Domperidone:-Nausea and vomiting, Gastroesophageal Reflux Disease.',100,101);
insert into medicine(code,name,descrip,price,patientId) values(502,'Entacyd Plus','Hyperacidity,Gastroesophageal Reflux Disease.',150,102);
insert into medicine(code,name,descrip,price,patientId) values(503,'Pevitin','inflammatory skin conditions ',200,103);
insert into medicine(code,name,descrip,price,patientId) values(504,'Ceevit','for prevention and treatment of scurvy,infection, trauma, burns, cold exposure,',400,104);
insert into medicine(code,name,descrip,price,patientId) values(505,'Ciprocin 200 IV','For treatment of infections caused by sensitive bacteria',500,105);
insert into medicine(code,name,descrip,price,patientId) values(506,'Femastin','For lack of estrogen',300,106);
insert into medicine(code,name,descrip,price,patientId) values(507,'Fexo','Seasonal allergic rhinitis idiopathic urticaria',600,107);
insert into medicine(code,name,descrip,price,patientId) values(508,'Comet','Management of type 2 diabetes mellitus',400,108);

-----------------------data insertion payment table--------------
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3001,101,2000,300,100);
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3002,102,2500,250,200);
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3003,103,1500,300,300);
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3004,104,1000,100,100);
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3005,105,1500,200,400);
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3006,106,500,500,500);
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3007,107,1000,1000,1000);
insert into payment(payID,patientId,doctorCharge,testCharge,medCharge) values(3008,108,1500,600,1500);


select *from doctor;
select *from  patient;
select *from  test;
select *from appointment;
select *from medicine;
select *from payment;

------------------------LAB 02-------------------------------------------
------------adding a new column----------------
alter table doctor
add address varchar(50);

describe doctor;

----------------drop a column--------------------------
alter table doctor
drop column address;

describe doctor;

-----------modify-----------------

alter table payment
modify medcharge NUMBER(20,3);

---------------rename------------------

alter table payment
rename  column medcharge to medicharge;

describe table payment;

-----------
update doctor
set deptname='Medicine' where name='Dr Sheikh Fazle Rabbi';

select name from patient






