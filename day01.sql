-- bu sekilde yorum yazabiliriz

/*
bu sekilde
uzun yorumlarımızı
yazabiliriz
*/




/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  ALTER: Tabloyu günceller.
  DROP: Tabloyu siler.
  
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  UPDATE:Tablodaki verileri günceller
  DELETE:Tablodaki verileri siler
  

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/

-- talebeler isminde tablo olusturalım.

create table talebeler(
ogreci_tc char(11), 		 -- Uzunlugu belli olan String veriler icin char() data turu kullanılır.
ogrenci_isim varchar(20),	 -- Uzunlugu belli olmayan String veriler icin varchar() data turu kullanılır
not_ort real,  				 -- Ondalıklı sayılar icin real data turu kullanılır
kayit_tarihi date			 -- Tarih icin date data turu kullanılır 
);





-- talebeler tablosundaki verileri listeleyelim

select * from talebeler;  -- * tum sutunlardaki verileri listeler




-- talebeler tablosuna veri ekleyelim

insert into talebeler values('12345678912','Esma',90.5,'2020-02-14');
insert into talebeler values('12345674596','Mustafa',90.6,'2021-05-16');
insert into talebeler values('12356896414','Yunus',86.5,'2022-02-25');



-- simdi tekrardan talebeler tablosundaki verileri listeleyelim

select * from talebeler;



-- talebeler tablosunu silelim

drop table talebeler;


--SORU: ogretmenler isminde tablo olusturalım

create table ogretmenler(
ogretmen_ismi varchar(15), 		-- Uzunlugu belli olmayan String datalar icin varchar() data turu kullanılır
bransı varchar(25),
mezuniyet_derecesi varchar(20),
tel_nu char(11),  				-- Uzunlugu belli olan String datalar icin char() data turu kullanılır
maas int
);



-- SORU: ogretmenler tablosuna veri girisi yapalım

insert into ogretmenler values('Esma','Matematik','Lisans','12345678965',30000);
insert into ogretmenler values('Nalan','Edebiyat','Yuksek Lisans','15975328645',30000);
insert into ogretmenler values('Ali','Tarih','Lisans','45612378996',32000);



-- SORU: ogretmenler tablosundaki verileri listeleyelim

select * from ogretmenler;


-- SORU: ogretmenler tablosunu silelim


drop table ogretmenler;


/*=====================================SELECT=======================================================


select * from tablo_adi ==> * Tüm sutunlardaki verileri listeler



DQL Grubundan ==> SELECT komutu ile 'Tablodaki İstedigimiz Sütundaki Verileri Listeleyebiliriz'


Syntax:
-------


select sutun_adi from tablo_adi; ==> Sadece belirtilen sutundaki verileri listeler


========================================================================================================*/


create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);

--SORU1: ogrenciler tablosunun tum sutunlarındaki verileri listeleyiniz

select * from ogrenciler;

--SORU2: ogrenciler tablosundaki 'isim' sutunundaki verileri listeleyiniz

select isim from ogrenciler;

--SORU3: ogrenciler tablosundaki 'adres' sutunundaki verileri listeleyiniz

select adres from ogrenciler;


--SORU4: ogrenciler tablosundaki 'sinav_notu' sutunundaki verileri listeleyiniz

select sinav_notu from ogrenciler;


--SORU5: ogrenciler tablosundaki 'isim' ve 'sinav_notu' sutunundaki verileri listeleyiniz

select isim,sinav_notu from ogrenciler;


/*

where==> ŞART belirtmemiz gerktiginde kullanılır.

*/


--SORU6: ogrenciler tablosundaki sinav_notu 80'den büyük olan öğrencilerin tüm bilgilerini listele

select * from ogrenciler where sinav_notu>80;


--SORU7: ogrenciler tablosundaki adres'i 'Ankara' olan ögrencilerin tüm bilgilerini listele


select * from ogrenciler where adres='Ankara';



--SORU8: ogrenciler tablosundaki sinav_notu 85 ve adres'i 'Ankara' olan öğrenci isim'ini listele


select isim from ogrenciler where sinav_notu=85 and adres='Ankara';


--SORU9: ogrenciler tablosundaki sinav_notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele


select * from ogrenciler where sinav_notu=65 or sinav_notu=85;


-- in ==> Birden fazla ifade ile tanımlayabilecegimiz durumları in komutuyla yazabiliriz.

-- 2.YOL

select * from ogrenciler where sinav_notu in(65,85);