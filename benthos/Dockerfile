FROM docker.redpanda.com/redpandadata/redpanda
ARG benthos_config
ADD $benthos_config /benthos.yaml
ENTRYPOINT [ "rpk", "connect", "run", "/benthos.yaml" ]
