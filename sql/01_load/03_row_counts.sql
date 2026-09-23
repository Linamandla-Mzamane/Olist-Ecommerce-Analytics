-- Row counts for the raw layer to confirm each table
-- matches its source CSV.
SELECT 'orders' AS table_name, count(*) AS row_count FROM raw.orders
UNION ALL
SELECT 'customers', count(*) FROM raw.customers
UNION ALL
SELECT 'geolocation', count(*) FROM raw.geolocation
UNION ALL
SELECT 'order_items', count(*) FROM raw.order_items
UNION ALL
SELECT 'order_payments', count(*) FROM raw.order_payments
UNION ALL
SELECT 'order_reviews', count(*) FROM raw.order_reviews
UNION ALL
SELECT 'products', count(*) FROM raw.products
UNION ALL
SELECT 'sellers', count(*) FROM raw.sellers
UNION ALL
SELECT 'product_category_name_translation', count(*) FROM raw.product_category_name_translation
ORDER BY table_name;