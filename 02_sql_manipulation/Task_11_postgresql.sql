--1. Stwórz Bazę Pracownicy/Jeżeli ją już masz zaktualizuj wpisy  tabelach
-- already created for task 7 

--2. Stwórz Tabelę Pracownicy z pięcioma kolumnami a także dobierz i ustaw dla każdej CONSTRAINTS:
--   - ID
--   - Imię
--   - Nazwisko
--   - Wiek
--   - Kurs

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
    ('Anna', NULL, 43, 'DS'),
    ('Elżbieta', 'Kowalczyk', NULL, 'Tester'),
    ('Anna', 'Kowalczyk', NULL, 'Java'),
    ('Robert', 'Kowalczyk', NULL, 'Java'),
    ('Radosław', 'Zieliński', NULL, 'Java'),
    ('Robert' , 'Woźniak', NULL, 'Java'),
    ('Robert', 'Szymański', 34, 'Tester'),
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

--4. Wyświetl listę pracowników wg kolumny Imię eliminując powtarzające się pozycje

SELECT DISTINCT first_name
FROM employees;

--5. Wyświetl listę pracowników wg kolumny Nazwisko eliminując powtarzające się pozycje

SELECT last_name
FROM employees
GROUP BY last_name;

--6. Wyświetl kursy prowadzone przez pracowników o Nazwisku: „Kowalczyk” 

SELECT course, count(course)
FROM employees
WHERE lower(last_name) = 'kowalczyk'
GROUP BY course;

--7. Wyświetl listę pracowników których dla których nie znamy wieku.

SELECT *
FROM employees 
WHERE emp_age IS NULL;

--8. Wyświetl wiek pracowników o Imieniu „Patryk”

SELECT *
FROM employees 
WHERE lower(first_name) = 'patryk';

--9. Zmień nazwę tabeli z  „Pracownicy” na „Mentorzy”
ALTER TABLE employees 
RENAME TO mentors;

