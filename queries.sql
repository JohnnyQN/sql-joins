-- Join the 'owners' and 'vehicles' tables to include all records from 'owners'
-- regardless of whether there is a matching 'owner_id' in the 'vehicles' table
SELECT 
    owners.id AS owner_id,
    owners.first_name,
    owners.last_name,
    vehicles.id AS vehicle_id,
    vehicles.make,
    vehicles.model,
    vehicles.year,
    vehicles.price,
    vehicles.owner_id
FROM 
    owners
LEFT JOIN 
    vehicles 
ON 
    owners.id = vehicles.owner_id;


-- Count the number of cars each owner has
-- Display the owner's first name, last name, and the count of vehicles
-- Sort the result by owner's first name in ascending order
SELECT 
    owners.first_name,
    owners.last_name,
    COUNT(vehicles.id) AS count
FROM 
    owners
LEFT JOIN 
    vehicles 
ON 
    owners.id = vehicles.owner_id
GROUP BY 
    owners.first_name, owners.last_name
ORDER BY 
    owners.first_name ASC;


-- Count the number of cars and calculate the average price for each owner
-- Only include results where the owner has more than one vehicle and the average price is greater than 10,000
-- Display results ordered by owner's first name in descending order
SELECT 
    owners.first_name,
    owners.last_name,
    CAST(AVG(vehicles.price) AS INTEGER) AS average_price,
    COUNT(vehicles.id) AS count
FROM 
    owners
LEFT JOIN 
    vehicles 
ON 
    owners.id = vehicles.owner_id
GROUP BY 
    owners.first_name, owners.last_name
HAVING 
    COUNT(vehicles.id) > 1 AND AVG(vehicles.price) > 10000
ORDER BY 
    owners.first_name DESC;
