FROM ghcr.io/astral-sh/uv:alpine
RUN uv python install
COPY --from=redpandadata/connect:4.78 /redpanda-connect /
ENTRYPOINT ["/redpanda-connect"]
