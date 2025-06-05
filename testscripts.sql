-- 1
SELECT 
* 
FROM 
dealerships;

-- 2
SELECT 
	`vehicles`.`vin`,
    `vehicles`.`year`,
    `vehicles`.`make`,
    `vehicles`.`model`,
    `vehicles`.`vehicleType`,
    `vehicles`.`color`,
    `vehicles`.`odometer`,
    `vehicles`.`price`,
    `vehicles`.`sold`
FROM `cardealershipdatabase`.`vehicles`
INNER JOIN inventory ON vehicles.vin = inventory.vin
WHERE
inventory.dealership_id = 1;

-- 3
SELECT
make,
model
FROM 
vehicles
WHERE
vin = 10010;

-- 4
SELECT
dealerships.name,
inventory.vin
FROM 
dealerships
INNER JOIN inventory ON inventory.dealership_id = dealerships.dealership_id
WHERE
vin = 10008;

-- 5
SELECT
dealerships.name,
vehicles.model
FROM 
dealerships
INNER JOIN inventory ON inventory.dealership_id = dealerships.dealership_id
INNER JOIN vehicles ON vehicles.vin = inventory.vin
WHERE vehicles.model = 'M4';

-- 6
SELECT
contract_id,
customer_name,
sales_tax,
recording_fee,
processing_fee,
is_finance,
date_of_sale,
vin
FROM
sales_contracts
WHERE
date_of_sale BETWEEN 20240601 AND 20240603;