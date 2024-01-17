use CakeShop;
drop procedure if exists saveDataOrderDetails;
delimiter **
create procedure saveDataOrderDetails(
	in iSelection varchar(30),
	in iOrderDetails_id INTEGER,
    in iOrder_id INTEGER,
    in iProduct_id INTEGER,
    in iDetail_Quantity INTEGER,
    in iDetail_UnitPrice  VARCHAR(20),
    in iDetail_Product_Flavor VARCHAR(255),
    in iDetail_Product_Size VARCHAR(255)
)
begin
	declare orderDetailsExists INTEGER;
    declare idOrderDetails INTEGER;
    declare mjsOut nvarchar(50);
	set orderDetailsExists = (select count(*) from OrderDetails where Order_id = iOrder_id AND Product_id = iProduct_id AND Detail_Product_Flavor = iDetail_Product_Flavor AND Detail_Product_Size = iDetail_Product_Size);
    set idOrderDetails = (select Order_id from OrderDetails where Order_id = iOrder_id AND Product_id = iProduct_id AND Detail_Product_Flavor = iDetail_Product_Flavor AND Detail_Product_Size = iDetail_Product_Size);
    if(iSelection='create')then
		if(orderDetailsExists=0)then
			INSERT INTO OrderDetails( 
				Order_id,
				Product_id ,
    			Detail_Quantity ,
    			Detail_UnitPrice,
                Detail_Product_Flavor,
                Detail_Product_Size) 
			values(
				iOrder_id,
				iProduct_id,
				iDetail_Quantity,
				iDetail_UnitPrice,
                iDetail_Product_Flavor,
                iDetail_Product_Size
			) ;
			set mjsOut = 'registered orderDetails';
			set idOrderDetails = (select Order_id from OrderDetails where Order_id = iOrder_id AND Product_id = iProduct_id AND Detail_Product_Flavor = iDetail_Product_Flavor AND Detail_Product_Size = iDetail_Product_Size);
        else
			set mjsOut = 'no posiible registered orderDetails'; 
        end if;
    else
		set orderDetailsExists = (select count(*) from OrderDetails where Order_id = iOrder_id);
		if(orderDetailsExists!=0)then
			UPDATE OrderDetails set 
				Order_id = iOrder_id,
    			Product_id = iProduct_id ,
    			Detail_Quantity  = iDetail_Quantity,
				Detail_UnitPrice = iDetail_UnitPrice
			where Detail_id = iOrderDetails_id;
			set mjsOut = 'orderDetails info updated';
			set idOrderDetails = (select Order_id from OrderDetails where Order_id = iOrder_id AND Product_id = iProduct_id);
        else
			set mjsOut = 'No possible update orderDetails info'; 
        end if;
    end if;
select idOrderDetails as OrderId, mjsOut as Message;	
end**
delimiter ;
-- call saveDataOrderDetails('create',0,1,1,3,'2.00','Menta','20 personas');
-- call saveDataOrderDetails('update',1, 1, 1, 2, '1');

select * from OrderDetails; 
use CakeShop;
drop procedure if exists searchOrderDetails;
delimiter **
create procedure searchOrderDetails(
	in iSelection varchar(30),
	in iOrder_id INTEGER,
    in iProduct_id INTEGER,
    in iDetail_Product_Flavor VARCHAR(255),
    in iDetail_Product_Size VARCHAR(255)
    )
begin
	declare msjOut varchar(80);
    declare orderDetailsExists int;
    declare idOrderDetails int;
    declare orderIsActive int;
    declare userId int;
    -- declare mail varchar(50);
    declare pass varchar(50);
    set orderDetailsExists = (select count(*) from OrderDetails where Order_id = iOrder_id AND iProduct_id = Product_id AND Detail_Product_Flavor = iDetail_Product_Flavor AND Detail_Product_Size = iDetail_Product_Size);
    set idOrderDetails = (select Detail_id from OrderDetails where Order_id = iOrder_id AND iProduct_id = Product_id AND Detail_Product_Flavor = iDetail_Product_Flavor AND Detail_Product_Size = iDetail_Product_Size);
	if(iSelection = 'delete')then
				if(orderDetailsExists = 1)then
					/*elimnar todos los registros de las demas tablas*/
					delete from OrderDetails where Detail_id=idOrderDetails;
					set msjOut = 'OrderDetails deleted';
					-- select idOrderDetails as UserID , msjOut as Message, mail as Email ;
				else
					set msjOut = 'OrderDetails doesnt exists';
					-- select idper as usuario , msj as mensaje, mail as correo ;
				end if;
				select idOrderDetails as idOrderDetails , msjOut as Message;
	else
		if(iSelection = 'search')then
			if(orderDetailsExists = 1)then							
				set msjOut = 'OrderDetails found';
				select * from OrderDetails where Detail_id=idOrderDetails;
			else
				set msjOut = 'OrderDetails doesnt exists';
				select idOrderDetails as idOrderDetails , msjOut as Message;
			end if;
		else
			if(iSelection = 'searchByOrder')then
            set orderDetailsExists = (select count(*) from OrderDetails where Order_id = iOrder_id);
            set userId = (select User_id from Orders where Order_id = iOrder_id);
            set orderIsActive = (select count(*) from Orders  where User_id = userId AND Order_Status = 'Carrito' AND Order_id = iOrder_id);
				if(orderIsActive != 0)then							
					set msjOut = 'OrderDetails found';
					select * from OrderDetails  where Order_id = iOrder_id;
				else
					set msjOut = 'OrderDetails searchByOrder doesnt exists';
					select idOrderDetails as idOrderDetails , msjOut as Message;
				end if;
			else
				if(iSelection = 'searchAllOrderUser')then
					set orderDetailsExists = (select count(*) from OrderDetails where Order_id = iOrder_id);
					set userId = (select User_id from Orders where Order_id = iOrder_id);
					set orderIsActive = (select count(*) from Orders  where User_id = userId AND Order_id = iOrder_id);
					if(orderIsActive != 0)then							
						set msjOut = 'OrderDetails found';
						select * from OrderDetails  where Order_id = iOrder_id;
					else
						set msjOut = 'OrderDetails searchByOrder doesnt exists';
						select idOrderDetails as idOrderDetails , msjOut as Message;
					end if;
				end if;
			end if;
		end if;
	end if;
end;**
delimiter ;
call searchOrderDetails('searchByOrder',1, 0,'','');

use CakeShop;
drop procedure if exists searchAllOrderDetails;
delimiter **
create procedure searchAllOrderDetails()
begin
	select * from OrderDetails;
end;**
delimiter ;
call searchAllOrderDetails();