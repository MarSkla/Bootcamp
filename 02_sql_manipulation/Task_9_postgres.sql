--1. Stwórz Bazę Pracownicy/Jeżeli ją już masz zaktualizuj wpisy  tabelach
--already created, update required

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
    ('Patryk', 'Lewandowski', 28, 'Tester'),
    (NULL, 'Zieliński', 28, 'Tester'),
    ('Andrzej', 'Woźniak', 31, 'Tester'),
    ('Andrzej', 'Lewandowski', 30, 'Tester'),
    ('Roman', 'Kowalczyk', 39, 'Tester'),
    ('Ewa', 'Woźniak', 31, 'Tester');

--4. Wyświetl listę pracowników o Nazwisku: KOWALCZYK
SELECT *
FROM employees
WHERE last_name = 'Kowalczyk';

--5. Wyświetl listę pracowników w wieku od 30 lat do 40 lat.
SELECT *
FROM employees
WHERE emp_age BETWEEN 30 AND 40;

--6. Wyświetl listę pracowników których nazwisko nie zawiera „and”
SELECT *
FROM employees
WHERE lower(last_name) NOT LIKE '%and%';

--7. Wyświetl listę pracowników z ID od 1 do 7
SELECT *
FROM employees
WHERE id BETWEEN 1 AND 7;

--8. Wyświetl listę pracowników z brakującymi danymi.
SELECT *
FROM employees
WHERE NOT (employees IS NOT NULL);

--9. Wyświetl wszystkich pracowników którzy nie prowadzą żadnego kursu
SELECT *
FROM employees
WHERE course IS NULL;
