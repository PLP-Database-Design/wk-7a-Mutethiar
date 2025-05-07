/* QUESTION 1: Split the comma-separated 'Products' column into individual rows */
/* The query extracts each product from the 'Products' column in the 'ProductDetail' table */
SELECT
    OrderID, -- Unique identifier for the order
    CustomerName, -- Name of the customer who placed the order
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product -- Extract individual products from the comma-separated list
FROM
    ProductDetail
JOIN
    (
        SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 -- Generate a sequence of numbers (1, 2, 3) for splitting
    ) n
ON
    n.n <= 1 + LENGTH(Products) - LENGTH(REPLACE(Products, ',', '')) -- Ensure the sequence covers the number of products in the list
;

/* QUESTION 2: Retrieve distinct orders and their details */
/* Part 1: Get distinct OrderID and CustomerName from the 'OrderDetails' table */
SELECT DISTINCT
    OrderID, -- Unique identifier for the order
    CustomerName -- Name of the customer who placed the order
FROM
    OrderDetails;

/* Part 2: Retrieve detailed information about each order */
SELECT
    OrderID, -- Unique identifier for the order
    Product, -- Name of the product in the order
    Quantity -- Quantity of the product ordered
FROM
    OrderDetails;
