ARG CADDY_VERSION=2.11.4
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder
RUN apk upgrade
RUN xcaddy build v${CADDY_VERSION} \
    --with github.com/caddy-dns/cloudflare
FROM caddy:${CADDY_VERSION}-alpine
RUN apk upgrade
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
