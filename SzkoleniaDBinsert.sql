
INSERT INTO Oœrodki (Nazwa_Oœrodka, Ulica, Kod_pocztowy, Opis) VALUES
('BitCode', 'Ulica C', '22-222', 'Oœrodek Informatyczny'),
('FinansePlus', 'Ulica B', '11-111', 'Oœrodek Ekonomiczny'),
('LingoMasters', 'Ulica A', '00-000', 'Oœrodek Jêzykowy'),
('MedCare', 'Ulica D', '33-333', 'Oœrodek Medyczny'),
('ScienceHub', 'Ulica E', '44-444', 'Oœrodek Nauukowy'),
('CreativeStudio', 'Ulica F', '55-555', 'Oœrodek Artystyczny'),
('BizPro', 'Ulica G', '66-666', 'Oœrodek Biznesowy'),
('TechForge', 'Ulica H', '77-777', 'Oœrodek Technologiczny'),
('InnoSpace', 'Ulica I', '88-888', 'Oœrodek Kreatywny'),
('ProPlan', 'Ulica J', '99-999', 'Oœrodek Projektowy');


INSERT INTO Sale (ID_Sali, Numer, Piêtro, Liczba_miejsc, Oœrodek, Czynna) VALUES
(1, 101, 1, 30, 'BitCode', 1),
(2, 102, 1, 25, 'FinansePlus', 1),
(3, 103, 2, 40, 'LingoMasters', 1),
(4, 201, 2, 20, 'MedCare', 1),
(5, 202, 3, 35, 'ScienceHub', 1),
(6, 301, 1, 30, 'CreativeStudio', 1),
(7, 302, 2, 25, 'BizPro', 1),
(8, 401, 3, 40, 'TechForge', 1),
(9, 402, 1, 20, 'InnoSpace', 0),
(10, 501, 2, 35, 'ProPlan', 1),
(11, 601, 3, 30, 'BitCode', 1),
(12, 602, 1, 25, 'FinansePlus', 1),
(13, 603, 2, 40, 'LingoMasters', 1),
(14, 701, 2, 20, 'MedCare', 1),
(15, 702, 3, 35, 'ScienceHub', 0),
(16, 801, 1, 30, 'CreativeStudio', 1),
(17, 802, 2, 25, 'BizPro', 1),
(18, 901, 3, 40, 'TechForge', 1),
(19, 902, 1, 20, 'InnoSpace', 1),
(20, 1001, 2, 35, 'ProPlan', 1);


INSERT INTO Ludzie (PESEL, Imiê, Nazwisko, Telefon, E_mail) VALUES
('12345678901', 'Jan', 'Kowalski', '123456789', 'jan.kowalski@example.com'),
('23456789012', 'Anna', 'Nowak', '234567890', 'anna.nowak@example.com'),
('34567890123', 'Piotr', 'Wiœniewski', '345678901', 'piotr.wisniewski@example.com'),
('45678901234', 'Alicja', 'D¹browska', '456789012', 'alicja.dabrowska@example.com'),
('56789012345', 'Krzysztof', 'Lewandowski', '567890123', 'krzysztof.lewandowski@example.com'),
('67890123456', 'Magdalena', 'Wójcik', '678901234', 'magdalena.wojcik@example.com'),
('78901234567', 'Marcin', 'Kamiñski', '789012345', 'marcin.kaminski@example.com'),
('89012345678', 'Natalia', 'Kowalczyk', '890123456', 'natalia.kowalczyk@example.com'),
('90123456789', 'Bartosz', 'Zieliñski', '901234567', 'bartosz.zielinski@example.com'),
('11223344556', 'Karolina', 'Szymañska', '912233445', 'karolina.szymanska@example.com'),
('22334455667', 'Rafa³', 'WoŸniak', '223344556', 'rafal.wozniak@example.com'),
('33445566778', 'Wiktoria', 'Jankowska', '334455667', 'wiktoria.jankowska@example.com'),
('44556677889', 'Tomasz', 'W³odarczyk', '445566778', 'tomasz.wlodarczyk@example.com'),
('55667788990', 'Kinga', 'Piotrowska', '556677889', 'kinga.piotrowska@example.com'),
('66778899001', '£ukasz', 'Grabowski', '667788990', 'lukasz.grabowski@example.com'),
('77889900112', 'Oliwia', 'Nowicka', '778899001', 'oliwia.nowicka@example.com'),
('88990011223', 'Adam', 'Kowalewski', '889900112', 'adam.kowalewski@example.com'),
('99001122334', 'Monika', 'Jab³oñska', '990011223', 'monika.jablonska@example.com'),
('00112233445', 'Micha³', 'Adamczyk', '001122334', 'michal.adamczyk@example.com'),
('11223344557', 'Karolina', 'Szymañska', '112233445', 'karolina.szymanska2@example.com'),
('21098765432', 'Marek', 'Kwiatkowski', '210987654', 'marek.kwiatkowski@example.com'),
('32109876543', 'Agnieszka', 'Kaczmarek', '321098765', 'agnieszka.kaczmarek@example.com'),
('43210987654', 'Grzegorz', 'Zalewski', '432109876', 'grzegorz.zalewski@example.com'),
('54321098765', 'Dominika', 'Sikorska', '543210987', 'dominika.sikorska@example.com'),
('65432109876', 'Patryk', 'Krajewski', '654321098', 'patryk.krajewski@example.com'),
('76543210987', 'Nina', 'Witkowska', '765432109', 'nina.witkowska@example.com'),
('87654321098', 'Artur', 'Olejnik', '876543210', 'artur.olejnik@example.com'),
('98765432109', 'Monika', 'Stêpieñ', '987654321', 'monika.stepien@example.com'),
('09876543210', 'Kamil', 'Czarnecki', '098765432', 'kamil.czarnecki@example.com'),
('54321012345', 'Aleksandra', 'Kwiatkowska', '543210123', 'aleksandra.kwiatkowska@example.com'),
('65432123456', 'Jakub', 'Nowicki', '654321234', 'jakub.nowicki@example.com'),
('76543234567', 'Hanna', 'Lis', '765432345', 'hanna.lis@example.com'),
('87654345678', 'Mateusz', 'Wawrzyniak', '876543456', 'mateusz.wawrzyniak@example.com'),
('98765456789', 'Marta', 'Kowal', '987654567', 'marta.kowal@example.com'),
('09876567890', 'Kacper', 'Józefowicz', '098765678', 'kacper.jozefowicz@example.com'),
('10987678901', 'Dominik', 'Sobczak', '109876789', 'dominik.sobczak@example.com'),
('21098789012', 'Paulina', 'Mazurek', '210987890', 'paulina.mazurek@example.com'),
('32109890123', 'Adrian', 'Ostrowski', '321098901', 'adrian.ostrowski@example.com'),
('43210901234', 'Nikola', 'Dudek', '432109012', 'nikola.dudek@example.com'),
('54321912345', 'Iga', 'Ko³odziej', '543219123', 'iga.kolodziej@example.com'),
('45267314331','Maciek', 'Pude³ko', '123465213', 'maciekpudlo@example.com');


INSERT INTO Uczestnicy (ID_Uczestnika)
VALUES
('12345678901'),
('23456789012'),
('34567890123'),
('45678901234'),
('56789012345'),
('67890123456'),
('78901234567'),
('89012345678'),
('90123456789'),
('11223344556'),
('65432123456'),
('76543234567'),
('87654345678'),
('98765456789'),
('09876567890'),
('10987678901'),
('21098789012'),
('32109890123'),
('43210901234'),
('54321912345');

INSERT INTO Goœcie_specjalni (ID_Goœcia, Firma, Stanowisko)
VALUES
('11223344557', 'Software Innovators', 'Architekt Oprogramowania'),
('22334455667', 'Data Science Solutions', 'Analityk Danych'),
('33445566778', 'Cyber Security Experts', 'Specjalista ds. Bezpieczeñstwa'),
('44556677889', 'Green Energy Solutions', 'In¿ynier Energii Odnawialnej'),
('55667788990', 'Financial Consultants', 'Doradca Finansowy'),
('66778899001', 'Marketing Mavericks', 'Specjalista ds. Marketingu'),
('77889900112', 'HealthTech Visionaries', 'Innowator ds. Technologii Medycznych'),
('88990011223', 'Manufacturing Excellence', 'Kierownik Produkcji'),
('99001122334', 'Human Resources Dynamics', 'Specjalista ds. Zasobów Ludzkich'),
('00112233445', 'Creative Design Studios', 'Projektant Kreatywny');



INSERT INTO Prowadz¹cy (ID_Prowadz¹cego, Data_zatrudnienia, Data_zwolnienia)
VALUES
('21098765432', '2019-01-01',NULL),
('32109876543', '2019-02-15',NULL),
('43210987654', '2019-04-30',NULL),
('54321098765', '2019-06-10',NULL),
('65432109876', '2019-08-25',NULL),
('76543210987', '2019-10-07',NULL),
('87654321098', '2020-01-15',NULL),
('98765432109', '2020-03-20',NULL),
('09876543210', '2020-05-02',NULL),
('54321012345', '2021-01-10',NULL),
('45267314331','2019-03-06','2021-06-06');


INSERT INTO Szkolenia (Nazwa_Szkolenia, ID_Prowadz¹cego, Opis, Liczba_zajêæ, Iloœæ_miejsc, Oœrodek)
VALUES
('Programowanie od Podstaw', '21098765432', 'Podstawy programowania dla pocz¹tkuj¹cych', 10, 20, 'BitCode'),
('Kurs Finansowy dla Firm', '32109876543', 'Finanse i ksiêgowoœæ dla przedsiêbiorstw', 12, 25, 'FinansePlus'),
('Angielski Biznesowy', '43210987654', 'Kurs jêzykowy z zakresu biznesu', 15, 30, 'LingoMasters'),
('Podstawy Medycyny', '54321098765', 'Wprowadzenie do podstaw medycznych', 8, 18, 'MedCare'),
('Badania Naukowe w Praktyce', '65432109876', 'Praktyczne aspekty prowadzenia badañ naukowych', 10, 20, 'ScienceHub'),
('Sztuka Grafiki Komputerowej', '76543210987', 'Tworzenie grafiki komputerowej i design', 14, 28, 'CreativeStudio'),
('Zarz¹dzanie Projektem Biznesowym', '87654321098', 'Techniki zarz¹dzania projektami w biznesie', 12, 25, 'BizPro'),
('Nowoczesne Technologie IT', '98765432109', 'Przegl¹d nowoczesnych technologii informatycznych', 10, 20, 'TechForge'),
('Szkolenie Kreatywne dla Artystów', '09876543210', 'Rozwijanie kreatywnoœci w dziedzinie sztuki', 15, 30, 'InnoSpace'),
('Planowanie Projektów w Praktyce', '54321012345', 'Efektywne planowanie i realizacja projektów', 8, 18, 'ProPlan'),
('Programowanie Dla Wtajemniczonych','21098765432', 'Kurs programowania dla bardziej doœwiadczonych osób',6,16,'BitCode');

INSERT INTO Terminy (ID_Terminu, Nazwa_Szkolenia, Data_rozpoczêcia, Data_zakoñczenia, Odwo³any)
VALUES
(1, 'Programowanie od Podstaw', '2022-02-01', '2022-02-10', 0),
(2, 'Kurs Finansowy dla Firm', '2022-02-15', '2022-02-24', 0),
(3, 'Angielski Biznesowy', '2022-03-01', '2022-03-10', 0),
(4, 'Podstawy Medycyny', '2022-03-15', '2022-03-24', 0),
(5, 'Badania Naukowe w Praktyce', '2022-04-01', '2022-04-10', 0),
(6, 'Sztuka Grafiki Komputerowej', '2022-04-15', '2022-04-24', 0),
(7, 'Zarz¹dzanie Projektem Biznesowym', '2022-05-01', '2022-05-10', 0),
(8, 'Nowoczesne Technologie IT', '2022-05-15', '2022-05-24', 0),
(9, 'Szkolenie Kreatywne dla Artystów', '2022-06-01', '2022-06-10', 0),
(10, 'Planowanie Projektów w Praktyce', '2022-06-15', '2022-06-24', 0),
(11, 'Szkolenie Kreatywne dla Artystów', '2022-07-01', '2022-07-10', 0),
(12, 'Nowoczesne Technologie IT', '2022-07-15', '2022-07-24', 0),
(13, 'Zarz¹dzanie Projektem Biznesowym', '2022-08-01', '2022-08-10', 0),
(14, 'Sztuka Grafiki Komputerowej', '2022-08-15', '2022-08-24', 0),
(15, 'Badania Naukowe w Praktyce', '2022-09-01', '2022-09-10', 0),
(16, 'Planowanie Projektów w Praktyce', '2022-09-15', '2022-09-24', 0),
(17, 'Podstawy Medycyny', '2022-10-01', '2022-10-10', 0),
(18, 'Angielski Biznesowy', '2022-10-15', '2022-10-24', 0),
(19, 'Kurs Finansowy dla Firm', '2022-11-01', '2022-11-10', 0),
(20, 'Programowanie od Podstaw', '2022-11-15', '2022-11-24', 0);


INSERT INTO Plan_Zajêæ (ID_Zajêcia, ID_Terminu, ID_SALI, Data, Godzina_rozpoczêcia, Godzina_zakoñczenia, Odwo³ane)
VALUES
(1, 1, 1, '2022-02-01', '10:00:00', '12:00:00', 0),
(2, 2, 2, '2022-02-16', '11:30:00', '13:30:00', 0),
(3, 3, 3, '2022-03-02', '14:00:00', '16:00:00', 0),
(4, 4, 4, '2022-03-17', '15:30:00', '17:30:00', 0),
(5, 5, 5, '2022-04-02', '08:00:00', '10:00:00', 0),
(6, 6, 6, '2022-04-17', '09:30:00', '11:30:00', 0),
(7, 7, 7, '2022-05-02', '13:00:00', '15:00:00', 0),
(8, 8, 8, '2022-05-17', '14:30:00', '16:30:00', 0),
(9, 9, 9, '2022-06-02', '17:00:00', '19:00:00', 0),
(10, 10, 10, '2022-06-17', '18:30:00', '20:30:00', 0),
(11, 11, 1, '2022-07-01', '10:00:00', '12:00:00', 0),
(12, 12, 2, '2022-07-16', '11:30:00', '13:30:00', 0),
(13, 13, 3, '2022-08-02', '14:00:00', '16:00:00', 0),
(14, 14, 4, '2022-08-17', '15:30:00', '17:30:00', 0),
(15, 15, 5, '2022-09-02', '08:00:00', '10:00:00', 0),
(16, 16, 6, '2022-09-17', '09:30:00', '11:30:00', 0),
(17, 17, 7, '2022-10-02', '13:00:00', '15:00:00', 0),
(18, 19, 8, '2022-11-01', '14:30:00', '16:30:00', 0),
(19, 19, 9, '2022-11-02', '14:30:00', '17:00:00', 0),
(20, 19, 10, '2022-11-03', '18:00:00', '20:30:00', 1);

INSERT INTO Przydzielenie (ID_Uczestników, ID_Terminu)
VALUES 
('12345678901',1),
('23456789012',2),
('34567890123',3),
('45678901234',4),
('56789012345',5),
('67890123456',6),
('78901234567',7),
('89012345678',8),
('90123456789',9),
('11223344556',10),
('12345678901',10),
('23456789012',9),
('34567890123',8),
('45678901234',7),
('56789012345',6),
('67890123456',5),
('78901234567',4),
('89012345678',3),
('90123456789',2),
('11223344556',1),
('65432123456',11),
('76543234567',12),
('87654345678',13),
('98765456789',14),
('09876567890',15),
('10987678901',16),
('21098789012',17),
('32109890123',18),
('43210901234',19),
('54321912345',17),
('12345678901',4),
('23456789012',4),
('34567890123',4);


