--Załóż bazę o nazwie: Moje zainteresowania.
--as previously, created in Terminal

--Załóż tabele o nazwie: Zainteresowanie.
CREATE TABLE interests();

--Utwórz 5 kolumn a także dobierz i ustaw dla każdej CONSTRAINTS:
ALTER TABLE interests
ADD COLUMN id SERIAL PRIMARY KEY,
ADD COLUMN interest_type VARCHAR(64) NOT NULL UNIQUE,
ADD COLUMN description VARCHAR(128) NOT NULL,
ADD COLUMN implementation_date char(4) DEFAULT date_part('year', current_date) + 1;

--Wprowadź dane dla kolumn: Nazwa i Opis. (Min 5 pozycji)
INSERT INTO interests (interest_type, description) 
VALUES 
    ('sailing', 'renting sloop to have few days off in Masuria and Baltic Sea'),
    ('city breaks', 'meeting new coultures and local cuisine'),
    ('hiking', 'feeling wildness'),
    ('new technologies', 'it started years ago with Sinclair Timex 2048 and Basic'),
    ('english Premier League', ' watching classic clashes is refreshing');

--Sprawdź czy wszystkie dane wyświetlają się prawidłowo i co pojawia się w kolumnie ID i Data realizacji.
SELECT *
FROM interests;

--Dodaj nową pozycje wypełniając wszystkie dane.
INSERT INTO interests (interest_type, description, implementation_date)
VALUES ('books', 'broadening horizons', 2021);

--Dodaj brakujące dane dla wiersza  4.
UPDATE interests 
SET implementation_date = 1987
WHERE id = 4;

--Sprawdź czy dane zostały zmienione wyświetlając wszystkie pozycje.
SELECT *
FROM interests;

--Usuń wszystkie wiersze w których któraś z pozycji jest pusta.
UPDATE interests 
SET implementation_date = NULL
WHERE id = 3;

DELETE FROM interests 
WHERE implementation_date IS NULL;

--Sprawdź czy dane zostały zmienione.
SELECT *
FROM interests;