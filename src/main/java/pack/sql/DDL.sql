create database project;

use project;

create table category(
c_num int PRIMARY KEY auto_increment,
c_name varchar(50) not null)charset utf8;

insert into category(c_num,c_name) values (null,'스터디 게시판');
insert into category(c_num,c_name) values (null,'공모전 게시판');
insert into category(c_num,c_name) values (null,'친목 게시판');

create table admin(
a_num int primary key auto_increment,
a_email varchar(40) not null,
a_name varchar(10) not null,
a_phone1 varchar(15) not null,
a_phone2 varchar(15) not null,
a_phone3 varchar(15) not null,
a_password varchar(60) not null)charset utf8;

create table notice(
n_num int primary key auto_increment,
n_title varchar(500) not null,
n_content varchar(10000) not null,
n_ano int(11) not null,
n_sdate datetime not null,
n_views int(11) not null,
foreign key(n_ano) references admin(a_num))charset utf8;

create table member(
m_num int primary key auto_increment,
m_email varchar(40) not null,
m_name varchar(10) not null,
m_password varchar(60) not null,
m_phone1 varchar(15) not null,
m_phone2 varchar(15) not null,
m_phone3 varchar(15) not null,
m_state varchar(5) not null,
m_grade varchar(5) not null,
m_warning varchar(5) not null,
m_regdate datetime not null
)charset utf8;

create table board(
b_num int PRIMARY KEY auto_increment,
b_cno int not null,
b_title varchar(500) not null,
b_content varchar(10000) not null,
b_mno int not null, 
b_ip varchar(20) not null,
b_sdate datetime not null, 
b_udate datetime not null,
b_views int(11) not null,
foreign key(b_cno) references category(c_num),		
foreign key(b_mno) references member(m_num))charset utf8;

create table reply(
r_num int PRIMARY KEY auto_increment,
r_content varchar(500) not null,
r_bno int not null,
r_sdate datetime not null,
r_mno int not null,
r_ip varchar(20) not null,
foreign key(r_bno) references board(b_num), 
foreign key(r_mno) references member(m_num))charset utf8;