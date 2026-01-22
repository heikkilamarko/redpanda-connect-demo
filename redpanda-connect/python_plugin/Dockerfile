FROM ghcr.io/astral-sh/uv:alpine
WORKDIR /app
COPY --from=redpandadata/connect:4.78 /redpanda-connect .
COPY . .
RUN uv sync --frozen --no-dev
ENTRYPOINT ["./redpanda-connect", "run", "--rpc-plugins=plugin.yaml", "connect.yaml"]
