 -- запрос выбирает имя, фамилию пользователей и их данные о фото профиля и все это отсортированно по размеру фото
 -- коррелирующий запрос
 SELECT
     (SELECT first_name FROM users WHERE users.id = owner_id) AS first_name,
     (SELECT last_name FROM users WHERE users.id = owner_id) AS last_name,
     url,
     description,
     size
    FROM pictures
    ORDER BY size ASC;

-- запрос выбирает имя и фамилию пользователя, который продоет товар по самой высокой цене
-- не коррелирующий запрос
SELECT
    first_name,
    last_name
    FROM users
    WHERE id = (SELECT seller_id FROM products WHERE price =
                (SELECT price FROM products ORDER BY price DESC LIMIT 1));