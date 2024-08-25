CREATE DATABASE grafana;
CREATE DATABASE benthos;

\c benthos;

CREATE TABLE task (
    id SERIAL NOT NULL,
    name TEXT NOT NULL,
    created_at timestamptz NOT NULL
);

SELECT create_hypertable('task', by_range('created_at'));
