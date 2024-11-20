#!/bin/bash

# Start SSH daemon
service ssh start

# Start Fail2ban
service fail2ban start

# Start nginx in the foreground
nginx -g 'daemon off;'