-- Kaskadowe usuwanie
-- Usuwamy Prowadz¹cego, co spowoduje usuniêcie jego Szkoleñ
DELETE FROM Prowadz¹cy WHERE ID_Prowadz¹cego = '21098765432';

-- Kaskadowa aktualizacja
-- Zak³adamy, ¿e chcemy zaktualizowaæ nazwe szkolenia, co spowoduje aktualizacjê równie¿ w terminach
UPDATE Szkolenia SET Nazwa_Szkolenia = 'Jak Zarz¹dzaæ Finansami' WHERE Nazwa_Szkolenia = 'Kurs Finansowy dla Firm';