CREATE DATABASE grafana;
CREATE DATABASE redpanda_connect;

\c redpanda_connect;

CREATE TABLE task (
    id SERIAL NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    created_at timestamptz NOT NULL
);

SELECT create_hypertable('task', by_range('created_at'));
