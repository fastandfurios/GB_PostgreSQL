BEGIN;
    DELETE FROM users
           WHERE id IN (SELECT DISTINCT
                    users.id AS user_id
                FROM users
                    LEFT JOIN friendship ON users.id = requested_to_user_id
                WHERE requested_at ISNULL
                ORDER BY user_id);
COMMIT;