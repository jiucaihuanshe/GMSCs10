create database gmscs10 charset utf8;

use gmscs10;

create table merchandise_type (
	tid int(4) auto_increment,
	tname varchar(20),
	tremark varchar(50),
	primary key (tid)
) engine=innodb charset=utf8;

create table unit (
	id int(4) auto_increment,
	name varchar(6),
	primary key (id)
) engine=innodb charset=utf8;

create table into_particular(
	id int(4) auto_increment,
	inid int(4),
	bar_code int(4),
	sum int(4) default 0,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

create table employee(
	id int(4) auto_increment,
	name varchar(10) not null,
	gender tinyint unsigned,
	age tinyint unsigned,
	duty varchar(16),
	telephone varchar(12),
	address varchar(40),
	remark varchar(50),
	addon datetime,
	addby int,
	editon datetime,
	editby int,
	deleteon datetime,
	deleteby int,
	delete_flag tinyint unsigned default 0,
	primary key (id)
) engine=innodb charset=utf8;

create table storehouse(
	id int(4) auto_increment,
	name varchar(20) not null,
	telephone varchar(12),
	address varchar(40),
	eid int(4) not null,
	remark varchar(50),
	primary key(id),
	foreign key(eid) references employee(id)
) engine=innodb charset=utf8;

create table offer_merchant(
	id int(4) auto_increment,
	name varchar(20),
	linkman varchar(10),
	telephone varchar(12),
	address varchar(40),
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

create table merchandise (
	id int(4) auto_increment,
	bar_code int(4) unique not null,
	trade_nam varchar(30),
	uid int(4) not null,
	purchase_price decimal(8,2) default '0.00',
	presell_price decimal(8,2) default '0.00',
	discount decimal(4,0) default '1',
	mid int(11) not null,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

alter table merchandise add foreign key(uid) references unit(id);
alter table merchandise add foreign key(mid) references merchandise_type(tid);

create table storage (
	id int(4) auto_increment,
	mbar_code int(4) not null,
	sid int(4) not null default '1',
	sum int(4) default '0',
	remark varchar(50),
	production_date datetime,
	expiry_date datetime,
	primary key (id)
) engine=innodb charset=utf8;

alter table storage add foreign key(mbar_code) references merchandise(bar_code);
alter table storage add foreign key(sid) references storehouse(id);

create table into_stock(
	id int(4) auto_increment,
	oid int(4),
	shid int(4) not null default '1',
	amount decimal(8,2) default '0.00',
	eid int(4) not null default '1',
	created datetime,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

alter table into_stock add foreign key(oid) references offer_merchant(id);
alter table into_stock add foreign key(eid) references employee(id);

create table sell(
	id int(4) auto_increment,
	amount decimal(8,2) default '0.00',
	eid int(4),
	sell_date datetime,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

alter table sell add foreign key(eid) references employee(id);

create table sell_particular(
	id int(4) auto_increment,
	sell_id int(4),
	bar_code int(4),
	sum int(4) default 0,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

alter table sell_particular add foreign key(sell_id) references sell(id);
alter table sell_particular add foreign key(bar_code) references merchandise(bar_code);

create table administrator(
	id int(4) auto_increment,
	username varchar(10) not null,
	password varchar(16) not null,
	salt varchar(50),
	remark varchar(10),
	addon datetime,
	addby int,
	editon datetime,
	editby int,
	deleteon datetime,
	deleteby int,
	delete_flag tinyint unsigned default 0,
	primary key (id)
) engine=innodb charset=utf8;

https://wenku.baidu.com/view/715008e24128915f804d2b160b4e767f5acf80da.html