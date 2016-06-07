  create user MoGuJie identified by a
  grant dba to MoGuJie
  --蘑菇街数据库设计
  delete admin;
  delete advertise;
  delete userInfo;
  delete active;
  delete activeinfo;
  delete address;
  delete cart;
  delete categoryone;
  delete categorythree;
  delete categorytwo;
  delete detail;
  delete feedback;
  delete guanggao;
  delete orderdetail;
  delete product;
  delete userorder;
  
  drop table admin;
  drop table advertise;
  drop table userInfo;
  drop table active;
  drop table activeinfo;
  drop table address;
  drop table cart;
  drop table categoryone;
  drop table categorythree;
  drop table categorytwo;
  drop table detail;
  drop table feedback;
  drop table guanggao;
  drop table orderdetail;
  drop table product;
  drop table userorder;
  
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
  select u.uname,u.ubirthday,u.ucode,u.usemail,u.usphone,u.usex,a.province,a.city from userInfo u,address a where u.usid=a.usid and u.uname='liqiu'
  --用户信息表
  create table userInfo(
    usid int primary key,--用户id
    uspwd varchar2(100),--密码
    uname varchar2(20) unique not null,--用户昵称
    usex varchar(2),--性别
    uphoto varchar2(100),--用户头像地址
    ubirthday date,--用户生日
    usemail varchar2(100),--邮箱地址
    ucode varchar2(10),--用户邮编
    usphone varchar2(15), --用户联系方式
    usaccount number(10,2),--用户余额
    statue int,--删除时的状态标志
    obligateone varchar2(40),--预留字段1
    statue int,--删除时的状态标志
    obligateone int,--预留字段1
    obligatetwo varchar2(40)--预留字段2
  );
  drop table userInfo
  create sequence seq_UserInfo_usid start with 100 increment by 1;
  select *from userInfo
  select u.uname,u.ubirthday,u.ucode,u.usemail,u.usphone,a.province,a.city from userInfo u,address a where u.usid=a.usid and u.uname='liqiu'

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
  obligateone varchar(50),--预留字段1
  obligatetwo varchar(50)--预留字段2
);
create sequence seq_UserInfo_usid start with 100 increment by 1;
select * from userInfo
insert into userInfo values(seq_UserInfo_usid.nextval,'123','lala','',to_date('2003-03-10','yyyy-mm-dd'),'523525@qq.com','421002',
'12123333','1000',1,'','');
insert into userInfo values(seq_UserInfo_usid.nextval,'123','haha','',to_date('2008-07-10','yyyy-mm-dd'),'67253278@qq.com','421002',
'12123333','1000',1,'','');

  delete from USERINFO where uname='cc'
  insert into userInfo values(1001,'123','haha','',to_date('2003-03-10','yyyy-mm-dd'),'523525@qq.com','421002',
  '12123333','1000',1,'','');
  insert into userInfo values(seq_UserInfo_usid.Nextval,'caicai','cc',null,null,'22@qq.com',null,
  '18397770461',0,0,null,null);
  usid=0, uspwd=caicai, uname=cc, uphoto=null, ubirthday=null, usemail=22@qq.com, ucode=null, usphone=18397770461, usaccount=0, statue=0, obligateone=null, obligatetwo=null
  insert into userInfo values(1002,'123','lala','',to_date('2008-07-10','yyyy-mm-dd'),'67253278@qq.com','421002',
  '12123333','1000',1,'','');


  select u.uname,u.ubirthday,u.ucode,u.usemail,u.usphone,a.province,a.city from userInfo u,address a where u.usid=a.usid and u.uname='lala'

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
  statue int,--是否为默认地址   		一般设为1, 0表示默认地址
  obligateone varchar(50),--预留字段1
  obliga
  tetwo varchar(50)--预留字段2
);
<<<<<<< HEAD
select * from address
select addressid from address
update address set statue=1 
delete from address
=======
select * from address 
>>>>>>> refs/remotes/origin/master
create sequence seq_address_addressid start with 100 increment by 1;
insert into address values(seq_address_addressid.nextval,'湖南省','衡阳市','珠晖区','衡花路18号',100,'陈烜',45646,'15674785546',1,'','');
insert into address values(seq_address_addressid.nextval,'湖南省','岳阳市','珠晖区','衡花路18号',100,'菜菜',45646,'15674785546',1,'','');
<<<<<<< HEAD


=======
update address set statue=0 where addressid=140
delete from address
>>>>>>> refs/remotes/origin/master
insert into userInfo values(1001,'123','haha','',to_date('2003-03-10','yyyy-mm-dd'),'523525@qq.com','421002',
'12123333','1000',1,'','');
insert into userInfo values(1002,'123','lala','',to_date('2008-07-10','yyyy-mm-dd'),'67253278@qq.com','421002',
'12123333','1000',1,'','');
insert into userInfo values(seq_UserInfo_usid.nextval,'aaa','liqiu','女','',to_date('2008-07-10','yyyy-mm-dd'),'1573454899@qq.com','422302',
'13241425','1000',1,'','');

<<<<<<< HEAD


=======
select *from userInfo;
>>>>>>> refs/remotes/origin/master
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
    adcode int,    --邮编
    adtel varchar2(15),    --电话     
    statue int,--是否为默认地址
     obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
  );
 select * from address;
  create sequence seq_address_addressid start with 100 increment by 1;

  insert into address values(seq_address_addressid.nextval,'湖南省','衡阳市','珠晖区','衡花路18号',120,'陈烜',45646,'15674785546',1,1,1);

  insert into address values(seq_address_addressid.nextval,'湖南省','衡阳市','珠晖区','衡花路18号',1002,'陈烜',45646,'15674785546',1,1,1);
  insert into address values(seq_address_addressid.nextval,'湖南省','岳阳市','珠晖区','衡花路18号',121,'菜菜',45646,'15674785546',1,'','');
  insert into address values(seq_address_addressid.nextval,'湖南省','岳阳市','珠晖区','衡花路18号',120,'菜菜',45646,'15674785546',1,'','');
  --商品分类表首级
  create table categoryone(
    categoryidone int primary key,--商品类型Id
    categoryTypeone varchar2(100),--商品类型   
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
  ); 
  
  select * from categoryone;
  create sequence seq_categorys_categoryidone start with 100 increment by 1;
<<<<<<< HEAD
  insert into categoryone values(seq_categorys_categoryidone.nextval,'上衣','','');
=======
  select * from categoryone;
  insert into categoryone values(seq_categorys_categoryidone.nextval,'上衣',1,0);
  insert into categoryone values(seq_categorys_categoryidone.nextval,'裙子',1,0);
>>>>>>> refs/remotes/origin/master
  --2级分类
  create table categorytwo(
    categoryidtwo int primary key,--商品类型Id
    categoryidone int--商品类型，引用外键
          constraint FK_categorytwo_categoryidone references categoryone(categoryidone), 
    categoryTypetwo varchar2(100),--商品类型   
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
  );
<<<<<<< HEAD
create sequence seq_categorys_categorytwo start with 100 increment by 1;
 insert into  categorytwo values(seq_categorys_categorytwo.nextval,100,'毛衣','','');
  
=======
insert into categorytwo values(11,100,'短袖','','');
select * from categorytwo;
update categorytwo set categoryTypetwo='长袖' where categoryidtwo=11;

select co.categoryTypeone,ct.categoryTypetwo
from categoryone co,categorytwo ct 
where co.categoryidone=ct.categoryidone and ct.categoryidone=100;

select distinct p.proid,p.prophoto,p.procontent,p.proprice,
		d.counts,cone.categoryTypeone,ctwo.categoryTypetwo
		from product p,detail d,categorythree cthree,categorytwo ctwo,categoryone cone 
		where p.proid=d.proid and cthree.categoryidthree=p.categoryidthree 
		and ctwo.categoryidtwo=cthree.categoryidtwo 
		and cone.categoryidone=ctwo.categoryidone and cone.categoryidone=100 and ctwo.categoryTypetwo='短袖';
>>>>>>> refs/remotes/origin/master
 --3级分类
  create table categorythree(
    categoryidthree int primary key,--商品类型Id
    categoryidtwo int--商品类型，引用外键
          constraint FK_categorythree_categoryidtwo references categorytwo(categoryidtwo), 
    categoryTypethree varchar2(100),--商品类型   
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
  );
  create sequence seq_categorys_categoryidthree start with 100 increment by 1;
  insert into categorythree values(seq_categorys_categoryidthree.nextval,100,'圆领','','');
<<<<<<< HEAD
=======
select * from categorythree;
>>>>>>> refs/remotes/origin/master

<<<<<<< HEAD
=======
  select distinct uo.orderid,uo.datetime,uo.ostatus,
  				p.prophoto,p.procontent,p.proprice,
  				d.color,d.psize,
  				od.buyprice,od.onumber 
  				from product p,detail d,userOrder uo,orderdetail od,userInfo u 
  				where p.proid=d.proid and od.proid=p.proid and 
  				od.orderid=uo.orderid and uo.usid=u.usid and u.usid=121 
  				and uo.ostatus between 1 and 3
  insert into product values(seq_product_proid.nextval,'ë��','������ë��','99.9',100,'',1,'','');
>>>>>>> refs/remotes/origin/master

  create sequence seq_categorys_categoryidtwo start with 100 increment by 1;

  insert into categorytwo values(seq_categorys_categoryidtwo.nextval,100,'����',1,0)

  insert into categorytwo values(seq_categorys_categoryidtwo.nextval,100,'短袖',1,0)

  select *from categorytwo

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
     obligateone int, --销售量
    obligatetwo varchar2(40)--预留字段2
  );
  select * from product;
  create sequence seq_product_proid start with 100 increment by 1;
<<<<<<< HEAD
insert into product values(seq_product_proid.nextval,'毛衣','羊羊羊毛衣','99.9',100,'',1,100,'');
=======

  insert into product values(seq_product_proid.nextval,'无袖短袖','韩版无袖小立领花边甜美气质蕾丝上衣女','56.9',100,'../uploadPic/上衣1.jpg',1,25,'');
  
  insert into product values(seq_product_proid.nextval,'短袖','韩版甜美气质上衣女','46.9',100,'../uploadPic/上衣2.jpg',1,25,'');
  insert into product values(seq_product_proid.nextval,'短袖','韩版甜美气质蕾丝上衣女','66.9',100,'../uploadPic/上衣3.jpg',1,25,'');
  insert into product values(seq_product_proid.nextval,'短袖a','韩版上衣女','34',100,'../uploadPic/上衣4.jpg',1,25,'');
   insert into product values(seq_product_proid.nextval,'短袖b','韩版上衣女','65.9',100,'../uploadPic/上衣5.jpg',1,25,'');
   insert into product values(seq_product_proid.nextval,'短袖c','韩版蕾丝上衣女','24.9',100,'../uploadPic/上衣6.jpg',1,25,'');
 
   update product set prophoto='../uploadPic/sy1.jpg' where proid=140;
   update product set prophoto='../uploadPic/sy2.jpg' where proid=141;
   update product set prophoto='../uploadPic/sy3.jpg' where proid=146;
   update product set prophoto='../uploadPic/sy4.jpg' where proid=147;
   update product set prophoto='../uploadPic/sy5.jpg' where proid=149;
   insert into product values(seq_product_proid.nextval,'毛衣','羊羊羊毛衣','99.9',100,'',1,'','');
select * from product;
>>>>>>> refs/remotes/origin/master

select distinct uo.orderid,uo.datetime,uo.ostatus,
						p.prophoto,p.procontent,p.proprice,
						d.color,d.psize,
						od.buyprice,od.onumber 
						from product p,detail d,userOrder uo,orderdetail od,userInfo u 
						where p.proid=d.proid and od.proid=p.proid and od.orderid=uo.orderid 
						and uo.usid=u.usid and u.usid=121 and uo.ostatus=2
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
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
  );

  create sequence seq_detail_deid start with 100 increment by 1;
<<<<<<< HEAD

=======
  insert into detail values(seq_detail_deid.nextval,149,254,'S','','red',1111,'','');
  select * from detail;
insert into product values(seq_product_proid.nextval,'毛衣','羊羊羊毛衣','99.9',101,'',1,'','');
>>>>>>> refs/remotes/origin/master

  insert into product values(seq_product_proid.nextval,'毛衣','羊羊羊毛衣','99.9',100,'',1,'','');




  --用户订单表，主要用来保存用户订单信息
  create table userOrder(
   orderid int primary key,--订单号
   usid int--用户表外键，知道用户名
       constraint FK_cart_usid references userInfo(usid),
   datetime date,--订单日期
   ostatus int,--订单状态  0不可用，1未付款，2已付款
   addressid int
     constraint FK_userOrder_addressid references address(addressid),
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
  );


  create sequence seq_userOrder_orderid start with 100 increment by 1;
  insert into userOrder values(seq_userOrder_orderid.nextval,121,to_date('2015-03-10','yyyy-mm-dd'),2,121,'','');
  insert into userOrder values(seq_userOrder_orderid.nextval,240,to_date('2015-03-10','yyyy-mm-dd'),1,141,'','');
  insert into userOrder values(seq_userOrder_orderid.nextval,240,to_date('2016-01-10','yyyy-mm-dd'),0,141,'','');
  select * from userOrder;
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
  insert into orderdetail values(seq_orderdetail_orid.nextval,100,100,100,123,'199.9',1,'','');
  insert into orderdetail values(seq_orderdetail_orid.nextval,128,102,100,1,'199.9',1,'','');
  insert into orderdetail values(seq_orderdetail_orid.nextval,123,100,1,'199.9',1,'','');

  --广告位表


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
 obligateone varchar(50),--预留字段1
 obligatetwo varchar(50)--预留字段2	
); 
select *from orderdetail;
create sequence seq_orderdetail_orid start with 100 increment by 1;
insert into orderdetail values(seq_orderdetail_orid.nextval,128,102,1,'199.9',1,'','');
insert into orderdetail values(seq_orderdetail_orid.nextval,128,102,100,1,'199.9',1,'','');
insert into orderdetail values(seq_orderdetail_orid.nextval,123,100,1,'199.9',1,'','');


  --广告位表
>>>>>>> refs/remotes/origin/master
  create table advertise(
    aid int primary key,--广告位id
    asize varchar2(100),--图片尺寸
     weizhi varchar2(100),--位置
     obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2

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
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2

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
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
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
 obligateone varchar(40),--预留字段1
 obligatetwo varchar(40)--预留字段2
);
insert into cart values(seq_cart_cid.nextval,102,100,'灰色','X','../uploadPic/1452755091682608.jpg',2,1,1);
insert into cart values(seq_cart_cid.nextval,102,100,'红色','X','',1,1,1);

create sequence seq_cart_cid start with 100 increment by 1;
select *from cart;
  --活动
  create table active(
    activeId int primary key,--活动id
    actives date,--开始时间
    activeo date, --结束时间
    activeType varchar2(100),--活动类型
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
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
    obligateone varchar2(40),--预留字段1
    obligatetwo varchar2(40)--预留字段2
    
  );
  create sequence seq_activeInfo_activeInfo start with 100 increment by 1;

   create table getOrderID(
     getid int  primary key, 1 ---120  , 2 ----121 
    orderid int
   );
  commit
