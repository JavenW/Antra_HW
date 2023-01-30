--1
create view view_product_order_wang as (
    select productID, sum(Quantity) from [Order Details] group by ProductID
)
select * from view_product_order_wang


--2
create PROC sp_product_order_quantity_wang
@productID INT
AS
BEGIN
    declare @result int
    select @result= sum(Quantity) from [Order Details] where ProductID=@productID group by ProductID
    return @result
END


--3
create PROC sp_product_order_city_wang
@productName CHAR(50)
AS
BEGIN
    declare @result int
    select @result= sum(Quantity) from [Order Details] where ProductID=@productID group by ProductID
    return @result
END


--4
BEGIN TRANSACTION;  
create table people_wang(
    id int,
    name char(50),
    city int
);
create table city_wang(
    id int,
    city char(50)
);
INSERT into city_wang VALUES (1, "seattle"),(2, "green bay");
INSERT into people_wang VALUES (1,"Aaron Rodgers", 2),(2, "Russell Wilson", 1),(3, "Jody Nelson",2);
INSERT into city_wang VALUES (3, "Madison");
UPDATE people_wang set city=3 where city=1
create view packers_wang as (
    select name from people_wang where city = 2;
)
select * from packers_wang

ROLLBACK;  

--5
create PROC sp_birthday_employees_city_wang
AS
BEGIN
    CREATE TABLE birthday_employees_wang (
        id int NOT NULL AUTO_INCREMENT,
        employeeID int,
        PRIMARY KEY (ID)
    );
    INSERT INTO birthday_employees_wang VALUES (select employeeID from employees where MONTH(BirthDate)=2);
END


--6
--join two table on the condition of every column should be same, and there should be exactly the same number of rows that one table has.