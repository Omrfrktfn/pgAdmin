/*
ogrenci_info adında bir table oluşturunuz.
ogr_id(PRIMARY KEY), ogr_isim(UNIQUE), ogr_yas(NOT NULL) ve ogr_kayit 
adında sütunlar oluşturunuz.
Sütunlara uygun data tipleri ve belirtilen constraint'leri atayınız.
ogr_yas sütunu sadece 5'ten buyuk degerler alabilsin ve bu kısıtlamanın
adı ogr_yas_check olsun
student_name sütunu küçük harf karakter alamasın ve bu kısıtlamanın
adı ogr_isim_upper olsun
*/

create table ogrenci_info(

    ogr_id int PRIMARY KEY,
	ogr_isim varchar(30) UNIQUE,
	ogr_yas int NOT NULL,
	ogr_kayit date,
	CONSTRAINT ogr_yas_check check(ogr_yas>5),
	CONSTRAINT ogr_isim_upper check(ogr_isim=UPPER(ogr_isim))
);


INSERT INTO ogrenci_info VALUES('101','ALI CAN', 6, '12.06.2007'); 
--INSERT INTO ogrenci_info VALUES('101','ALI CAN', 15, '12.06.2007');
INSERT INTO ogrenci_info VALUES(102, 'VELI HAN', '19', '5.08.04');
INSERT INTO ogrenci_info VALUES(103, 'AYSE TAN', 20, '3.11.2006');
INSERT INTO ogrenci_info VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO ogrenci_info VALUES('105', 'TOM HANKS', 20, '12-11-2003');
INSERT INTO ogrenci_info VALUES('106', 'ANGELINA JOLIE', 10, '12-6-2013');
INSERT INTO ogrenci_info VALUES('107', 'BRAD PITT', 7, '10-9-2021');


insert into ogrenci_info (ogr_id,ogr_yas) values (108,17);
insert into ogrenci_info(ogr_id,ogr_yas,ogr_isim) values (109,6,'JOHN WALKER');


--SORU1: ogr_id değeri 108 olan verinin ogr_isim değerini
--'LEO OCEAN' olarak güncelleyin.
update ogrenci_info set  ogr_isim='LEO OCEAN' where ogr_id=108;

select * from ogrenci_info;

--SORU2: JOHN WALKER'ın , ogr_kayit sütununu 11-12-1997 değeriyle değiştiriniz.
update ogrenci_info set ogr_kayit='11-12-1997' where ogr_isim='JOHN WALKER';



--SORU3: 105 id'li verinin ogr_kayit hücresini 11-4-1996 değerine ve 
--ogr_isim hücresini MARK TWAIN değerine güncelle.

update ogrenci_info set ogr_kayit='11-4-1996', ogr_isim='MARK TWAIN' where ogr_id= 105;
select * from ogrenci_info;


--SORU4: id'si 106'dan küçük tüm ogr_kayit değerlerini 01-08-2021'e güncelle.


update ogrenci_info set ogr_kayit='01-08-2021' where ogr_id<106;

select * from ogrenci_info;


--SORU5: id'si 105 ten buyuk olan verilerin ogr_yas degerlerini 5 artır

update ogrenci_info set ogr_yas = ogr_yas+5 where ogr_id>105;


--SORU6: ogr_kayit degeri 01.Aug.2021 olan verilerin ogr_idlerini,
--yas ile toplayarak guncelleyın
update ogrenci_info set ogr_id= ogr_id+ogr_yas where ogr_kayit='01.08.2021';




CREATE TABLE insanlar
(
kimlik_no INT,
isim VARCHAR(50),
adres VARCHAR(80)     
);

INSERT INTO insanlar VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO insanlar VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO insanlar VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO insanlar(kimlik_no, adres) VALUES(456789012, 'Michigan');
INSERT INTO insanlar(kimlik_no, adres) VALUES(567890123, 'California');
INSERT INTO insanlar(kimlik_no, isim) VALUES(567890123, 'California');



--SORU7: null isim değerlerini "Daha sonra eklenecek" değerine güncelleyin.
update insanlar set isim='Daha sonra eklenecek' where isim is null ;
select * from insanlar;


--SORU8: null adres değerlerini "Daha sonra eklenecek" değerine güncelleyin.
update insanlar set adres='Daha sonra eklenecek' where adres is null;


--SORU9: İsimsiz kayıtları silin.(not: isimsiz kayıtların degeri
--'Daha sonra eklenecek' seklinde guncellenmıstı)
delete from insanlar where isim='Daha sonra eklenecek';
select * from insanlar;


--SORU10:Adres değeri Florida olmayan kaydı siliniz
delete from insanlar where adres <> 'Florida';
--adres!='Florida' buda kullanilabilir









