/*----------------------------FOREIGN KEY---------------------------------------------------

	FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. 
	Böylelikle, tablolar arasında parent - child ilişkisi oluşur.
	
	FOREIGN KEY'in bulundugu tablo Child tablodur.
	PRIMARY KEY'in bulundugu tablo ise Parent tablodur.

	FOREIGN KEY KISITLAMASI SAYESİNDE:
	---------------------------------
	
	1-) parent tabloda olmayan primary key ile, child tabloya veri girişi yapılamaz.
	(child tablo null deger kabul eder)

	2-) child tablodaki veri silinmeden, parent tablodaki veri silinemez

	3-) child tablo silinmeden, parent tablo silinemez
----------------------------------------------------------------------------------------------*/


create table hastaneler
(
hastane_adi varchar(30) PRIMARY KEY,
adres varchar(30),
alan_kodu int
);
insert into hastaneler values('Meddem', 'Isparta', '0246');
insert into hastaneler values('Sifa', 'Ankara', '0236');
insert into hastaneler values('Davraz', 'Istanbul', '0216');
insert into hastaneler values('Deva', 'Antalya', '0242');


create table doktorlar
(
gorev_yeri varchar(30),
doktor_adi varchar(30),
diploma_no int,
brans_adı varchar(30),
	
	CONSTRAINT fk FOREIGN KEY(gorev_yeri) REFERENCES hastaneler(hastane_adi)
);	
insert into doktorlar values('Meddem', 'Hasan Bal', '123456', 'psikiyatri');
insert into doktorlar values('Sifa', 'Vedat Sen', '123865', 'pediatri');
insert into doktorlar values('Davraz', 'Huseyin Oz', '123568', 'noroloji');
insert into doktorlar values('Deva', 'Ahmet Kar', '123852', 'dahiliye');
insert into doktorlar values('Meddem', 'Hakan Kar', '123369', 'dermatoloji');
insert into doktorlar values('Sifa', 'Ramiz Kara', '123147', 'anestezi');
insert into doktorlar values('Davraz', 'Okan Pul', '123147', 'ortopedi');


select * from doktorlar;


--SORU 1: doktorlar tablosuna gorev_yeri 'Meddem' olan veri girişi yapınız
insert into doktorlar values ('Meddem','Esma',654123,'noroloji');

--SORU 2: .doktorlar tablosuna gorev_yeri 'Okmeydanı' olan veri girişi yapınız.
--parent tabloda olmayan primary key ile child tabloya veri girisi yapilmaz.
insert into doktorlar values ('Okmeydani','omer',987456,'dahiliye');

--SORU 3: doktorlar tablosuna gorev_yeri null olan veri girişi yapınız
insert into doktorlar values (null,'burak boru',564896,'dahiliye');
--child tablo null deger kabul eder.
select * from doktorlar;


--SORU 4: .hastaneler tablosundaki hastane_adi 'Meddem' olan veriyi siliniz. 
--child tablodaki veri silinmeden parent tablodaki veri silinemez.

--SORU 5: doktorlar tablosundaki gorev_yeri 'Meddem' olan verileri siliniz
delete from doktorlar where gorev_yeri = 'Meddem';

--SORU 6: .hastaneler tablosundaki hastane_adi 'Meddem' olan veriyi siliniz. 
delete from hastaneler where hastane_adi='Meddem';

--SORU 7: .hastaneler tablosunu siliniz.
--direk parent tablo silinmez. child tablo silinmeden parent tablo silinemez.
--drop table hastaneler;

--SORU 8: doktorlar tablosunu siliniz
drop table doktorlar;

--SORU 9: .hastaneler tablosunu siliniz.
drop table hastaneler;




/*--------------------ON DELETE CASCADE---------------------------------------------


ON DELETE CASCADE komutu sayesinde;

 
Direk parent tablodaki veriyi silebiliyoruz

Ayrıca,

Direk parent tabloyu silebiliyoruz

Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutu yazmamız yeterli

-------------------------------------------------------------------------------------*/



CREATE TABLE parent 
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO parent VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent VALUES (104, 'Apple', 'Mick Jackson');


    



CREATE TABLE child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),

CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
ON DELETE CASCADE

);    
    
INSERT INTO child VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child VALUES(104, 1007,'Kamera', 'Eymen Ozden');


select * from child;

--SORU1: parent tablosundaki tum verileri siliniz 
delete from parent;
--ON DELETE CASCADE sayesinde child tablodaki veri silinmeden parent tablodaki 
--veri silinmeye calisildiginda pgAdmin error vermez. Parent tablodaki veriyi
--siler fakat bu durumda child tablodaki veride silinir.

--SORU2: parent tablosunu siliniz..
drop table parent cascade; -- parent silme isleminde cascade yazilmali

--SORU3: child tablosunu siliniz
drop table child;


/*

FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILMAZSA

1-) Child tablo silinmeden Parent tablo silinmeye çalışıldıgında PgAdmin Eror verir.
yani Child tablo silinmeden Parent tablo silinemez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında Pg Admin Eror verir.
yani Child tablodaki veri silinmeden Parent tablodaki veri silinemez






FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILIRSA

1-) Child tablo silinmeden Parent tablo silinebilir.
PgAdmin Eror vermez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında PgAdmin Eror vermez
Parent tablodaki veriyi siler.
Fakat bu durumda Child tablodaki veride silinir.

*/








/*------------ AGGREGATE METHOD KULLANIMI ---------------------------

AGGREGATE METHODLARI:  Tek bir deger elde etmek istedigimizde kullanılır.

sum() ==>   Verilerin toplamını alır.
count() ==> Verilerin sayisini alır.
min() ==>   Verilerden en kücük degeri alır.
max() ==>   Verilerden en büyük degeri alır.
avg() ==>   Verilerin ortalamasını alır.

--------------------------------------------------------------------*/


create table arac
(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
);

insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

--SORU1 : arac tablosundaki en yüksek fiyat'ı listele
select max(fiyat) from arac;
select max(fiyat)  as enyukse_fiyat from arac -- kendimiz isim verebiliriz.


--SORU2 : arac tablosundaki en düşük fiyat'ı listele
select min(fiyat) from arac;


--SORU3 : arac tablosundaki fiyatların toplamını listele
select sum(fiyat) as toplam_fiyat from arac;


--SORU4 : arac tablosundaki fiyat ortalamalarını listele
select avg(fiyat) as ortalama_fiyat from arac;
select round (avg(fiyat)) as ortalama_fiyat from arac;--ondalikli kismi almaz.
select round (avg(fiyat),2) as ortalama_fiyat from arac;--virgulden sonra kac basamak istersek


--SORU5 : arac tablosunda kaç tane araç oldugunu listele

select count(id) as toplam_arac from arac;




/*============================SUBQUERY==============================

 SUBQUERY:  Sorgu içinde çalışan sorguya denir.


==========================================================================*/


CREATE TABLE malzemeler    
(
ted_vergino int, 
malzeme_id int, 
malzeme_isim VARCHAR(20), 
musteri_isim VARCHAR(25)
);    
    
INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
    



CREATE TABLE toptancilar    
(
vergi_no int,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
    
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Sen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Cetin HoS');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gor');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Cos');




select * from malzemeler;


-- SORU1: Malzemeler tablosundaki musteri_isim'i 'Ali Can' olanın malzeme_isim'ini,
--toptancilar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.


update malzemeler set malzeme_isim=('Apple') where musteri_isim='Ali can';
--daha dinamik hale getirmek icin
update malzemeler set malzeme_isim=(select sirket_ismi from toptancilar where irtibat_ismi='Adem Cos')
where musteri_isim = 'Ali Can';

--('Apple')==>select sirket_ismi from toptancilar where irtibat_ismi='Adem Cos' 


