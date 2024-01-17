use CakeShop;
drop procedure if exists saveDataProduct;
delimiter **
create procedure saveDataProduct(
	in iSelection varchar(30),
    in iProductId INTEGER,
	in iName VARCHAR(100),
    in iDescription VARCHAR(255),
    in iFlavors VARCHAR(255),
    in iSize VARCHAR(255),
    in iPrice  VARCHAR(20),
    in iStock VARCHAR(255),
    in iUriImage VARCHAR(200)
)
begin
	declare productExists INTEGER;
    declare idProduct INTEGER;
    declare mjsOut nvarchar(50);
	set productExists = (select count(*) from Products where Product_Name = iName AND Product_Description = iDescription);
    set idProduct = (select Product_id from Products where Product_Name = iName AND Product_Description = iDescription AND Product_Price = iPrice AND Product_Stock = iStock AND Product_UriImage = iUriImage);
    if(iSelection='create')then
		if(productExists=0)then
			INSERT INTO Products( 
				Product_Name ,
    			Product_Description ,
                Product_Flavors,
                Product_Size,
    			Product_Price  ,
    			Product_Stock ,
    			Product_UriImage ) 
			values(
				iName,
				iDescription,
                iFlavors,
                iSize,
				iPrice,
				iStock,
				iUriImage
			) ;
			set mjsOut = 'registered product';
			set idProduct = (select Product_id from Products where Product_Name = iName AND Product_Description = iDescription AND Product_Price = iPrice AND Product_Stock = iStock AND Product_UriImage = iUriImage);
        else
			set mjsOut = 'no posiible registered product'; 
        end if;
    else
		set productExists = (select count(*) from Products where Product_id = iProductId);
		if(productExists!=0)then
			UPDATE Products set 
				Product_Name = iName,
    			Product_Description = iDescription ,
                Product_Flavors = iFlavors,
                Product_Size = iSize,
    			Product_Price  = iPrice,
    			Product_Stock = iStock,
    			Product_UriImage  = iUriImage
			where Product_id = iProductId;
			set mjsOut = 'Product info updated';
			set idProduct = (select Product_id from Products where Product_Name = iName AND Product_Description = iDescription AND Product_Price = iPrice AND Product_Stock = iStock AND Product_UriImage = iUriImage);
        else
			set mjsOut = 'No possible update product info'; 
        end if;
    end if;
select idProduct as ProductId, mjsOut as Message;	
end**
delimiter ;
call saveDataProduct('create',1,'Pan De molde','El pan de molde es un tipo de pan rectangular y uniforme, caracterizado por su miga suave y textura tierna. ','Blanco/integral/Centeno','Grande/Pequeno','100.00','100','images/image1.jpg');
call saveDataProduct('create',2,'Panecillos','Los panecillos son pequeños panes redondos o de forma similar, generalmente suaves y tiernos en textura.','Panecillos para hamburguesas/hot dog/bollos suizos','16-12 personas/10-8 personas','250.00','100','images/image1.jpg');
call saveDataProduct('create',3,'Galletas','Las galletas son pequeños productos horneados, planos y crujientes, que pueden tener diversas formas, texturas y sabores.','Mantequilla/Avena/Menta','16-12 personas/10-8 personas','300.00','100','images/image1.jpg');

-- call saveDataUser('update','Mau', 'Garcia', '22', 'juan@gmail.com', '1234','5534151058','src/images');
select * from Products;
use CakeShop;
drop procedure if exists searchProduct;
delimiter **
create procedure searchProduct(
	in iSelection varchar(30),
	in iName VARCHAR(100),
    in iDescription VARCHAR(255),
    in iPrice  VARCHAR(20),
    in iStock VARCHAR(255),
    in iUriImage VARCHAR(200),
    in iProductId INTEGER)
begin
	declare msjOut varchar(80);
    declare productExists int;
    declare idProduct int;
    declare idDetailOrder int;
    -- declare mail varchar(50);
    declare pass varchar(50);
    set productExists = (select count(*) from Products where Product_Name = iName AND Product_Description = iDescription);
    set idProduct = (select Product_id from Products where Product_Name = iName AND Product_Description = iDescription AND Product_Price = iPrice AND Product_Stock = iStock AND Product_UriImage = iUriImage);
	if(iSelection = 'delete')then
				if(productExists = 1)then
					/*elimnar todos los registros de las demas tablas*/
                    set idDetailOrder = (select Detail_id from OrderDetails where Product_id = iProductId);
                    delete from OrderDetails where Detail_id = idDetailOrder;
					delete from Products where Product_id = iProductId;
					set msjOut = 'Product deleted';
                    set idProduct = idDetailOrder;
					-- select idProduct as UserID , msjOut as Message, mail as Email ;
				else
					set msjOut = 'Product doesnt exists';
					-- select idper as usuario , msj as mensaje, mail as correo ;
				end if;
				select idProduct as Product_id , msjOut as Message;
	else
		if(iSelection = 'search')then
			if(productExists = 1)then							
				set msjOut = 'Product found';
				select * from Products where Product_id=idProduct;
			else
				set msjOut = 'Product doesnt exists';
				select idProduct as Product_id , msjOut as Message;
			end if;
		else
			if(iSelection = 'searchById')then
				set productExists = (select count(*) from Products where Product_id = iProductId);
				if(productExists != 0)then							
					select * from Products where Product_id=iProductId;
				else
					set msjOut = 'Product doesnt exists';
					select idProduct as Product_id , msjOut as Message;
				end if;
			end if;
		end if;
	end if;
end;**
delimiter ;
-- call searchProduct('delete','Cheesecake','Cheesecake zarsamora','120.00','30','images/image1.jpg',3);
use CakeShop;
-- select Detail_id from OrderDetails where Product_id = 3;
-- delete from OrderDetails where Detail_id=2;
-- delete from Products where Product_id=2;
-- select * from Products;


use CakeShop;
drop procedure if exists searchAllProduct;
delimiter **
create procedure searchAllProduct()
begin
	select * from Products;
end;**
delimiter ;
call searchAllProduct();