
-- Step 6: Creates the inventory table with the required columns
CREATE TABLE INVENTORY (
    item_id INT NOT NULL PRIMARY KEY,
    item_name VARCHAR(40) NOT NULL,
    category VARCHAR(30),
    quantity INT,
    unit_cost DECIMAL(7,2),
    received_on DATE
);

-- Checks the column types and primary key
DESCRIBE INVENTORY;


-- Step 7: Inserts the three required inventory records
INSERT INTO INVENTORY
    (item_id, item_name, category, quantity, unit_cost, received_on)
VALUES
    (1, 'Laser Mouse', 'Peripherals', 25, 18.50, '2026-02-10'),
    (2, 'Mechanical Keyboard', 'Peripherals', 12, 64.00, '2026-03-05'),
    (3, 'USB Hub', 'Accessories', 40, 22.75, '2026-04-18');

-- Displays all inventory records to verify the inserted data
SELECT * FROM INVENTORY;


-- Step 8: Displays item IDs, names, and current prices
SELECT item_id, item_name, unit_cost
FROM INVENTORY;

-- Changes only the keyboard's price to 59.99
UPDATE INVENTORY
SET unit_cost = 59.99
WHERE item_id = 2;

-- Displays the prices again to verify the update
SELECT item_id, item_name, unit_cost
FROM INVENTORY;


-- Step 9: Creates a view that calculates each item's total value
CREATE VIEW INVENTORY_VALUE AS
SELECT
    item_name,
    quantity,
    unit_cost,
    quantity * unit_cost AS total_value
FROM INVENTORY;

-- Displays the most valuable inventory items first
SELECT *
FROM INVENTORY_VALUE
ORDER BY total_value DESC;


-- Step 10: Creates a copy of the inventory table and its records
CREATE TABLE INVENTORY_COPY AS
SELECT * FROM INVENTORY;

-- Inspects the structure of the copied table
SHOW CREATE TABLE INVENTORY_COPY;

-- Adds a primary key to the copied table
ALTER TABLE INVENTORY_COPY
ADD PRIMARY KEY (item_id);

-- Verifies the copied table's columns and primary key
DESCRIBE INVENTORY_COPY;

-- Tests that a duplicate item ID is rejected
-- This statement is expected to fail with ERROR 1062
-- Uncomment and run it once to verify the primary key
-- Comment it out again so it will not run accidentally
-- INSERT INTO INVENTORY_COPY
-- VALUES (1, 'Duplicate Mouse', 'Peripherals', 5, 10.00, '2026-05-01');

-- Step 11: adds a new user
CREATE USER 'stockclerk'@'localhost' IDENTIFIED BY 'Stock#2026';

-- views the users
SELECT user, host FROM mysql.user ORDER BY user;




