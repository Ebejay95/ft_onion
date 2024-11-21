# Base image: lightweight Debian Bullseye
FROM debian:bullseye-slim

# Update package lists and install nginx and OpenSSH server
RUN apt-get update && apt-get install -y \
    nginx \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Create a user joeberle with a password
RUN useradd -m -s /bin/bash joeberle && \
    echo "joeberle:joeberle" | chpasswd

# Create SSHD directory and generate host keys
RUN mkdir /run/sshd && ssh-keygen -A

# SSH Config direkt im Dockerfile setzen
RUN echo "Port 4242\n\
ListenAddress 0.0.0.0\n\
PermitRootLogin no\n\
PasswordAuthentication yes\n\
ChallengeResponseAuthentication no\n\
UsePAM yes\n\
X11Forwarding yes\n\
PrintMotd no\n\
AcceptEnv LANG LC_*\n\
Subsystem sftp /usr/lib/openssh/sftp-server\n\
LogLevel DEBUG3" > /etc/ssh/sshd_config

# Copy custom HTML files and configs
COPY html /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf

# Start both services
CMD service ssh start && nginx -g 'daemon off;'