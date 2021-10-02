DROP TABLE IF EXISTS people;

CREATE TABLE people (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    phone varchar(255),
    email varchar(255),
    birthday timestamp,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
);

INSERT INTO people (name, email, phone, birthday, created_at, updated_at)
VALUES
    ('Halie Rempel', 'halie.rempel@hotmail.com', '+1-760-332-2048', '1984-09-14 12:15', 'now', 'now'),
    ('Meda Jenkins', 'meda.jenkins@hotmail.com', '+1-208-826-4508', '1967-11-03 19:40', 'now', 'now'),
    ('Drew Kunde', 'drew.kunde@yahoo.com', '+1-957-750-5519', '1978-01-10 03:11', 'now', 'now'),
    ('Bell Lakin', 'bell.lakin@yahoo.com', '+1-214-419-2938', '2001-06-28 23:30', 'now', 'now'),
    ('Donato King', 'donato.king@yahoo.com', '+1-469-629-8525', '1996-12-06 07:15', 'now', 'now'),
    ('Ashleigh Schoen', 'ashleigh.schoen@yahoo.com', '+1-281-747-0469', '2008-04-17 12:12', 'now', 'now');
