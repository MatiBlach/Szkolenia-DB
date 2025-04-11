-- Kaskadowe usuwanie
-- Usuwamy Prowadzącego, co spowoduje usunięcie jego Szkoleń
DELETE FROM Prowadzący WHERE ID_Prowadzącego = '21098765432';

-- Kaskadowa aktualizacja
-- Zakładamy, że chcemy zaktualizować nazwe szkolenia, co spowoduje aktualizację również w terminach
UPDATE Szkolenia SET Nazwa_Szkolenia = 'Jak Zarządzać Finansami' WHERE Nazwa_Szkolenia = 'Kurs Finansowy dla Firm';