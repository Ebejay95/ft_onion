FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    nginx \
    tor \
    ssh \
    && rm -rf /var/lib/apt/lists/*

# Copy web files
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/index.html
COPY evil-onion.jpg /var/www/html/evil-onion.jpg

# Rest of your Dockerfile remains the same...
COPY sshd_config /etc/ssh/sshd_config
RUN mkdir /run/sshd

COPY torrc /etc/tor/torrc
RUN mkdir -p /var/lib/tor/hidden_service && \
    chmod 700 /var/lib/tor/hidden_service && \
    chown debian-tor:debian-tor /var/lib/tor/hidden_service

RUN ssh-keygen -A

EXPOSE 80 4242

CMD service tor start && service ssh start && nginx -g 'daemon off;'