# Cybersecurity Piscine – ft_onion

**Unleash the power of anonymity on the Internet.**

---

## Summary

**ft_onion** is a project in the Cybersecurity Piscine that focuses on setting up a hidden service on the Tor network. The goal is to configure a web server that hosts a static webpage accessible via a `.onion` URL. This project emphasizes networking, web server configuration, and leveraging anonymity for secure communication.

---

## Features

### Core Functionality

1. **Static Web Page**:
   - Serve a single `index.html` file as the webpage content.
   - Accessible via a `.onion` URL on the Tor network.

2. **Nginx Web Server**:
   - Configured to serve the static webpage.
   - HTTP access enabled on port 80.

3. **SSH Access**:
   - Configure SSH to allow access on port 4242 via the Tor network.

4. **No Extra Ports**:
   - No additional ports are opened, and no firewall rules are set.

---

## Structure

### Required Files

| **File**        | **Purpose**                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `index.html`    | The static web page served over the Tor network.                           |
| `nginx.conf`    | Configuration file for the Nginx web server.                               |
| `sshd_config`   | Configuration file for the SSH service.                                    |
| `torrc`         | Configuration file for the Tor service to set up the hidden service.       |

---

## Usage

### Setting Up the Services

1. **Build the Docker Image**:
   ```bash
   docker-compose build --no-cache
   ```
   
## Start the Services:

```
docker-compose up -d
```

## Restart or Stop the Services:

### Stop:
```
docker-compose down
```

### Restart:
```
docker-compose up -d
```

## Testing the Setup
### Tor Hidden Service
To retrieve the .onion URL for your service:

```
docker exec -it ft_onion-tor-1 cat /var/lib/tor/hidden_service/hostname
```

Copy the .onion URL and open it in a Tor-enabled browser (e.g., Tor Browser).

## SSH Service
To test SSH access via the Tor network:

```
ssh -v -p 4242 \
    -o ProxyCommand="nc -X 5 -x 127.0.0.1:9150 %h %p" \
    -o "ServerAliveInterval 60" joeberle@<onion_address>
Password: joeberle
```

### Requirements
##Mandatory Part

Static Webpage:

Serve index.html via the Tor network.
Nginx Configuration:

HTTP access enabled on port 80.
Properly configured using nginx.conf.
SSH Configuration:

Enable SSH on port 4242.
Configure access via the Tor network using sshd_config.
Hidden Service:

Configure Tor to create a hidden service using torrc.
Ensure the service is reachable through a .onion URL.
Learning Outcomes
Tor Networking:
Understand how to configure and use hidden services on the Tor network.
Web Server Configuration:
Gain experience with Nginx and static file serving.
Secure SSH Access:
Configure SSH for secure communication over the Tor network.

ft_onion – Bringing anonymity and security together on the web! 🧅
