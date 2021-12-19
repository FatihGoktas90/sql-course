/* =====================================

 LIMIT CLAUSE  -- FAZLA VERİDEN BELLİ MİKTARINI ÇEKMEK İÇİN GEREKİR.
 
 ========================*/

 /* ınvoices tablosundan Total değeri 10 dan byük olan ilk 4 kaydın ınvoices ıd , ınvoices date ve total bilgilerini sorgulayınız */ 
 
 SELECT InvoiceId , InvoiceDate , Total
 FROM invoices 
 WHERE  total > 10
 LIMIT 4;

 /* =====================================

ORDER BY sutunları sıralamak için ASC artan şekilde DESC desending azalan şekilde sıralamak için yapılır.
 
 ========================*/

 -- invoices tablosundan Total değeri 10 dan büyük olan kayıtları total değerine göre ARTAN sırada sıralayarak sorgulayınız. 
-- ORDER BY KOMUTUNUN DEFAULT DEĞERİ ASC DİR.

SELECT CustomerId,Total 
FROM invoices 
WHERE Total > 10
ORDER BY Total ASC ;

/* invioces tablosundan total değeri 10 dan büyük olan kayıtlardan işlem tarihi en yeni olan 10 kaydın tüm bilgilerini listeyiniz.Total

*/
SELECT *
FROM invoices 
WHERE Total > 10 
ORDER BY InvoiceDate DESC 
LIMIT 10 ;

-- MULTIPLE COLUMN ORDER BY İLE SIRALAMA OLABİLİR. İLK DEĞERLERİ AYNI İSE 2NCİ SUTUNA BAKAR GİBİ

/* AND OR VE NOT OPERASYONLARI  WHERE İLE KULLANILIR.*/
/* İNVİOCES tablosunda ülkesi USA olmayan kayıtları total değerine göre AZALAN sırasında listeleyiniz */

SELECT *
FROM invoices
WHERE NOT BillingCountry = "USA"  -- WHERE BillingCountry <> "USA" SQL STANDARDI 
ORDER BY Total DESC;

/*  BillingCountry  invoices tablosunda USA veya Germany olan kayıtları InvoiceId sırasına göre artan sırada listeleyiniz */


SELECT*
FROM invoices 
WHERE BillingCountry="USA" OR BillingCountry="Germany" 
ORDER BY InvoiceId ;


/* (SAAT DETAYI ÖNEMLİ) invoices tablosunda fatura tarihi InvoiceDate 01-01-2012 ile 03-01-2012 arasındaki faturaların tüm bilgilerini listeleyiniz */

SELECT*
FROM invoices
WHERE InvoiceDate >=  "2012-01-01 00:00:00" AND InvoiceDate <= "2013-01-02 00:00:00";



/* =====================================

 BETWEEN OPERATÖRÜ AND OPERATÖRÜ GİBİ
 
 ========================*/
/* invoices tablosundan  2009-2011 tarihleri arasındaki en yeni faturayı listeleyen sorguyu yazınız. */

SELECT * 
FROM invoices 
WHERE InvoiceDate
BETWEEN "2009-01-01 00:00:00" AND "2011-12-31 00:00:00" 
ORDER BY InvoiceDate DESC
LIMIT 1 ;

/* =====================================

İN OPERATÖRÜ -- OR OPERATÖRÜ GİBİ DAVRANIR.
 
 ========================*/

/* CUSTOMER TABLOSUNDA bELGİUM ,nORWAY veya Canada ülkelerinden sipariş veren müşterilerin FirstName Ve LastName bilgilerini listeleyin */

SELECT FirstName , LastName ,country
FROM customers 
WHERE Country IN ("Belgium" , "Norway", "Canada", "USA");

/* =====================================

LİKE OPERATÖRÜ -- SORGU İÇERİSİNDE SPESİFİK BİR ŞEYİ ÇEKMEK İÇİN KULLANILIR.STRİNG KULLANILMASI GEREKMEKTEDİR.
 
 ========================*/

/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini listeleyen sorgu yazınız.*/

SELECT Name,Composer
FROM tracks
WHERE Composer LIKE "%Bach";

/* albums tablosunda Title sutununda Greatest içeren kayıtların tüm bilgilerini listeleyen sorguyu yazınız. */

SELECT *
FROM albums
WHERE Title LIKE "%Greatest%";

/* invoices tablosunda , 2010 ve 2019 arası bir tarihte (invoice date) sadece şubat aylarında gerçekleşmiş olan faturaların tüm bilgilerini listeleyen sorguyu yazınız*/

SELECT*
FROM invoices 
WHERE InvoiceDate LIKE '201_-02%';
