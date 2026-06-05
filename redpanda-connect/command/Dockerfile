FROM ghcr.io/astral-sh/uv:alpine
COPY --from=redpandadata/connect:4.95 /redpanda-connect /
ENTRYPOINT ["/redpanda-connect"]
CMD ["run", "/connect.yaml"]
