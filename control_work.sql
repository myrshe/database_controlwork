CREATE OR REPLACE FUNCTION generate_random_name() RETURNS TEXT AS $$
BEGIN
RETURN 'Name ' || floor(random() * 10000)::int;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_random_surname() RETURNS TEXT AS $$
BEGIN
RETURN 'Surname ' || floor(random() * 10000)::int;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_random_address() RETURNS TEXT AS $$
BEGIN
RETURN 'Address ' || floor(random() * 10000)::int;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION generate_random_phone() RETURNS VARCHAR(11) AS $$
BEGIN
RETURN lpad(floor(random() * 99999999)::text, 11, '0');
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION generate_random_price() RETURNS NUMERIC(10, 2) AS $$
BEGIN
RETURN (floor(random() * 100000) + 0.01)::numeric(10, 2);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_random_weight() RETURNS NUMERIC(5, 2) AS $$
BEGIN
RETURN (floor(random() * 100) + 0.01)::numeric(5, 2);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_random_time() RETURNS TIME AS $$
BEGIN
RETURN CAST('08:00:00' AS Time);
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_random_date() RETURNS DATE AS $$
BEGIN
RETURN date_trunc('day', current_date + (random() * 365)::integer);
end;
$$ LANGUAGE plpgsql;



INSERT INTO delivery (deliveryid, time, price)
SELECT
    floor(random() * 1000000)::int,
        generate_random_time(),
    generate_random_price()
FROM generate_series(1, 500);


INSERT INTO Product (ProductID, Name, Price, Weight)
SELECT
    floor(random() * 1000000)::int,
        generate_random_name(),
    generate_random_price(),
    generate_random_weight()
FROM generate_series(1, 500);

INSERT INTO Shop (ShopID, Name, Address, City)
SELECT
    floor(random() * 1000000)::int,
        generate_random_name(),
    generate_random_address(),
    generate_random_name()
FROM generate_series(1, 500);

INSERT INTO Client (ClientID, Name, Surname, Address, phone)
SELECT
    floor(random() * 100000)::int,
        generate_random_name(),
    generate_random_surname(),
    generate_random_address(),
    generate_random_phone()
FROM generate_series(1, 500);
