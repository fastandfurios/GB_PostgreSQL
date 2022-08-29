 -- запрос выбирает имя, фамилию пользователей и их данные о фото профиля и все это отсортированно по размеру фото
  SELECT
     first_name,
     last_name,
     url AS picture_url,
     description,
     size
    FROM pictures,
         (SELECT id, first_name, last_name FROM users) AS owners
    WHERE owner_id = owners.id
    ORDER BY size ASC;

-- запрос выбирает имя и фамилию пользователя, который продает товар по самой высокой цене
SELECT
    first_name,
    last_name
    FROM users
    WHERE id = (SELECT seller_id FROM products WHERE price =
                (SELECT price FROM products ORDER BY price DESC LIMIT 1));