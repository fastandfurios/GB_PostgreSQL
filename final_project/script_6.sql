-- запрос выбирает владельцев групп с фотографией профиля
SELECT DISTINCT
    first_name,
    last_name,
    g.name,
    p.url
    FROM users
        JOIN groups g ON users.id = g.creator_id
        LEFT JOIN pictures p ON users.id = p.owner_id
    WHERE name NOTNULL AND url NOTNULL;

-- запрос выбирает 5 самых просматриваемых видео исполнителей песен
SELECT DISTINCT
    musician_id,
    url,
    description,
    v.size,
    views
    FROM music
        JOIN users u ON music.musician_id = u.id
        LEFT JOIN video v ON u.id = v.owner_id
    WHERE v.size NOTNULL
    ORDER BY views DESC LIMIT 5;