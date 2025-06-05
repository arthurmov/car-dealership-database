DROP DATABASE cardealershipdatabase;
CREATE DATABASE cardealershipdatabase;
USE cardealershipdatabase;

CREATE TABLE dealerships (
dealership_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(50),
phone VARCHAR(12)
);

CREATE TABLE vehicles (
vin INT PRIMARY KEY,
year YEAR,
make VARCHAR(50),
model VARCHAR(50),
vehicleType VARCHAR(50),
color VARCHAR(30),
odometer INT,
price DECIMAL(10,2),
sold BOOLEAN
);

CREATE TABLE inventory(
inventory_id INT AUTO_INCREMENT PRIMARY KEY,
dealership_id INT,
vin INT,
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE sales_contracts(
contract_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(50),
sales_tax DECIMAL(10,2),
recording_fee INT,
processing_fee INT,
is_finance BOOLEAN,
date_of_sale INT,
vin INT,
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE lease_contracts(
contract_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(50),
extended_ending_value DECIMAL(10,2),
lease_fee DECIMAL(10,2),
monthly_payment DECIMAL(10,2),
date_of_sale INT,
vin INT,
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

INSERT INTO dealerships (name, address, phone)
VALUES
('Bavarian Auto Haus', '500 Autobahn Ln', '212-555-2025'),
('Merc Motors', '101 City Rd', '718-555-8833');

INSERT INTO vehicles (vin, year, make, model, vehicleType, color, odometer, price, sold)
VALUES
(10002, 2021, 'BMW', '3 Series', 'Sedan', 'White', 22100, 37950.00, FALSE),
(10003, 2020, 'BMW', 'M4', 'Coupe', 'Blue', 15700, 58900.00, FALSE),
(10008, 2020, 'BMW', 'M4', 'Sedan', 'Black', 15000, 89000.00, FALSE),
(10009, 2021, 'Chevrolet', 'Silverado', 'Truck', 'Black', 2750, 31995.00, TRUE),
(10010, 2023, 'BMW', 'M5', 'Sedan', 'Black', 12034, 109239.00, TRUE);

INSERT INTO inventory (dealership_id, vin)
VALUES
(1, 10002),
(1, 10003),
(1, 10008);

INSERT INTO sales_contracts (customer_name, sales_tax, recording_fee, processing_fee, is_finance, date_of_sale, vin)
VALUES
('Alice Johnson', 49.75, 100, 295, FALSE, 20240601, 10002), 
('Bob Lee', 1599.75, 100, 0, TRUE, 20240602, 10002),
('Carlos Rivera', 2199.75, 100, 0, TRUE, 20240603, 10003);

INSERT INTO lease_contracts (customer_name, extended_ending_value, lease_fee, monthly_payment, date_of_sale, vin)
VALUES
('John Doe', 15997.50, 2239.65, 541.39, 20240601, 10009),
('Jane Smith', 54619.50, 7646.73, 3225.17, 20240602, 10010);