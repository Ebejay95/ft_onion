# Base image: lightweight Debian Bullseye
FROM debian:bullseye-slim

# Update package lists and install nginx and OpenSSH server
RUN apt-get update && apt-get install -y \
    nginx \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*  # Clean up package lists to reduce image size

# Create the directory for SSHD and generate host keys
RUN mkdir /run/sshd && ssh-keygen -A

# Copy custom HTML files to the web server root
COPY html /var/www/html

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the custom SSH server configuration file
COPY sshd_config /etc/ssh/sshd_config

# Start the SSH service and run the Nginx daemon in the foreground
CMD service ssh start && nginx -g 'daemon off;'
