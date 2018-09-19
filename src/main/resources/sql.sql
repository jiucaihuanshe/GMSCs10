create database gmscs10 charset utf8;

use gmscs10;

create table merchandise_type (
	id int(4) auto_increment,
	name varchar(20),
	parentId int,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

create table unit (
	id int(4) auto_increment,
	name varchar(20),
	primary key (id)
) engine=innodb charset=utf8;

create table into_particular(
	id int(4) auto_increment,
	inid int(4),
	bar_code varchar(50),
	sum int(4) default 0,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

create table employee(
	id int(4) auto_increment,
	name varchar(10) not null,
	gender tinyint unsigned,
	age tinyint unsigned,
	duty int,
	telephone varchar(12),
	id_card varchar(50),
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
	delete_flag tinyint unsigned default 0,
	primary key (id)
) engine=innodb charset=utf8;

create table merchandise (
	id int(4) auto_increment,
	bar_code varchar(50) unique not null,
	trade_name varchar(30),
	uid int(4) not null,
	purchase_price decimal(8,2) default '0.00',
	presell_price decimal(8,2) default '0.00',
	discount decimal(4,0) default '1',
	mid int(11) not null,
	remark varchar(50),
	delete_flag tinyint unsigned default 0,
	primary key (id)
) engine=innodb charset=utf8;

alter table merchandise add foreign key(uid) references unit(id);
alter table merchandise add foreign key(mid) references merchandise_type(tid);

create table storage (
	id int(4) auto_increment,
	mbar_code varchar(50) not null,
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
	bar_code varchar(50),
	sum int(4) default 0,
	remark varchar(50),
	primary key (id)
) engine=innodb charset=utf8;

alter table sell_particular add foreign key(sell_id) references sell(id);
alter table sell_particular add foreign key(bar_code) references merchandise(bar_code);

create table administrator(
	id int(4) auto_increment,
	username varchar(10) not null,
	password varchar(50) not null,
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

create table sys_lookup(
	id int not null primary key auto_increment,
	lookup_key varchar(50),
	lookup_code varchar(50),
	lookup_descrption varchar(200),
	col1 varchar(50),
	col2 varchar(50),
	col3 varchar(50),
	display varchar(2)
)engine=innodb charset=utf8;

insert into sys_lookup(lookup_key,lookup_code,lookup_descrption) values
('gender','1','男'),('gender','0','女'),
('comeway','0','父母接送'),('comeway','1','学校接送'),('comeway','2','住校')

create table employee_duty(
	id INT AUTO_INCREMENT,
	parentId INT,
	name VARCHAR(50),
	PRIMARY KEY(id)
)ENGINE=INNODB CHARSET=utf8


insert  into `administrator`(`id`,`username`,`password`,`salt`,`remark`,`addon`,`addby`,`editon`,`editby`,`deleteon`,`deleteby`,`delete_flag`) values (4,'admin','14b7f1f71f72ad4361d90b69cd7153f1','29766d71-e97f-48df-9bed-863bed9809d0',NULL,'2018-09-07 11:05:29',1,'2018-09-07 16:24:57',1,'2018-09-07 13:33:50',1,0),(5,'as','c72b87387fe3017b1a435dc8ee383604','d98cceda-df69-4e81-8c53-39c9d23ef7b3',NULL,'2018-09-07 13:44:09',1,'2018-09-08 09:13:12',1,NULL,NULL,0),(6,'张丽','4bf3fb7d96b5673fa221da4c0d9071cf','efecaa12-8264-43ed-8ee9-3d7ae54dc018',NULL,'2018-09-12 13:21:09',1,NULL,NULL,NULL,NULL,0),(7,'美丽','727f049b6f5d6bd6a130e6da55a9e513','b257c0db-1538-4b6d-a77c-7df3cec073b5',NULL,'2018-09-15 15:53:49',1,NULL,NULL,NULL,NULL,0);
insert  into `employee`(`id`,`name`,`gender`,`age`,`duty`,`telephone`,`id_card`,`address`,`remark`,`addon`,`addby`,`editon`,`editby`,`deleteon`,`deleteby`,`delete_flag`) values (4,'admin',0,18,1,'123456','123456789987654321','北京市','员工一名,负责看店','2018-09-07 11:05:29',1,'2018-09-08 08:55:43',1,'2018-09-07 13:33:50',1,0),(5,'as',0,19,2,'12345','123456789987654321','北京市','理货员一名','2018-09-07 13:44:09',1,NULL,NULL,NULL,NULL,0),(6,'张丽',0,22,3,'18715026227','123456789987654321','北京市大兴区','员工一名','2018-09-12 13:21:09',1,NULL,NULL,NULL,NULL,0),(7,'美丽',1,19,25,'18233334444','123456789987654321','南京市','前台经理','2018-09-15 15:53:48',1,'2018-09-15 16:00:27',1,NULL,NULL,0);
insert  into `employee_duty`(`id`,`parentId`,`name`) values (1,NULL,'采购部'),(2,1,'采购经理'),(3,1,'采购主管'),(4,1,'采购助理'),(6,NULL,'生鲜部'),(7,6,'生鲜经理'),(10,6,'生鲜主管'),(11,6,'生鲜员工'),(12,NULL,'食品部'),(13,12,'食品经理'),(14,12,'食品主管'),(15,12,'理货员'),(16,NULL,'收货部'),(17,16,'收货经理'),(18,16,'收货主管'),(19,16,'接单员'),(20,16,'录入员'),(21,16,'确认员'),(22,16,'收货员'),(23,16,'退换货员'),(24,NULL,'前台部'),(25,24,'前台经理'),(26,NULL,'收银部'),(27,26,'收银主管'),(28,26,'收银员'),(29,26,'总收室出纳'),(30,NULL,'客服部'),(31,30,'客服经理'),(32,30,'客服主管'),(33,30,'前台接待'),(34,30,'广播员'),(35,30,'退换货员'),(36,30,'赠品发放员'),(37,36,'赠品员'),(38,NULL,'账务');
insert  into `merchandise_type`(`id`,`parentId`,`name`,`remark`) values (4,NULL,'食品干货',NULL),(5,4,'冷冻',NULL),(6,4,'冷藏',''),(7,4,'粮油测试',''),(8,5,'混沌',''),(9,5,'饺子',''),(10,8,'散装混沌',''),(11,8,'袋装混沌',''),(12,4,'饼干',''),(13,12,'蛋糕类',''),(14,13,'派',''),(15,13,'布司',''),(16,13,'其他蛋糕',''),(17,NULL,'日用品',''),(18,17,'健康美容','');
insert  into `offer_merchant`(`id`,`name`,`linkman`,`telephone`,`address`,`remark`,`delete_flag`) values (1,'恒信公司','李小姐','13526241542','北京朝阳区','零食商',0),(2,'康师傅','康小姐','4006510022','天津顶园食品有限公司','蛋糕',0);
insert  into `storehouse`(`id`,`name`,`telephone`,`address`,`eid`,`remark`) values (1,'北京仓','110000','北京市丰台区',4,'仓库一个'),(3,'北京仓','110000','北京市丰台区',5,'仓库二个'),(4,'天津仓','123456','天津市朝阳区',5,'仓库三个'),(5,'河北仓','123456','河北路',5,'仓库'),(6,'河南仓','123456','河南区',5,'仓库'),(8,'合肥','110000','合肥',6,'合肥');
insert  into `unit`(`id`,`name`) values (1,'合肥分公司');



https://wenku.baidu.com/view/715008e24128915f804d2b160b4e767f5acf80da.html