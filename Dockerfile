FROM debian:bullseye-slim as base

FROM base as shell
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    sudo \
    xterm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY image-files/start.sh /app/

CMD ["./start.sh"]
