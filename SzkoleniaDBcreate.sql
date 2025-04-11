
CREATE TABLE Ludzie (
    PESEL VARCHAR(11) PRIMARY KEY CHECK (LEN(PESEL) = 11),
    Imi� VARCHAR(255) NOT NULL,
    Nazwisko VARCHAR(255) NOT NULL,
    Telefon VARCHAR(20) UNIQUE,
    E_mail VARCHAR(255) UNIQUE
);

CREATE TABLE Prowadz�cy (
    ID_Prowadz�cego VARCHAR(11) PRIMARY KEY,
    Data_zatrudnienia DATE NOT NULL CHECK (Data_zatrudnienia > '1753-01-01'),
    Data_zwolnienia DATE DEFAULT NULL CHECK (Data_zwolnienia IS NULL OR Data_zwolnienia > '1753-01-01'),
    FOREIGN KEY (ID_Prowadz�cego) REFERENCES Ludzie(PESEL)
);

CREATE TABLE Uczestnicy (
    ID_Uczestnika VARCHAR(11) PRIMARY KEY,
    FOREIGN KEY (ID_Uczestnika) REFERENCES Ludzie(PESEL)
);

CREATE TABLE Go�cie_specjalni (
    ID_Go�cia VARCHAR(11) PRIMARY KEY,
    Firma VARCHAR(255),
    Stanowisko VARCHAR(255),
    FOREIGN KEY (ID_Go�cia) REFERENCES Ludzie(PESEL)
);

CREATE TABLE O�rodki (
    Nazwa_O�rodka VARCHAR(255) PRIMARY KEY,
    Ulica VARCHAR(255),
    Kod_pocztowy VARCHAR(10),
    Opis TEXT
);

CREATE TABLE Sale (
    ID_Sali INT PRIMARY KEY,
    Numer INT NOT NULL,
    Pi�tro INT NOT NULL,
    Liczba_miejsc INT NOT NULL,
    O�rodek VARCHAR(255) NOT NULL,
    Czynna BIT DEFAULT 0,
    FOREIGN KEY (O�rodek) REFERENCES O�rodki(Nazwa_O�rodka)
);

CREATE TABLE Szkolenia (
    Nazwa_Szkolenia VARCHAR(255) PRIMARY KEY,
    ID_Prowadz�cego VARCHAR(11),
    Opis TEXT,
    Liczba_zaj�� INT,
    Ilo��_miejsc INT,
    O�rodek VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Prowadz�cego) REFERENCES Prowadz�cy(ID_Prowadz�cego),
    FOREIGN KEY (O�rodek) REFERENCES O�rodki(Nazwa_O�rodka)
);

CREATE TABLE Terminy (
    ID_Terminu INT PRIMARY KEY,
    Nazwa_Szkolenia VARCHAR(255),
    Data_rozpocz�cia DATE NOT NULL,
    Data_zako�czenia DATE NOT NULL,
    Odwo�any BIT DEFAULT 0,
    FOREIGN KEY (Nazwa_Szkolenia) REFERENCES Szkolenia(Nazwa_Szkolenia) ON UPDATE CASCADE
);

CREATE TABLE Plan_Zaj�� (
    ID_Zaj�cia INT PRIMARY KEY,
    ID_Terminu INT NOT NULL,
    ID_SALI INT NOT NULL,
    Data DATE NOT NULL,
    Godzina_rozpocz�cia TIME NOT NULL CHECK (Godzina_rozpocz�cia >= '00:00:00' AND Godzina_rozpocz�cia < '23:59:59'),
    Godzina_zako�czenia TIME NOT NULL CHECK (Godzina_zako�czenia >= '00:00:00' AND Godzina_zako�czenia < '23:59:59'),
    Odwo�ane BIT DEFAULT 0,
    ID_Go�cia VARCHAR(11) NULL,
    Numer_zaj�� INT,
    FOREIGN KEY (ID_Terminu) REFERENCES Terminy(ID_Terminu),
    FOREIGN KEY (ID_SALI) REFERENCES Sale(ID_Sali),
    FOREIGN KEY (ID_Go�cia) REFERENCES Go�cie_specjalni(ID_Go�cia)
);

CREATE TABLE Przydzielenie (
    ID_Uczestnik�w VARCHAR(11),
    ID_Terminu INT NOT NULL,
    PRIMARY KEY (ID_Uczestnik�w, ID_Terminu),
    FOREIGN KEY (ID_Uczestnik�w) REFERENCES Uczestnicy(ID_Uczestnika),
    FOREIGN KEY (ID_Terminu) REFERENCES Terminy(ID_Terminu) ON DELETE CASCADE
);

ALTER TABLE Szkolenia
ADD CONSTRAINT FK_Szkolenia_ID_Prowadzacego
FOREIGN KEY (ID_Prowadz�cego) REFERENCES Prowadz�cy(ID_Prowadz�cego)
ON DELETE CASCADE;

ALTER TABLE Terminy
ADD CONSTRAINT FK_Terminy_Nazwa_Szkolenia
FOREIGN KEY (Nazwa_Szkolenia) REFERENCES Szkolenia(Nazwa_Szkolenia)
ON DELETE CASCADE;

ALTER TABLE Plan_Zaj��
ADD CONSTRAINT FK_Plan_Zaj��_ID_Terminu
FOREIGN KEY (ID_Terminu) REFERENCES Terminy(ID_Terminu)
ON DELETE CASCADE;

ALTER TABLE Plan_Zaj��
ADD CONSTRAINT FK_Plan_Zaj��_ID_SALI
FOREIGN KEY (ID_SALI) REFERENCES Sale(ID_Sali)
ON DELETE CASCADE;

ALTER TABLE Plan_Zaj��
ADD CONSTRAINT FK_Plan_Zaj��_ID_Go�cia
FOREIGN KEY (ID_Go�cia) REFERENCES Go�cie_specjalni(ID_Go�cia)
ON DELETE CASCADE;