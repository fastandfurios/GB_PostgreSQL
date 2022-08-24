CREATE OR REPLACE PROCEDURE main_photo_id_cleanup()
LANGUAGE PLPGSQL AS
$$
DECLARE photo_profiles_row RECORD;
BEGIN
    FOR photo_profiles_row IN
        SELECT users.id AS user_id,
               pr.main_photo_id,
               p.owner_id
        FROM users
                      LEFT JOIN photo p ON users.id = p.owner_id
                      LEFT JOIN profiles pr ON users.id = pr.user_id
    LOOP
        IF photo_profiles_row.user_id = photo_profiles_row.owner_id THEN
            UPDATE profiles SET main_photo_id = photo_profiles_row.main_photo_id WHERE user_id = photo_profiles_row.owner_id;
        ELSE
            UPDATE profiles SET main_photo_id = NULL WHERE user_id = photo_profiles_row.user_id;
        END IF;
    END LOOP;
    COMMIT;
END;
$$;

ALTER TABLE profiles ALTER COLUMN main_photo_id DROP NOT NULL;

CALL main_photo_id_cleanup();

SELECT main_photo_id FROM profiles;