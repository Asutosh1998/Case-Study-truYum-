--1.A)Query to insert into Menu_Items

insert into Menu_Items values('1','Sandwich',99.00,'Yes','2017/03/15','MainCourse','Yes')
insert into Menu_Items values('2','Burger',129.00,'Yes','2017/12/23','MainCourse','No')
insert into Menu_Items values('3','Pizza',149.00,'Yes','2017/08/21','MainCourse','No')
insert into Menu_Items values('4','French Fries',57.00,'No','2017/07/02','Starter','Yes')
insert into Menu_Items values('5','Chocolate Brownie',32.00,'Yes','2022/11/02','Dessert','Yes')
go

--1.B)Query to get all Menu Items

SELECT [Name]
      ,'Rs.'+convert(varchar,[Price]) AS Price
      ,[Active]
      ,Convert(varchar,[Date of Launch],103) as [Date of Launch]
      ,[Category]
      ,[Free Delivery]
  FROM [Students].[dbo].[Menu_Items]
--2.A)Query to get all menu items after launch date and is active

SELECT [Name]
      ,'Rs.'+convert(varchar,[Price]) AS Price
      ,[Active]
      ,Convert(varchar,[Date of Launch],103) as [Date of Launch]
      ,[Category]
      ,[Free Delivery]
  FROM [Students].[dbo].[Menu_Items]
  where [Date of Launch]< GETDATE() and Active='Yes'
  go
--3.A)Query to get all menu items based on Menu Item Id

SELECT [Name]
      ,'Rs.'+convert(varchar,[Price]) AS Price
      ,[Active]
      ,Convert(varchar,[Date of Launch],103) as [Date of Launch]
      ,[Category]
      ,[Free Delivery]
  FROM [Students].[dbo].[Menu_Items]
  where Id=2
  go
--3.B)Query to update all the column values based on menu_Item Id

update Menu_Items
set [Name]='KFC',
	[Price]=299,
	[Active]='No',
	[Date of Launch]='2019/05/12',
	Category='Starter',
	[Free Delivery]='No'
	where item_id=5
	go

--4.A.1)Query to Insert into Users table

insert into users values('1','Asutosh')
insert into users values('2','Anmol'),
insert into users values('3','Varun'),
insert into users values('4','Ajay')
go
--4.A2)Quert to Insert into Cart Table

insert into cart_Item values('1','1','1'),
insert into cart_Item values('2','1','2'),
insert into cart_Item values('3','1','3'),
insert into cart_Item values('4','1','5'),
insert into cart_Item values('5','2','3'),
insert into cart_Item values('6','2','5')
go
select * from cart_Item
--5.A)Query to get all menu items in a particular user’s cart

select m.Name, m.Active,'Rs.'+convert(varchar,m.Price)as Price,m.Category,u.user_name as UserName,c.users_id as UserId
from Menu_Items m inner join cart_Item c
on c.item_id=m.item_id 
inner join users u on 
u.user_Id=c.users_id
where c.users_id='1'
go
--5.B)Query to get the total price of all menu items in a particular user’s cart

select 'Rs.'+convert(varchar,sum(m.Price)) as TotalPrice,u.user_Id as UserId,u.user_name as UserName
from Menu_Items m inner join cart_Item c
on c.item_id=m.item_id 
inner join users u on 
u.user_Id=c.users_id
where u.user_Id=2
group by u.user_Id,u.user_name
go

--6)Query to Remove a menu items from Cart based on user id and menu item_Id

delete cart_Item where users_id=3 and item_id=1
go












