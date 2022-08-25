-- неизменяемое представление
CREATE OR REPLACE VIEW products_users_view AS (
    SELECT
        products.id AS product_id,
        name,
        price,
        u.first_name AS first_name,
        u.last_name AS last_name
    FROM products
        LEFT JOIN users u on u.id = products.seller_id
        GROUP BY product_id, first_name, last_name
        ORDER BY first_name
);

SELECT * FROM products_users_view;

-- изменяемое предстваление
CREATE OR REPLACE VIEW video_view AS (
    SELECT
        video.id AS video_id,
        size
        FROM video
        WHERE size BETWEEN 100 AND 500
        ORDER BY video_id
);

SELECT * FROM video_view;
UPDATE video_view SET size = 200 WHERE video_id = 11;
SELECT id, size FROM video WHERE id = 11;