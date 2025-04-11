-- Przyklady od kolegów:

-- 1)
/* Podczas analizy harmonogramu szkoleñ zauwa¿ono, ¿e prowadz¹cy o imieniu
zawieraj¹cym literê „O” s¹ odpowiedzialny za wiele kursów. Zapytaj o pe³ne
zestawienie wszystkich szkoleñ, których prowadz¹cym maj¹ imiê zawieraj¹ce
literê "O”, aby lepiej zrozumieæ zakres i tematykê tych szkoleñ. */

/*
SELECT 
	Ludzie.Imiê,
	Szkolenia.*
FROM 
	Szkolenia
JOIN 
	Ludzie ON Szkolenia.ID_Prowadz¹cego = Ludzie.PESEL
WHERE 
	Ludzie.Imiê LIKE '%O%';
*/

-- 2)
/* W trakcie analizy dostêpnoœci miejsc na szkolenia, zauwa¿ono, ¿e szkolenia o
temacie Podstawy Medycyny posiadaj¹ nadal wolne miejsca. Zapytaj o
aktualne zestawienie iloœci wolnych miejsc na wszystkich szkoleniach
zwi¹zanych z tematem Podstaw Medycyny, aby skoordynowaæ kampanie
promocyjne i zape³niæ dostêpne miejsca. */

/*
SELECT 
	SUM(WolneMiejsca) as SumaWolnychMiejsc
FROM (
	SELECT 
		SUM(Szkolenia.Iloœæ_miejsc) - SUM(PrzydzielenieCount.CountUczestnikow) as WolneMiejsca
	FROM 
		Plan_zajêæ
	JOIN 
		Terminy ON Plan_zajêæ.ID_Terminu = Terminy.ID_Terminu
	JOIN 
		Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
	INNER JOIN 
    (
		SELECT ID_Terminu, COUNT(ID_Uczestników) as CountUczestnikow
		FROM Przydzielenie
		GROUP BY ID_Terminu
    ) as PrzydzielenieCount ON Terminy.ID_Terminu = PrzydzielenieCount.ID_Terminu
	WHERE 
		Szkolenia.Nazwa_Szkolenia LIKE 'Podstawy Medycyny'
	GROUP BY
		Szkolenia.Nazwa_Szkolenia, PrzydzielenieCount.CountUczestnikow
) Subquery
*/

-- 3)
/* Planuj¹c wydarzenia na 19 paŸdziernika 2023 roku, zidentyfikowano potrzebê
dostêpu do sal szkoleniowych w godzinach 15.00-18.00 w oœrodkach w których
³¹czna liczba miejsc w ka¿dej z sal jest liczb¹ wiêksz¹ lub równ¹ 40. Zapytaj o aktualne
zestawienie wolnych sal w tym czasie w oœrodkach spe³niaj¹cych podane
kryteria, aby efektywnie zorganizowaæ plan zajêæ lub spotkañ w danym oœrodku. */


/*
SELECT DISTINCT
	Oœrodki.Nazwa_Oœrodka,
	Sale.Numer,
	Sale.Liczba_miejsc
FROM
	Plan_Zajêæ
LEFT JOIN
	Terminy ON Plan_Zajêæ.ID_Terminu = Terminy.ID_Terminu
LEFT JOIN
	Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
LEFT JOIN
	Oœrodki ON Szkolenia.Oœrodek = Oœrodki.Nazwa_Oœrodka
LEFT JOIN
	Sale ON Oœrodki.Nazwa_Oœrodka = Sale.Oœrodek
WHERE 
	NOT 
	(
		Plan_Zajêæ.Data = '2023-10-19' AND 
		Plan_Zajêæ.Godzina_rozpoczêcia > '15:00:00' AND
		Plan_Zajêæ.Godzina_zakoñczenia < '18:00:00'
	) AND
	Sale.Liczba_miejsc >= 40;
*/
	
-- 4)
  /*Jest potrzeba przeprowadzenia szkolenia dnia X, w godzinach Y, podaj zestawienie
wszystkich wolnych sal w oœrodku Z.*/

/*
SELECT
	Oœrodki.Nazwa_Oœrodka,
	Sale.Numer,
	Plan_Zajêæ.Data,
	Plan_Zajêæ.Godzina_rozpoczêcia,
	Plan_Zajêæ.Godzina_zakoñczenia
FROM
	Plan_Zajêæ
LEFT JOIN
	Terminy ON Plan_Zajêæ.ID_Terminu = Terminy.ID_Terminu
LEFT JOIN
	Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
LEFT JOIN
	Oœrodki ON Szkolenia.Oœrodek = Oœrodki.Nazwa_Oœrodka
LEFT JOIN
	Sale ON Oœrodki.Nazwa_Oœrodka = Sale.Oœrodek
WHERE 
	--NOT --Zakomentuj aby pokazaæ sale, które s¹ zajête
	(
		Plan_Zajêæ.Data = '2022-02-16' AND 
		Plan_Zajêæ.Godzina_rozpoczêcia > '10:00:00' AND
		Plan_Zajêæ.Godzina_zakoñczenia < '14:00:00'
	);
*/

-- 5)
/*Prezes wiedzieæ którzy prowadz¹cy,prowadzili najmniej szkoleñ. Sporz¹dŸ
zestawienie 10 prowadz¹cych uporz¹dkowanych malej¹co, wzglêdem liczby szkoleñ.*/

/*
CREATE VIEW TopProwadzacy AS
SELECT TOP 10
    Ludzie.Imiê,
    Ludzie.Nazwisko,
    COUNT(Szkolenia.Nazwa_Szkolenia) AS LiczbaSzkolen
FROM
    Ludzie
JOIN
    Prowadz¹cy ON Ludzie.PESEL = Prowadz¹cy.ID_Prowadz¹cego
LEFT JOIN
    Szkolenia ON Prowadz¹cy.ID_Prowadz¹cego = Szkolenia.ID_Prowadz¹cego
GROUP BY
    Ludzie.Imiê, Ludzie.Nazwisko
ORDER BY
    LiczbaSzkolen DESC;
*/


--SELECT * FROM TopProwadzacy;

-- 6)
/*Do kampanii reklamowej potrzebna jest informacja o szkoleniach, w których
uczestniczy³o najwiêcej uczestników, sporz¹dŸ zestawienie 10 uporz¹dkowanych
rosn¹co szkoleñ, wzglêdem iloœci uczestników.*/

/*
SELECT TOP 10
	Terminy.Nazwa_Szkolenia,
	COUNT(Przydzielenie.ID_Uczestników) AS LiczbaUczestnikow
FROM
	Terminy
JOIN 
	Przydzielenie ON Terminy.ID_Terminu = Przydzielenie.ID_Terminu
GROUP BY
	Terminy.Nazwa_Szkolenia
ORDER BY 2 DESC;
--*/

-- Zapytania w³asne:

-- 7)
/*Prowadz¹cy ciekawy jest, czy wœród osób na którymœ z jego kursów, jest jakaœ znajoma mu osoba.
Stwórz zestawienie wszystkich uczestników (imiê i nazwisko) jakiegokolwiek z kursów prowadz¹cego
Marka Kwiatkowskiego*/


/*
SELECT DISTINCT 
	Imiê, 
	Nazwisko
FROM 
	Ludzie
JOIN 
	Uczestnicy ON Ludzie.PESEL = Uczestnicy.ID_Uczestnika
JOIN 
	Przydzielenie ON Ludzie.PESEL = Przydzielenie.ID_Uczestników
JOIN 
	Terminy ON Przydzielenie.ID_Terminu = Terminy.ID_Terminu
JOIN 
	Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
JOIN 
	Prowadz¹cy ON Szkolenia.ID_Prowadz¹cego = Prowadz¹cy.ID_Prowadz¹cego
WHERE 
Prowadz¹cy.ID_Prowadz¹cego = (
	SELECT 
		ID_Prowadz¹cego 
	FROM 
		Prowadz¹cy
	JOIN 
		Ludzie ON Prowadz¹cy.ID_Prowadz¹cego = Ludzie.PESEL
	WHERE 
		Ludzie.Imiê = 'Marek' AND 
		Ludzie.Nazwisko = 'Kwiatkowski')
*/
