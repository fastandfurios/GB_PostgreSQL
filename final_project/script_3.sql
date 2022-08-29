ALTER TABLE users
    ADD CONSTRAINT users_picture_id_fk
    FOREIGN KEY (picture_id)
    REFERENCES pictures (id)
    ON DELETE SET DEFAULT;

ALTER TABLE messages
    ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id)
    REFERENCES users (id)
    ON DELETE CASCADE;

ALTER TABLE messages
    ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id)
    REFERENCES users (id)
    ON DELETE CASCADE;

ALTER TABLE groups
    ADD CONSTRAINT creator_id_fk
    FOREIGN KEY (creator_id)
    REFERENCES users (id)
    ON DELETE SET DEFAULT;

ALTER TABLE groups_users
    ADD CONSTRAINT groups_id_fk
    FOREIGN KEY (group_id)
    REFERENCES groups (id)
    ON DELETE SET DEFAULT;

ALTER TABLE groups_users
    ADD CONSTRAINT users_id_fk
    FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE SET DEFAULT;

ALTER TABLE friendship
    ADD CONSTRAINT requested_by_user_id_fk
    FOREIGN KEY (requested_by_user_id)
    REFERENCES users (id)
    ON DELETE SET DEFAULT;

ALTER TABLE friendship
    ADD CONSTRAINT requested_to_user_id_fk
    FOREIGN KEY (requested_to_user_id)
    REFERENCES users (id)
    ON DELETE SET DEFAULT;

ALTER TABLE pictures
    ADD CONSTRAINT owner_id_fk
    FOREIGN KEY (owner_id)
    REFERENCES users (id)
    ON DELETE CASCADE;

ALTER TABLE video
    ADD CONSTRAINT owner_id_fk
    FOREIGN KEY (owner_id)
    REFERENCES users (id)
    ON DELETE CASCADE;

ALTER TABLE music
    ADD CONSTRAINT musician_id_fk
    FOREIGN KEY (musician_id)
    REFERENCES users (id)
    ON DELETE CASCADE;

ALTER TABLE products
    ADD CONSTRAINT products_id_fk
    FOREIGN KEY (seller_id)
    REFERENCES users (id)
    ON DELETE CASCADE;

ALTER TABLE notifications
    ADD CONSTRAINT picture_id_fk
    FOREIGN KEY (picture_id)
    REFERENCES pictures (id)
    ON DELETE SET DEFAULT;

ALTER TABLE notifications
    ADD CONSTRAINT user_id_fk
    FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE;