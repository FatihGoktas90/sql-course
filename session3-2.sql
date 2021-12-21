
/* customers tablosunda isimleri üç harfli olan müşterilerin firstname lastname ve city bilgilerini listeleyen sorgu yazıınız*/
SELECT FirstName,LastName,City
FROM customers
WHERE FirstName LIKE "___";

/* customers tablosunda soyisimleri Sch veya Go ile başlayan müşterilerin fistname lastname ve city bilgilerini listeleyen sorgu yazınız*/

SELECT FirstName,LastName ,City
FROM customers 
WHERE LastName LIKE 'Sch%' OR LastName LIKE 'Go%';

/* ========================================

AGGREGATE FUNCTION COUNT,SUM,MAX,MIN,AVG

===========================*/
--COUNT

/* invoices tablosunda kaç adet fatura olduğunu döndüren sorgu
AS alias anlamına geliyor.
*/
SELECT COUNT(FirstName) AS number_of_customers
FROM customers;

-- * ile yine max sayıyı verir. primarykey unique null olmaz.
SELECT COUNT(*) AS invoices_number
FROM invoices;

SELECT COUNT(InvoiceId) AS invoices_number
FROM invoices;

SELECT COUNT(BillingState) AS invoices_number
FROM invoices;

/* tracks tablosounda kaç farklı composer bulunduğunu döndüren kod. */

SELECT COUNT(DISTINCT Composer) AS besteci_sayisi
FROM tracks;

------------------------------------------------

/* ÖDEV İNVOİCES TABLOSUNDA KAÇ ADET FARKLI YIL OLDUĞUNU DÖNDÜREN KODU YAZINIZ 

iNVOİCES TABLOSUNDA 2009 İLE 2013(TAMAMI DAHİL) TARİHLERİ ARASINDAKİ FATURALARIN TOPLAM DEĞERİNİ LİSTELEYİNİZ*/

------------------------------------------------

---------------MIN--------

/* TRACKS TABLOSUNDAKİ MİN DURATİON ŞARKI SÜRESİ U GÖSTERİN MİLSEC*/

SELECT name AS sarkı_ismi, MIN(Milliseconds)/1000.0 AS Duration
FROM tracks ;

/* student tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

SELECT  MIN(Grade) , MAX(Grade)
FROM students;

/* SUM,AVG */

/* SATILAN ÜRÜNLER TOPLAMI İNVOİCES */

SELECT SUM(Total)
FROM invoices;

SELECT ROUND(AVG(Total),4)
FROM invoices;


/*tracks toplasundaki avg duration dan daha büyük olan duration ı göster*/
/*bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil.alt-sorgu(sub-quary) ile daha doğru bir yaklaşım olacaktır. 
*/


SELECT ROUND(AVG(Milliseconds))
FROM tracks; 


SELECT Name , Milliseconds
FROM tracks
WHERE Milliseconds > 393599;

--sub-quary yöntemi

SELECT Name , Milliseconds
FROM tracks
WHERE Milliseconds > (SELECT AVG(Milliseconds)
                      FROM tracks); 


-- GROUP BY CLAUSE GRUPLANDIRIYOR.GROUP BY İÇERSİNDEKİ YER SELECT TE DE GENELDE OLUR!

/* tracks tablosundaki her bir bestecinin toplam şarkı sayısını besteci adına göre gruplandırarak listeleyen sorguyu yazınız.*/

SELECT Composer, COUNT(Name) AS song_count
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;



/* customers tablosundaki müşterilerin sayılarını ülkelerine göre gruplandırarak ve müşteri sayısına göre azalan olacak şekilde sıralayarak listeleyen sorguyu yazınız*/

SELECT Country,COUNT(FirstName) AS nu_of_cust
FROM customers
GROUP BY  Country
ORDER BY nu_of_cust  DESC;

/* customers tablosundaki müşterilerin sayılarını ülkelerine(Country) ve şehirlerine(City) göre
gruplandırarak listeleyen sorguyu yazınız */

SELECT country,city,COUNT(FirstName) AS num_of_cust
FROM customers
GROUP BY country , City;

/* invoices tablosundaki her bir ülkenin fatura ortalamalarını hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınıoz*/

SELECT BillingCountry,ROUND(AVG(Total),2) AS inv_avg
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31 23:59:09"
GROUP BY BillingCountry;

/*==========================================

JOİNS
SQLİTE sadece INNER , LEFT VE CROSS JOİN  işlemlerinş destekler. 
===========================================*/

/* araclar.db adındaki veritababnını kullanarak markalar ve siparişler tablosundaki marka_id'si ynı
olan kayıtların marka_id,marka_adi , sipariş adedi ve siparis_tarhi bilgilerinş listeleyen bir 
sorgu yazınız. */

SELECT markalar.marka_id,markalar.marka_adi,siparisler.siparis_adedi,siparisler.siparis_tarihi
FROM markalar
LEFT JOIN siparisler 
ON markalar.marka_id=siparisler.marka_id;