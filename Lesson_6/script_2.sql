CREATE OR REPLACE PROCEDURE main_photo_id_cleanup()
LANGUAGE PLPGSQL AS
$$
DECLARE photo_profiles_row RECORD;
BEGIN
    FOR photo_profiles_row IN
        SELECT owner_id,
                main_photo_id
        FROM profiles
            LEFT JOIN photo p on p.id = profiles.main_photo_id
        ORDER BY owner_id
    LOOP
        UPDATE profiles SET main_photo_id = NULL WHERE user_id = photo_profiles_row.owner_id;
    END LOOP;
    COMMIT;
END;
$$;

ALTER TABLE profiles ALTER COLUMN main_photo_id DROP NOT NULL;

CALL main_photo_id_cleanup();

SELECT main_photo_id FROM profiles;