
CREATE TABLE Ludzie (
    PESEL VARCHAR(11) PRIMARY KEY CHECK (LEN(PESEL) = 11),
    Imiê VARCHAR(255) NOT NULL,
    Nazwisko VARCHAR(255) NOT NULL,
    Telefon VARCHAR(20) UNIQUE,
    E_mail VARCHAR(255) UNIQUE
);

CREATE TABLE Prowadz¹cy (
    ID_Prowadz¹cego VARCHAR(11) PRIMARY KEY,
    Data_zatrudnienia DATE NOT NULL CHECK (Data_zatrudnienia > '1753-01-01'),
    Data_zwolnienia DATE DEFAULT NULL CHECK (Data_zwolnienia IS NULL OR Data_zwolnienia > '1753-01-01'),
    FOREIGN KEY (ID_Prowadz¹cego) REFERENCES Ludzie(PESEL)
);

CREATE TABLE Uczestnicy (
    ID_Uczestnika VARCHAR(11) PRIMARY KEY,
    FOREIGN KEY (ID_Uczestnika) REFERENCES Ludzie(PESEL)
);

CREATE TABLE Goœcie_specjalni (
    ID_Goœcia VARCHAR(11) PRIMARY KEY,
    Firma VARCHAR(255),
    Stanowisko VARCHAR(255),
    FOREIGN KEY (ID_Goœcia) REFERENCES Ludzie(PESEL)
);

CREATE TABLE Oœrodki (
    Nazwa_Oœrodka VARCHAR(255) PRIMARY KEY,
    Ulica VARCHAR(255),
    Kod_pocztowy VARCHAR(10),
    Opis TEXT
);

CREATE TABLE Sale (
    ID_Sali INT PRIMARY KEY,
    Numer INT NOT NULL,
    Piêtro INT NOT NULL,
    Liczba_miejsc INT NOT NULL,
    Oœrodek VARCHAR(255) NOT NULL,
    Czynna BIT DEFAULT 0,
    FOREIGN KEY (Oœrodek) REFERENCES Oœrodki(Nazwa_Oœrodka)
);

CREATE TABLE Szkolenia (
    Nazwa_Szkolenia VARCHAR(255) PRIMARY KEY,
    ID_Prowadz¹cego VARCHAR(11),
    Opis TEXT,
    Liczba_zajêæ INT,
    Iloœæ_miejsc INT,
    Oœrodek VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Prowadz¹cego) REFERENCES Prowadz¹cy(ID_Prowadz¹cego),
    FOREIGN KEY (Oœrodek) REFERENCES Oœrodki(Nazwa_Oœrodka)
);

CREATE TABLE Terminy (
    ID_Terminu INT PRIMARY KEY,
    Nazwa_Szkolenia VARCHAR(255),
    Data_rozpoczêcia DATE NOT NULL,
    Data_zakoñczenia DATE NOT NULL,
    Odwo³any BIT DEFAULT 0,
    FOREIGN KEY (Nazwa_Szkolenia) REFERENCES Szkolenia(Nazwa_Szkolenia) ON UPDATE CASCADE
);

CREATE TABLE Plan_Zajêæ (
    ID_Zajêcia INT PRIMARY KEY,
    ID_Terminu INT NOT NULL,
    ID_SALI INT NOT NULL,
    Data DATE NOT NULL,
    Godzina_rozpoczêcia TIME NOT NULL CHECK (Godzina_rozpoczêcia >= '00:00:00' AND Godzina_rozpoczêcia < '23:59:59'),
    Godzina_zakoñczenia TIME NOT NULL CHECK (Godzina_zakoñczenia >= '00:00:00' AND Godzina_zakoñczenia < '23:59:59'),
    Odwo³ane BIT DEFAULT 0,
    ID_Goœcia VARCHAR(11) NULL,
    Numer_zajêæ INT,
    FOREIGN KEY (ID_Terminu) REFERENCES Terminy(ID_Terminu),
    FOREIGN KEY (ID_SALI) REFERENCES Sale(ID_Sali),
    FOREIGN KEY (ID_Goœcia) REFERENCES Goœcie_specjalni(ID_Goœcia)
);

CREATE TABLE Przydzielenie (
    ID_Uczestników VARCHAR(11),
    ID_Terminu INT NOT NULL,
    PRIMARY KEY (ID_Uczestników, ID_Terminu),
    FOREIGN KEY (ID_Uczestników) REFERENCES Uczestnicy(ID_Uczestnika),
    FOREIGN KEY (ID_Terminu) REFERENCES Terminy(ID_Terminu) ON DELETE CASCADE
);

ALTER TABLE Szkolenia
ADD CONSTRAINT FK_Szkolenia_ID_Prowadzacego
FOREIGN KEY (ID_Prowadz¹cego) REFERENCES Prowadz¹cy(ID_Prowadz¹cego)
ON DELETE CASCADE;

ALTER TABLE Terminy
ADD CONSTRAINT FK_Terminy_Nazwa_Szkolenia
FOREIGN KEY (Nazwa_Szkolenia) REFERENCES Szkolenia(Nazwa_Szkolenia)
ON DELETE CASCADE;

ALTER TABLE Plan_Zajêæ
ADD CONSTRAINT FK_Plan_Zajêæ_ID_Terminu
FOREIGN KEY (ID_Terminu) REFERENCES Terminy(ID_Terminu)
ON DELETE CASCADE;

ALTER TABLE Plan_Zajêæ
ADD CONSTRAINT FK_Plan_Zajêæ_ID_SALI
FOREIGN KEY (ID_SALI) REFERENCES Sale(ID_Sali)
ON DELETE CASCADE;

ALTER TABLE Plan_Zajêæ
ADD CONSTRAINT FK_Plan_Zajêæ_ID_Goœcia
FOREIGN KEY (ID_Goœcia) REFERENCES Goœcie_specjalni(ID_Goœcia)
ON DELETE CASCADE;