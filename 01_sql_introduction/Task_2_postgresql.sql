-- first task was to install sql database and sql editor


--1. Stwórz bazę danych
CREATE DATABASE task_1;

/*
* 2. Stwórz tabelę nazwaną Biblioteczka z trzema kolumnami:
    - id, który przechowuje INTEGER - CONSTRAINTS
    - Tytuł, która przechowuje TEXT
    - Data zakupu, które przechowuje DATA
 */
CREATE TABLE biblioteczka (
    id INT UNIQUE,
    title TEXT NOT NULL,
    purchase_date DATE NOT NULL
    );

--3. Dodaj książkę o Twoim ulubionym tytule do Biblioteczki wraz z pozostałymi danymi.
INSERT INTO biblioteczka (id, title, purchase_date)
VALUES (1, 'Szewc z Lichtenrade', '2005-10-13');


--4. Sprawdź czy książka została dodana do bazy danych, sprawdź czy dane są prawidłowe.
SELECT *
FROM biblioteczka;

--5. Dodaj kolejne dwie ulubione książki do Biblioteczki wraz z identyfikatorem (wg. kolejności którą najbardziej lubisz) i pozostałymi danymi.
INSERT INTO biblioteczka (id, title, purchase_date)
VALUES
    (2, 'Seven', '2010-03-06'),
    (3, 'Wojna futbolowa', '2018-09-09');

--6. Zmień ulubioną książkę na książkę która najmniej Ci się podoba. Zaktualizujcie tą pozycję.
UPDATE biblioteczka 
SET title = 'Nad Niemnem', purchase_date = '2009-12-12'
WHERE id = 1;

--7. Dodaj nową kolumnę o nazwie Autor.
ALTER TABLE biblioteczka 
ADD COLUMN author TEXT DEFAULT 'who knows' NOT NULL; -- DEFAULT required due to NOT NULL CONSTRAINT

--8. Uzupełnij kolumnę Autor danymi dla wszystkich pozycji.
UPDATE biblioteczka 
SET author = 'Eliza Orzeszkowa' WHERE id = 1;

UPDATE biblioteczka 
SET author = 'Anthony Bruno'
WHERE id = 2;

UPDATE biblioteczka 
SET author = 'Ryszard Kapuścinski'
WHERE id = 3;

--9. Usuń pozycje z ulubionymi książkami.
DELETE FROM biblioteczka 
WHERE id IN (2,3);

--10. Sprawdź dane autora dla pozycji która została w bazie
SELECT author 
FROM biblioteczka;


