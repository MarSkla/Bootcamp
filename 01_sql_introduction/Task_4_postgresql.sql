
 
--1. Załóż bazę o nazwie: Lista Prezentów.
--created in Terminal with CREATE DATABASE and connected with \c

--2. Załóż tabele o nazwie: Prezenty_2020.
CREATE TABLE presents_2020 ();

/*
3. Utwórz 5 kolumn a także dobierz i ustaw dla każdej CONSTRAINTS:
    - ID
    - Imię obdarowanego
    - Pomysł na prezent
    - Cena
    - Miejsce zakupu
*/
ALTER TABLE presents_2020
ADD COLUMN id SERIAL PRIMARY KEY,
ADD COLUMN first_name CHAR(16) NOT NULL,
ADD COLUMN idea TEXT UNIQUE,
ADD COLUMN price MONEY CHECK (price BETWEEN 20::money AND 50::money),
ADD COLUMN place_purchase VARCHAR(64);

--4. Wprowadź dane osób dla których kupujesz świąteczne prezenty(min. 5). Każda pozycja ma mieć wypełnione wszystkie dane zgodnie z wymaganiem).
INSERT INTO PRESENTS_2020 (first_name, idea, price, place_purchase)
VALUES 
    ('Ania', 'New York Times Best Seller Book', 49.99, 'Świat Książki'),
    ('Hania', 'scarf', 45.00, 'gustgust.com'),
    ('Mania', 'easel', 32, 'allegro.pl' ),
    ('Mietek', 'toolbox', 29.1, 'Leroy Merlin'),
    ('Zbyszek', 'tie', 37, 'tieshop.com'),
    ('Czesiek', 'Rammstein Live in Moscow', 49, 'blueray.com');

--5. Sprawdź czy wszystkie dane wyświetlają się prawidłowo.
SELECT *
FROM presents_2020;

--6. Zmień pomysł na prezent dla osoby zapisanej w pozycji 3 na wartość „Rower”.
UPDATE presents_2020 
SET idea = 'bicycle'
WHERE id = 3;

--7. Sprawdź czy dane zostały zmienione wyświetlając tylko tą pozycję.
SELECT *
FROM presents_2020 WHERE idea = 'bicycle';

--8. Usuń pozycje 1.
DELETE FROM presents_2020
WHERE id = 1;

--9. Sprawdź czy dane zostały zmienione, zwróć uwagę co się zmieniło w kolumnie ID.
SELECT *
FROM presents_2020
ORDER BY id;

--10. Usuń kolumnę o nazwie Miejsce zakupu.
ALTER TABLE presents_2020 
DROP COLUMN place_purchase;

--11. Wyświetl zawartość kolumny Imię obdarowanego dla pozycji 3,4,5  i sprawdź czy dane są prawidłowe.
SELECT first_name
FROM presents_2020
WHERE id IN (3, 4, 5)
ORDER BY id;
