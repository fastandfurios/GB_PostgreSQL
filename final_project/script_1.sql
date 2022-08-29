-- база данных социальной сети "Одноклассники"
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    city VARCHAR(50),
    created_at TIMESTAMP,
    data_of_birth TIMESTAMP,
	picture_id INT NOT NULL
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_user_id INT NOT NULL,
    to_user_id INT NOT NULL,
    body TEXT,
    is_important BOOLEAN,
    is_delivered BOOLEAN,
    created_at TIMESTAMP
);

DROP TABLE IF EXISTS friendship;
CREATE TABLE friendship (
    id SERIAL PRIMARY KEY,
    requested_by_user_id INT NOT NULL,
    requested_to_user_id INT NOT NULL,
    requested_at TIMESTAMP,
    confirmed_at TIMESTAMP
);

DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  name VARCHAR(120) UNIQUE,
  creator_id INT NOT NULL,
  created_at TIMESTAMP
);

DROP TABLE IF EXISTS groups_users;
CREATE TABLE groups_users (
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP,
    PRIMARY KEY (group_id, user_id)
);

DROP TABLE IF EXISTS pictures;
CREATE TABLE pictures (
    id SERIAL PRIMARY KEY,
    url VARCHAR(250) NOT NULL UNIQUE,
    owner_id INT NOT NULL,
    description VARCHAR(250) NOT NULL,
    uploaded_at TIMESTAMP NOT NULL,
    size INT NOT NULL -- from 10 to 5000 KB
);

DROP TABLE IF EXISTS video;
CREATE TABLE video (
    id SERIAL PRIMARY KEY,
    url VARCHAR(250) NOT NULL UNIQUE,
    owner_id INT NOT NULL,
    description VARCHAR(250) NOT NULL,
    uploaded_at TIMESTAMP NOT NULL,
    size INT NOT NULL, -- from 10 to 2048 MB
    views INT,
    duration TIME NOT NULL
);

DROP TABLE IF EXISTS music;
CREATE TABLE music (
    id SERIAL PRIMARY KEY,
    musician_id INT NOT NULL,
    song_title VARCHAR(120) NOT NULL,
    duration TIME NOT NULL,
	size INT NOT NULL -- from 10 to 1000 MB
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    seller_id INT NOT NULL,
    price DECIMAL NOT NULL, -- RUB
    name VARCHAR(120) NOT NULL,
    description VARCHAR(250) NOT NULL,
    created_at TIMESTAMP
);

DROP TABLE IF EXISTS notifications;
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    picture_id INT NOT NULL,
    description VARCHAR(250) NOT NULL,
    created_at TIMESTAMP,
	user_id INT NOT NULL
);