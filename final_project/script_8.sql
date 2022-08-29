-- вернуть исполнителя (идентификатор, имя, фамилию, год рождения) по названию песни
CREATE TYPE author AS (author_id INTEGER, first_name VARCHAR(150), last_name VARCHAR(150), birthday TIMESTAMP);
CREATE OR REPLACE FUNCTION get_author(track_name VARCHAR(150))
RETURNS author AS
$$
    SELECT
        users.id AS user_id,
        first_name,
        last_name,
        data_of_birth
        FROM users
            LEFT JOIN music m on users.id = m.musician_id
            WHERE m.song_title = track_name
$$
LANGUAGE SQL;

SELECT get_author('neque venenatis') AS author;