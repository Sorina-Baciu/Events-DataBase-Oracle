CREATE TABLE angajatii (
    id_angajat NUMBER(12) NOT NULL,
    nume_angajat VARCHAR(30),
    prenume_angajat VARCHAR(30),
    email VARCHAR(50),
    telefon VARCHAR(10),
    id_functie NUMBER(12),
    id_sala NUMBER(12)
);

CREATE TABLE functii_angajati (
    id_functie NUMBER(12) NOT NULL,
    denumire_functie VARCHAR(30),
    salariu_baza NUMBER(10)
);

CREATE TABLE clientii (
    id_client NUMBER(12) NOT NULL,
    nume_client VARCHAR(30),
    prenume_client VARCHAR(30),
    data_nasterii DATE,
    telefon VARCHAR(10),
    email VARCHAR(50),
    id_abonament NUMBER(12)
);

CREATE TABLE sali (
    id_sala NUMBER(12) NOT NULL,
    oras VARCHAR(20),
    locatie VARCHAR(50),
    telefon VARCHAR(10),
    capacitate NUMBER(5)
);

CREATE TABLE sali_clienti (
    id_sala NUMBER(12) NOT NULL,
    id_client NUMBER(12) NOT NULL
);

CREATE TABLE abonamente (
    id_abonament NUMBER(12) NOT NULL,
    tip VARCHAR(30),
    valabilitate NUMBER(10),
    id_client NUMBER(12),
    acces VARCHAR(15),
    pret NUMBER(7, 2),
    data_inceput DATE
);

--TABELA ANGAJATII
ALTER TABLE
    angajatii
ADD
    CONSTRAINT ag_id_angajat_PK PRIMARY KEY (id_angajat);

ALTER TABLE
    angajatii
ADD
    CONSTRAINT ag_id_functie_FK FOREIGN KEY (id_functie) REFERENCES functii_angajati(id_functie);

ALTER TABLE
    angajatii
ADD
    CONSTRAINT ag_id_sala_FK FOREIGN KEY (id_sala) REFERENCES sali (id_sala);

--TABELA FUNCTII_ANGAJATI 
ALTER TABLE
    functii_angajati
ADD
    CONSTRAINT fuc_id_functie_PK PRIMARY KEY (id_functie);

--TABELA CLIENTII
ALTER TABLE
    clientii
ADD
    CONSTRAINT cl_id_client_PK PRIMARY KEY (id_client);

ALTER TABLE
    clientii
ADD
    CONSTRAINT cl_id_abonament_FK FOREIGN KEY (id_abonament) REFERENCES abonamente (id_abonament);

--TABELA SALI
ALTER TABLE
    sali
ADD
    CONSTRAINT sali_id_sala_PK PRIMARY KEY (id_sala);

--TABELA SALI_CLIENTI
ALTER TABLE
    sali_clienti
ADD
    CONSTRAINT sali_clienti_PK PRIMARY KEY (id_sala, id_client);

ALTER TABLE
    sali_clienti
ADD
    CONSTRAINT sali_clienti_sala_FK FOREIGN KEY (id_sala) REFERENCES sali (id_sala);

ALTER TABLE
    sali_clienti
ADD
    CONSTRAINT sali_clienti_client_FK FOREIGN KEY (id_client) REFERENCES clientii (id_client);

--TABELA ABONAMENTE
ALTER TABLE
    abonamente
ADD
    CONSTRAINT abon_id_abonament_PK PRIMARY KEY (id_abonament);

ALTER TABLE
    abonamente
ADD
    CONSTRAINT abon_id_client_FK FOREIGN KEY (id_client) REFERENCES clienti (id_client);

ALTER TABLE
    angajatii disable CONSTRAINT ag_id_functie_FK;

ALTER TABLE
    angajatii disable CONSTRAINT ag_id_sala_FK;

ALTER TABLE
    clientii disable CONSTRAINT cl_id_abonament_FK;

ALTER TABLE
    abonamente disable CONSTRAINT abon_id_client_FK;

TRUNCATE TABLE angajatii;

TRUNCATE TABLE clientii;

TRUNCATE TABLE abonamente;

TRUNCATE TABLE sali;

TRUNCATE TABLE functii_angajati;

ALTER TABLE
    abonamente DROP COLUMN valabilitate;

ALTER TABLE
    abonamente
ADD
    valabilitate NUMBER(10);

ALTER TABLE
    functii_angajati
ADD
    studii VARCHAR(30);

ALTER TABLE
    clientii
ADD
    ocupatie VARCHAR(10);

ALTER TABLE
    abonamente
MODIFY
    valabilitate VARCHAR(30);

ALTER TABLE
    sali
MODIFY
    locatie VARCHAR(100);

ALTER TABLE
    abonamente
MODIFY
    pret NUMBER(7.2);

ALTER TABLE
    abonamente RENAME COLUMN valabilitate TO durata;

ALTER TABLE
    sali
ADD
    CONSTRAINT ck_cap CHECK (
        capacitate BETWEEN 100
        AND 150
    );

ALTER TABLE
    sali
MODIFY
    CONSTRAINT ck_cap disable;

ALTER TABLE
    sali DROP CONSTRAINT ck_cap;

ALTER TABLE
    abonamente
ADD
    CONSTRAINT abon_pret_CK CHECK (pret >= 0);

ALTER TABLE
    angajatii
ADD
    salariul NUMBER(10, 2);

--ADAUGARE INREGISTRARI
--tabela sali:
INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1001,
        'Ploiesti',
        'Bulevardul Republicii 17-25',
        '0344802806',
        150
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1002,
        'Cluj',
        'Aleea Bibliotecii, nr.10, parter, Maresti',
        '0726669636',
        160
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1003,
        'Bucuresti',
        'Bulevardul Chisinau numarul 1, etajul 1, Complex Delfinului, sector 2',
        '0727550569',
        150
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1004,
        'Bucuresti',
        'Str. Răcari nr. 5 (în spatele Kaufland )',
        '0727725000',
        200
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1005,
        'Bucuresti',
        ' Intrarea Scorușului 2,',
        '0216341145',
        100
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1006,
        'Brasov',
        ' str. Ferecz Szemler nr.14, cartier Astra',
        '0726800046',
        110
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1007,
        'Slatina',
        ' str. Milcov nr.1',
        '0234488250',
        90
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1008,
        'Arad',
        ' Calea Aurel Vlaicu 181-183, etaj 2',
        '0751496914',
        100
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1009,
        'Arad',
        ' 37, Calea Romanilor 35',
        '0257285048',
        150
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1010,
        'Timisoara',
        ' Bulevardul Cetății 97',
        '0356453124',
        150
    );

INSERT INTO
    sali (id_sala, oras, locatie, telefon, capacitate)
VALUES
    (
        1011,
        'Targu-Mures',
        ' Strada Mureș 132',
        '0335608874',
        100
    );

--tabela functii:
INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (1, 'Receptioner', 1600, 'medii');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (2, 'Contabil', 2000, 'superioare');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (3, 'Femeie de serviciu', 1500, 'nu conteaza');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (4, 'Antrenor', 3000, 'cursuri');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (5, 'Antrenor aerobic', 2500, 'cursuri');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (6, 'Antrenor cycling', 2500, 'cursuri');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (7, 'Antrenor dans', 2500, 'cursuri');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (8, 'Antrenor cardio', 2000, 'cursuri');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (9, 'Paznic', 1500, 'nu conteaza');

INSERT INTO
    functii_angajati (
        id_functie,
        denumire_functie,
        salariu_baza,
        studii
    )
VALUES
    (10, 'Administrator', 3500, 'superioare');

--tabela angajatii:
INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        101,
        'Ionescu',
        'Maria',
        'ionescu.maria@yahoo.com',
        '0726809965',
        2500,
        6,
        1003
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        102,
        'Ionescu',
        'Madalin',
        'madalin999@gmail.com',
        '0728830679',
        3100,
        4,
        1003
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        103,
        'Moise',
        'Andreea',
        'andreea_moise@yahoo.com',
        '0769605060',
        2000,
        1,
        1003
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        104,
        'Vasile',
        'Ioana',
        'ioanavasilee@gmail.com',
        '0725560965',
        1500,
        3,
        1003
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        105,
        'Marin',
        'Elena',
        'elena_maarin@yahoo.com',
        '0726837722',
        2500,
        2,
        1004
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        106,
        'Mihai',
        'George',
        'George0101@yahoo.com',
        '0724556022',
        2600,
        6,
        1004
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        107,
        'Iordache',
        'Claudiu',
        'claudiuu@yahoo.com',
        '0757040210',
        3500,
        10,
        1004
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        108,
        'Catalin',
        'Gabriel',
        'catalin_g@gmail.com',
        '072388760',
        3000,
        4,
        1006
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        109,
        'Manole',
        'Catalin',
        'manole_catalin@gmail.com',
        '0745664477',
        3500,
        4,
        1007
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        110,
        'Popa',
        'Alexandra',
        'alexandra2000@gmail.com',
        '0745664477',
        1700,
        1,
        1007
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        111,
        'Cristescu',
        'Octavian',
        'cristescu.o@gmail.com',
        '0769605655',
        3500,
        8,
        1009
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        112,
        'Radulescu ',
        'Cristina',
        'cristina21@yahoo.com',
        '0745999870',
        2500,
        5,
        1001
    );

INSERT INTO
    angajatii (
        id_angajat,
        nume_angajat,
        prenume_angajat,
        email,
        telefon,
        salariul,
        id_functie,
        id_sala
    )
VALUES
    (
        113,
        'Ciobanu ',
        'Radu',
        'ciobanu_r@yahoo.com',
        '0735667553',
        4000,
        5,
        1001
    );

--tabela clientii:
INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        1,
        'Grigore',
        'Gabriel',
        to_date('21.10.2000', 'dd.mm.yyyy'),
        '0721363726',
        NULL,
        'student'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        2,
        'Enoiu',
        'Livia',
        to_date('30.11.1976', 'dd.mm.yyyy'),
        '0723111555',
        'livia_enoiuu@yahoo.com',
        'altceva'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        3,
        'Mihai',
        'Madalin',
        to_date('05.10.1999', 'dd.mm.yyyy'),
        '0721363333',
        'mada.mih@gmail.com',
        'student'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        4,
        'Tanase',
        'Andra',
        to_date('21.02.2002', 'dd.mm.yyyy'),
        '0756623321',
        'tanaseandr@gmail.com',
        'elev'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        5,
        'Virgilescu',
        'Cristiana',
        to_date('25.11.2000', 'dd.mm.yyyy'),
        '0725889693',
        NULL,
        'student'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        6,
        'Mihai',
        'Virgil',
        to_date('19.05.2000', 'dd.mm.yyyy'),
        '0725885577',
        NULL,
        'altceva'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        7,
        'Teodorescu',
        'Liviu',
        to_date('25.05.1995', 'dd.mm.yyyy'),
        '0735446987',
        NULL,
        'student'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        8,
        'Cuza',
        'Bianca',
        to_date('04.11.2000', 'dd.mm.yyyy'),
        '0721145963',
        'cuza_bi00@yahoo.com',
        'altceva'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        9,
        'Preda',
        'Ioan',
        to_date('15.07.1966', 'dd.mm.yyyy'),
        '0726558720',
        NULL,
        'pensionar'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        10,
        'Gurau',
        'Marius',
        to_date('22.07.1999', 'dd.mm.yyyy'),
        '0725885564',
        'marius.gurau@gmail.com',
        'student'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        11,
        'Mihai',
        'Alexandru',
        to_date('12.07.2000', 'dd.mm.yyyy'),
        '0736547780',
        'alex.mihai@yahoo.com',
        'student'
    );

INSERT INTO
    clientii (
        id_client,
        nume_client,
        prenume_client,
        data_nasterii,
        telefon,
        email,
        ocupatie
    )
VALUES
    (
        12,
        'Costache',
        'Laura',
        to_date('25.11.1969', 'dd.mm.yyyy'),
        '0735944788',
        NULL,
        'pensionar'
    );

--tabela sali_clienti:
INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1001, 1);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1001, 2);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1002, 1);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1002, 2);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1002, 3);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1003, 4);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1003, 5);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1003, 6);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1004, 1);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1005, 10);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1005, 9);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1006, 5);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1007, 7);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1007, 8);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1007, 4);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1008, 10);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1008, 12);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1009, 11);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1010, 5);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1010, 10);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1011, 11);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1011, 9);

INSERT INTO
    sali_clienti (id_sala, id_client)
VALUES
    (1011, 6);

--tabela abonamente:
INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        11,
        'student',
        'o luna',
        11,
        'limitat',
        '100',
        to_date('20.01.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        12,
        'student',
        'o luna',
        10,
        'limitat',
        '100',
        to_date('22.01.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        13,
        'pensionar',
        'o luna',
        12,
        'nelimitat',
        '120',
        to_date('23.01.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        14,
        'student',
        'o luna',
        7,
        'limitat',
        '100',
        to_date('10.02.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        15,
        'student',
        'o luna',
        5,
        'limitat',
        '100',
        to_date('03.03.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        16,
        'pensionar',
        'o luna',
        9,
        'nelimitat',
        '120',
        to_date('12.04.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        17,
        'student',
        'trei luni',
        1,
        'nelimitat',
        '250',
        to_date('12.04.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        18,
        'normal',
        'o luna',
        2,
        'nelimitat',
        '150',
        to_date('12.04.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        19,
        'student',
        'o luna',
        3,
        'limitat',
        '100',
        to_date('03.05.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        20,
        'elev',
        'o luna',
        4,
        'limitat',
        '100',
        to_date('09.05.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        21,
        'normal',
        'sase luni',
        6,
        'nelimitat',
        '500',
        to_date('24.06.2020', 'dd.mm.yyyy')
    );

INSERT INTO
    abonamente (
        id_abonament,
        tip,
        durata,
        id_client,
        acces,
        pret,
        data_inceput
    )
VALUES
    (
        22,
        'normal',
        'o luna',
        8,
        'nelimitat',
        '150',
        to_date('26.06.2020', 'dd.mm.yyyy')
    );

ALTER TABLE
    angajatii
ADD
    data_angajare DATE;

UPDATE
    abonamente
SET
    pret = 98
WHERE
    tip = 'student'
    AND durata = 'o luna';

UPDATE
    angajatii
SET
    data_angajare = to_date('25.02.2019', 'dd.mm.yyyy')
WHERE
    nume_angajat = 'Cristescu';

UPDATE
    angajatii
SET
    data_angajare = to_date('20.09.2018', 'dd.mm.yyyy')
WHERE
    nume_angajat = 'Ionescu';

UPDATE
    angajatii
SET
    data_angajare = to_date('30.01.2020', 'dd.mm.yyyy')
WHERE
    nume_angajat = 'Popa';

UPDATE
    angajatii
SET
    data_angajare = to_date('12.05.2017', 'dd.mm.yyyy')
WHERE
    id_sala = 1001;

-- sa se micsoreze cu 10% preturile abonamentelor care sunt de tipul 'pensionar'
UPDATE
    abonamente
SET
    pret = pret * 0.9
WHERE
    tip = 'pensionar';

-- rotunjeste la o valoare(o treime din salariul angajatiilor) cu n = 2 zecimale
SELECT
    salariul,
    ROUND (salariul / 3, 2) treime_salariu
FROM
    angajatii;

-- se obtine o valoare(o treime din salariul angajatiilor) cu n zecimale, prin truncare
SELECT
    salariul,
    TRUNC (salariul / 3, 2) treime_salariu
FROM
    angajatii;

construim un email fromat din primele 3 litere ale prenumelui concatenate cu.,
primele 4 litere ale numelui
SELECT
    nume_angajat,
    prenume_angajat,
    concat(
        concat(
            concat(lower(substr(prenume_angajat, 1, 3)), '.'),
            lower(REPLACE(substr(nume_angajat, 1, 4), ' ', ''))
        ),
        '@yahoo.ro'
    ) email
FROM
    angajatii;

-- afiseaza clientii din categoria student
SELECT
    id_client,
    nume_client,
    prenume_client
FROM
    clientii
WHERE
    upper(ocupatie) = 'STUDENT'
GROUP BY
    id_client,
    nume_client,
    prenume_client;

-- afiseaza angajatii care au in denumirea functiei cuvantul 'Antrenor'
SELECT
    nume_angajat,
    prenume_angajat,
    denumire_functie
FROM
    angajatii an,
    functii_angajati f
WHERE
    an.id_functie = f.id_functie
    AND substr(denumire_functie, 1, 8) = 'Antrenor';

-- clientii care au prima litera din nume 'M' 
SELECT
    nume_client,
    prenume_client
FROM
    clientii
WHERE
    substr(nume_client, 1, 1) = 'M'
GROUP BY
    nume_client,
    prenume_client;

-- angajatii al caror numar de telefon incepe cu grupul de cifre '072'
SELECT
    nume_angajat,
    prenume_angajat,
    telefon
FROM
    angajatii
WHERE
    substr(telefon, 1, 3) = '072'
GROUP BY
    nume_angajat,
    prenume_angajat,
    telefon;

SELECT
    nume_angajat,
    data_angajare,
    round(months_between(SYSDATE, data_angajare) / 12, 2) vechime
FROM
    angajatii;

-- lungimea numelui si a prenumelui angajatilor
SELECT
    nume_angajat,
    prenume_angajat,
    LENGTH(nume_angajat),
    LENGTH(prenume_angajat)
FROM
    angajatii;

-- converteste caracterele mici in caractere mari
SELECT
    nume_angajat,
    prenume_angajat,
    upper(nume_angajat),
    upper(prenume_angajat)
FROM
    angajatii;

DATA actuala
SELECT
    SYSDATE
FROM
    dual;

-- converteste o valoare de tip data intrun sir de caractere ce are formatul specificat 'MM/YY'
SELECT
    nume_angajat,
    prenume_angajat,
    to_char(data_angajare, 'MM/YY') luna__angajare
FROM
    angajatii
WHERE
    nume_angajat = 'Ionescu';

-- afiseaza abonamentele care au fost incepute in luna aprilie si mai, anul 2020
SELECT
    *
FROM
    abonamente
WHERE
    EXTRACT(
        MONTH
        FROM
            data_inceput
    ) IN (4, 5)
    AND EXTRACT(
        YEAR
        FROM
            data_inceput
    ) = 2020;

SELECT
    nume_angajat,
    data_angajare,
    round(months_between(SYSDATE, data_angajare) / 12, 2) vechime
FROM
    angajatii;

-- data la care se termina abonamentele facute, la cei cu valabilitate de o luna (data_sfarsit)
SELECT
    id_abonament,
    data_inceput + 30 data_sfarsit
FROM
    abonamente
WHERE
    durata = 'o luna';

-- varsta angajati
SELECT
    nume_client,
    prenume_client data_nasterii,
    round(months_between(SYSDATE, data_nasterii) / 12, 2) varsta,
    EXTRACT (
        YEAR
        FROM
            SYSDATE
    ) - EXTRACT(
        YEAR
        FROM
            data_nasterii
    ) varsta_ani
FROM
    clientii
ORDER BY
    3 DESC;

-- clientii care si - au facut abonament in luna aprilie 2020
SELECT
    nume_client,
    prenume_client,
    data_inceput
FROM
    abonamente ab,
    clientii cl
WHERE
    EXTRACT(
        MONTH
        FROM
            data_inceput
    ) = 4
    AND EXTRACT(
        YEAR
        FROM
            data_inceput
    ) = 2020
    AND ab.id_client = cl.id_client;

-- afiseaza angajatii care au salariul intre 1700 si 3000 de lei
SELECT
    id_angajat,
    nume_angajat,
    prenume_angajat,
    salariul
FROM
    angajatii
HAVING
    salariul BETWEEN 1700
    AND 3000
GROUP BY
    id_angajat,
    nume_angajat,
    prenume_angajat,
    salariul
ORDER BY
    4;

-- salariul mediu al functiei care are in denumire 'Antrenor'
SELECT
    AVG(salariul) salariu_mediu
FROM
    angajatii an,
    functii_angajati f
WHERE
    an.id_functie = f.id_functie
    AND substr(denumire_functie, 1, 8) = 'Antrenor';

-- suma abonamentelor facute in luna aprilie, anul 2020
SELECT
    SUM(pret)
FROM
    abonamente
WHERE
    EXTRACT(
        MONTH
        FROM
            data_inceput
    ) = 4
    AND EXTRACT(
        YEAR
        FROM
            data_inceput
    ) = 2020;

-- functiile la care toti angajatii au salariul mai mic de 3000
SELECT
    ang.id_functie,
    denumire_functie,
    salariul
FROM
    angajatii ang,
    functii_angajati f
WHERE
    ang.id_functie = f.id_functie
HAVING
    MAX(salariul) < 30000
GROUP BY
    ang.id_functie,
    denumire_functie,
    salariul;

-- salile care au aceasi capcitate ca cea din Timisoara
SELECT
    id_sala,
    oras
FROM
    sali
WHERE
    capacitate = (
        SELECT
            capacitate
        FROM
            sali
        WHERE
            oras = 'Timisoara'
    );

-- abonamentele care au pretul minim
SELECT
    tip,
    durata,
    acces,
    pret
FROM
    abonamente
WHERE
    pret = (
        SELECT
            MIN(pret)
        FROM
            abonamente
    );

-- functiile la care toti angajatii au salariul mai mic de 3000
SELECT
    ang.id_functie,
    denumire_functie,
    salariul
FROM
    angajatii ang,
    functii_angajati f
WHERE
    ang.id_functie = f.id_functie
    AND ang.id_functie NOT IN (
        SELECT
            id_functie
        FROM
            angajatii
        WHERE
            salariul > 3000
    );

-- angajatii care au salariul mai mare decat al angajatului 'Catalin'
SELECT
    nume_angajat,
    prenume_angajat,
    salariul
FROM
    angajatii
WHERE
    salariul > (
        SELECT
            salariul
        FROM
            angajatii
        WHERE
            nume_angajat = 'Catalin'
    );

-- angajatii care au salariul peste cel mediu
SELECT
    nume_angajat,
    prenume_angajat,
    salariul
FROM
    angajatii
HAVING
    salariul > (
        SELECT
            AVG(salariul)
        FROM
            angajatii
    )
GROUP BY
    nume_angajat,
    prenume_angajat,
    salariul
ORDER BY
    3;

-- angajatii care au aceasi functie ca 'Ionescu Madalin'
SELECT
    nume_angajat,
    prenume_angajat
FROM
    angajatii
WHERE
    id_functie = (
        SELECT
            id_functie
        FROM
            angajatii
        WHERE
            nume_angajat = 'Ionescu'
            AND prenume_angajat = 'Madalin'
    );

-- de sarbatori, angajatii vor primi preme in functie de salariu astfel:
-- pentru angajatii cu salariul de 1500 => prema va fii de '200 lei'
-- pentru angajatii cu salariul intre 1500 si 2000 => prema va fii de '300 lei'
-- pentru angajatii cu salariul mai mare de 2000 => prema va fii de '400 lei'
SELECT
    nume_angajat,
    prenume_angajat,
    CASE
        WHEN salariul = 1500 THEN '200 lei '
        WHEN salariul BETWEEN 1500
        AND 2000 THEN '300 lei'
        WHEN salariul > 2000 THEN '400 lei'
    END AS prema_sarbatori
FROM
    angajatii;

-- afiseaza numai angajatii (nume_angajat si prenume_angajat) is orasul care nu lucreaza la salile din Bucuresti
SELECT
    nume_angajat,
    prenume_angajat,
    oras
FROM
    sali s,
    angajatii an
WHERE
    s.id_sala = an.id_sala
MINUS
SELECT
    nume_angajat,
    prenume_angajat,
    oras
FROM
    sali s,
    angajatii an
WHERE
    s.id_sala = an.id_sala
    AND oras = 'Bucuresti';

-- functiile la care toti angajatii au salariul mai mic de 3000
SELECT
    DISTINCT ang.id_functie,
    denumire_functie,
    salariul
FROM
    angajatii ang,
    functii_angajati f
WHERE
    ang.id_functie = f.id_functie
MINUS
SELECT
    DISTINCT ang.id_functie,
    denumire_functie,
    salariul
FROM
    angajatii ang,
    functii_angajati f
WHERE
    ang.id_functie = f.id_functie
    AND salariul >= 3000;

-- clientii care sunt studenti si fac sala in Bucuresti
SELECT
    nume_client,
    prenume_client,
    oras,
    ocupatie
FROM
    sali s,
    clientii cl
WHERE
    ocupatie = 'student'
INTERSECT
SELECT
    nume_client,
    prenume_client,
    oras,
    ocupatie
FROM
    sali s,
    clientii cl,
    sali_clienti scl
WHERE
    s.id_sala = scl.id_sala
    AND scl.id_client = cl.id_client
    AND oras = 'Bucuresti';

-- angajatii si clientii al caror prenume incep cu litera A
SELECT
    nume_angajat,
    prenume_angajat
FROM
    angajatii
WHERE
    substr(prenume_angajat, 1, 1) = 'A'
UNION
SELECT
    nume_client,
    prenume_client
FROM
    clientii
WHERE
    substr(prenume_client, 1, 1) = 'A';

-- jonctiune totala in sintaxa Oracle ( union )
SELECT
    ang.id_functie,
    nume_angajat,
    denumire_functie
FROM
    angajatii ang,
    functii_angajati f
WHERE
    ang.id_functie = f.id_functie(+)
UNION
SELECT
    ang.id_functie,
    nume_angajat,
    denumire_functie
FROM
    angajatii ang,
    functii_angajati f
WHERE
    ang.id_functie(+) = f.id_functie;

-- jonctiunea totala in sintaxa ANSI
SELECT
    ang.id_functie,
    nume_angajat,
    denumire_functie
FROM
    angajatii ang FULL
    OUTER JOIN functii_angajati f ON ang.id_functie = f.id_functie;

-- tabela virtuala, ce contine angajatii care au salariul mai mare de 3000 
CREATE
OR REPLACE VIEW angajatii_3k AS
SELECT
    *
FROM
    angajatii
WHERE
    salariul > 3000 WITH READ ONLY;

-- tabela virtuala, ce contine clientii care sunt studenti 
CREATE
OR REPLACE VIEW clientii_s AS
SELECT
    *
FROM
    clientii
WHERE
    ocupatie = 'student' WITH CHECK OPTION;

-- clientii din tablea virtuala, care sunt nascutii in luna iulie
SELECT
    *
FROM
    clientii_s
WHERE
    EXTRACT(
        MONTH
        FROM
            data_nasterii
    ) = 7;

-- pentru a putea face operatii cu datele tabelei angajatii_3k trebuie sa schimbam permisiunea IN CHECK OPTION 
CREATE
OR REPLACE VIEW angajatii_3k AS
SELECT
    *
FROM
    angajatii
WHERE
    salariul > 3000 WITH CHECK OPTION;

-- salariul se va mari cu 10 %
UPDATE
    angajatii_3k
SET
    salariul = salariul * 1.1;

-- stergerm tabelele virtuale create
DROP VIEW angajatii_3k;

DROP VIEW clientii_s;

-- sinonimul pentru tabela functii_angajati va fii 'fa'
CREATE SYNONYM fa FOR functii_angajati;

SELECT
    *
FROM
    fa;

DROP SYNONYM fa;

-- verificam daca mai avem indecsi
SELECT
    *
FROM
    user_indexes
WHERE
    table_name = 'CLIENTIi';

-- crearea unui indecs 
CREATE INDEX nume_client_idxx ON clientii (initcap(nume_client));

-- stergerea indecsului creat 
DROP INDEX nume_client_idxx;

SELECT
    *
FROM
    user_sequences;

--crearea unei secvente
CREATE SEQUENCE secv
START WITH
    20 increment BY 1 maxvalue 100 nocycle;