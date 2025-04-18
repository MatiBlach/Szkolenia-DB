CREATE VIEW TopProwadzacy AS
SELECT TOP 10
    Ludzie.Imię,
    Ludzie.Nazwisko,
    COUNT(Szkolenia.Nazwa_Szkolenia) AS LiczbaSzkolen
FROM
    Ludzie
JOIN
    Prowadzący ON Ludzie.PESEL = Prowadzący.ID_Prowadzącego
LEFT JOIN
    Szkolenia ON Prowadzący.ID_Prowadzącego = Szkolenia.ID_Prowadzącego
GROUP BY
    Ludzie.Imię, Ludzie.Nazwisko
ORDER BY
    LiczbaSzkolen DESC;