create table store_cust
(
 cust_id varchar2(6),
 first_name varchar2(20) not null,
 last_name varchar2(20) not null,
 card_num varchar2(16),
 exp_date varchar2(4),
 card_type varchar2(20),
 primary key(cust_id)
);

create table freq_cust
(cust_id varchar2 (6),
 first_name varchar2(20) not null,
 last_name varchar2(20) not null,
 card_num varchar2(16) not null,
 exp_date varchar2(4) not null,
 card_type varchar2(20) not null,
 address varchar(40),
 city varchar(20),
 state varchar2(20),
 zip varchar2 (5),
 status varchar2 (10) check (status in ('Silver', 'Gold', 'Platinum')),
 email varchar(40) not null,
 pass varchar2(12),
 username varchar2(10), 
 primary key(cust_id),
 foreign key(cust_id) references store_cust on delete cascade);

create table store
(store_id varchar2 (3),
 address varchar2(225),
 city varchar2(30),
 state varchar2(30),
 zip varchar2(5),
 phone varchar2 (10),
 primary key(store_id));

create table product
(upc varchar (12),
 product_name varchar(20),
 weight number(10),
 primary key(upc) 
);

create table cust_trans
( store_id varchar2(3),
  cust_id varchar2(6),
  upc varchar2 (12),
  date_trans date,
  amt_paid numeric (12,2),
  quantity number (10),
  primary key(store_id, cust_id, upc, date_trans),
  foreign key (upc, store_id) references store_inv,
  foreign key (cust_id) references store_cust
);

create table hike
(
 upc varchar (12),
 product_name varchar(40) not null,
 p_type varchar2 (20),
 weight number(10,2),
 description varchar2(300),
 primary key(upc), 
 foreign key(upc) references product on delete cascade
);

create table climb
(
 upc varchar (12),
 product_name varchar(40) not null,
 p_type varchar2 (20),
 weight number(10,2),
 description varchar2(300),
 primary key(upc), 
 foreign key(upc) references product on delete cascade on update cascade
);

create table kayak
(
 upc varchar (12),
 product_name varchar(40) not null,
 p_type varchar2 (20),
 weight number(10,2),
 description varchar2(300),
 primary key (upc), 
 foreign key(upc) references product on delete cascade
);

create table cycle
(
 upc varchar (12),
 product_name varchar(40) not null,
 p_type varchar2 (20),
 weight number(10,2),
 description varchar2(300),
 primary key (upc), 
 foreign key(upc) references product on delete cascade
);

create table camp
(
 upc varchar (12),
 product_name varchar(40) not null,
 p_type varchar2 (20),
 weight number(10,2),
 description varchar2(300),
 primary key (upc), 
 foreign key(upc) references product on delete cascade
);

create table makes
( upc varchar(12),
  brand_name varchar(20),
  primary key (upc, brand_name),
  foreign key (upc) references product,
  foreign key (brand_name) references brand
 );

create table brand
( brand_name varchar(20),
  primary key (brand_name)
);

create table vendor
(vendor_id varchar2 (3),
 vendor_name varchar2 (20),
 address varchar2(40),
 city varchar2(30),
 state varchar2(30),
 zip varchar2 (5),
 phone varchar2 (10),
 primary key(vendor_id));

create table vendor_inv
(vendor_id varchar2 (3),
 upc varchar2 (12),
 sale_price numeric (12,2),
 quantity number(10),
 primary key (vendor_id),
 foreign key (upc) references product,
 foreign key (vendor_id) references vendor
 );

create table store_inv
(store_id varchar2(3),
 upc varchar2(12),
 sale_price numeric (12,2),
 quantity number (10),
 primary key (upc, store_id),
 foreign key (upc) references product,
 foreign key (store_id) references store
);

drop table vend_tran;
create table vend_tran
( vendor_id varchar2 (3),
  store_id varchar2 (3),
  upc varchar2 (12),
  date_trans date,
  amt_paid numeric (12,2),
  quantity number (10),
  primary key(vendor_id, store_id, upc, date_trans),
  foreign key (vendor_id, upc) references vendor_inv,
  foreign key (vendor_id) references vendor,
  foreign key (store_id) references store 
);














