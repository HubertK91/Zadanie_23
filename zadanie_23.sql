-- Tworzy tabelę pracownik(imie, nazwisko, wyplata, data urodzenia, stanowisko). W tabeli mogą być dodatkowe kolumny, które uznasz za niezbędne.
CREATE TABLE pracownik(
id BIGINT primary key auto_increment,
first_name VARCHAR(30),
last_name VARCHAR(30),
salary INTEGER,
birth_year DATE,
title VARCHAR(30));
-- Wstawia do tabeli co najmniej 6 pracowników
INSERT INTO pracownik(first_name, last_name, salary, birth_year, title)
VALUES('Jan', 'Kowalski', 5500, '1995-03-12', 'projektant'), ('Janina', 'Kowalska', 4500, '1998-09-19', 'asystent projektanta'),
('Marta', 'Zawadzka', 8500, '1985-06-12', 'kierownik'), ('Jan', 'Nowak', 6500, '1990-10-03', 'asystent kierownika'),
('Maria', 'Jankowska', 12500, '1975-03-18', 'dyrektor'), ('Paweł', 'Abacki', 6000, '1993-01-26', 'koordynator');
-- Pobiera wszystkich pracowników i wyświetla ich w kolejności alfabetycznej po nazwisku
SELECT*FROM zadanie_23.pracownik ORDER BY last_name;
-- Pobiera pracowników na wybranym stanowisku
SELECT*FROM zadanie_23.pracownik WHERE title = 'dyrektor';
-- Pobiera pracowników, którzy mają co najmniej 30 lat
SELECT*FROM zadanie_23.pracownik WHERE DATEDIFF(NOW(), birth_year)>=30*365.25;
-- Zwiększa wypłatę pracowników na wybranym stanowisku o 10%
UPDATE zadanie_23.pracownik SET salary = salary * 1.1 WHERE title = 'koordynator';
-- Pobiera najmłodszego pracowników (uwzględnij przypadek, że może być kilku urodzonych tego samego dnia)
SELECT*FROM zadanie_23.pracownik where birth_year = (SELECT max(birth_year) FROM pracownik);
-- Usuwa tabelę pracownik
DROP TABLE `zadanie_23`.`pracownik`;
-- Tworzy tabelę stanowisko (nazwa stanowiska, opis, wypłata na danym stanowisku)
CREATE TABLE stanowisko(
id BIGINT primary key auto_increment,
title_name VARCHAR(30),
title_description VARCHAR(30),
salary INTEGER);
-- Tworzy tabelę adres (ulica+numer domu/mieszkania, kod pocztowy, miejscowość)
CREATE TABLE adres(
id BIGINT primary key auto_increment,
street VARCHAR(30),
house_number VARCHAR(30),
postcode VARCHAR(30),
city VARCHAR(30));
-- Tworzy tabelę pracownik (imię, nazwisko) + relacje do tabeli stanowisko i adres
CREATE TABLE pracownik(
id BIGINT primary key auto_increment,
first_name VARCHAR(30),
last_name VARCHAR(30));

-- Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)
-- Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)
-- Oblicza sumę wypłat dla wszystkich pracowników w firmie
-- Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210 (albo innym, który będzie miał sens dla Twoich danych testowych)