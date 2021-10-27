--1. Stwórz Bazę Pracownicy
-- as always, created in Terminal

--2. Stwórz Tabelę Pracownicy z pięcioma kolumnami a także dobierz i ustaw dla każdej CONSTRAINTS:
--   - ID
--   - Imię
--   - Nazwisko
--   - Wiek
--   - Kurs
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(16) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    emp_age INTEGER NOT NULL CHECK (emp_age > 17),
    course VARCHAR(32)
    );

--3. Każdą tabelę uzupełnij danymi z tabeli (załączonej obok)
INSERT INTO employees (first_name, last_name, emp_age, course)
VALUES
    ('Anna', 'Nowak', 34, 'DS'),
    ('Roman', 'Kowalski', 42, 'DS'),
    ('Tomasz', 'Wiśniewski', 33, 'DS'),
    ('Agata', 'Wójcik', 43, 'DS'),
    ('Elżbieta', 'Kowalczyk', 28, 'Java'),
    ('Przemysław', 'Kamiński', 34, 'Java'),
    ('Robert', 'Lewandowski', 35, 'Java'),
    ('Radosław', 'Zieliński', 38, 'Java'),
    ('Anna', 'Woźniak', 26, 'Java'),
    ('Robert', 'Szymański', 34, 'Java'),
    ('Radosław', 'Dąbrowski', 35, 'UX'),
    ('Robert', 'Kozłowski', 38, 'UX'),
    ('Joanna', 'Mazur', 26, 'UX'),
    ('Radosław', 'Jankowski', 27, 'UX'),
    ('Patryk', 'Lewandowski', 28, 'Tester'),
    ('Patryk', 'Zieliński', 28, 'Tester'),
    ('Andrzej', 'Woźniak', 31, 'Tester'),
    ('Andrzej', 'Lewandowski', 30, 'Tester'),
    ('Roman', 'Zieliński', 39, 'Tester'),
    ('Ewa', 'Woźniak', 31, 'Tester');

--4. Wyświetl listę pracowników starszych niż 30 lat.
SELECT *
FROM employees 
WHERE emp_age > 30;

--5. Wyświetl listę pracowników młodszych niż 30 lat.
SELECT *
FROM employees 
WHERE emp_age < 30;

--6. Wyświetl listę pracowników których nazwisko zaczyna się na „K” i kończy na „ki”
SELECT *
FROM employees 
WHERE last_name Like 'K%ki';

--7. Zmień nazwę kolumny „ID” na „NR”
ALTER TABLE employees 
RENAME COLUMN id TO nr;

--8. Wyświetl pozycje których są puste pozycje.
SELECT *
FROM employees 
WHERE employees IS NULL;

--9. Wyświetl wszystkich pracowników z kursu „Java”
SELECT *
FROM employees
WHERE course = 'Java';
-- a jeżeli chcemy uniezaleznić od wielkości znaków, wtedy:
-- WHERE lower(course) LIKE 'java';