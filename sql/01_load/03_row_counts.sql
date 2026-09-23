-- Row counts vs the source CSVs
-- Expected counts are the data rows in each file, excluding the header.
WITH actual AS (
    SELECT 'orders' AS table_name, COUNT(*) AS row_count FROM raw.orders
    UNION ALL
    SELECT 'customers', COUNT(*) FROM raw.customers
    UNION ALL
    SELECT 'geolocation', COUNT(*) FROM raw.geolocation
    UNION ALL
    SELECT 'order_items', COUNT(*) FROM raw.order_items
    UNION ALL
    SELECT 'order_payments', COUNT(*) FROM raw.order_payments
    UNION ALL
    SELECT 'order_reviews', COUNT(*) FROM raw.order_reviews
    UNION ALL
    SELECT 'products', COUNT(*) FROM raw.products
    UNION ALL
    SELECT 'sellers', COUNT(*) FROM raw.sellers
    UNION ALL
    SELECT 'product_category_name_translation', COUNT(*) FROM raw.product_category_name_translation
),

expected (table_name, expected_rows) AS (
    VALUES
        ('orders', 99441),
        ('customers', 99441),
        ('geolocation', 1000163),
        ('order_items', 112650),
        ('order_payments', 103886),
        ('order_reviews', 99224),
        ('products', 32951),
        ('sellers', 3095),
        ('product_category_name_translation', 71)
)
SELECT
    a.table_name,
    a.row_count,
    e.expected_rows,
    a.row_count = e.expected_rows AS matches
FROM actual a
JOIN expected e USING (table_name)
ORDER BY a.table_name;