CREATE DATABASE grafana;
CREATE DATABASE redpanda_connect;

\c redpanda_connect;

CREATE SCHEMA demo;

CREATE TABLE demo.processed_messages (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    created_at timestamptz NOT NULL
);

CREATE TABLE demo.factories (
    id SERIAL PRIMARY KEY,
    name TEXT,
    location TEXT,
    production_capacity NUMERIC
);

INSERT INTO demo.factories (name, location, production_capacity)
VALUES
    ('Factory A', 'New York', 100000),
    ('Factory B', 'Los Angeles', 150000),
    ('Factory C', 'Chicago', 120000),
    ('Factory D', 'Houston', 130000),
    ('Factory E', 'Phoenix', 110000);

CREATE OR REPLACE FUNCTION demo.get_factory_model()
RETURNS JSONB AS $$
BEGIN
    RETURN (
        SELECT jsonb_agg(f)
        FROM (
            SELECT id, name, location, production_capacity
            FROM demo.factories
        ) f
    );
END;
$$ LANGUAGE plpgsql;
