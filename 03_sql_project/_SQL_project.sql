--Projekt:

--1. Stwórz Bazę „Sklep odzieżowy”
    /*database created in Terminal:
     * ~$ psql -U <user> postgres
     * postgres=# CREATE DATABASE clothing_store;
     * postgres=# \c clothing_store;
     * clothing_store=#
     */
    
/*2. Utwórz tabelę „Dostawca” z kolumnami:
   - Id producenta
   - Nazwa producenta
   - Adres producenta
   - Nip producenta
   - Data podpisania umowy z producentem

   Do każdej kolumny ustaw odpowiedni „constraint”*/

CREATE SCHEMA my_project;

CREATE TABLE supplier (
    sup_id SERIAL PRIMARY KEY,
    sup_name VARCHAR(64) UNIQUE NOT NULL,
    sup_address VARCHAR(128) NOT NULL,
    sup_tax_id VARCHAR(32) UNIQUE NOT NULL CHECK (length(sup_tax_id) >= 9),
    sup_agreement_date DATE DEFAULT NULL
    );

--check
--    SELECT *
--    FROM supplier;

/*3. Utwórz tabelę „Produkt” z kolumnami:
   - id produktu
   - nazwa producenta
   - nazwa produktu
   - opis produktu
   - cena netto zakupu
   - cena brutto zakupu
   - cena netto sprzedaży
   - cena brutto sprzedaży
   - procent VAT sprzedaży

   Do każdej kolumny ustaw odpowiedni „constraint”*/

CREATE TABLE products (
    prod_id VARCHAR(16) UNIQUE PRIMARY KEY,
    prod_manu_name VARCHAR(64) NOT NULL,
    prod_name VARCHAR(32) UNIQUE NOT NULL,
    prod_desc VARCHAR(128) NOT NULL,
    prod_pur_price_net NUMERIC(10, 2) NOT NULL,
    prod_pur_price_gross NUMERIC(10, 2),
    prod_sell_price_net NUMERIC(10, 2) NOT NULL,
    prod_sell_price_gross NUMERIC(10, 2),
    prod_VAT_perc VARCHAR(2) NOT NULL CHECK (prod_VAT_perc::INTEGER IN (8, 23))
    );

--check:
--    SELECT *
--    FROM products;
                            
/*4. Utwórz tabelę „Zamówienie” z kolumnami:
   - Id zamówienia
   - Id klienta
   - Id produktu
   - Data zamówienia

   Do każdej kolumny ustaw odpowiedni „constraint”*/

CREATE TABLE orders (
    ord_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    ord_cust_id VARCHAR(16) NOT NULL,
    ord_prod_id VARCHAR(16) NOT NULL,
    ord_date DATE NOT NULL
    );

--check
--    SELECT *
--    FROM orders;

/*5. Utwórz tabelę „Klient” z kolumnami:
    Id klienta
    Id zamówienia
    Imię
    Nazwisko
    adres

   Do każdej kolumny ustaw odpowiedni „constraint”*/

CREATE TABLE clients (
    client_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    client_pur_id INTEGER NOT NULL,
    client_first_name VARCHAR(16) NOT NULL,
    client_surname VARCHAR(32) NOT NULL,
    client_address VARCHAR(128) NOT NULL
    );

--check
--    SELECT *
--    FROM clients;

/*6. Każdą tabelę uzupełnij danymi wg:
   - Tabela „Dostawca” – 4 pozycje
   - Tabela „Produkt” – 20 pozycji
   - Tabela „Zamówienie” – 10 pozycji
   - Tabela „Klient” – 10 pozycji*/

INSERT INTO supplier (sup_name, sup_address, sup_tax_id, sup_agreement_date)
VALUES
    ('Kowalska i spólka', 'Koniaków 15', '6401864578', '2012-07-19'),
    ('Radomskie Zakłady Odzieżowe S.A.', 'Radom, Lotnisko 578', '7348128831', '2019-11-10'),
    ('Abibas Corp', 'Wolka Kosowska, Warszawska 15', '1123671971', '2015-06-01'),
    ('Towarzystwo Kubotex', 'Nowy Sącz, Smogu 45', '5456467273', '2018-12-12');

--check
--    SELECT *
--    FROM supplier;

--creating triggers to auto calculate price gross values based on net and vat after each insert and update
CREATE FUNCTION calculate_gross()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
    AS
    $$
        BEGIN
            UPDATE products 
                SET prod_pur_price_gross = NEW.prod_pur_price_net * (1 + (NEW.prod_VAT_perc::INTEGER * 0.01)),
                    prod_sell_price_gross = NEW.prod_sell_price_net * (1 + (NEW.prod_VAT_perc::INTEGER * 0.01))
            WHERE prod_id = NEW.prod_id;
            RETURN NEW; 
        END;
    $$;

CREATE TRIGGER trigger_gross
AFTER INSERT
ON products
FOR ROW EXECUTE FUNCTION calculate_gross();

CREATE TRIGGER trigger_gross_update
AFTER UPDATE OF prod_pur_price_net, prod_sell_price_net, prod_VAT_perc
ON products
FOR ROW EXECUTE FUNCTION calculate_gross();

--returning to providing data as requested
INSERT INTO products (prod_id, prod_manu_name, prod_name , prod_desc ,prod_pur_price_net , prod_sell_price_net , prod_vat_perc)
VALUES
    ('A1','Kowalska i spólka', 'kalesony', 'cudownie fantastyczne',15.23, 22.50, 23),
    ('A2','Kowalska i spólka', 'podkoszulek męski', 'delikatnie opinający',10, 17, 23),
    ('A3','Kowalska i spólka', 'skarpety - trójpak','bez dziur!', 12.15, 35, 23),
    ('A4','Kowalska i spólka', 'piżama - komplet', 'prawie kaszmir',33.20, 44.72, 23),
    ('A5','Kowalska i spólka', 'pantalony', 'cieplutko jak przy piecu',7.18, 10.57, 23),
    ('B1','Radomskie Zakłady Odzieżowe S.A.', 'kurtka na jesienne marsze', 'wytrzyma mróz 11 listopada',44.17, 56.91, 23),
    ('B2','Radomskie Zakłady Odzieżowe S.A.', 'dżiny rurki', 'perfekcyjne do biegania',33.06, 44.72, 23),
    ('B3','Radomskie Zakłady Odzieżowe S.A.', 'kominiarka', 'już nie będziesz w TV',11.87, 16.26, 23),
    ('B4','Radomskie Zakłady Odzieżowe S.A.', 'rękawice petardowe', 'bezpieczeństwo to podstawa',9.16, 12.60, 23),
    ('B5','Radomskie Zakłady Odzieżowe S.A.', 'kamizelka', 'gumowe kule to nie strach',23.09, 28.45, 23),
    ('C1','Abibas Corp', 'sporty', 'pograj w gałe', 16.17, 24.31, 23),
    ('C2','Abibas Corp', 'pantofle weselne', 'gdybyś strzelił',74, 89.34, 23),
    ('C3','Abibas Corp', 'bambosze szpitalne', 'będą potrzebne',30.18, 40.64, 23),
    ('C4','Abibas Corp', 'gumofilce', 'ciepłe i wodoszczelne',7.9, 13.94, 23),
    ('C5','Abibas Corp', 'martensy podróby', 'klasyk na miasto',40, 85.37, 23),
    ('D1','Towarzystwo Kubotex', 'klapeczki klasyki', 'wakacje nad morzem?',5.60, 11.11, 8),
    ('D2','Towarzystwo Kubotex', 'kapcie ortopedyczne','czasami trzeba korekty',22.19, 41.67, 8),
    ('D3','Towarzystwo Kubotex', 'cichobiegi','powrót nad ranem?',16.50, 27.27, 8),
    ('D4','Towarzystwo Kubotex', 'kozaki typ old-school relax','klasyka traktora',66.66, 92.58, 8),
    ('D5','Towarzystwo Kubotex', 'adiki','szyk w piątkowe wieczory', 78.15, 138.90, 8);

--check
--  SELECT *
--  FROM products;

--Trigger_gross check
--    SELECT *
--    FROM products
--    WHERE prod_id = 'A2';


--Trigger_gross_update check
--    UPDATE products 
--    SET prod_pur_price_net = 15,
--        prod_sell_price_net = 24
--    WHERE prod_id = 'A2';
--    
--    SELECT *
--    FROM products
--    WHERE prod_id = 'A2';

INSERT INTO orders (ord_cust_id , ord_prod_id, ord_date)
VALUES
    (1, 'A3', '2019-12-10'),
    (1, 'C2', '2019-12-10'),
    (3, 'D4', '2018-09-30'),
    (4, 'B4', '2015-10-19'),
    (4, 'B3', '2015-10-19'),
    (6, 'A3', '2015-10-19'),
    (7, 'D3', '2020-06-17'),
    (8, 'A4', '2011-02-03'),
    (9, 'D1', '2013-07-28'),
    (9, 'A2', '2013-07-28');

--check
--    SELECT *
--    FROM orders;
    
INSERT INTO clients (client_pur_id , client_first_name , client_surname , client_address)
VALUES
    (1, 'Ildefons', 'Wąs', 'Kazimierzowice 7'),
    (2, 'Martyna', 'Konieczna', 'Warszawa, Puławska 74/5'),
    (3, 'Rafał', 'Ciepły', 'Wyszków, Rojaków 7'),
    (4, 'Nina', 'Wazelina', 'Słupca, Trzęsawisko 7'),
    (5, 'Paul', 'van der Bear', 'Netherlands, Venlo, Postgarten 7'),
    (6, 'Jorge', 'Mendes-Wolski 4', 'Konipnica, Wolanska 7 m 5'),
    (7, 'Pan', 'Prezydent', 'Warszawa, Krakowskie Przedmieście 48/50'),
    (8, 'Henryk', 'Szczuj-Szczczujski', 'Lubiensko, Kwaśnicka 700'),
    (9, 'Jożin', '', 'Baziny, Kabaretowa 63 lok A'),
    (10, 'Janusz', 'Trenerski', 'Krnąbrno, Monopolowa 1');

--check
--    SELECT*
--    FROM clients;

/*7. Połącz kolumny ze Sobą aby tabele ze sobą się Komunikowały
   - Produkt – Dostawca
   - Produkt – Zamówienie
   - Zamówienie - Klient*/

ALTER TABLE products 
ADD CONSTRAINT supplier_foreign_key FOREIGN KEY (prod_manu_name) REFERENCES supplier(sup_name);


ALTER TABLE orders 
ADD CONSTRAINT product_foreign_key FOREIGN KEY (ord_prod_id) REFERENCES products(prod_id);

--altering data type for orders(ord_cust_id) (first try failed due to different data types)
ALTER TABLE orders 
ALTER COLUMN ord_cust_id TYPE bigint
USING ord_cust_id::bigint;

ALTER TABLE orders 
ADD CONSTRAINT client_foreign_key FOREIGN KEY (ord_cust_id) REFERENCES clients(client_id);

--8. Wyświetl wszystkie produkty z wszystkimi danymi od dostawcy który znajduje się na pozycji 1 w tabeli „Dostawca”

-- this and next 3 tasks relate to the same range of data, therefore "VIEW" will be created to facilitate

CREATE VIEW supplier_no1 AS
    SELECT *
    FROM products p 
    INNER JOIN supplier s 
    ON p.prod_manu_name = s.sup_name 
    WHERE s.sup_id = 1;

SELECT *
FROM supplier_no1;


--9. Posortuj te produkty po Nazwie od A-B
SELECT *
FROM supplier_no1
ORDER BY prod_name;

--10. Wylicz średnią cenę za produktu od tego dostawcy

-- due to lack of information, I make assuption it should be average sell price (gross)
SELECT avg(prod_sell_price_gross) AS all_products_average_price 
FROM supplier_no1;

--11. Wyświetl dwie grupy produktów tego dostawcy:
--    a) Połowa najtańszych to grupa: „Tanie”
SELECT  prod_name ,
        prod_sell_price_gross,
        CASE 
            WHEN prod_sell_price_gross > 
                (SELECT 
                    avg(prod_sell_price_gross)::int
                FROM supplier_no1) 
            THEN 'expensive'
            ELSE 'cheap'
        END AS category
FROM supplier_no1
WHERE 
    (CASE 
        WHEN prod_sell_price_gross > 
            (SELECT 
                avg(prod_sell_price_gross)::int
            FROM supplier_no1) 
            THEN 'expensive'
            ELSE 'cheap'
        END) = 'cheap';

    
--    b) Pozostałe to grupa: „Drogie”

--alternative solution to above

WITH categories AS (
    SELECT  prod_name ,
        prod_sell_price_gross,
        CASE 
            WHEN prod_sell_price_gross > 
                (SELECT 
                    avg(prod_sell_price_gross)::int
                FROM supplier_no1) 
            THEN 'expensive'
            ELSE 'cheap'
        END AS category
    FROM supplier_no1 
)
SELECT *
FROM categories
WHERE category = 'expensive';
    
--12. Wyświetl produkty zamówione, wyświetlając nazwę, 
    
SELECT
    o.ord_prod_id,
    p.prod_name 
FROM orders o
INNER JOIN products p 
ON p.prod_id = o.ord_prod_id;

--additionally, below is to practis joining more than only two tables

SELECT 
    o.ord_prod_id,
    p.prod_name 
FROM orders o 
INNER JOIN products p 
ON o.ord_prod_id = p.prod_id 
INNER JOIN supplier s 
ON p.prod_manu_name = s.sup_name
WHERE s.sup_id = 2;

--13. Wyświetl wszystkie produkty zamówione – ograniczając do wyświetlonych 5 pozycji
SELECT
    o.ord_prod_id,
    p.prod_name
FROM orders o 
INNER JOIN products p 
ON o.ord_prod_id = p.prod_id
ORDER BY o.ord_date ASC
LIMIT 5;


--14. Policz wartość wszystkich zamówień
SELECT
    sum(prod_sell_price_gross) AS total_gross_value_all_orders
FROM products p 
INNER JOIN orders o 
ON p.prod_id = o.ord_prod_id;

--15. Wyświetl wszystkie zamówienia wraz z produktami sortując je wg daty od najstarszego do najnowszego
SELECT 
    p.prod_name,
    o.*
FROM orders o 
INNER JOIN products p 
ON o.ord_prod_id = p.prod_id
ORDER BY o.ord_date ASC;

--16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych
SELECT *
FROM products p 
WHERE p IS NULL;

--17. Wyświetl produkty najczęściej sprzedawane wraz z ich ceną
WITH total_orders_per_product AS (
    SELECT
        p.prod_name AS topp_prod_name, 
        count(o.ord_prod_id) AS total_orders,
        p.prod_sell_price_gross 
    FROM orders o
    INNER JOIN products p 
    ON o.ord_prod_id = p.prod_id
    GROUP BY p.prod_name, p.prod_sell_price_gross
)
SELECT *    
FROM total_orders_per_product
WHERE total_orders = (
    SELECT
        max(total_orders)
    FROM total_orders_per_product
);     


--18. Znajdź dzień w którym najwięcej zostało złożonych zamówień
WITH biggest_sales_day AS (
    SELECT 
        o.ord_date,
        count(o.ord_date) AS goods_sold_this_day 
    FROM orders o
    GROUP BY o.ord_date 
)
SELECT *
FROM biggest_sales_day
WHERE goods_sold_this_day = (
    SELECT
        max(goods_sold_this_day)
    FROM biggest_sales_day
);

--Odpowiedzi prześlij do mentora. Powodzenia!