CREATE TABLE personel
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);


INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Maden', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Ahmet Gurbuz', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Ali Sahin', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Mahmut Sahin', 'Ankara', 4500, 'Ford');





-- SORU1: personel tablosuna ulke_isim adinda ve default degeri
--'Turkiye' olan yeni bir sutun ekleyiniz.
alter table personel add column ulke_isim varchar(50) default 'Turkiye';

select * from personel;


--SORU2: personel tablosuna cinsiyet sutunu ekleyiniz, default degeri 'E' olsu
alter table personel add column cinsiyet char(1) default 'E';



--SORU3: cinsiyet sutunu siliniz

alter table personel drop column cinsiyet;


-- SORU4: personel tablosundan sirket sutununu siliniz.
alter table personel drop column sirket;
select * from personel;

--SORU5: personel tablosuna tel_no char(11) ve cocuk_sayisi 
--int seklinde yeni sutunlar ekleyiniz.

alter table personel add column tel_no char(11), add column cocuk_sayisi int;

--SORU6: personel tablosundan tel_no ve cocuk_sayisi sutunlarını siliniz
alter table personel drop column tel_no , drop column cocuk_sayisi;
