DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type text,
    content text,
    url text,
    due_date timestamp,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
);

INSERT INTO posts (type, content, created_at, updated_at) VALUES
('Memo', 'Мне приснился странный сон', 'now', 'now');
