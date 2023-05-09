CREATE TABLE personel 
(
	id int  PRIMARY KEY, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	sirket VARCHAR(20)
);
   
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'Istanbul', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');

/* -----------------------------------------------------------------------------
  SORU3: maas'ı 5000’den az olan personelin isim, maas ve sirket bilgileri ile, 
-- 'Honda' calisani olmayan personelin isim, maas, sirket bilgilerini
-- tekrarsız listeleyen bir sorgu yaziniz. 
------------------------------------------------------------------------------*/ 
select isim, maas,sirket from personel where maas<5000
UNION
select isim, maas,sirket from personel where sirket!='Honda';

/* -----------------------------------------------------------------------------
  SORU4: isim'i 'Mehmet Ozturk' olanlarin isim'lerini, sehir'lerini ve
-- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini tekrarsız listeleyen sorguyu yaziniz.
------------------------------------------------------------------------------*/

select isim,sehir from personel where isim='Mehmet Ozturk'
UNION
select isim,sehir from personel where sehir!='Istanbul';


CREATE TABLE personel_bilgi 
(
id int, 
tel char(10) UNIQUE , 
cocuk_sayisi int
); 
   
INSERT INTO personel_bilgi VALUES(123, '5302345678' , 5);
INSERT INTO personel_bilgi VALUES(234, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345, '5354561245', 3); 
INSERT INTO personel_bilgi VALUES(478, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(789, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(344, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(125, '5537488585', 1);


select * from personel_bilgi;

/* -----------------------------------------------------------------------------
  SORU5: id'si 123456789 olan personelin, personel tablosundan sehir ve maas'ini, 
--personel_bilgi tablosundan da id'si 123 olan, personelin tel ve cocuk sayisini tekrarsız yazdirin  
-----------------------------------------------------------------------------*/   
select sehir, maas from personel where id=123456789
UNION
select tel, cocuk_sayisi from personel_bilgi where id=123;


/*=========================================  LIKE  ================================================

LIKE ==> Gibi anlamına gelir. 

Örnek:
-----
'A' ile baslayan verileri listele
'n' ile biten verileri listele
ikinci harfi 'e' olan verileri listele  

örneklerindeki işlemler için LIKE komutu kullanılır.

LIKE, sorgulama yaparken belirli pattern'leri kullanmamıza olanak verir. 

Pattern:
-------

% ==> Sıfır veya daha fazla karakteri belirtir.
_ ==> Tek bir karakteri belirtir.

Syntax:
------

SELECT * FROM tablo_adi
WHERE sutun_adi like PATTERN
====================================================================================================*/

CREATE TABLE musteriler 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
maas int
);



INSERT INTO musteriler (id, isim, maas) VALUES (1001, 'Ali', 100000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, maas) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, maas) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, maas) VALUES (1006, 'ahmet', 82000);


--SORU1: isim'i 'A' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz
select * from musteriler where isim like 'A%';

--SORU2: isim'i 'a' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz
select * from musteriler where isim like 'a%';


--SORU3: isim'i buyuk harf kucuk harf gözetmeksizin 'A' ile baslayan tum bilgileri listeleyiniz
--not ilike buyuk kucuk gozetmeksizin anlamina gelir
select * from musteriler where isim ilike 'a%';


--SORU4: isim'i 'e' harfi ile biten tum bilgileri listeleyiniz
select * from musteriler where isim like '%e';


--SORU5: isim'i icerisinde 'er' olan tum bilgileri listeleyiniz.
select * from musteriler where isim like '%er%';


--SORU6: isim'i 5 harfli olup son 4 harfi 'atma' olan tum bilgileri listeleyiniz.
select * from musteriler where isim like '_atma';

--SORU7: isim'in 2. harfi 'a' olan tum bilgileri listeleyiniz.
select * from musteriler where isim like '_a%';

--SORU8: isim'in 3. harfi 's' olan tum bilgileri listeleyiniz.
select * from musteriler where isim like '__s%';

--SORU9: isim'in 3. harfi 's' olup 4 harfli tum bilgileri listeleyiniz.
select * from musteriler where isim like '__s_';

--SORU10: isim'in ilk harfi 'F' olup en az 4 harfli tum bilgileri listeleyiniz.
select * from musteriler where isim like 'F___%';

--SORU11: isim'in ikinci harfi 'a' olup, 4.harfi 'm' olan en az 4 harfli tum bilgilerini listeleyiniz.
select * from musteriler where isim like '_a_m%';

--SORU12: isim'i icerisinde 'i' olmayan tum bilgileri listeleyiniz.
select * from musteriler where isim not like '%i%';


/* ==================================  REGEXP_LIKE  ==========================================

   REGEXP_LIKE: Gibi anlamına gelir. Daha karmaşık sorgulama işlemi için kullanılabilir.

		   ~ isareti ile ifade edilir.


    	Syntax:
    	--------

	SELECT * FROM tablo_adi
	WHERE sutun_adi ~ PATTERN
		~~
 ========================================================================================= */
 create table exercises
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
harf_sayisi int
);


INSERT INTO exercises VALUES (1001, 'hot', 3);  
INSERT INTO exercises VALUES (1002, 'hat', 3);  
INSERT INTO exercises VALUES (1003, 'hit', 3);  
INSERT INTO exercises VALUES (1004, 'hbt', 3);  
INSERT INTO exercises VALUES (1008, 'hct', 3);  
INSERT INTO exercises VALUES (1005, 'adem', 4);  
INSERT INTO exercises VALUES (1006, 'selim', 5);  
INSERT INTO exercises VALUES (1007, 'yusuf', 5);
INSERT INTO exercises VALUES (1009, 'hAt', 3); 
 
 -- SORU1 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan
 --3 harfli kelimelerin tum bilgilerini listeleyiniz.
 select * from exercises where kelime ~ 'h[ai]t';
 
 -- SORU2 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan 3 harfli kelimeleri
--buyuk harf kucuk harf gözetmeksizin tum bilgilerini listeleyiniz.
select * from exercises where kelime ~* 'h[ai]t';
--buyuk harf kucuk harf gozetmeksizin listelemek istersek ~* kullaniriz.

-- SORU3 : ilk harfi 'h', son harfi 't' olup, 2.harfi 'a' ile 'k' arasinda olan 3 harfli kelimelerin  
--tum bilgilerini listeleyiniz
select * from exercises where kelime ~ 'h[a-k]t'; 

-- SORU4 : ilk harfi 'a' veya 's' ile baslayan kelimelerin tum bilgilerini listeleyiniz
select * from exercises where kelime ~ '^[as]';
-- ^ sapka isareti baslayan anlaminda kullanilir.


-- SORU5 : son harfi 'm' veya 'f' ile biten kelimelerin tum bilgilerini listeleyiniz.
select * from exercises where kelime ~ '[mf]$';
-- $ isareti biten anlaminda kullanilir.


-- SORU6 : son harfi 'm' veya 'f' ile bitmeyen kelimelerin tum bilgilerini listeleyiniz.
select * from exercises where kelime !~ '[mf]$';








