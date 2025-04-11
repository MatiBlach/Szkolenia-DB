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