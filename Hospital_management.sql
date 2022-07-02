drop table payment;
drop table medicine;
drop table test;
drop table appointment;
drop table patient;
drop table doctor;


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
name varchar(10) not null,
descrip varchar(30),
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
