-- Kaskadowe usuwanie
-- Usuwamy Prowadz�cego, co spowoduje usuni�cie jego Szkole�
DELETE FROM Prowadz�cy WHERE ID_Prowadz�cego = '21098765432';

-- Kaskadowa aktualizacja
-- Zak�adamy, �e chcemy zaktualizowa� nazwe szkolenia, co spowoduje aktualizacj� r�wnie� w terminach
UPDATE Szkolenia SET Nazwa_Szkolenia = 'Jak Zarz�dza� Finansami' WHERE Nazwa_Szkolenia = 'Kurs Finansowy dla Firm';