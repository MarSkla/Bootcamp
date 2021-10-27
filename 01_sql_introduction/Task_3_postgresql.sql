    
--1. Załóż bazę o nazwie: School_Coding.
/*
 * created via Terminal:
 * $ psql -U <user> <database>
 * <database>=# CREATE DATABASE task_3_school_coding;
 * <database>=# \c task_3_school_coding;
 */
 
/*
 * 2. Załóż tabele o nazwie: Mentors.
 * 3. Utwórz 6 kolumn a także dobierz i ustaw dla każdej CONSTRAINTS:
 *  - ID
 *  - Imię 
 *  - Nazwisko
 *  - Specjalizacja
 *  - Data zatrudnienia
 *  - Data zwolnienia
 */
CREATE TABLE mentors (
    id INT UNIQUE,
    first_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    expertise TEXT NOT NULL,
    empl_start_date DATE NOT NULL,
    empl_end_date DATE NULL
    );
    
--4. Wprowadź dane (10 pozycji od 1 do 10). Każda pozycja ma mieć wypełnione wszystkie dane zgodnie z wymaganiem).
INSERT INTO mentors
VALUES
    (1, 'One', 'Pierwszy', 'JS', '2000-01-01', '2003-01-01'),
    (2, 'Two', 'Second', 'Python', '2000-02-01', '2004-01-01'),
    (3, 'Three', 'Trzeci', 'C++', '2000-03-01', '2005-12-31'),
    (4, 'Four', 'Czwarty', 'C++', '2000-04-01', '2006-01-01'),
    (5, 'Five', 'Piaty', 'Turbo Pascal', '2000-05-01', '2020-12-31'),
    (6, 'Six', 'Szosty', 'Python', '2000-06-01', '2019-11-30'),
    (7, 'Seven', 'Siodmy', 'Java', '2000-07-01', '2018-10-31'),
    (8, 'Eight', 'Osmy', 'C#', '2000-08-01', '2015-09-30'),
    (9, 'Nine', 'Dziewiaty', 'R', '2000-09-01', '2017-08-31'),
    (10, 'Ten', 'Dziesiąty', 'JavaScript', '2000-10-31', '2016-07-31');

--5. Sprawdź czy wszystkie dane wyświetlają się prawidłowo.
SELECT *
FROM mentors;

--6. Zmień Nazwisko Mentora w pozycji nr 5.
UPDATE mentors 
SET surname = 'Fifth'
WHERE id = 5;

--7. Sprawdź czy dane zostały zmienione wyświetlając tylko tą pozycję.
SELECT *
FROM mentors
WHERE id = 5;

--8. Zmień stanowisko mentora w pozycji 9.
UPDATE mentors 
SET expertise = 'Ruby'
WHERE id = 9;

--9. Sprawdź czy dane zostały zmienione wyświetlając tylko tą pozycję.
SELECT *
FROM mentors
WHERE id = 9;

--10. Dodaj kolumnę o nazwie Wynagrodzenie a także dobierz i ustaw CONSTRAINTS.
ALTER TABLE mentors 
ADD COLUMN salary DECIMAL DEFAULT 0.00;

--11. Uzupełnij kolumnę wartością 1000 dla pozycji 1,2,3.
UPDATE mentors 
SET salary = 1000.00
WHERE id IN (1, 2, 3);

--12. Wyświetl pozycję 1,2,3 i sprawdź czy dane są prawidłowe.
SELECT *
FROM mentors 
WHERE id BETWEEN 1 AND 3;