-- Przyklady od koleg�w:

-- 1)
/* Podczas analizy harmonogramu szkole� zauwa�ono, �e prowadz�cy o imieniu
zawieraj�cym liter� �O� s� odpowiedzialny za wiele kurs�w. Zapytaj o pe�ne
zestawienie wszystkich szkole�, kt�rych prowadz�cym maj� imi� zawieraj�ce
liter� "O�, aby lepiej zrozumie� zakres i tematyk� tych szkole�. */

/*
SELECT 
	Ludzie.Imi�,
	Szkolenia.*
FROM 
	Szkolenia
JOIN 
	Ludzie ON Szkolenia.ID_Prowadz�cego = Ludzie.PESEL
WHERE 
	Ludzie.Imi� LIKE '%O%';
*/

-- 2)
/* W trakcie analizy dost�pno�ci miejsc na szkolenia, zauwa�ono, �e szkolenia o
temacie Podstawy Medycyny posiadaj� nadal wolne miejsca. Zapytaj o
aktualne zestawienie ilo�ci wolnych miejsc na wszystkich szkoleniach
zwi�zanych z tematem Podstaw Medycyny, aby skoordynowa� kampanie
promocyjne i zape�ni� dost�pne miejsca. */

/*
SELECT 
	SUM(WolneMiejsca) as SumaWolnychMiejsc
FROM (
	SELECT 
		SUM(Szkolenia.Ilo��_miejsc) - SUM(PrzydzielenieCount.CountUczestnikow) as WolneMiejsca
	FROM 
		Plan_zaj��
	JOIN 
		Terminy ON Plan_zaj��.ID_Terminu = Terminy.ID_Terminu
	JOIN 
		Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
	INNER JOIN 
    (
		SELECT ID_Terminu, COUNT(ID_Uczestnik�w) as CountUczestnikow
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
/* Planuj�c wydarzenia na 19 pa�dziernika 2023 roku, zidentyfikowano potrzeb�
dost�pu do sal szkoleniowych w godzinach 15.00-18.00 w o�rodkach w kt�rych
��czna liczba miejsc w ka�dej z sal jest liczb� wi�ksz� lub r�wn� 40. Zapytaj o aktualne
zestawienie wolnych sal w tym czasie w o�rodkach spe�niaj�cych podane
kryteria, aby efektywnie zorganizowa� plan zaj�� lub spotka� w danym o�rodku. */


/*
SELECT DISTINCT
	O�rodki.Nazwa_O�rodka,
	Sale.Numer,
	Sale.Liczba_miejsc
FROM
	Plan_Zaj��
LEFT JOIN
	Terminy ON Plan_Zaj��.ID_Terminu = Terminy.ID_Terminu
LEFT JOIN
	Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
LEFT JOIN
	O�rodki ON Szkolenia.O�rodek = O�rodki.Nazwa_O�rodka
LEFT JOIN
	Sale ON O�rodki.Nazwa_O�rodka = Sale.O�rodek
WHERE 
	NOT 
	(
		Plan_Zaj��.Data = '2023-10-19' AND 
		Plan_Zaj��.Godzina_rozpocz�cia > '15:00:00' AND
		Plan_Zaj��.Godzina_zako�czenia < '18:00:00'
	) AND
	Sale.Liczba_miejsc >= 40;
*/
	
-- 4)
  /*Jest potrzeba przeprowadzenia szkolenia dnia X, w godzinach Y, podaj zestawienie
wszystkich wolnych sal w o�rodku Z.*/

/*
SELECT
	O�rodki.Nazwa_O�rodka,
	Sale.Numer,
	Plan_Zaj��.Data,
	Plan_Zaj��.Godzina_rozpocz�cia,
	Plan_Zaj��.Godzina_zako�czenia
FROM
	Plan_Zaj��
LEFT JOIN
	Terminy ON Plan_Zaj��.ID_Terminu = Terminy.ID_Terminu
LEFT JOIN
	Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
LEFT JOIN
	O�rodki ON Szkolenia.O�rodek = O�rodki.Nazwa_O�rodka
LEFT JOIN
	Sale ON O�rodki.Nazwa_O�rodka = Sale.O�rodek
WHERE 
	--NOT --Zakomentuj aby pokaza� sale, kt�re s� zaj�te
	(
		Plan_Zaj��.Data = '2022-02-16' AND 
		Plan_Zaj��.Godzina_rozpocz�cia > '10:00:00' AND
		Plan_Zaj��.Godzina_zako�czenia < '14:00:00'
	);
*/

-- 5)
/*Prezes wiedzie� kt�rzy prowadz�cy,prowadzili najmniej szkole�. Sporz�d�
zestawienie 10 prowadz�cych uporz�dkowanych malej�co, wzgl�dem liczby szkole�.*/

/*
CREATE VIEW TopProwadzacy AS
SELECT TOP 10
    Ludzie.Imi�,
    Ludzie.Nazwisko,
    COUNT(Szkolenia.Nazwa_Szkolenia) AS LiczbaSzkolen
FROM
    Ludzie
JOIN
    Prowadz�cy ON Ludzie.PESEL = Prowadz�cy.ID_Prowadz�cego
LEFT JOIN
    Szkolenia ON Prowadz�cy.ID_Prowadz�cego = Szkolenia.ID_Prowadz�cego
GROUP BY
    Ludzie.Imi�, Ludzie.Nazwisko
ORDER BY
    LiczbaSzkolen DESC;
*/


--SELECT * FROM TopProwadzacy;

-- 6)
/*Do kampanii reklamowej potrzebna jest informacja o szkoleniach, w kt�rych
uczestniczy�o najwi�cej uczestnik�w, sporz�d� zestawienie 10 uporz�dkowanych
rosn�co szkole�, wzgl�dem ilo�ci uczestnik�w.*/

/*
SELECT TOP 10
	Terminy.Nazwa_Szkolenia,
	COUNT(Przydzielenie.ID_Uczestnik�w) AS LiczbaUczestnikow
FROM
	Terminy
JOIN 
	Przydzielenie ON Terminy.ID_Terminu = Przydzielenie.ID_Terminu
GROUP BY
	Terminy.Nazwa_Szkolenia
ORDER BY 2 DESC;
--*/

-- Zapytania w�asne:

-- 7)
/*Prowadz�cy ciekawy jest, czy w�r�d os�b na kt�rym� z jego kurs�w, jest jaka� znajoma mu osoba.
Stw�rz zestawienie wszystkich uczestnik�w (imi� i nazwisko) jakiegokolwiek z kurs�w prowadz�cego
Marka Kwiatkowskiego*/


/*
SELECT DISTINCT 
	Imi�, 
	Nazwisko
FROM 
	Ludzie
JOIN 
	Uczestnicy ON Ludzie.PESEL = Uczestnicy.ID_Uczestnika
JOIN 
	Przydzielenie ON Ludzie.PESEL = Przydzielenie.ID_Uczestnik�w
JOIN 
	Terminy ON Przydzielenie.ID_Terminu = Terminy.ID_Terminu
JOIN 
	Szkolenia ON Terminy.Nazwa_Szkolenia = Szkolenia.Nazwa_Szkolenia
JOIN 
	Prowadz�cy ON Szkolenia.ID_Prowadz�cego = Prowadz�cy.ID_Prowadz�cego
WHERE 
Prowadz�cy.ID_Prowadz�cego = (
	SELECT 
		ID_Prowadz�cego 
	FROM 
		Prowadz�cy
	JOIN 
		Ludzie ON Prowadz�cy.ID_Prowadz�cego = Ludzie.PESEL
	WHERE 
		Ludzie.Imi� = 'Marek' AND 
		Ludzie.Nazwisko = 'Kwiatkowski')
*/
