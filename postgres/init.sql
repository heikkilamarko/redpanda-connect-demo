CREATE DATABASE grafana;
CREATE DATABASE benthos;

\c benthos;

CREATE TABLE task (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    created_at timestamptz NOT NULL
);
