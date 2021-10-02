DROP TABLE IF EXISTS people;

CREATE TABLE people (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    phone varchar(255),
    birthday timestamp,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
);

INSERT INTO people (name, phone, birthday, created_at, updated_at) VALUES
('Вадик', '+7 926 982-58-19', '1984-09-14 03:00:00', 'now', 'now');
