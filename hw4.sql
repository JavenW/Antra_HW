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
