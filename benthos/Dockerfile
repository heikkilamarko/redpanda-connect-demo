FROM docker.redpanda.com/redpandadata/redpanda
ARG benthos_config
ADD $benthos_config /connect.yaml
CMD [ "connect" ]
