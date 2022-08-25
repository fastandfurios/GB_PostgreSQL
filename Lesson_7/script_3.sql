SELECT DISTINCT
    c.id AS community_id,
    avg(v.size) OVER (PARTITION BY c.id) AS average_size_video,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    max(v.size) OVER (PARTITION BY u.id) AS max_size_video
    FROM communities_users
        JOIN communities c on c.id = communities_users.community_id
        JOIN users u on c.creator_id = u.id
        JOIN video v on u.id = v.owner_id
    ORDER BY community_id;