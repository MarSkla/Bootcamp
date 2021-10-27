--1. Stwórz Bazę Pracownicy/Jeżeli ją już masz zaktualizuj wpisy  tabelach
--database "tasks_7_11_manipulation" created, updating records

ALTER TABLE employees
ALTER first_name DROP NOT NULL,
ALTER last_name DROP NOT NULL,
ALTER emp_age DROP NOT NULL,
ALTER course DROP NOT NULL;

UPDATE employees SET first_name = NULL WHERE nr IN (9, 16) RETURNING *;
UPDATE employees SET last_name = NULL WHERE nr IN (6, 7, 19) RETURNING *;
UPDATE employees SET emp_age = NULL WHERE nr = 12 RETURNING *;
UPDATE employees SET course = NULL WHERE nr = 11 RETURNING *;


--2. Stwórz Tabelę Pracownicy z pięcioma kolumnami a także dobierz i ustaw dla każdej CONSTRAINTS:
--    - ID
--    - Imię
--    - Nazwisko
--    - Wiek
--    - Kurs

ALTER TABLE employees
RENAME COLUMN nr TO id;

--3. Każdą tabelę uzupełnij danymi z tabeli (załączonej obok)/lub zaktualizuj.
-- updated

--4. Wyświetl listę pracowników w wieku 28 lat.
SELECT *
FROM employees
WHERE  emp_age = 28;

--5. Wyświetl listę pracowników w wieku 30 lat i młodszych.
SELECT *
FROM employees e 
WHERE emp_age <= 30;

--6. Wyświetl listę pracowników których nazwisko zawiera „ski”
SELECT *
FROM employees
WHERE last_name LIKE '%ski%';

--7. Wyświetl listę pracowników z ID: 1,4,7,18,20
SELECT *
FROM employees
WHERE id IN (1, 4, 7, 18, 20);

--8. Wyświetl listę pracowników z wprowadzonymi kompletnymi danymi
SELECT *
FROM employees
WHERE employees IS NOT NULL;


--9. Wyświetl wszystkich pracowników którzy nie prowadzą kursu DS
SELECT *
FROM employees
WHERE course <> 'DS';
