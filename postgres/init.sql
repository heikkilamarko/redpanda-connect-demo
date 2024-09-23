CREATE DATABASE grafana;
CREATE DATABASE redpanda_connect;

\c redpanda_connect;

CREATE TABLE factories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    production_capacity NUMERIC
);

INSERT INTO factories (name, location, production_capacity)
VALUES 
    ('Factory A', 'New York', 100000),
    ('Factory B', 'Los Angeles', 150000),
    ('Factory C', 'Chicago', 120000),
    ('Factory D', 'Houston', 130000),
    ('Factory E', 'Phoenix', 110000);

CREATE OR REPLACE FUNCTION get_factory_model()
RETURNS JSONB AS $$
BEGIN
    RETURN (
        SELECT jsonb_agg(f)
        FROM (
            SELECT id, name, location, production_capacity 
            FROM factories
        ) f
    );
END;
$$ LANGUAGE plpgsql;
