create table Menu_Items(
	item_id int not null primary key,
	[Name] varchar(max),
	[Price] decimal(10,2),
	[Active] varchar(3),
	[Date of Launch] date,
	[Category] varchar(max),
	[Free Delivery] varchar(3),
)	
go
drop table menu_Items
drop table cart_Item
create table users(
	user_Id int not null primary key,
	user_name varchar(max),
)
go
create table cart_Item(
	cart_id int not null primary key,
	users_id int,
	item_id int,
	constraint fk_Menuitem_table foreign key (item_id) references Menu_Items(item_id),
	constraint fk_user_table foreign key (users_id) references users(user_Id)
)
go