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