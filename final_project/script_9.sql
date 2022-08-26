-- триггер ставит при любом добавлении или изменении строки в таблице сохраняет 
-- в этой строке информацию о текущем пользователе и отметку времени.
CREATE OR REPLACE FUNCTION picture_stamp()
RETURNS TRIGGER AS
$picture_stamp$
    BEGIN
        IF NEW.url IS NULL THEN
            RAISE EXCEPTION 'url cannot be null';
        END IF;
        IF NEW.owner_id = 0 OR NEW.owner_id < 0 THEN
            RAISE EXCEPTION 'the correct identifier must be specified';
        END IF;
        IF NEW.uploaded_at IS NULL
               OR NEW.uploaded_at < '2006-09-04 00:00:00.000000'
               OR NEW.uploaded_at > current_date THEN
            RAISE EXCEPTION 'incorrect date';
        END IF;
        IF NEW.size < 10 OR NEW.size > 5000 THEN
            RAISE EXCEPTION 'uploaded photo less than 10 KB or more than 5000 KB';
        END IF;

        NEW.last_user := current_user;
        NEW.last_date := current_timestamp;
        RETURN NEW;
    END
$picture_stamp$
LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER picture_stamp BEFORE INSERT OR UPDATE ON pictures
    FOR EACH ROW EXECUTE FUNCTION picture_stamp();