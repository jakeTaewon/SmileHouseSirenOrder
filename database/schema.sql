create table member(
	id varchar(32) primary key,
	password varchar(32) not null,
	name varchar(32) not null,
	pnum varchar(32) not null
);

create table menu(
name varchar2(32) primary key, /*drink name*/
image BLOB not null,
time varchar2(32) not null

);

create table reserv(
name varchar2(32),/*username*/
pnum varchar2(32) not null,
extime varchar2(12) not null,
drink varchar2(32) not null,
time varchar2(32) not null
);