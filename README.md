# ft_onion

docker-compose build --no-cache

docker-compose down

docker-compose up -d

to test the tor service:

docker exec -it ft_onion-tor-1 cat /var/lib/tor/hidden_service/hostname

to test the ssh service:

ssh -v -p 4242 -o ProxyCommand="nc -X 5 -x 127.0.0.1:9150 %h %p" -o "ServerAliveInterval 60" joeberle@

PW is joeberle