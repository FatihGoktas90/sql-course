/*==========================================
				SELECT
============================================*/

	SELECT name FROM tracks;
	
/* tracks tablosundaki besteci ve isimlerini sorgulayınız. */

	SELECT Composer, name FROM tracks;
	
/* tracks tablosundaki tüm bilgileri sorgulayınız */

	SELECT * FROM tracks;
	
/*==========================================
				DISTINCT
============================================*/
	
-- DISTINCT CLAUSE BENZERSİZ OLANLARDIR.TEKRARSIZ KULLANIMLAR İÇİN GEREKLİDİR. 

	SELECT DISTINCT Composer FROM tracks;
	SELECT  Composer FROM tracks;
	
-- 2 sutun yazılırsa iki sutunda tekrarlı olanları almayacak. Yani ikisine beraber bakacak. 4 - 1 bir kere varsa 2ncisini almayacak.	
	
	SELECT DISTINCT AlbumId,MediaTypeId FROM tracks;

/*==========================================
				WHERE AND LIMIT CONDITION
============================================*/	

-- Composer I jimi Hendrix olanların name ini göster.

	SELECT name 
	FROM tracks 
	WHERE Composer='Jimi Hendrix';

	/* İnvoice tablosundan Total değeri 10$ dan büyük olan faturaların tüm bilgilerini sorgulayınız. */
	
	SELECT *
	FROM invoices
	WHERE total > 10;
	
