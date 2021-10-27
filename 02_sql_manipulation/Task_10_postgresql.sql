--1. Stwórz Bazę Pracownicy/Jeżeli ją już masz zaktualizuj wpisy  tabelach
--already created for task 7

--2. Stwórz Tabelę Pracownicy z pięcioma kolumnami a także dobierz i ustaw dla każdej CONSTRAINTS:
--    - ID
--    - Imię
--    - Nazwisko
--    - Wiek
--    - Kurs

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(16),
    last_name VARCHAR(64),
    emp_age INTEGER CHECK (emp_age > 17),
    course VARCHAR(32)
    );

--3. Każdą tabelę uzupełnij danymi z tabeli (załączonej obok)/lub zaktualizuj.

INSERT INTO employees (first_name, last_name, emp_age, course)
VALUES
    ('Anna', 'Nowak', 34, 'DS'),
    ('Roman', 'Kowalski', 42, 'DS'),
    ('Tomasz', 'Wiśniewski', 33, 'DS'),
    ('Agata', 'Wójcik', 43, 'DS'),
    ('Elżbieta', 'Kowalczyk', 28, 'Java'),
    ('Przemysław', 'Kowalczyk', 34, 'Java'),
    ('Robert', 'Kowalczyk', 35, 'Java'),
    ('Radosław', 'Zieliński', 38, 'Java'),
    (NULL , 'Woźniak', 26, 'Java'),
    ('Robert', 'Szymański', 34, 'Java'),
    ('Radosław', 'Dąbrowski', 35, NULL),
    ('Robert', 'Kozłowski', NULL, 'UX'),
    ('Joanna', 'Mazur', 26, 'UX'),
    ('Radosław', 'Jankowski', 27, 'UX'),
    ('Patryk', 'Lewandowski', 28, NULL),
    (NULL, 'Zieliński', 28, NULL),
    ('Andrzej', 'Woźniak', 31, NULL),
    ('Andrzej', 'Lewandowski', 30, NULL),
    ('Roman', 'Kowalczyk', 39, NULL),
    ('Ewa', 'Woźniak', 31, NULL);

--4. Wyświetl listę pracowników o Imieniu: Anna

SELECT *
FROM employees
WHERE lower(first_name) = 'anna';

--5. Wyświetl listę pracowników z brakującą daną w kolumnie Imię

SELECT *
FROM employees
WHERE first_name IS NULL;

--6. Wyświetl kursy prowadzone przez pracowników w wieku od 30 lat do 40 lat.

SELECT *
FROM employees
WHERE emp_age BETWEEN 30 AND 40;

--7. Wyświetl listę pracowników których nazwisko nie zawiera „and”

SELECT *
FROM employees
WHERE last_name NOT LIKE '%and%';

--8. Wyświetl wiek pracowników z ID od 1 do 7

SELECT emp_age
FROM employees
WHERE id >= 1 AND id <=7;

--9. Wyświetl listę pracowników z brakującymi danymi w kolumnie wiek.

SELECT *
FROM employees
WHERE emp_age IS NULL;

--10. Zmień nazwę kolumnę „Kurs” na „Szkolenie”

ALTER TABLE employees
RENAME COLUMN course TO training;

