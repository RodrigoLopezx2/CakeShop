use CakeShop;
drop procedure if exists saveDataOrder;
delimiter **
create procedure saveDataOrder(
	in iSelection varchar(30),
    in iOrderId INTEGER,
	in iUserId VARCHAR(100),
    in iDate VARCHAR(255),
    in iStatus  VARCHAR(20),
    in iPayment VARCHAR(250),
    in iDirection VARCHAR(250)
)
begin
	declare orderExists INTEGER;
    declare idOrder INTEGER;
    declare mjsOut nvarchar(50);
	set orderExists = (select count(*) from Orders where Order_Status = iStatus);
    -- set idOrder = (select Order_id from Orders where User_id = iUserId AND Order_Date = iDate AND Order_Status = iStatus);
    if(iSelection='create')then
		if(orderExists=0)then
			INSERT INTO Orders( 
				User_id ,
    			Order_Date ,
    			Order_Status,
                Order_Payment,
                Order_Direction
			) 
			values(
				iUserId,
				iDate,
				iStatus,
                iPayment,
                iDirection
			);
			set mjsOut = 'registered order';
			-- set idOrder = (select Order_id from Orders where User_id = iUserId AND Order_Date = iDate AND Order_Status = iStatus);
        else
			set mjsOut = 'no posiible registered product'; 
        end if;
    else
		set orderExists = (select count(*) from Orders where Order_id = iOrderId);
		if(orderExists!=0)then
			UPDATE Orders set 
				User_id = iUserId,
    			Order_Date = iDate ,
    			Order_Status  = iStatus,
                Order_Payment = iPayment,
                Order_Direction = iDirection
			where Order_id = iOrderId;
            if(iStatus = 'En camino')then
				DROP TABLE IF EXISTS numeros;
					CREATE TABLE numeros (id INTEGER PRIMARY KEY not null auto_increment,numero INTEGER,id_Product INTEGER);
					INSERT INTO numeros (numero, id_Product)
					SELECT
						SUM(Detail_Quantity) AS TotalQuantity,
						Product_id
					FROM OrderDetails
					WHERE Order_id = iOrderId
					GROUP BY Product_id;
					UPDATE Products
					JOIN numeros ON Products.Product_id = numeros.id_Product
					SET Products.Product_Stock = Products.Product_Stock - numeros.numero;
					DROP TABLE IF EXISTS numeros;
            end if;
			set mjsOut = 'Order info updated';
			-- set idOrder = (select Order_id from Orders where User_id = iUserId AND Order_Date = iDate AND Order_Status = iStatus);
        else
			set mjsOut = 'No possible update order info'; 
        end if;
    end if;
select mjsOut as Message;	
end**
delimiter ;
-- call saveDataOrder('update',2, 1, '2024-01-08', 'Comprado');
-- Agregar direccion a la orden
-- Agregar metodo de pago



-- DROP TABLE IF EXISTS numeros;
-- CREATE TABLE numeros (id INTEGER PRIMARY KEY not null auto_increment,numero INTEGER,id_Product INTEGER);
-- INSERT INTO numeros (numero, id_Product)
-- SELECT
--     SUM(Detail_Quantity) AS TotalQuantity,
--     Product_id
-- FROM OrderDetails
-- WHERE Order_id = 1
-- GROUP BY Product_id;
-- UPDATE Products
-- JOIN numeros ON Products.Product_id = numeros.id_Product
-- SET Products.Product_Stock = Products.Product_Stock - numeros.numero;
-- DROP TABLE IF EXISTS numeros;

select * from Orders;
use CakeShop;
drop procedure if exists searchOrder;
delimiter **
create procedure searchOrder(
	in iSelection varchar(30),
	in iUserId INTEGER,
    in iDate VARCHAR(255),
    in iStatus  VARCHAR(20))
begin
	declare msjOut varchar(80);
    declare orderExists int;
    declare idOrder int;
    -- declare mail varchar(50);
    declare pass varchar(50);
    set orderExists = (select count(*) from Orders where User_id = iUserId AND Order_Date = iDate AND Order_Status = iStatus);
    set idOrder = (select Order_id from Orders where User_id = iUserId AND Order_Date = iDate AND Order_Status = iStatus);
	if(iSelection = 'delete')then
				if(orderExists = 1)then
					/*elimnar todos los registros de las demas tablas*/
					delete from Orders where Order_id=idOrder;
					set msjOut = 'Order deleted';
					-- select idOrder as UserID , msjOut as Message, mail as Email ;
				else
					set msjOut = 'Order doesnt exists';
					-- select idper as usuario , msj as mensaje, mail as correo ;
				end if;
				select idOrder as Order_id , msjOut as Message;
	else
		if(iSelection = 'search')then
			if(orderExists = 1)then							
				set msjOut = 'Order found';
				select * from Orders where Order_id=idOrder;
			else
				set msjOut = 'Order doesnt exists';
				select idOrder as Order_id , msjOut as Message;
			end if;
		else 
			if(iSelection = 'find-Actives')then
				set orderExists = (select count(*) from Orders where User_id = iUserId AND Order_Status = 'Carrito');
				if(orderExists != 0)then
					select * from Orders  where User_id = iUserId AND Order_Status = 'Carrito';
				else
					set msjOut = 'Orders actives doesnt exists';
                    select orderExists as orderExists , msjOut as Message;
				end if;
			else 
				if(iSelection = 'active')then
					set orderExists = (select count(*) from Orders where User_id = iUserId AND Order_Status = 'Carrito');
					if(orderExists != 0)then
						set msjOut = 'Orders actives';
					else
						set msjOut = 'Order doesnt exists';
					end if;
					select orderExists as orderExists , msjOut as Message;
				else
					if(iSelection = 'purchases')then
					set orderExists = (select count(*) from Orders where User_id = iUserId);
						if(orderExists != 0)then
							select * from Orders where User_id = iUserId AND Order_Status NOT LIKE 'Carrito'; 
						else
							set msjOut = 'No orders found';
							select orderExists as orderExists , msjOut as Message;
                        end if;
					end if;
				end if;
            end if;
		end if;
	end if;
end;**
delimiter ;
 -- call searchOrder('purchases',1, '2024-01-08', 'Comprado');
-- select User_id from Orders where Order_id = 1;
-- use CakeShop;
-- select * from Orders;

use CakeShop;
drop procedure if exists searchAllOrders;
delimiter **
create procedure searchAllOrders()
begin
	select * from Orders;
end;**
delimiter ;
call searchAllOrders();