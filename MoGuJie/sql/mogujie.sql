--蘑菇街数据库设计
delete ADMIN;
delete ADVERTISE;
delete USERINFO;
select *from admin;
--管理员
create table admin(
	aid int primary key,--管理员id
	aname varchar2(50) unique not null,--管理员昵称
	apwd varchar2(20),--密码
	aemail varchar(50),--邮箱
	agread int --管理员等级
);
create sequence seq_admin_aid start with 100 increment by 1;
--用户信息表
create table userInfo(
  usid int primary key,--用户id
  uspwd varchar2(100),--密码
  uname varchar2(20) unique not null,--用户昵称
  uphoto varchar2(100),--用户头像地址
  ubirthday date,--用户生日
  usemail varchar2(100),--邮箱地址
  ucode varchar2(10),--用户邮编
  usphone varchar2(15), --用户联系方式
  usaccount number(10,2),--用户余额
  statue int,--删除时的状态标志
  obligateone int,--预留字段1
  obligatetwo int--预留字段2
);
create sequence seq_UserInfo_usid start with 100 increment by 1;

insert into userInfo values(1001,'123','haha','',to_date('2003-03-10','yyyy-mm-dd'),'523525@qq.com','421002',
'12123333','1000',1,'','');
insert into userInfo values(1002,'123','lala','',to_date('2008-07-10','yyyy-mm-dd'),'67253278@qq.com','421002',
'12123333','1000',1,'','');

--地址表
create table address(
  addressid int primary key,--id
  province varchar2(40),--省份
  city varchar2(40),--市
  street varchar2(80),--区
  usaddress varchar2(100),--用户详细地址
  usid int--用户id
        constraint FK_address_usid references userInfo(usid),
  adname varchar2(50),--真实姓名
  adcode int,		--邮编
  adtel varchar2(15),		--电话     
  statue int,--是否为默认地址
  obligateone int,--预留字段1
  obligatetwo int--预留字段2
);

create sequence seq_address_addressid start with 100 increment by 1;
insert into address values(seq_address_addressid.nextval,'湖南省','衡阳市','珠晖区','衡花路18号',120,'陈烜',45646,'15674785546',1,1,1);
insert into address values(seq_address_addressid.nextval,'湖南省','岳阳市','珠晖区','衡花路18号',120,'菜菜',45646,'15674785546',1,'','');
--商品分类表首级
create table categoryone(
  categoryidone int primary key,--商品类型Id
  categoryTypeone varchar2(100),--商品类型   
  obligateone int,--状态
  obligatetwo int--预留字段2
);
create sequence seq_categorys_categoryidone start with 100 increment by 1;
insert into categoryone values(seq_categorys_categoryidone.nextval,'上衣',1,0);
--2级分类
create table categorytwo(
  categoryidtwo int primary key,--商品类型Id
  categoryidone int--商品类型，引用外键
	      constraint FK_categorytwo_categoryidone references categoryone(categoryidone), 
  categoryTypetwo varchar2(100),--商品类型   
  obligateone int,--状态
  obligatetwo int--预留字段2
);

create sequence seq_categorys_categoryidtwo start with 100 increment by 1;
insert into categorytwo values(seq_categorys_categoryidtwo.nextval,100,'短袖',1,0)
select *from categorytwo
--3级分类
create table categorythree(
  categoryidthree int primary key,--商品类型Id
  categoryidtwo int--商品类型，引用外键
	      constraint FK_categorythree_categoryidtwo references categorytwo(categoryidtwo), 
  categoryTypethree varchar2(100),--商品类型   
  obligateone int,--状态
  obligatetwo int--预留字段2
);
create sequence seq_categorys_categoryidthree start with 100 increment by 1;
insert into categorythree values(seq_categorys_categoryidthree.nextval,101,'圆领',1,0);

--商品表，主要用来保存管理员上传的商品信息
create table product(
	 proid int primary key,--商品id
	 proname varchar2(100) not null unique,--商品名称
	 procontent varchar2(100),--商品简介
	 proprice number(8,2),--商品价格
	 categoryidthree int--商品类型，引用外键
	      constraint FK_Product_categoryidthree references categorythree(categoryidthree),
	 prophoto varchar2(100),--图片地址
	 pstatue int,--商品状态  可用与不可用
	 obligateone int,--预留字段1
	 obligatetwo int--预留字段2
);
create sequence seq_product_proid start with 100 increment by 1;

insert into product values(seq_product_proid.nextval,'毛衣','羊羊羊毛衣','99.9',101,'',1,'','');

insert into product values(seq_product_proid.nextval,'毛衣','羊羊羊毛衣','99.9',100,'',1,'','');

--商品详细表
create table detail(
  	deid int primary key,
	proid int -- 商品名称
        constraint FK_detail_product references product(proid),
	counts int,--销售量
	psize varchar2(20),--商品尺寸
	pcolor varchar2(100),--颜色图片地址
	color varchar2(20),--颜色
	proNumber int,--库存
    obligateone int,--预留字段1s
    obligatetwo int--预留字段2
);

create sequence seq_detail_deid start with 100 increment by 1;

--用户订单表，主要用来保存用户订单信息
create table userOrder(
 orderid int primary key,--订单号
 usid int--用户表外键，知道用户名
     constraint FK_cart_usid references userInfo(usid),
 datetime date,--订单日期
 ostatus int,--订单状态  0不可用，1未付款，2已付款
 addressid int
	 constraint FK_userOrder_addressid references address(addressid),
 obligateone int,--预留字段1
 obligatetwo int--预留字段2
);

create sequence seq_userOrder_orderid start with 100 increment by 1;
insert into userOrder values(seq_userOrder_orderid.nextval,260,to_date('2015-03-10','yyyy-mm-dd'),2,181,'','');
insert into userOrder values(seq_userOrder_orderid.nextval,240,to_date('2015-03-10','yyyy-mm-dd'),1,141,'','');
insert into userOrder values(seq_userOrder_orderid.nextval,240,to_date('2016-01-10','yyyy-mm-dd'),0,141,'','');

--用户订单详细表
create table  orderdetail(
 orid int primary key,
 orderid int --订单号
         constraint FK_orderdetail_orderid references userOrder(orderid) on delete cascade, 
 proid int  --商品表id
       constraint FK_orderdetail_proid references product(proid),
 deid int --商品详细id
       constraint FK_orderdetail_deid references detail(deid),
 onumber int,--数量
 buyprice number(8,2),--购买价
 ostatus int,--状态 可用与不可用
 obligateone int,--预留字段1
 obligatetwo int--预留字段2	
); 
select *from orderdetail;
create sequence seq_orderdetail_orid start with 100 increment by 1;
insert into orderdetail values(seq_orderdetail_orid.nextval,128,102,1,'199.9',1,'','');
insert into orderdetail values(seq_orderdetail_orid.nextval,128,102,100,1,'199.9',1,'','');
insert into orderdetail values(seq_orderdetail_orid.nextval,123,100,1,'199.9',1,'','');

--广告位表
create table advertise(
	aid int primary key,--广告位id
	asize varchar2(100),--图片尺寸
 	weizhi varchar2(100),--位置
 	obligateone int,--预留字段1
 	obligatetwo int--预留字段2
);
insert into advertise values(1,'100*100','',1,1)
create sequence seq_advertise_aid start with 100 increment by 1;
--广告表
create table guanggao(
	gid int primary key,--广告编号
	aid int
      constraint FK_guanggao_aid references advertise(aid),--广告位id
	ggrade int,
	gPhoto varchar2(100),--图片地址
	gdates date,--广告开始时间
	gdateo date,--广告结束时间
  	weight int,--权重
	click int,--点击次数
	linkaddress varchar2(100),--连接地址
 obligateone int,--预留字段1
 obligatetwo int--预留字段2
);
create sequence seq_guanggao_gid start with 100 increment by 1;
insert into guanggao values(seq_guanggao_gid.nextval,1,1,'','','',1,1,'',1,1)
select * from guanggao order by weight desc,gdates desc
--买家回馈
create table feedback(
	fid int primary key,--回馈编号
	usid int --用户表外键
		constraint FK_fedbook_usid references userInfo(usid),
	orderid int--订单表外键
		constraint FK_fedbook_orderid references userOrder(orderid),
	proid int--商品表
    constraint FK_fedbook_proid references userOrder(orderid),   
	content clob,
	fdate date,
  obligateone int,--预留字段1
  obligatetwo int--预留字段2
);

create sequence seq_feedback_fid start with 100 increment by 1;

--用户购物车表，主要用来保存用户购买商品时的购物车商品信息
create table cart(
 cid int primary key,
 proid int--商品表外键
     constraint FK_cart_proid references product(proid),
 usid int--用户表外键
     constraint FK_carts_usid references userInfo(usid),
 --listprice number(8,2),--商品价格
 color varchar2(30),
 csize varchar2(30),
 pcolor varchar2(100),
 snumber int,--商品数量
 obligateone int,--预留字段1
 obligatetwo int--预留字段2
);
insert into cart values(seq_cart_cid.nextval,138,120,'灰色','X','../uploadPic/1452755091682608.jpg',2,1,1);
insert into cart values(seq_cart_cid.nextval,138,1001,'灰','X','../uploadPic/1452755091682608.jpg',2,1,1);

create sequence seq_cart_cid start with 100 increment by 1;
select *from cart;
--活动
create table active(
	activeId int primary key,--活动id
	actives date,--开始时间
	activeo date, --结束时间
	activeType varchar2(100),--活动类型
	obligateone int,--预留字段1
	obligatetwo int--预留字段2
);
create sequence seq_active_activeId start with 100 increment by 1;

--活动信息
create table activeInfo(
	activeInfo int primary key,--活动信息id
	activeId int--活动id
		constraint FK_activeInfo_activeId references active(activeId),
	proid int--商品表外键
		constraint FK_activeInfo_proid references product(proid),
	discount int, --折扣
	obligateone int,--预留字段1
	obligatetwo int--预留字段2
	
);
create sequence seq_activeInfo_activeInfo start with 100 increment by 1;

 create table getOrderID(
 	getid int  primary key, 1 ---120  , 2 ----121 
 	orderid int
 );