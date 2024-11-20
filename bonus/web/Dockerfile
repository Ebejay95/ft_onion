# Base image: lightweight Debian Bullseye
FROM debian:bullseye-slim

# Update package lists and install required packages
RUN apt-get update && apt-get install -y \
    nginx \
    openssh-server \
    fail2ban \
    ufw \
    && rm -rf /var/lib/apt/lists/*  # Clean up package lists to reduce image size

# Create necessary directories
RUN mkdir /run/sshd && ssh-keygen -A
RUN mkdir -p /root/.ssh

# Create a non-root user for SSH access
RUN useradd -m -s /bin/bash user42
RUN mkdir -p /home/user42/.ssh
RUN chmod 700 /home/user42/.ssh

# Copy web files and configs
COPY html /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY sshd_config /etc/ssh/sshd_config
COPY jail.local /etc/fail2ban/jail.local
COPY authorized_keys /home/user42/.ssh/authorized_keys

# Set proper permissions for SSH
RUN chmod 600 /home/user42/.ssh/authorized_keys
RUN chown -R user42:user42 /home/user42/.ssh

# Configure UFW (note: might need adjustment in Docker context)
RUN ufw allow 4242/tcp
RUN ufw allow 80/tcp
RUN ufw --force enable

# Create startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ports
EXPOSE 80 4242

# Use entrypoint script to start services
ENTRYPOINT ["/entrypoint.sh"]