CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    bank_account VARCHAR(30) UNIQUE,
    phone VARCHAR(20),
    contact_person VARCHAR(100),
    address TEXT
);

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    brand VARCHAR(20) CHECK (brand IN ('fiesta', 'focus', 'fusion', 'mondeo')),
    new_car_price NUMERIC(10,2),
    client_id INTEGER REFERENCES clients(client_id)
);

CREATE TABLE repairs (
    repair_id SERIAL PRIMARY KEY,
    repair_date DATE,
    car_id INTEGER REFERENCES cars(car_id),

    repair_type VARCHAR(20)
    CHECK (repair_type IN ('гарантійний', 'плановий', 'капітальний')),

    hourly_price NUMERIC(10,2),

    discount NUMERIC(4,2)
    CHECK (discount >= 0 AND discount <= 10),

    hours INTEGER
);

INSERT INTO clients
(company_name, bank_account, phone, contact_person, address)
VALUES
('Ford Service Rivne', 'UA111111', '+380501111111', 'Ivan Petrenko', 'Rivne'),
('Auto Plus', 'UA222222', '+380502222222', 'Oleg Ivanov', 'Kyiv'),
('Drive Center', 'UA333333', '+380503333333', 'Anna Kovalenko', 'Lviv'),
('Car Expert', 'UA444444', '+380504444444', 'Olena Shevchenko', 'Kharkiv'),
('Master Auto', 'UA555555', '+380505555555', 'Taras Bondar', 'Odesa'),
('Garage Lux', 'UA666666', '+380506666666', 'Ihor Melnyk', 'Dnipro');

INSERT INTO cars
(brand, new_car_price, client_id)
VALUES
('fiesta', 15000, 1),
('focus', 18000, 2),
('fusion', 20000, 3),
('mondeo', 25000, 4);

INSERT INTO repairs
(repair_date, car_id, repair_type, hourly_price, discount, hours)
VALUES
('2025-01-01', 1, 'гарантійний', 300, 5, 3),
('2025-01-02', 1, 'плановий', 350, 0, 2),
('2025-01-03', 2, 'капітальний', 500, 10, 8),
('2025-01-04', 2, 'гарантійний', 320, 3, 4),
('2025-01-05', 3, 'плановий', 330, 2, 5),
('2025-01-06', 3, 'капітальний', 550, 8, 10),
('2025-01-07', 4, 'гарантійний', 300, 0, 2),
('2025-01-08', 4, 'плановий', 340, 1, 4),
('2025-01-09', 1, 'капітальний', 600, 10, 12),
('2025-01-10', 2, 'гарантійний', 310, 5, 3),
('2025-01-11', 3, 'плановий', 360, 2, 6),
('2025-01-12', 4, 'капітальний', 520, 7, 9),
('2025-01-13', 1, 'гарантійний', 330, 4, 2),
('2025-01-14', 2, 'плановий', 345, 1, 5),
('2025-01-15', 3, 'капітальний', 570, 9, 11);