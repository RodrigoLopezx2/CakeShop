use CakeShop;
drop procedure if exists saveDataUser;
delimiter **
create procedure saveDataUser(
	in iSelection varchar(30),
	in iName varchar(30),
	in iLastName VARCHAR(30),
	in iAge INTEGER,
	in iEmail varchar(60),
	in iPassword varchar(30),
	in iPhone VARCHAR(10),
	in iUriImage varchar(20),
    in iDirection varchar(200)
)
begin
	declare userExists INTEGER;
    declare idUser INTEGER;
    declare mjsOut nvarchar(50);
	set userExists = (select count(*) from Users where User_Email = iEmail);
    set idUser = (select User_id from Users where  User_Email = iEmail);
    if(iSelection='create')then
		if(userExists=0)then
			INSERT INTO Users(User_Name,User_LastName,User_Age,User_Email,User_Password,User_Phone,User_UriImage,User_Direction) 
			values(
				iName,
				iLastName,
				iAge ,
				iEmail ,
				iPassword ,
				iPhone ,
				iUriImage,
                iDirection
			) ;
			set mjsOut = 'registered user';
			set idUser = (select User_id from Users where  User_Email = iEmail);
        else
			set mjsOut = 'no posiible registered user'; 
        end if;
    else
		if(userExists!=0)then
			UPDATE Users set 
				User_Name = iName,
				User_LastName = iLastName,
				User_Age = iAge,
				User_Email = iEmail,
				User_Password = iPassword,
				User_Phone=iPhone,
				User_UriImage=iUriImage,
                User_Direction=iDirection
			WHERE User_id = idUser;
			set mjsOut = 'User info updated';
			set idUser = (select User_id from Users where  User_Email = iEmail);
        else
			set mjsOut = 'No possible update User info'; 
        end if;
    end if;
select idUser as UserId, mjsOut as Message;	
end**
delimiter ;
call saveDataUser("create","Rodrigo", "Lopez", "22", "rodrigo@gmail.com", "1234","5534151058","src/images",'CMDX/Iztapalapa/Col hangares/calle 3/3/4/Entre calles 3 y 4');
call saveDataUser("create","Rodrigo", "Lopez", "22", "admin@gmail.com", "1234","5534151058","src/images",'CMDX/Iztapalapa/Col hangares/calle 3/3/4/Entre calles 3 y 4');
-- call saveDataUser("update","Mau", "Garcia", "22", "juan@gmail.com", "1234","5534151058","src/images");
select * from Users;

drop procedure if exists searchUser;
delimiter **
create procedure searchUser(
	in iSeletion varchar(30),
    in iEmail varchar(100),
    in iPassword nvarchar(100))
begin
	declare msjOut varchar(80);
    declare userExists int;
    declare idUser int;
    -- declare mail varchar(50);
    declare pass varchar(50);
    set userExists = (select count(*) from Users where User_Email = iEmail);
    set idUser = (select User_id from Users where  User_Email = iEmail);
	if(iSeletion = 'login')then
			if(userExists = 1)then 		
					set pass = (select User_Password from Users where User_Email = iEmail);
					if(pass = iPassword)then
						set msjOut = 'login true';
						-- select idUser as UserId , msjOut as Message, mail as Email , pass as Password;
					else
						set msjOut = 'login false';
						-- select idper as usuario , msjOut as Message, mail as correo , pass as contra;
					end if;
			else
					set msjOut = 'Email doesnt exists';
					-- select idper as usuario , msj as mensaje, mail as correo  , pass as contra;
			end if;
            select idUser as UserId , msjOut as Message, iEmail as Email , pass as password;
        else 
			if(iSeletion = 'delete')then
						if(userExists = 1)then
							/*elimnar todos los registros de las demas tablas*/
							delete from Users where User_id=idUser;
							set msjOut = 'User deleted';
							-- select idUser as UserID , msjOut as Message, mail as Email ;
						else
							set msjOut = 'Email doesnt exists';
							-- select idper as usuario , msj as mensaje, mail as correo ;
						end if;
                        select idUser as UserId , msjOut as Message, iEmail as Email ;
                else
					if(iSeletion = 'search')then
						if(userExists = 1)then							
                            set msjOut = 'User found';
                            select * from Users where User_id=idUser;
						else
							set msjOut = 'Email doesnt exists';
							select idUser as UserId , msjOut as Message, iEmail as Email ;
						end if;
					else
						if(iSeletion = 'searchLastProducts')then
							SELECT Products.*
							FROM Users
							INNER JOIN Orders ON Users.User_id = Orders.User_id
							INNER JOIN OrderDetails ON Orders.Order_id = OrderDetails.Order_id
							INNER JOIN Products ON OrderDetails.Product_id = Products.Product_id
							WHERE Users.User_id = idUser
                            LIMIT 3;
						end if;
                    end if;
			end if;
	end if;
end;**
delimiter ;
call searchUser('searchLastProducts','mau@gmail.com','');
select * from Users; 