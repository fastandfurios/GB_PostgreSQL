CREATE OR REPLACE FUNCTION update_main_photo_id_trigger()
RETURNS TRIGGER AS
$$
DECLARE is_found BOOLEAN;
BEGIN
    is_found := EXISTS(SELECT user_id FROM profiles WHERE NEW.user_id = user_id AND main_photo_id ISNULL);
    IF is_found THEN
        NEW.main_photo_id := NULL;
    END IF;
    RETURN NEW;
END
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER check_main_photo_id_update BEFORE UPDATE ON profiles
    FOR EACH ROW
    EXECUTE FUNCTION update_main_photo_id_trigger();

SELECT user_id, main_photo_id FROM profiles WHERE user_id = 3;
UPDATE profiles SET main_photo_id = 45 WHERE user_id = 3;
SELECT user_id, main_photo_id FROM profiles WHERE user_id = 3;

SELECT user_id, main_photo_id FROM profiles WHERE user_id = 4;
UPDATE profiles SET main_photo_id = 23 WHERE user_id = 4;
SELECT user_id, main_photo_id FROM profiles WHERE user_id = 4;