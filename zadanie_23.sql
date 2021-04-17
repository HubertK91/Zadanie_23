-- Tworzy tabelę pracownik(imie, nazwisko, wyplata, data urodzenia, stanowisko). W tabeli mogą być dodatkowe kolumny, które uznasz za niezbędne.
CREATE TABLE pracownik(
id BIGINT primary key auto_increment,
first_name VARCHAR(30),
last_name VARCHAR(30),
salary DECIMAL,
birth_year DATE,
title VARCHAR(30));
-- Wstawia do tabeli co najmniej 6 pracowników
INSERT INTO pracownik(first_name, last_name, salary, birth_year, title)
VALUES('Jan', 'Kowalski', 5500, '1991-04-14', 'projektant'), ('Janina', 'Kowalska', 4500, '1991-04-16', 'asystent projektanta'),
('Marta', 'Zawadzka', 8500, '1985-06-12', 'kierownik'), ('Jan', 'Nowak', 6500, '1990-10-03', 'asystent kierownika'),
('Maria', 'Jankowska', 12500, '1975-03-18', 'dyrektor'), ('Paweł', 'Abacki', 6000, '1993-01-26', 'koordynator');
-- Pobiera wszystkich pracowników i wyświetla ich w kolejności alfabetycznej po nazwisku
SELECT * FROM pracownik ORDER BY last_name;
-- Pobiera pracowników na wybranym stanowisku
SELECT * FROM pracownik WHERE title = 'dyrektor';
-- Pobiera pracowników, którzy mają co najmniej 30 lat
SELECT * FROM pracownik WHERE YEAR(CURDATE()) - EXTRACT(YEAR FROM birth_year)>=30;
-- Zwiększa wypłatę pracowników na wybranym stanowisku o 10%
UPDATE pracownik SET salary = salary * 1.1 WHERE title = 'koordynator';
-- Pobiera najmłodszego pracowników (uwzględnij przypadek, że może być kilku urodzonych tego samego dnia)
SELECT * FROM pracownik where birth_year = (SELECT max(birth_year) FROM pracownik);
-- Usuwa tabelę pracownik
DROP TABLE `pracownik`;
-- Tworzy tabelę stanowisko (nazwa stanowiska, opis, wypłata na danym stanowisku)
CREATE TABLE stanowisko(
id BIGINT primary key auto_increment,
title_name VARCHAR(30),
title_description VARCHAR(30),
salary DECIMAL(10,2));
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
last_name VARCHAR(30),
stanowisko_id BIGINT,
adres_id BIGINT,
FOREIGN KEY (stanowisko_id) REFERENCES stanowisko (id),
FOREIGN KEY (adres_id) REFERENCES adres (id));
-- Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)
INSERT INTO pracownik(first_name, last_name)
VALUES('Jan', 'Kowalski'), ('Janina', 'Kowalska'),
('Marta', 'Zawadzka'), ('Jan', 'Nowak'),
('Maria', 'Jankowska'), ('Paweł', 'Abacki');
INSERT INTO stanowisko(title_name, title_description, salary)
VALUES('projektant','ma uprawnienia projektowe',5500), ('asystent projektanta','zajmuje się projektowaniem',4500),
('kierownik','zarządza zasobami ludzkimi',8500), ('asystent kierownika','wspiera kierownika',6500),
('dyrektor','zarządza pracą kierowników',12500), ('koordynator','koordynuje prace',6000);
INSERT INTO adres(street, house_number, postcode, city)
VALUES('Mazowiecka',25,90210,'Sosnowiec'), ('Krótka',20,90000,'Warszawa'),
('Długa',35,90200,'Wrocław'), ('Piwna',15,80210,'Kraków'),
('Spokojna',8,10210,'Gdańsk'), ('Wąska',10,30210,'Poznań');
-- Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)
SELECT * FROM pracownik p
join adres a on a.id = p.id
join stanowisko s on s.id = p.id;
-- Oblicza sumę wypłat dla wszystkich pracowników w firmie
SELECT SUM(salary) FROM stanowisko;
-- Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210 (albo innym, który będzie miał sens dla Twoich danych testowych)