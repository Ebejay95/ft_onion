# ft_onion

docker build -t onion-service .

docker run -d onion-service

docker exec <container_id> cat /var/lib/tor/hidden_service/hostname