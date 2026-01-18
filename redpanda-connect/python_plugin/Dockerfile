FROM ghcr.io/astral-sh/uv:alpine
COPY --from=redpandadata/connect:4.78 /redpanda-connect /
ENTRYPOINT ["/redpanda-connect"]
