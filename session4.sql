/*====================

SELECT t1.x, t2.y, ....
	FROM TABLO1 t1
	FULL JOIN TABLO2 t2
	ON t1.FK = t2.PK;
	
	=================*/
SELECT m.marka_id,m.marka_adi,s.siparis_adedi,s.siparis_tarihi
FROM markalar m
INNER JOIN siparisler s
ON m.marka_id=s.marka_id;

------------------------------------------

/* ÖDEV chinbook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz */

SELECT *FROM tracks;
SELECT*FROM genres;

SELECT t.name AS sarki_adi,g.name AS sarki_turu
FROM tracks t
JOIN genres g
ON	t.GenreId=g.GenreId;


 /* ÖDEV: invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 
 SELECT * FROM invoices;
 
 SELECT * FROM customers;
 
 SELECT c.FirstName,c.LastName,i.InvoiceDate,i.Total
 FROM invoices i
 JOIN customers c
 ON i.CustomerId=c.CustomerId;
 
 
 
	
	/* ÖDEV: artists tablosunda bulunan her bir kişinin albums tablosunda 
bulunan tüm albümlerinin listeleyen sorguyu yazınız. 
Sorguda ArtistId, Name, Title ve AlbumId olmalıdır */

SELECT *FROM artists;

SELECT*FROM albums;

SELECT artists.Name,artists.ArtistId,albums.Title,albums.AlbumId
FROM artists
LEFT JOIN albums
ON artists.ArtistId=albums.ArtistId;

/* ===================================

	SUBQUARY ----nested yapı gibi
	
=========================================*/

/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */
	
	SELECT TrackId,name,AlbumId
	FROM tracks
	WHERE AlbumId=(SELECT AlbumId
				   FROM albums
	               WHERE Title="Faceless");
				   
/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini JOIN kullanarak listeyiniz.
	Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */
	
	SELECT t.TrackId,t.name,t.AlbumId
	FROM tracks t
	JOIN albums a
	ON	t.AlbumId=a.AlbumId
	WHERE a.Title="Faceless";
	
	-- ALTERNATİF KULLANIM
	
	SELECT t.TrackId,t.name,t.AlbumId
	FROM tracks t
	JOIN albums a
	ON	t.AlbumId=a.AlbumId AND a.Title="Faceless";
	
	

/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
	albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
	SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */
	
	SELECT tracks.TrackId,tracks.name,tracks.AlbumId,albums.Title
	FROM tracks,albums
	WHERE tracks.AlbumId IN(SELECT AlbumId
				   FROM albums
	               WHERE Title IN ("Faceless","Let There Be Rock"));
	
	
	SELECT TrackId,name,AlbumId
	FROM tracks
	WHERE AlbumId IN(SELECT AlbumId
				   FROM albums
	               WHERE Title IN ("Faceless","Let There Be Rock"));
				   
				   
				   
	