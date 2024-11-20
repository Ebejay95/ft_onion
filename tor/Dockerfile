FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    tor \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/tor/hidden_service && \
    chown -R debian-tor:debian-tor /var/lib/tor/hidden_service && \
    chmod 700 /var/lib/tor/hidden_service

CMD ["tor", "-f", "/etc/tor/torrc"]
