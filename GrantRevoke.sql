create database namann;
use namann;
create table hotel(hotelno int , name varchar(20) , city varchar(20));
desc hotel;
alter table hotel modify hotelno int primary key;
desc hotel;

create table room(roomno int , hotelno int , type varchar(20) , price int);
create table booking (hotelno int, guestno int ,datefrom date , dateto date , roomno int);
desc booking;

create table guest(guestno int primary key, guestname varchar(20) , guestaddr varchar(50));
desc guest;

alter table hotel modify name varchar(20) not null;
alter table hotel modify city varchar(20) not null;
desc hotel;

alter table guest add guestid varchar(20);
desc guest;

alter table guest modify guestid varchar(20) not null;
alter table guest drop guestid;
alter table room add roomid int;

select user from mysql.user;
select user();
create user 'naman69'@'localhost' identified by 'test@123';
select user from mysql.user;

grant select on namann.hotel to naman69@localhost;
revoke select on namann.hotel from naman69@localhost;

select *from hotel;

insert into hotel values(12, 'namanhotel' , 'bhadra');
desc hotel;

 