  create user MoGuJie identified by a
  grant dba to MoGuJie
  --Ģ�������ݿ����
  delete ADMIN;
  delete ADVERTISE;
  delete USERINFO;
  select *from admin;
  --����Ա
  create table admin(
    aid int primary key,--����Աid
    aname varchar2(50) unique not null,--����Ա�ǳ�
    apwd varchar2(20),--����
    aemail varchar(50),--����
    agread int --����Ա�ȼ�
  );
  create sequence seq_admin_aid start with 100 increment by 1;
  --�û���Ϣ��
  create table userInfo(
    usid int primary key,--�û�id
    uspwd varchar2(100),--����
    uname varchar2(20) unique not null,--�û��ǳ�
    uphoto varchar2(100),--�û�ͷ���ַ
    ubirthday date,--�û�����
    usemail varchar2(100),--�����ַ
    ucode varchar2(10),--�û��ʱ�
    usphone varchar2(15), --�û���ϵ��ʽ
    usaccount number(10,2),--�û����
    statue int,--ɾ��ʱ��״̬��־
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  create sequence seq_UserInfo_usid start with 100 increment by 1;
  select *from userInfo
  insert into userInfo values(1001,'123','haha','',to_date('2003-03-10','yyyy-mm-dd'),'523525@qq.com','421002',
  '12123333','1000',1,'','');
  insert into userInfo values(seq_UserInfo_usid.Nextval,'caicai','cc',null,null,'22@qq.com',null,
  '18397770461',0,0,null,null);
  usid=0, uspwd=caicai, uname=cc, uphoto=null, ubirthday=null, usemail=22@qq.com, ucode=null, usphone=18397770461, usaccount=0, statue=0, obligateone=null, obligatetwo=null
  insert into userInfo values(1002,'123','lala','',to_date('2008-07-10','yyyy-mm-dd'),'67253278@qq.com','421002',
  '12123333','1000',1,'','');

  --��ַ��
  create table address(
    addressid int primary key,--id
    province varchar2(40),--ʡ��
    city varchar2(40),--��
    street varchar2(80),--��
    usaddress varchar2(100),--�û���ϸ��ַ
    usid int--�û�id
          constraint FK_address_usid references userInfo(usid),
    adname varchar2(50),--��ʵ����
    adcode int,    --�ʱ�
    adtel varchar2(15),    --�绰     
    statue int,--�Ƿ�ΪĬ�ϵ�ַ
     obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );

  create sequence seq_address_addressid start with 100 increment by 1;
  insert into address values(seq_address_addressid.nextval,'����ʡ','������','������','�⻨·18��',120,'�@',45646,'15674785546',1,1,1);
  insert into address values(seq_address_addressid.nextval,'����ʡ','������','������','�⻨·18��',120,'�˲�',45646,'15674785546',1,'','');
  --��Ʒ������׼�
  create table categoryone(
    categoryidone int primary key,--��Ʒ����Id
    categoryTypeone varchar2(100),--��Ʒ����   
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  create sequence seq_categorys_categoryidone start with 100 increment by 1;
  insert into categoryone values(seq_categorys_categoryidone.nextval,'����',1,0);
  --2������
  create table categorytwo(
    categoryidtwo int primary key,--��Ʒ����Id
    categoryidone int--��Ʒ���ͣ��������
          constraint FK_categorytwo_categoryidone references categoryone(categoryidone), 
    categoryTypetwo varchar2(100),--��Ʒ����   
     obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );

  create sequence seq_categorys_categoryidtwo start with 100 increment by 1;
  insert into categorytwo values(seq_categorys_categoryidtwo.nextval,100,'����',1,0)
  select *from categorytwo
  --3������
  create table categorythree(
    categoryidthree int primary key,--��Ʒ����Id
    categoryidtwo int--��Ʒ���ͣ��������
          constraint FK_categorythree_categoryidtwo references categorytwo(categoryidtwo), 
    categoryTypethree varchar2(100),--��Ʒ����   
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  create sequence seq_categorys_categoryidthree start with 100 increment by 1;
  insert into categorythree values(seq_categorys_categoryidthree.nextval,101,'Բ��',1,0);

  --��Ʒ����Ҫ�����������Ա�ϴ�����Ʒ��Ϣ
  create table product(
     proid int primary key,--��Ʒid
     proname varchar2(100) not null unique,--��Ʒ����
     procontent varchar2(100),--��Ʒ���
     proprice number(8,2),--��Ʒ�۸�
     categoryidthree int--��Ʒ���ͣ��������
          constraint FK_Product_categoryidthree references categorythree(categoryidthree),
     prophoto varchar2(100),--ͼƬ��ַ
     pstatue int,--��Ʒ״̬  �����벻����
     obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  create sequence seq_product_proid start with 100 increment by 1;

  insert into product values(seq_product_proid.nextval,'ë��','������ë��','99.9',101,'',1,'','');

  insert into product values(seq_product_proid.nextval,'ë��','������ë��','99.9',100,'',1,'','');

  --��Ʒ��ϸ��
  create table detail(
      deid int primary key,
    proid int -- ��Ʒ����
          constraint FK_detail_product references product(proid),
    counts int,--������
    psize varchar2(20),--��Ʒ�ߴ�
    pcolor varchar2(100),--��ɫͼƬ��ַ
    color varchar2(20),--��ɫ
    proNumber int,--���
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );

  create sequence seq_detail_deid start with 100 increment by 1;

  --�û���������Ҫ���������û�������Ϣ
  create table userOrder(
   orderid int primary key,--������
   usid int--�û��������֪���û���
       constraint FK_cart_usid references userInfo(usid),
   datetime date,--��������
   ostatus int,--����״̬  0�����ã�1δ���2�Ѹ���
   addressid int
     constraint FK_userOrder_addressid references address(addressid),
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );

  create sequence seq_userOrder_orderid start with 100 increment by 1;
  insert into userOrder values(seq_userOrder_orderid.nextval,260,to_date('2015-03-10','yyyy-mm-dd'),2,181,'','');
  insert into userOrder values(seq_userOrder_orderid.nextval,240,to_date('2015-03-10','yyyy-mm-dd'),1,141,'','');
  insert into userOrder values(seq_userOrder_orderid.nextval,240,to_date('2016-01-10','yyyy-mm-dd'),0,141,'','');

  --�û�������ϸ��
  create table  orderdetail(
   orid int primary key,
   orderid int --������
           constraint FK_orderdetail_orderid references userOrder(orderid) on delete cascade, 
   proid int  --��Ʒ��id
         constraint FK_orderdetail_proid references product(proid),
   deid int --��Ʒ��ϸid
         constraint FK_orderdetail_deid references detail(deid),
   onumber int,--����
   buyprice number(8,2),--�����
   ostatus int,--״̬ �����벻����
   obligateone int,--Ԥ���ֶ�1
   obligatetwo int--Ԥ���ֶ�2  
  ); 
  select *from orderdetail;
  create sequence seq_orderdetail_orid start with 100 increment by 1;
  insert into orderdetail values(seq_orderdetail_orid.nextval,128,102,1,'199.9',1,'','');
  insert into orderdetail values(seq_orderdetail_orid.nextval,128,102,100,1,'199.9',1,'','');
  insert into orderdetail values(seq_orderdetail_orid.nextval,123,100,1,'199.9',1,'','');

  --���λ��
  create table advertise(
    aid int primary key,--���λid
    asize varchar2(100),--ͼƬ�ߴ�
     weizhi varchar2(100),--λ��
     obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  insert into advertise values(1,'100*100','',1,1)
  create sequence seq_advertise_aid start with 100 increment by 1;
  --����
  create table guanggao(
    gid int primary key,--�����
    aid int
        constraint FK_guanggao_aid references advertise(aid),--���λid
    ggrade int,
    gPhoto varchar2(100),--ͼƬ��ַ
    gdates date,--��濪ʼʱ��
    gdateo date,--������ʱ��
      weight int,--Ȩ��
    click int,--�������
    linkaddress varchar2(100),--���ӵ�ַ
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  create sequence seq_guanggao_gid start with 100 increment by 1;
  insert into guanggao values(seq_guanggao_gid.nextval,1,1,'','','',1,1,'',1,1)
  select * from guanggao order by weight desc,gdates desc
  --��һ���
  create table feedback(
    fid int primary key,--�������
    usid int --�û������
      constraint FK_fedbook_usid references userInfo(usid),
    orderid int--���������
      constraint FK_fedbook_orderid references userOrder(orderid),
    proid int--��Ʒ��
      constraint FK_fedbook_proid references userOrder(orderid),   
    content clob,
    fdate date,
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );

  create sequence seq_feedback_fid start with 100 increment by 1;

  --�û����ﳵ����Ҫ���������û�������Ʒʱ�Ĺ��ﳵ��Ʒ��Ϣ
  create table cart(
   cid int primary key,
   proid int--��Ʒ�����
       constraint FK_cart_proid references product(proid),
   usid int--�û������
       constraint FK_carts_usid references userInfo(usid),
   --listprice number(8,2),--��Ʒ�۸�
   color varchar2(30),
   csize varchar2(30),
   pcolor varchar2(100),
   snumber int,--��Ʒ����
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  insert into cart values(seq_cart_cid.nextval,138,120,'��ɫ','X','../uploadPic/1452755091682608.jpg',2,1,1);
  insert into cart values(seq_cart_cid.nextval,138,1001,'��','X','../uploadPic/1452755091682608.jpg',2,1,1);

  create sequence seq_cart_cid start with 100 increment by 1;
  select *from cart;
  --�
  create table active(
    activeId int primary key,--�id
    actives date,--��ʼʱ��
    activeo date, --����ʱ��
    activeType varchar2(100),--�����
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
  );
  create sequence seq_active_activeId start with 100 increment by 1;

  --���Ϣ
  create table activeInfo(
    activeInfo int primary key,--���Ϣid
    activeId int--�id
      constraint FK_activeInfo_activeId references active(activeId),
    proid int--��Ʒ�����
      constraint FK_activeInfo_proid references product(proid),
    discount int, --�ۿ�
    obligateone varchar2(40),--Ԥ���ֶ�1
    obligatetwo varchar2(40)--Ԥ���ֶ�2
    
  );
  create sequence seq_activeInfo_activeInfo start with 100 increment by 1;

   create table getOrderID(
     getid int  primary key, 1 ---120  , 2 ----121 
    orderid int
   );
  commit
