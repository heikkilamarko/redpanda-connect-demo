FROM ghcr.io/astral-sh/uv:alpine
COPY --from=redpandadata/connect:4.69 /redpanda-connect /
ENTRYPOINT ["/redpanda-connect"]
CMD ["run", "/connect.yaml"]
