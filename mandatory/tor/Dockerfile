# Use the lightweight Debian Bullseye slim image as the base image
FROM debian:bullseye-slim

# Update the package list and install Tor, then clean up to reduce image size
RUN apt-get update && apt-get install -y \
    tor && rm -rf /var/lib/apt/lists/*

# Create a directory for the Tor hidden service and set appropriate permissions
# Set ownership to the Tor user
# Set restrictive permissions for security
RUN mkdir -p /var/lib/tor/hidden_service && \
    chown -R debian-tor:debian-tor /var/lib/tor/hidden_service && \  
    chmod 700 /var/lib/tor/hidden_service 

# Run the Tor service with the specified configuration file
CMD ["tor", "-f", "/etc/tor/torrc"]
