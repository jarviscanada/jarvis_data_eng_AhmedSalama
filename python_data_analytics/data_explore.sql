-- Show table schema
\d+ retail;

-- Show first 10 rows
SELECT * FROM retail LIMIT 10;

-- Check # of records
SELECT COUNT(*) AS total_records FROM retail;

-- Number of clients (unique customer_id)
SELECT COUNT(DISTINCT customer_id) AS total_clients FROM retail;

-- Invoice date range
SELECT MAX(invoice_date) AS max_date, MIN(invoice_date) AS min_date FROM retail;

-- Number of SKU / merchants
SELECT COUNT(DISTINCT stock_code) AS total_sku FROM retail;

-- Average invoice amount excluding negative invoices
SELECT AVG(invoice_total) AS avg_invoice
FROM (
    SELECT invoice_no, SUM(quantity * unit_price) AS invoice_total
    FROM retail
    GROUP BY invoice_no
    HAVING SUM(quantity * unit_price) > 0
) sub;

-- Total revenue
SELECT SUM(quantity * unit_price) AS total_revenue FROM retail;

-- Total revenue by YYYYMM
SELECT
    (EXTRACT(YEAR FROM invoice_date)::int * 100 + EXTRACT(MONTH FROM invoice_date)::int) AS yyyymm,
    SUM(quantity * unit_price) AS revenue
FROM retail
GROUP BY yyyymm
ORDER BY yyyymm;

