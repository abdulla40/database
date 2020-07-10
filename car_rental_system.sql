create table tb_client(
client_id int primary key,
client_fname nvarchar(50),
client_lname nvarchar(50),
client_phone int,
client_email nvarchar(50),
client_address nvarchar(50)
);

create table tb_car(
car_id int primary key,
car_model nvarchar(50),
cal_color nvarchar(50),
rental_price int
);

create table tb_booking(
booking_id int primary key,
booking_date date,
booking_duration nvarchar(50),
total_price int,
client_id int foreign key references tb_client(client_id),
car_id int foreign key references tb_car(car_id)
);

insert into tb_client values(1,'magdy','fawzy',01127485678,'magdy@email.com','elray street 4');
insert into tb_client values(2,'Doha','Gamal',01227485678,'doha@email.com','elray street 5');
insert into tb_client values(3,'ahmed','ismail',01527485678,'ahmed@email.com','mandara street 7');
insert into tb_client values(4,'fares','mohamed',01129875678,'fares@email.com','manshia street 8');
insert into tb_client values(5,'ibrahim','elmnofy',01127485558,'ibrahim@email.com','qlen street 4');
insert into tb_client values(6,'youssef','loay',01123385678,'youssef@email.com','sidi gaber street 4');
insert into tb_client values(7,'abdo','yassen',01127485699,'abdo@email.com','smouha street 7');
insert into tb_client values(8,'abdallah','aboshoieka',01127481178,'abdalluh@email.com','negrig street 9');
select*from tb_client;

insert into tb_car values(10,'lada','white',200);
insert into tb_car values(11,'mercedes','black',300);
insert into tb_car values(12,'reno 2f','blue',400);
insert into tb_car values(13,'Audi','navy',500);
insert into tb_car values(14,'porsche','black',2000);
insert into tb_car values(15,'Opel','white',1000);
insert into tb_car values(16,'ladaJaguar','yellow',500);
insert into tb_car values(17,'Skoda','black',700);
select*from tb_car;

insert into tb_booking values(20,'11-9-2020','2 months',3000,1,10);
insert into tb_booking values(21,'2-9-2020','3 months',3500,2,11);
insert into tb_booking values(22,'9-9-2020','1 months',4000,3,12);
insert into tb_booking values(23,'10-9-2020','2 weeks',6000,4,13);
insert into tb_booking values(24,'11-7-2020','1 months',2000,5,14);
insert into tb_booking values(25,'12-11-2020','3 weeks',4000,6,15);
select*from tb_booking;


--1-what is the usage of ASCII function?
SELECT ASCII(client_fname) AS NumCodeOfFirstChar
FROM tb_client;
--2-how to use CHAR function?
SELECT CHAR(75) AS CodeToCharacter;
--3-how to use CHARINDEX function?
SELECT CHARINDEX('d', 'Abdalluh') AS MatchPosition;
--4-how to use CONCAT function?
SELECT CONCAT('fares', '.com');
--5-how to use DATALENGTH function?
SELECT DATALENGTH('Doha');
--6-how to know the difference between two words?
SELECT DIFFERENCE('skoda', 'lada');
--7-how to use LEFT function?
SELECT LEFT('ibrahim', 3) AS ExtractString;
--8-how to use LEN function?
SELECT LEN('mercedes');
--9-how to use LOWER function?
SELECT LOWER('Gamal');
--10-how to use NCHAR function?
SELECT NCHAR(65) AS NumberCodeToUnicode;
--11-how to use PATINDEX function?
SELECT PATINDEX('aly', 'Mohamed');
--12-how to use REPLACE function?
SELECT REPLACE('Opel', 'e', 'w');
--13-how to use REVERSE function?
SELECT REVERSE('Abo shoieka');
--14-how to use RIGHT function?
SELECT RIGHT('yassen', 3) AS ExtractString;
--15-how to use RTRIM function?
SELECT RTRIM('lada   ') AS RightTrimmedString;
--16-how to use STR function?
SELECT STR(65);
--17-how to use SUBSTRING function?
SELECT SUBSTRING('Mohamed', 1, 3) AS ExtractString;
--18-how to use UNICODE function?
SELECT UNICODE('ismail');
--19-how to use UPPER function?
SELECT UPPER('mandara street 4');
--20-how to use SOUNDEX function?
SELECT SOUNDEX('moatasem'), SOUNDEX('nada');

--sub query
SELECT client_fname FROM tb_client WHERE client_id in (SELECT client_id FROM tb_car WHERE car_id >13)
SELECT car_model FROM tb_car WHERE car_id in (SELECT car_id FROM tb_client WHERE client_id >2)
SELECT client_address FROM tb_client WHERE client_id in (SELECT client_id FROM tb_car WHERE car_id >14)


--different join

 SELECT  car_model, client_lname
   FROM tb_car
   INNER JOIN tb_client
   ON tb_car.car_id = tb_client.client_id;

SELECT client_email, car_id
   FROM tb_client
   LEFT JOIN tb_car
   ON tb_client.client_id = tb_car.car_id;

SELECT client_phone, total_price
  FROM tb_client
  RIGHT JOIN tb_booking
  ON tb_client.client_id = tb_booking.booking_id;

SELECT client_phone, booking_id
  FROM tb_client
  FULL JOIN tb_booking
  ON tb_client.client_id = tb_booking.booking_id;


SELECT client_fname,booking_date
  FROM tb_client,tb_booking
  WHERE tb_client.client_id=tb_booking.booking_id

--count and group

--what the number of clients ?
SELECT COUNT(client_id)
  FROM tb_client
--what is the number of cars ?
SELECT COUNT(car_id)
  FROM tb_car
--Group
SELECT COUNT(client_id), client_email 
  FROM tb_client
 GROUP BY client_email

--update

UPDATE tb_car
set car_model='skoda' where car_id=1
UPDATE tb_client
set client_fname='noha' where client_id=3
UPDATE tb_booking
set total_price=6000 where booking_id=24
UPDATE tb_client
set client_lname='nader' where client_id=5
UPDATE tb_car
set cal_color='green' where car_id=12
select*from tb_booking;
select*from tb_car;
select*from tb_client;

--delete

DELETE from tb_client where client_id=7
DELETE from tb_car where car_id=16
DELETE from tb_booking where booking_id =25
DELETE from tb_client where client_fname='ahmed'
DELETE from tb_car where car_id=8
select*from tb_booking;
select*from tb_car;
select*from tb_client;