/*
        UPPER- LOWER- INITCAP-DISTINCT 
        ------------------------------
UPPER ==> Sütunudaki verileri Büyük Harf ile listeler.
Syntax:
-------
select UPPER(Sutun_adi) from tablo_adi;



LOWER ==> Sütunudaki verileri Küçük Harf ile listeler.
Syntax:
-------
select LOWER(Sutun_adi) from tablo_adi;



INITCAP ==> Sütunudaki verileri ilk Harfi Büyük Diger Harfleri Küçük listeler.
Syntax:
-------
select INITCAP(Sutun_adi) from tablo_adi;



DISTINCT ==> Sütunudaki verileri tekrarsız listeler.
Syntax:
-------
select DISTINCT(Sutun_adi) from tablo_adi;

*/



create table ornek
(
isim varchar(20),
soyisim varchar(25)
);

insert into ornek values('Hasan','YAN');
insert into ornek values('Veli','TURK');
insert into ornek values('Ramiz','KARA');
insert into ornek values('Elif','GUL');
insert into ornek values('Hasan','VURAL');


--SORU1: isim sutununu buyuk harflerle listeleyiniz.
select UPPER(isim) from ornek;

select * from ornek;

--SORU2: isim sutununu kucuk harflerle listeleyiniz.
select lower(isim) from ornek;


--SORU3: soyisim sutununu ilk harfi buyuk diger harfleri küçük listeleyiniz.
select initcap (soyisim) from ornek;

--SORU4: isim sutununu buyuk harflerle, soyisim sutununu kucuk harflerle listeleyiniz.
select UPPER(isim), lower(soyisim) from ornek;


--SORU5: isim sutununu tekrarsız listeleyiniz.
select distinct(isim) from ornek;


/*
IS NULL = NULL OLAN VERILERI GETIRIR
IS NOT NULL = NULL OLMAYAN VERILERI GETIRIR.
*/

create table deneme
(
id char(9),
isim varchar(50),
adres varchar(50)
);


insert into deneme values(123456789, 'Ali', 'Istanbul');
insert into deneme values(846256716, 'Veli', 'Ankara');
insert into deneme values(714931862, 'Mine', 'Izmir');
insert into deneme values(562481742, null, 'Ankara');


select * from deneme;


--SORU1: isim sutununda null olan verileri listeleyiniz.
select * from deneme where isim is null;

--SORU2: isim sutununda null olmayan verileri listeleyiniz.
select * from deneme where isim is not null ;

/*========================================= JOIN İSLEMLERİ ===================================================
 
  
    Join islemleri: iki tabloyu birlestirmek için kullanılır.

    3 Cesit Join islemi kullanilabilmektedir.
    
    
    1) LEFT JOIN:  ilk tabloda olan tum verileri listeler.
    2) RIGHT JOIN: ikinci tabloda olan tum verileri listeler.
    3) INNER JOIN: Tablolardaki ortak olan verileri listeler.
    4) FULL JOIN: her iki tablodaki verilerin tamamını listeler 

 	Syntax
    -----------
    SELECT sutun1,sutun2... FROM tablo1_adi    
           
    ....JOIN tablo2_adi 
        
    ON tablo1_adi.ortak_sutun = tablo2_adi.ortak_sutun;

===================================================================================================================*/ 

create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into filmler values (100, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (300, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (400, 'Aile Arasinda', 'Komedi');
insert into filmler values (500, 'GORA', 'Bilim Kurgu');
insert into filmler values (600, 'Organize Isler', 'Komedi');
insert into filmler values (700, 'Babam ve Oglum', 'Dram');


create table aktorler
(
actor_name varchar(30),
film_id int
);

insert into aktorler values ('Ata Demirer', 100);
insert into aktorler values ('Necati Sasmaz', 200);
insert into aktorler values ('Gupse Ozay', 300);
insert into aktorler values ('Engin Gunaydin', 400);
insert into aktorler values ('Cem Yilmaz', 500);
insert into aktorler values ('Yilmaz Erdogan', 800);
insert into aktorler values ('Haluk Bilginer', 900);

select * from filmler;

-- SORU1: Tüm film_name'leri, tüm category'lerini ve bu filmlerde oynayan 
--actor_name'leri listeleyiniz.

select film_name,category,actor_name from filmler
left join aktorler
on filmler.film_id = aktorler.film_id;

-- SORU2: Tüm actor_name'leri ve bu actorlerin oynadıgı film_name'lerini listeleyiniz.

select actor_name,film_name from aktorler
right join filmler
on filmler.film_id = aktorler.film_id;

--second way
select actor_name,film_name from filmler
left join aktorler
on filmler.film_id = aktorler.film_id;


--SORU3: Her iki tabloda film_id'si ortak olan verilerin film_name ve actor_name'lerini listeleyiniz

select film_name,actor_name from filmler
inner join aktorler
on filmler.film_id = aktorler.film_id;


--SORU4: Tüm film_name'leri ve tüm actor_name'leri listeleyiniz
select film_name, actor_name from filmler
full join aktorler
on filmler.film_id = aktorler.film_id;


/*
TRANSACTİON: Verileri silinmeye karşı korur.

Tabloya ekledigimiz verileri silinmeye karşı korumak istiyorsak TRANSACTION işlemi kullanılmalıdır.


Begin: Transaction'ı başlatmak için kullanılır.

Savepoint: Verileri silinmeye karşı save eder.

Rollback: Silinen verileri geri getirir.

Commit: Transaction'ı sonlandırmak için kullanılır.

*/

create table evraklar
(
id int,
onem_derecesi varchar(40),
konusu varchar(100)
);

begin;--transaction islemi basladi

insert into evraklar values(100,'Cok Onemli','Saglik');
insert into evraklar values(101,'Cok Onemli','Maliye');
insert into evraklar values(102,'Cok Onemli','Nufus');
insert into evraklar values (103,'Cok Onemli','Mezuniyet');

savepoint x; -- savepoint cok onemli verileri silinmeye karsi save eder.

insert into evraklar values (104,'Onemsiz','Apartman Makbuzu');
insert into evraklar values (105,'Onemsiz','Su faturasi');

select * from evraklar ;

delete from evraklar;

select * from evraklar;

rollback to x; --silinen cok onemli verileri geri getirir

select * from evraklar;--silinen cok onemli veriler geri gelir.

commit;--sonlarndirma islemi yapmak zorundayiz.












