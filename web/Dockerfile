FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    nginx \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/sshd && ssh-keygen -A

COPY html /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY sshd_config /etc/ssh/sshd_config

CMD service ssh start && nginx -g 'daemon off;'
