# Use the lightweight Debian Bullseye slim image as the base image
FROM debian:bullseye-slim

# Update the package list and install Tor, then clean up to reduce image size
RUN apt-get update && apt-get install -y \
    tor \  # Install the Tor package
    && rm -rf /var/lib/apt/lists/*  # Remove cached package lists to minimize the image size

# Create a directory for the Tor hidden service and set appropriate permissions
RUN mkdir -p /var/lib/tor/hidden_service && \  # Create the hidden_service directory
    chown -R debian-tor:debian-tor /var/lib/tor/hidden_service && \  # Set ownership to the Tor user
    chmod 700 /var/lib/tor/hidden_service  # Set restrictive permissions for security

# Run the Tor service with the specified configuration file
CMD ["tor", "-f", "/etc/tor/torrc"]
