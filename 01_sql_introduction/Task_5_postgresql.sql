--Załóż bazę o nazwie: Lista Pracowników.
--created in Terminal

/*
 * Załóż tabele o nazwie: Pracownicy.
 * Utwórz 5 kolumn a także dobierz i ustaw dla każdej CONSTRAINTS:
 *  - ID
 *  - Imię 
 *  - Nazwisko
 *  - Stanowisko
 *  - Dział
 */

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name CHAR(16) NOT NULL,
    surname VARCHAR(36) NOT NULL,
    job_position VARCHAR(64) NOT NULL,
    department TEXT CHECK (department IN ('IT', 'HR', 'Finance', 'Admin', 'Board'))
    );


--Wprowadź dane osób z którymi pracujesz w Swojej firmie. Każda pozycja ma mieć wypełnione wszystkie dane zgodnie z wymaganiem).
INSERT INTO employees (first_name, surname, job_position, department)
VALUES 
    ('Ryszard', 'Rynkowski', 'Head of Communication', 'Board'),
    ('Bernard', 'Madoff', 'Chief Financial Officer', 'Finance'),
    ('Mr.', 'Robot', 'IT expert', 'IT'),
    ('Wlad', 'Palownik', 'Head of HR', 'HR'),
    ('Maryla', 'Korecka', 'Specialist', 'Admin');

--Sprawdź czy wszystkie dane wyświetlają się prawidłowo.
SELECT *
FROM employees;

--Dodaj kolumnę: Data zatrudnienia.
ALTER TABLE employees 
ADD COLUMN empl_start_date DATE NOT NULL DEFAULT '1111-11-11';

--Dodaj nowego pracownika uzupełniając wszystkie dane.
INSERT INTO employees (first_name, surname, job_position, department, empl_start_date)
VALUES ('Hippollitt', 'Kwass', 'Special Force', 'Admin', '2006-01-07');

--Sprawdź czy dane zostały zmienione wyświetlając wszystkie pozycje. Zwróć uwagę na dane z kolumnie Data zatrudnienia.
SELECT *
FROM employees;

--Uzupełni wszystkie brakujące dane w kolumnie o nazwie Data Zatrudnienia.
UPDATE employees 
SET empl_start_date = 
    CASE
        WHEN id = 1 THEN '1989-01-01'::date
        WHEN id = 2 THEN '1997-12-01'::date
        WHEN id = 3 THEN '2010-06-06'::date
        WHEN id = 4 THEN '2015-10-01'::date
        WHEN id = 5 THEN '2020-01-07'::date
    END
WHERE id IN (1,2,3,4,5);

--Sprawdź czy dane zostały zmienione, zwróć uwagę co się zmieniło w kolumnie ID.
SELECT *
FROM employees;
