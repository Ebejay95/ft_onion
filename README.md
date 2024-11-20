# ft_onion

docker-compose down && docker-compose up -d

to test the tor service:

docker exec -it mandatory-tor-1 cat /var/lib/tor/hidden_service/hostname

to test the ssh service:

docker exec -it mandatory-web-1 ssh -p 4242 joeberle@127.0.0.1





ssh-keygen -t ed25519 -a 100 -f ~/.ssh/docker_ed25519

cp ~/.ssh/docker_ed25519.pub {web/authorized_keys}

